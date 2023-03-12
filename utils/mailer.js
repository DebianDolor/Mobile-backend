const nodemailer = require("nodemailer");
require("dotenv/config");

exports.sendingMail = async ({ from, to, subject, text }) => {
  try {
    let mailOptions = {
      from,
      to,
      subject,
      text,
    };

    const Transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        // user: "nguyenhaiphong2308@gmail.com",
        // pass: "ulloorcqyitaqsmb",
        user: process.env.EMAIL,
        pass: process.env.PW,
      },
    });
    return await Transporter.sendMail(mailOptions);
  } catch (error) {
    console.log(error);
  }
};
