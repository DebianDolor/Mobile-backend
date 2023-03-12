const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { TheatersController } = require("../controllers/index");

router.get(
  "/all",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  TheatersController.findAll
);
router.get("/getTheater/:theaterID", TheatersController.findOne);
router.get("/getShowtime/:theaterID", TheatersController.getShowtime);
router.get("/getSeats/:theaterID", TheatersController.getSeats);
module.exports = router;
