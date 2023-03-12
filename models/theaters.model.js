const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const TheatersModel = dbConfig.define(
  "theaters",
  {
    theaterID: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    theater_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    capacity: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = TheatersModel;
