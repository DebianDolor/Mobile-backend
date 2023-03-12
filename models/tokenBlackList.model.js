const dbConfig = require("../config/db.config");
const { DataTypes } = require("sequelize");

const TokenBlackListModel = dbConfig.define(
  "token_black_list",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    token: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
    timestamps: false,
  }
);

module.exports = TokenBlackListModel;
