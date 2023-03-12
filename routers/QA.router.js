const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { QAController } = require("../controllers/index");

router.post(
  "/",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  QAController.chat
);

module.exports = router;
