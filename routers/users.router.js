const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();
const { UsersController } = require("../controllers/index");

router.put(
  "/credit/add",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  UsersController.addCreditCard
);

router.put(
  "/wishlist/add",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  UsersController.addWishList
);

router.get(
  "/booking/history/:userID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  UsersController.getBookingHistory
);

router.get(
  "/wishlist/:userID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  UsersController.getWishlist
);

router.post(
  "/changepassword",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  UsersController.changePassword
);

module.exports = router;
