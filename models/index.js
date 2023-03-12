const BookingsModel = require("./bookings.model");
const DiscountModel = require("./discount.model");
const MoviesModel = require("./movies.model");
const PaymentModel = require("./payment.model");
const SeatsModel = require("./seats.model");
const ShowtimesModel = require("./showtimes.model");
const TheatersModel = require("./theaters.model");
const UsersModel = require("./users.model");
const TokenModel = require("./token.model");
const TokenBlackListModel = require("./tokenBlackList.model");

TheatersModel.hasMany(SeatsModel, {
  foreignKey: {
    name: "theaterID",
    allowNull: false,
  },
});

TheatersModel.hasMany(ShowtimesModel, {
  foreignKey: {
    name: "theaterID",
    allowNull: false,
  },
});

MoviesModel.hasMany(ShowtimesModel, {
  foreignKey: {
    name: "movieID",
    allowNull: false,
  },
});

DiscountModel.hasMany(BookingsModel, {
  foreignKey: {
    name: "discountID",
    allowNull: false,
  },
});

UsersModel.hasMany(BookingsModel, {
  foreignKey: {
    name: "userID",
    allowNull: false,
  },
});

ShowtimesModel.hasMany(BookingsModel, {
  foreignKey: {
    name: "showtimeID",
    allowNull: false,
  },
});

BookingsModel.hasMany(PaymentModel, {
  foreignKey: {
    name: "bookingID",
    allowNull: false,
  },
});

UsersModel.hasOne(TokenModel, {
  foreignKey: {
    name: "userID",
    allowNull: false,
  },
});

TokenModel.belongsTo(UsersModel, {
  foreignKey: {
    name: "userID",
    allowNull: false,
  },
});

module.exports = {
  BookingsModel,
  DiscountModel,
  MoviesModel,
  PaymentModel,
  SeatsModel,
  ShowtimesModel,
  TheatersModel,
  UsersModel,
  TokenModel,
  TokenBlackListModel,
};
