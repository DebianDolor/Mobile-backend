const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const BookingsModel = dbConfig.define(
  "bookings",
  {
    bookingID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    showtimeID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    seatID: {
      type: DataTypes.JSON,
      allowNull: false,
    },
    userID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    price: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    discountID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = BookingsModel;
