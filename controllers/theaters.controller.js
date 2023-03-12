const { TheatersModel } = require("../models/index");
const { ShowtimesModel } = require("../models/index");
const { SeatsModel } = require("../models/index");

exports.findAll = async (req, res) => {
  try {
    const theaters = await TheatersModel.findAll();
    res.status(200).json(theaters);
  } catch (err) {
    res.status(500).json(err);
  }
};

// find Theater by theaterID
exports.findOne = async (req, res) => {
  try {
    const theaters = await TheatersModel.findByPk(req.params.theaterID);
    res.json(theaters);
  } catch (err) {
    console.log(err);
  }
};

// Movie showtimes by theaterID
exports.getShowtime = async (req, res) => {
  try {
    const theaters = await TheatersModel.findOne({
      where: { theaterID: req.params.theaterID },
      include: [{ model: ShowtimesModel }],
    });
    res.json(theaters);
  } catch (err) {
    console.log(err);
  }
};

// seats by theaterID
exports.getSeats = async (req, res) => {
  try {
    const theaters = await TheatersModel.findOne({
      where: { theaterID: req.params.theaterID },
      include: [{ model: SeatsModel }],
    });
    res.json(theaters);
  } catch (err) {
    console.log(err);
  }
};
