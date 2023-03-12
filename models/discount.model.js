const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const DiscountModel = dbConfig.define(
  "discount",
  {
    discountID: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    number: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    percentage: {
      type: DataTypes.DOUBLE,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = DiscountModel;
