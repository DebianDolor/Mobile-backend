const bcrypt = require("bcrypt");
const {
  UsersModel,
  TokenModel,
  TokenBlackListModel,
} = require("../models/index");
const jwt = require("jsonwebtoken");
const crypto = require("crypto");
const { sendingMail } = require("../utils/mailer");

exports.signup = async (req, res) => {
  try {
    const { username, email, password, isVerified, phone } = req.body;
    const data = {
      username,
      email,
      password: await bcrypt.hash(password, 10),
      isVerified,
      phone,
    };
    //saving the user
    const user = await UsersModel.create(data);

    //if user details is captured
    //create a token with crypto.js

    if (user) {
      let setToken = await TokenModel.create({
        userID: user.userID,
        token: crypto.randomBytes(16).toString("hex"),
      });

      //if token is created, send the user a mail
      if (setToken) {
        //send email to the user
        //with the function coming from the mailing.js file
        //message containing the user userID and the token to help verify their email
        sendingMail({
          from: "no-reply@example.com",
          to: `${email}`,
          subject: "Account Verification Link",
          text: `Hello, ${username}, 
        Please verify your email by clicking this link :
        http://localhost:8080/api/auth/verify-email/${user.userID}/${setToken.token} `,
        });

        //if token is not created, send a status of 400
      } else {
        return res.status(400).send("token not created");
      }

      console.log("user", JSON.stringify(user, null, 2));

      //send users details
      return res.status(201).send({
        user: user,
        message: "User registered successfully. Please verify your email!",
      });
    } else {
      return res.status(409).send("Details are not correct");
    }
  } catch (error) {
    console.log(error);
  }
};

//verifying the email of the user
exports.verifyEmail = async (req, res) => {
  try {
    const token = req.params.token;

    //find user by token using the where clause
    const usertoken = await TokenModel.findOne({
      token,
      where: {
        userID: req.params.userID,
      },
    });
    console.log(usertoken);

    //if token doesnt exist, send status of 400
    if (!usertoken) {
      return res.status(400).send({
        msg: "Your verification link may have expired. Please click on resend for verify your Emai!.",
      });

      //if token exist, find the user with that token
    } else {
      const user = await UsersModel.findOne({
        where: { userID: req.params.userID },
      });
      if (!user) {
        console.log(user);

        return res.status(401).send({
          msg: "We were unable to find a user for this verification. Please SignUp!",
        });

        //if user is already verified, tell the user to login
      } else if (user.isVerified) {
        return res
          .status(200)
          .send("User has been already verified. Please Login!");

        //if user is not verified, change the verified to true by updating the field
      } else {
        const updated = await UsersModel.update(
          { isVerified: true },
          {
            where: {
              userID: usertoken.userID,
            },
          }
        );
        console.log(updated);

        if (!updated) {
          return res.status(500).send({ msg: err.message });
        } else {
          return res
            .status(200)
            .send("Your account has been successfully verified!");
        }
      }
    }
  } catch (error) {
    console.log(error);
  }
};

//login authentication
exports.signin = (req, res) => {
  UsersModel.findOne({
    where: {
      email: req.body.email,
    },
  })
    .then((user) => {
      if (!user) {
        return res.status(404).send({ message: "Email Not found!" });
      }

      var passwordIsValid = bcrypt.compareSync(
        req.body.password,
        user.password
      );

      if (!passwordIsValid) {
        return res.status(401).send({
          accessToken: null,
          message: "Invalid Password!",
        });
      } else {
        const isVerified = user.isVerified;
        if (isVerified) {
          var token = jwt.sign(
            { username: user.username, email: user.email },
            process.env.SECRET,
            {
              expiresIn: 86400, // 24 hours
            }
          );
          res.cookie("jwt", token, {
            maxAge: 1 * 24 * 60 * 60,
            httpOnly: true,
          });

          res.status(200).send({
            username: user.username,
            email: user.email,
            accessToken: token,
          });
        } else {
          return res.status(401).send("User is not verified!");
        }
      }
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};

exports.logout = async (req, res) => {
  const token = req.headers.cookie.replace("jwt=", "");

  // Add the token to the blacklist table
  await TokenBlackListModel.create({ token });

  res.json({ message: "Logged out successfully" });
};

exports.forgotPassword = async (req, res) => {
  const user = await UsersModel.findOne({
    where: {
      email: req.body.email,
    },
  });

  if (!user) {
    return res.status(400).send({
      message: "Email doesn't exist!",
    });
  } else if (user.isVerified) {
    const usertoken = await TokenModel.findOne({
      where: {
        userID: user.userID,
      },
    });

    const hash = crypto.createHash("sha256");
    hash.update(usertoken.token);
    const code = hash.digest("hex");
    sendingMail({
      from: "no-reply@example.com",
      to: `${req.body.email}`,
      subject: "Reset Password Code",
      text: `Hello, ${req.body.email}, 
    Please use this code to reset your password: ${code}.
    Code can only used one!`,
    });
    res.status(200).send({
      message: "Please check your email for confirmation!",
    });
  } else {
    return res.status(400).send({
      message: "Email has not been verified. Please Sign Up!",
    });
  }
};

exports.resetPassword = async (req, res) => {
  const { email, password } = req.body;

  const user = await UsersModel.findOne({
    where: {
      email: email,
    },
  });

  if (!user) {
    return res.status(400).send({
      message: "Email doesn't exist!",
    });
  } else {
    const usertoken = await TokenModel.findOne({
      where: {
        userID: user.userID,
      },
    });

    const hash = crypto.createHash("sha256");
    hash.update(usertoken.token);
    const validateCode = hash.digest("hex");

    if (req.body.code === validateCode) {
      const updated = await UsersModel.update(
        { password: await bcrypt.hash(password, 10) },
        {
          where: {
            email: email,
          },
        }
      );

      const setToken = await TokenModel.update(
        { token: crypto.randomBytes(16).toString("hex") },
        {
          where: {
            userID: user.userID,
          },
        }
      );

      if (!updated || !setToken) {
        return res.status(500).send({ msg: err.message });
      } else {
        return res
          .status(200)
          .send("You have successfully change your password!");
      }
    } else {
      return res.status(400).send({
        message: "Reset code is wrong!",
      });
    }
  }
};

exports.sendPassword = async (req, res) => {
  const { password, phone } = req.body;

  let xToken = req.headers["x-access-token"];

  if (!xToken) {
    return res.status(403).send({
      message: "No token provided!",
    });
  }

  const decoded = jwt.decode(xToken);
  username = decoded.username;
  email = decoded.email;
  const isVerified = 1;

  const data = {
    username,
    email,
    password: await bcrypt.hash(password, 10),
    phone,
    isVerified,
  };

  const user = await UsersModel.create(data);

  //if user details is captured
  //create a token with crypto.js

  if (user) {
    let setToken = await TokenModel.create({
      userID: user.userID,
      token: crypto.randomBytes(16).toString("hex"),
    });

    if (!setToken) {
      return res.status(400).send("Token not created!");
    }

    //send users details
    return res.status(201).send({
      user: user,
      message: "User registered successfully!",
    });
  } else {
    return res.status(409).send("Details are not correct!");
  }
};
