const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const UsersModel = dbConfig.define(
  "users",
  {
    userID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    credit_card: {
      type: DataTypes.STRING,
    },
    booking_history: {
      type: DataTypes.JSON,
    },
    wishlist: {
      type: DataTypes.JSON,
    },
    isVerified: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = UsersModel;
