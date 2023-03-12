const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { ShowtimesController } = require("../controllers/index");

router.get(
  "/all",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  ShowtimesController.findAll
);

module.exports = router;
