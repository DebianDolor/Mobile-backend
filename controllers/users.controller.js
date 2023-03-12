const { UsersModel, TokenModel } = require("../models/index");
const sequelize = require("../config/db.config");
const bcrypt = require("bcrypt");
const crypto = require("crypto");

exports.addCreditCard = async (req, res) => {
  UsersModel.update(
    {
      credit_card: req.body.credit_card,
    },
    { where: { email: req.body.email } }
  )
    .then((num) => {
      if (num == 1) {
        res.send({
          message: "Credit Card added successfully!",
        });
      } else {
        res.send({
          message: `Cannot add Credit Card with email = ${email}. Maybe UsersModel was not found or req.body is empty!`,
        });
      }
    })
    .catch((err) => {
      res.status(500).send({
        message: err,
      });
    });
};

exports.addWishList = async (req, res) => {
  try {
    const [wishlist] = await sequelize.query(
      "select wishlist from users where email = :email",
      { replacements: { email: req.body.email } }
    );
    const wl = wishlist[0].wishlist;
    wl.push(req.body.movieID);
    console.log(wl);

    UsersModel.update(
      {
        wishlist: wl,
      },
      { where: { email: req.body.email } }
    );

    res.status(200).json("Success!");
  } catch (err) {
    res.status(500).json(err);
  }
};

exports.changePassword = async (req, res) => {
  const user = await UsersModel.findOne({
    where: {
      email: req.body.email,
    },
  });

  const updated = await UsersModel.update(
    { password: await bcrypt.hash(req.body.password, 10) },
    {
      where: {
        email: req.body.email,
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
    return res.status(200).send("You have successfully change your password!");
  }
};

exports.getBookingHistory = async (req, res) => {
  try {
    const [bookingHistory] = await sequelize.query(
      "select * from bookings where userID = :userID",
      { replacements: { userID: req.params.userID } }
    );
    res.status(200).json(bookingHistory);
  } catch (err) {
    res.status(500).json(err);
  }
};

exports.getWishlist = async (req, res) => {
  try {
    const [wishlist] = await sequelize.query(
      "select wishlist from users where userID = :userID",
      { replacements: { userID: req.params.userID } }
    );
    res.status(200).json(wishlist);
  } catch (err) {
    res.status(500).json(err);
  }
};
