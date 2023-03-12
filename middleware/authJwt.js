const jwt = require("jsonwebtoken");
const { TokenBlackListModel } = require("../models/index");
require("dotenv/config");

verifyToken = (req, res, next) => {
  let token = req.headers["x-access-token"];

  if (!token) {
    return res.status(403).send({
      message: "No token provided!",
    });
  }

  jwt.verify(token, process.env.SECRET, (err, decoded) => {
    if (err) {
      return res.status(401).send({
        message: "Unauthorized!",
      });
    }
    req.userId = decoded.id;
    next();
  });
};

checkTokenBlacklist = async (req, res, next) => {
  const token = req.headers["x-access-token"];
  console.log(token);

  // Check if token exists in the blacklist table
  const tokenExists = await TokenBlackListModel.findOne({
    where: { token: token },
  });

  if (tokenExists) {
    return res.status(401).json({ message: "Unauthorized" });
  }

  // Continue with the request
  next();
};

const authJwt = {
  verifyToken: verifyToken,
  checkTokenBlacklist: checkTokenBlacklist,
};

module.exports = authJwt;
