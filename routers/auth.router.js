const { verifySignUp, OAuth } = require("../middleware");
const { AuthController } = require("../controllers/index");
const express = require("express");
const router = express.Router();

router.post(
  "/signup",
  [verifySignUp.checkDuplicatePhoneOrEmail],
  AuthController.signup
);

router.post("/signin", AuthController.signin);

router.post("/logout", AuthController.logout);

router.get("/verify-email/:userID/:token", AuthController.verifyEmail);

router.post("/forgotpassword", AuthController.forgotPassword);

router.post("/resetpassword", AuthController.resetPassword);

router.post("/sendpassword", [OAuth.OAuthHelpers], AuthController.sendPassword);

module.exports = router;
