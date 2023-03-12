const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const PaymentModel = dbConfig.define(
  "payment",
  {
    paymentID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    bookingID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    payment_method: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    received: {
      type: DataTypes.TINYINT(1),
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = PaymentModel;
