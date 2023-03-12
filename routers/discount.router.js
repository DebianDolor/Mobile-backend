const { authJwt } = require("../middleware");
const express = require("express");
const router = express.Router();

const { DiscountController } = require("../controllers/index");

router.get(
  "/all",
  [authJwt.verifyToken, authJwt.checkTokenBlacklist],
  DiscountController.findAll
);

module.exports = router;
