const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const SeatsModel = dbConfig.define(
  "seats",
  {
    seatID: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    theaterID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    r_number: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    c_number: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = SeatsModel;
