const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { PaymentController } = require("../controllers/index");

router.get(
  "/:bookingID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  PaymentController.findOne
);

module.exports = router;
