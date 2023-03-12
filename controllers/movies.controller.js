<<<<<<< HEAD
const { MoviesModel, ShowtimesModel } = require("../models/index");
const sequelize = require("../config/db.config");
=======
const { MoviesModel } = require("../models/index");
const { ShowtimesModel } = require("../models/index");
const { TheatersModel } = require("../models/index");
>>>>>>> 746093f394bd01ce099462a5ba572dd0f55f1afd

exports.findAll = async (req, res) => {
  try {
    const movies = await MoviesModel.findAll();
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

exports.findOne = async (req, res) => {
  try {
    const movies = await MoviesModel.findByPk(req.params.movieID);
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

exports.getNewlyAdded = async (req, res) => {
  try {
    const [movies] = await sequelize.query(
      "select * from movies where year(release_date) in (2022, 2023)"
    );
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

exports.topRating = async (req, res) => {
  try {
    const [movies] = await sequelize.query(
      "select * from movies where rating = (select max(rating) from movies)"
    );
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

// Movie showtimes by movieID
exports.getShowtime = async (req, res) => {
  try {
    const movies = await MoviesModel.findOne({
      where: { movieID: req.params.movieID },
      include: [
        {
          model: ShowtimesModel,
        },
      ],
    });
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

// find movies by category
exports.getCategory = async (req, res) => {
  try {
    const movies = await MoviesModel.findAll({
      where: {
        category: req.params.category,
      },
    });
    res.status(200).json(movies);
  } catch (err) {
    res.status(400).send({ message: err });
  }
};

// Movie showtimes by movieID
exports.getShowtime = async (req, res) => {
  try {
    const movies = await MoviesModel.findOne({
      where: { movieID: req.params.movieID },
      include: [
        {
          model: ShowtimesModel,
        },
      ],
    });
    res.json(movies);
  } catch (err) {
    console.log(err);
  }
};

// find movies by category
exports.getCategory = async (req, res) => {
  try {
    const movies = await MoviesModel.findAll({
      where: {
        category: req.params.category,
      },
    });
    res.json(movies);
  } catch (err) {
    console.log(err);
  }
};
