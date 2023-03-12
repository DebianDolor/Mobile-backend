<<<<<<< HEAD
const { BookingsModel, UsersModel } = require("../models/index");
=======
const { BookingsModel } = require("../models/index");
>>>>>>> 746093f394bd01ce099462a5ba572dd0f55f1afd
const sequelize = require("../config/db.config");

exports.createBooking = async (req, res) => {
  try {
    const booking = {
      showtimeID: req.body.showtimeID,
      seatID: req.body.seatID,
      userID: req.body.userID,
      price: req.body.price,
      discountID: req.body.discountID,
    };

    const booked = await BookingsModel.create(booking);

    if (booked) {
      try {
        const [history] = await sequelize.query(
          "select booking_history from users where userID = :userID",
          { replacements: { userID: req.body.userID } }
        );
        const bh = history[0].booking_history;
        bh.push(req.body.showtimeID);
        console.log(bh);

        UsersModel.update(
          {
            booking_history: bh,
          },
          { where: { userID: req.body.userID } }
        );
        res.status(200).json("Success!");
      } catch (err) {
        res.status(500).json(err);
      }
    } else {
      res.status(400).json("Some error occur!");
    }
  } catch (err) {
    res.status(500).json(err);
  }
};

exports.bookingDetails = async (req, res) => {
  try {
    const payment = await sequelize.query(
      "select b.bookingID, payment_method, \
      st.showtimeID, theaterID, seatID, userID, price, discountID, \
      st.movieID, title \
      from payment p \
      join bookings b \
      on p.bookingID = b.bookingID \
      join showtimes st \
      on b.showtimeID = st.showtimeID \
      join movies m \
      on st.movieID = m.movieID \
      where b.bookingID = :bookingID",
      {
        replacements: {
          bookingID: req.params.bookingID,
        },
      }
    );
    res.status(200).json(payment);
  } catch (err) {
    res.status(500).json(err);
  }
};

exports.choosenSeat = async (req, res) => {
  try {
    const [seats] = await sequelize.query(
      "SELECT b.seatID, st.theaterID FROM bookings b \
      join showtimes st \
      on b.showtimeID = st.showtimeID \
      where st.showtimeID = :showtimeID \
      and st.theaterID = :theaterID",
      {
        replacements: {
          showtimeID: req.params.showtimeID,
          theaterID: req.params.theaterID,
        },
      }
    );
    console.log(seats);
    const allSeatIDs = seats.flatMap((seat) => seat.seatID).concat();
    console.log(allSeatIDs);

    const choosenSeats = [];
    for (const key in allSeatIDs) {
      const s = await sequelize.query(
        "SELECT c_number, r_number FROM seats where seatID = :seatID",
        {
          replacements: {
            seatID: allSeatIDs[key],
          },
        }
      );
      const rows = s[0][0].r_number;
      const cols = s[0][0].c_number;
      choosenSeats.push(rows + cols);
    }
    console.log(choosenSeats);

    res.status(200).json(choosenSeats);
  } catch (err) {
    res.status(500).json(err);
  }
};

// ch test
exports.createBooking = async (req, res) => {
  if (!req.body.bookingID) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
    return;
  }
  const booking = {
    bookingID: req.body.productID,
    showtimeID: req.body.showtimeID,
    seatID: req.body.seatID,
    userID: req.body.userID,
    price: req.body.price,
    discountID: req.body.discountID,
  };

  BookingsModel.create(booking)
    .then((data) => {
      res.send(data);
    })
    .catch((err) => {
      res.status(500).send({
        message: err,
      });
    });
};

exports.getInfoBooking = async (req, res) => {
  try {
    const [booking] = await sequelize.query(
      "select b.bookingID, users.username, b.price,\
          p.payment_method, p.received,\
          theaters.theater_name, theaters.address as theater_address,\
          seats.theaterID, seats.row_number, seats.seat_number,\
          movies.title,\
          showtimes.date,\
          showtimes.time\
        from bookings b\
        join users on b.userID = users.userID\
        join seats on b.seatID = seats.seatID\
        join theaters on seats.theaterID = theaters.theaterID\
        join showtimes on b.showtimeID = showtimes.showtimeID\
        join movies on movies.movieID = showtimes.movieID\
        join discount on b.discountID = discount.discountID\
        join payment p on b.bookingID = p.bookingID"
    );
    res.json(booking);
  } catch (err) {
    console.log(err);
  }
};
