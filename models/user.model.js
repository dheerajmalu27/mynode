"use strict";
const bcrypt = require("bcrypt");
const bcrypt_p = require("bcrypt-promise");
const jwt = require("jsonwebtoken");
const { TE, to } = require("../services/util.service");
const CONFIG = require("../config/config");

module.exports = (sequelize, DataTypes) => {
  var Model = sequelize.define("User", {
    first: DataTypes.STRING,
    last: DataTypes.STRING,
    email: {
      type: DataTypes.STRING,
      allowNull: true,
      unique: true,
      validate: { isEmail: { msg: "Email address is invalid." } },
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
      unique: true,
      validate: {
        len: { args: [7, 20], msg: "Phone number is invalid, too short." },
        isNumeric: { msg: "Phone number must be numeric." },
      },
    },
    password: DataTypes.STRING,
    active: DataTypes.BOOLEAN,
    role: DataTypes.STRING,
    resetToken: DataTypes.STRING, // New column for storing reset token
    resetTokenExpires: DataTypes.DATE, // New column for storing reset token expiration timestamp
  });

  // Other model associations and methods...

  Model.beforeSave(async (user, options) => {
    let err;
    if (user.changed("password")) {
      let salt, hash;
      [err, salt] = await to(bcrypt.genSalt(10));
      if (err) TE(err.message, true);

      [err, hash] = await to(bcrypt.hash(user.password, salt));
      if (err) TE(err.message, true);

      user.password = hash;
    }
  });

  Model.prototype.comparePassword = async function (pw) {
    let err, pass;
    if (!this.password) TE("Password not set");

    [err, pass] = await to(bcrypt_p.compare(pw, this.password));
    if (err) TE(err);

    if (!pass) TE("Invalid password");

    return this;
  };

  Model.prototype.getJWT = function () {
    let expiration_time = parseInt(CONFIG.jwt_expiration);
    return (
      "Bearer " +
      jwt.sign({ user_id: this.id }, CONFIG.jwt_encryption, {
        expiresIn: expiration_time,
      })
    );
  };

  Model.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    console.log(json);
    return json;
  };

  return Model;
};
