const { ShowtimesModel } = require("../models/index");

exports.findAll = async (req, res) => {
  try {
    const showtimes = await ShowtimesModel.findAll();
    res.status(200).json(showtimes);
  } catch (err) {
    res.status(500).json(err);
  }
};
