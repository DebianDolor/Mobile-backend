const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { TheatersController } = require("../controllers/index");

router.get(
  "/all",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  TheatersController.findAll
);

module.exports = router;
