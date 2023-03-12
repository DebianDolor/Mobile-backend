const { UsersModel } = require("../models/index");
const jwt = require("jsonwebtoken");

OAuthHelpers = (req, res, next) => {
  // Phone
  UsersModel.findOne({
    where: {
      phone: req.body.phone,
    },
  }).then((user) => {
    if (user) {
      res.status(400).send({
        message: "Failed! Phone is already exists!",
      });
      return;
    }

    // Email
    let token = req.headers["x-access-token"];

    if (!token) {
      return res.status(403).send({
        message: "No token provided!",
      });
    }

    const decoded = jwt.decode(token);
    const email = decoded.email;

    UsersModel.findOne({
      where: {
        email: email,
      },
    }).then((user) => {
      if (user) {
        res.status(400).send({
          message: "Failed! Email is already exists!",
        });
        return;
      }

      next();
    });
  });
};

const OAuth = {
  OAuthHelpers: OAuthHelpers,
};

module.exports = OAuth;
