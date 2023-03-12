const { MoviesController } = require("../controllers/index");
const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

router.get(
  "/all",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.findAll
);

router.get(
  "/new",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.getNewlyAdded
);

router.get(
  "/details/:movieID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.findOne
);

router.get(
  "/top",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.topRating
);

router.get(
  "/showtime/:movieID",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.getShowtime
);

router.get(
  "/category/:category",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  MoviesController.getCategory
);

module.exports = router;
