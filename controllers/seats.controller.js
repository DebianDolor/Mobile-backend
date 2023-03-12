const { SeatsModel } = require("../models/index");

exports.findAll = async (req, res) => {
  try {
    const seats = await SeatsModel.findAll();
    res.status(200).json(seats);
  } catch (err) {
    res.status(500).json(err);
  }
};
