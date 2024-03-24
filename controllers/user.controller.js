const { User } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const schoolprofile = require("../controllers/schoolprofile.controller");
const crypto = require("crypto");
const nodemailer = require("nodemailer");
const create = async function (req, res) {
  const body = req.body;

  if (!body.email) {
    return ReE(res, "Please enter an email.");
  } else if (!body.password) {
    return ReE(res, "Please enter a password to register.");
  } else {
    let err, user;

    [err, user] = await to(authService.createUser(body));

    if (err) return ReE(res, err, 422);
    return ReS(
      res,
      {
        message: "Successfully created new user.",
        user: user.toWeb(),
        token: user.getJWT(),
      },
      201
    );
  }
};
module.exports.create = create;

const get = async function (req, res) {
  let user = req.user;
  console.log("user" + user);
  return ReS(res, { user: user.toWeb() });
};
module.exports.get = get;

const update = async function (req, res) {
  let err, user, data;
  user = req.user;
  data = req.body;
  user.set(data);

  [err, user] = await to(user.save());
  if (err) {
    if (err.message == "Validation error")
      err = "The email address or phone number is already in use";
    return ReE(res, err);
  }
  return ReS(res, { message: "Updated User: " + user.email });
};
module.exports.update = update;

const remove = async function (req, res) {
  let user, err;
  user = req.user;

  [err, user] = await to(user.destroy());
  if (err) return ReE(res, "error occured trying to delete user");

  return ReS(res, { message: "Deleted User" }, 200);
};
module.exports.remove = remove;
const login = async function (req, res) {
  const body = req.body;
  let err, user;

  [err, user] = await to(authService.authUser(req.body));

  if (err) {
    // console.log(err);
    // If user not found, try authentication with authUserTeacherView
    if (err.message === "Not registered") {
      [err, user] = await to(authService.authUserTeacherView(req.body));
      console.log("user");
      console.log(user);

      if (err) return ReE(res, err, 422);
    } else {
      return ReE(res, err, 422);
    }
  }

  try {
    let schoolprofiledata = await schoolprofile.getAll({}, {});
    const schoolprofileObjects = schoolprofiledata.schoolprofile.map(
      (profile) => profile.dataValues
    );
    if (user.dataValues && user.dataValues.hasOwnProperty("password")) {
      delete user.dataValues.password;
    }

    return ReS(res, {
      token: user.getJWT(),
      user: user.toWeb(),
      schoolprofile: schoolprofileObjects[0],
    });
  } catch (error) {
    console.log(error);
    return ReE(res, error, 500); // Handle any errors that might occur
  }
};
module.exports.login = login;

// Forgot password endpoint
const sendPasswordResetEmail = async (email, resetToken) => {
  // Create a nodemailer transporter with your SMTP settings
  let transporter = nodemailer.createTransport({
    host: "smtp.mail.yahoo.com",
    port: 587,
    secure: false,
    auth: {
      user: "dheerajmalu@example.com",
      pass: "ibcrhaicuffilhkc",
      //oclqusjyjmxtqbpb
    },
  });

  // Email content
  let mailOptions = {
    from: "schooltest@techinnowiz.com",
    to: email,
    subject: "Password Reset Request",
    html: `
      <p>You are receiving this email because a password reset request was made for your account.</p>
      <p>Please click the following link to reset your password:</p>
      <a href="https://schooltest.techinnowiz.com/reset-password/${resetToken}">Reset Password</a>
      <p>If you did not request this, please ignore this email and your password will remain unchanged.</p>
    `,
  };

  // Send email
  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log("Error sending email:", error);
    } else {
      console.log("Email sent:", info.response);
    }
  });
};

// Forgot password endpoint
const forgotPassword = async function (req, res) {
  const { email } = req.body;

  if (!email) {
    return ReE(res, "Please enter an email.", 400);
  }

  let err, user;

  [err, user] = await to(User.findOne({ where: { email } }));

  if (err) {
    return ReE(res, err.message, 500);
  }

  if (!user) {
    return ReE(res, "Email not found", 404);
  }

  // Generate token
  const token = crypto.randomBytes(20).toString("hex");
  const timestamp = Date.now();

  [err] = await to(
    user.update({ resetToken: token, resetTokenTimestamp: timestamp })
  );

  if (err) {
    return ReE(res, "Error updating user", 500);
  }

  // Send password reset email
  sendPasswordResetEmail(email, token);

  return ReS(
    res,
    { message: "Password reset token generated successfully." },
    200
  );
};
module.exports.forgotPassword = forgotPassword;
// Reset password endpoint
const resetPassword = async function (req, res) {
  const { token, newPassword } = req.body;

  if (!token) {
    return ReE(res, "Token is required.", 400);
  }

  if (!newPassword) {
    return ReE(res, "New password is required.", 400);
  }

  let err, user;

  [err, user] = await to(User.findOne({ where: { resetToken: token } }));

  if (err) {
    return ReE(res, err.message, 500);
  }

  if (!user) {
    return ReE(res, "Invalid or expired token", 400);
  }

  const tokenExpiration = 3600 * 1000; // 1 hour

  if (Date.now() - user.resetTokenTimestamp > tokenExpiration) {
    return ReE(res, "Token has expired", 400);
  }

  // Update password
  user.password = newPassword; // Assuming you have a 'password' field in your User model
  user.resetToken = null; // Clear the reset token
  user.resetTokenTimestamp = null; // Clear the token timestamp

  [err] = await to(user.save());

  if (err) {
    return ReE(res, "Error updating password", 500);
  }

  return ReS(res, { message: "Password reset successful" }, 200);
};
module.exports.resetPassword = resetPassword;
