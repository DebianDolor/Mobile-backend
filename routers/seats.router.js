const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { SeatsController } = require("../controllers/index");

router.get(
  "/",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  SeatsController.findAll
);

module.exports = router;
