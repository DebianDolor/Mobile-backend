const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const TokenModel = dbConfig.define(
  "tokens",
  {
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
    },

    userID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      onUpdate: "cascade",
      onDelete: "cascade",
    },

    token: {
      type: DataTypes.STRING,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = TokenModel;
