const { UsersModel } = require("../models/index");

checkDuplicatePhoneOrEmail = (req, res, next) => {
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
    UsersModel.findOne({
      where: {
        email: req.body.email,
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

const verifySignUp = {
  checkDuplicatePhoneOrEmail: checkDuplicatePhoneOrEmail,
};

module.exports = verifySignUp;
