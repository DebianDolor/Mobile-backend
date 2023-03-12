const { PaymentModel } = require("../models/index");

exports.findOne = async (req, res) => {
  try {
    const payment = await PaymentModel.findByPk(req.params.bookingID);
    res.status(200).json(payment);
  } catch (err) {
    res.status(500).json(err);
  }
};
