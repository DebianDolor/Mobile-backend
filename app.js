const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const cors = require("cors");
const dbConfig = require("./config/db.config");
const passport = require("passport");
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const jwt = require("jsonwebtoken");
require("dotenv/config");
const app = express();

const {
  AuthRouter,
  MoviesRouter,
  UsersRouter,
  BookingsRouter,
  DiscountRouter,
  PaymentRouter,
  SeatsRouter,
  ShowtimesRouter,
  TheatersRouter,
  QARouter,
} = require("./routers/index");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var corsOptions = {
  origin: "http://localhost:8080",
};

app.use(cors());

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type,Accept"
  );
  next();
});

app.use(logger("dev"));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

dbConfig.sync().then(() => {
  console.log("Successfully connect to DB");
});

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Hello World!" });
});

passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: process.env.callbackURL,
    },
    (accessToken, refreshToken, profile, done) => {
      // Here, you can save the user profile to your database, generate a JWT token and send it back to the client.
      // For simplicity, we will just generate a JWT token using the user's profile information.
      const token = jwt.sign(
        {
          username: profile.displayName,
          email: profile.emails[0].value,
        },
        process.env.SECRET,
        { expiresIn: 86400 }
      );
      done(null, token);
    }
  )
);

// Middleware to authenticate with Google OAuth 2.0
app.get(
  "/auth/google",
  passport.authenticate("google", {
    scope: [
      "https://www.googleapis.com/auth/plus.login",
      "https://www.googleapis.com/auth/userinfo.email",
    ],
  })
);

// Callback URL for Google OAuth 2.0
app.get(
  "/auth/google/callback",
  passport.authenticate("google", { session: false }),
  (req, res) => {
    res.json({ token: req.user });
  }
);

app.use("/api/auth", AuthRouter);
app.use("/api/movies", MoviesRouter);
app.use("/api/users", UsersRouter);
app.use("/api/booking", BookingsRouter);
app.use("/api/discount", DiscountRouter);
app.use("/api/payment", PaymentRouter);
app.use("/api/seats", SeatsRouter);
app.use("/api/showtimes", ShowtimesRouter);
app.use("/api/theaters", TheatersRouter);
app.use("/api/qa", QARouter);

// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
