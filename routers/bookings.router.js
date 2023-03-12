const { BookingsController } = require("../controllers/index");
const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

router.post(
  "/create",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  BookingsController.createBooking
);

router.get(
  "/details/:bookingID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  BookingsController.bookingDetails
);

router.get(
  "/seat/:showtimeID/:theaterID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  BookingsController.choosenSeat
);
router.get("/getInfoBooking", BookingsController.getInfoBooking);
module.exports = router;
