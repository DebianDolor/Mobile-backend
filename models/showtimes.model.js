const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const ShowtimesModel = dbConfig.define(
  "showtimes",
  {
    showtimeID: {
      type: DataTypes.STRING,
      primaryKey: true,
      allowNull: false,
    },
    movieID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    theaterID: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    time: {
      type: DataTypes.TIME,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = ShowtimesModel;
