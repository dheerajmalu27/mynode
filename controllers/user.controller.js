const { User } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const schoolprofile = require("../controllers/schoolprofile.controller");
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
