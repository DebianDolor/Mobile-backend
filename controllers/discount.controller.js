const { DiscountModel } = require("../models/index");

exports.findAll = async (req, res) => {
  try {
    const discount = await DiscountModel.findAll();
    res.status(200).json(discount);
  } catch (err) {
    res.status(500).json(err);
  }
};
