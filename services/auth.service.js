const { User } = require("../models");
const { Teacher } = require("../models");
const validator = require("validator");
const { to, TE } = require("../services/util.service");
const db = require("../models/index").db;
const CONFIG = require("../config/config");
const bcrypt_p = require("bcrypt-promise");
const jwt = require("jsonwebtoken");
const getUniqueKeyFromBody = function (body) {
  // this is so they can send in 3 options unique_key, email, or phone and it will work
  let unique_key = body.unique_key;
  if (typeof unique_key === "undefined") {
    if (typeof body.email != "undefined") {
      unique_key = body.email;
    } else if (typeof body.phone != "undefined") {
      unique_key = body.phone;
    } else {
      unique_key = null;
    }
  }

  return unique_key;
};
module.exports.getUniqueKeyFromBody = getUniqueKeyFromBody;

const createUser = async (userInfo) => {
  let unique_key, auth_info, err;

  auth_info = {};
  auth_info.status = "create";

  unique_key = getUniqueKeyFromBody(userInfo);
  if (!unique_key) TE("An email or phone number was not entered.");

  if (validator.isEmail(unique_key)) {
    auth_info.method = "email";
    userInfo.email = unique_key;

    [err, user] = await to(User.create(userInfo));
    if (err) TE("user already exists with that email");

    return user;
  } else if (validator.isMobilePhone(unique_key, "any")) {
    //checks if only phone number was sent
    auth_info.method = "phone";
    userInfo.phone = unique_key;

    [err, user] = await to(User.create(userInfo));
    if (err) TE("user already exists with that phone number");

    return user;
  } else {
    TE("A valid email or phone number was not entered.");
  }
};
module.exports.createUser = createUser;

const authUser = async function (userInfo) {
  //returns token
  let unique_key;
  let auth_info = {};
  auth_info.status = "login";
  unique_key = getUniqueKeyFromBody(userInfo);

  if (!unique_key) {
    TE("Please enter an email or phone number to login");
  }

  if (!userInfo.password) {
    TE("Please enter a password to login");
  }

  let user;
  try {
    if (validator.isEmail(unique_key)) {
      auth_info.method = "email";

      [err, user] = await to(User.findOne({ where: { email: unique_key } }));
      if (err) {
        TE(err.message);
      }
    } else if (validator.isMobilePhone(unique_key, "any")) {
      //checks if only phone number was sent
      auth_info.method = "phone";

      [err, user] = await to(User.findOne({ where: { phone: unique_key } }));
      if (err) {
        TE(err.message);
      }
    } else {
      TE("A valid email or phone number was not entered");
    }

    if (!user) {
      TE("Not registered");
    }

    [err, user] = await to(user.comparePassword(userInfo.password));

    if (err) {
      TE(err.message);
    }

    return user;
  } catch (error) {
    throw error;
  }
};

module.exports.authUser = authUser;

// const authUser = async function (userInfo) {
//   //returns token
//   let unique_key;
//   let auth_info = {};
//   auth_info.status = "login";
//   unique_key = getUniqueKeyFromBody(userInfo);

//   if (!unique_key) TE("Please enter an email or phone number to login");

//   if (!userInfo.password) TE("Please enter a password to login");

//   let user;
//   if (validator.isEmail(unique_key)) {
//     auth_info.method = "email";

//     [err, user] = await to(User.findOne({ where: { email: unique_key } }));
//     if (err) TE(err.message);
//   } else if (validator.isMobilePhone(unique_key, "any")) {
//     //checks if only phone number was sent
//     auth_info.method = "phone";

//     [err, user] = await to(User.findOne({ where: { phone: unique_key } }));
//     if (err) TE(err.message);
//   } else {
//     TE("A valid email or phone number was not entered");
//   }

//   if (!user) TE("Not registered");

//   [err, user] = await to(user.comparePassword(userInfo.password));

//   if (err) TE(err.message);

//   return user;
// };
// module.exports.authUser = authUser;

const authTeacher = async function (teacherInfo) {
  let unique_key;
  let auth_info = {};
  auth_info.status = "login";
  unique_key = getUniqueKeyFromBody(teacherInfo);

  if (!unique_key) TE("Please enter an email or phone number to login");

  if (!teacherInfo.password) TE("Please enter a password to login");

  let teacher;
  if (validator.isEmail(unique_key)) {
    auth_info.method = "email";

    [err, teacher] = await to(
      Teacher.findOne({ where: { emailid: unique_key } })
    );
    if (err) TE(err.message);
  } else if (validator.isMobilePhone(unique_key, "any")) {
    auth_info.method = "phone";

    [err, teacher] = await to(
      Teacher.findOne({ where: { mobileNumber: unique_key } })
    );
    if (err) TE(err.message);
  } else {
    TE("A valid email or phone number was not entered");
  }

  if (!teacher) TE("Not registered");

  [err, teacher] = await to(teacher.comparePassword(teacherInfo.password));
  console.log(teacher);
  if (err) TE(err.message);

  return teacher;
};

module.exports.authTeacher = authTeacher;

const authUserTeacherView = async function (userInfo) {
  let uniqueKey;
  let authInfo = {};
  authInfo.status = "login";
  uniqueKey = getUniqueKeyFromBody(userInfo);

  if (!uniqueKey) TE("Please enter an email or phone number to login");
  if (!userInfo.password) TE("Please enter a password to login");

  let userTeacherView;
  let query;
  if (validator.isEmail(uniqueKey)) {
    authInfo.method = "email";

    query = `SELECT * FROM userteacherview WHERE emailid = '${uniqueKey}';`;
  } else if (validator.isMobilePhone(uniqueKey, "any")) {
    authInfo.method = "phone";

    query = `SELECT * FROM userteacherview WHERE mobileNumber = '${uniqueKey}';`;
  } else {
    TE("A valid email or phone number was not entered");
  }

  try {
    [userTeacherView] = await db.sequelize.query(query, { raw: true });
  } catch (err) {
    TE(err.message);
  }

  if (userTeacherView.length == 0) {
    TE("Not registered");
  } else {
    userTeacherView = userTeacherView[0];
  }

  const isPasswordMatch = await comparePassword(
    userInfo.password,
    userTeacherView.password
  );

  if (!isPasswordMatch) TE("Invalid password");

  userTeacherView.getJWT = function () {
    let expiration_time = parseInt(CONFIG.jwt_expiration);
    return (
      "Bearer " +
      jwt.sign({ user_id: this.id }, CONFIG.jwt_encryption, {
        expiresIn: expiration_time,
      })
    );
  };

  userTeacherView.toWeb = function () {
    let json = { ...this }; // Create a copy of the userTeacherView object
    delete json.password; // Remove the password field from the response
    return json;
  };

  return userTeacherView;
};

async function comparePassword(password, hashedPassword) {
  if (!hashedPassword) TE("password not set");

  [err, pass] = await to(bcrypt_p.compare(password, hashedPassword));

  if (err) TE(err);

  if (!pass) TE("invalid password");

  return pass;
}

module.exports.authUserTeacherView = authUserTeacherView;
