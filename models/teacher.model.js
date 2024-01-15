"use strict";
const bcrypt = require("bcrypt");
const bcrypt_p = require("bcrypt-promise");
const jwt = require("jsonwebtoken");
const { TE, to } = require("../services/util.service");
const CONFIG = require("../config/config");

module.exports = (sequelize, DataTypes) => {
  const Teacher = sequelize.define(
    "Teacher",
    {
      id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      },
      firstName: DataTypes.STRING,
      middleName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      profileImage: DataTypes.STRING,
      gender: DataTypes.INTEGER,
      dateOfBirth: DataTypes.STRING,
      qualification: DataTypes.STRING,
      nationality: DataTypes.STRING,
      bloodGroup: DataTypes.STRING,
      caste: DataTypes.STRING,
      experience: DataTypes.STRING,
      mobileNumber: DataTypes.INTEGER,
      mobileNumberSecond: DataTypes.INTEGER,
      address: DataTypes.TEXT,
      pincode: DataTypes.STRING,
      joiningDate: DataTypes.STRING,
      endDate: DataTypes.STRING,
      active: DataTypes.BOOLEAN,
      emailid: DataTypes.STRING,
      password: DataTypes.STRING,
    },
    {
      freezeTableName: true,
    }
  );
  Teacher.associate = function (models) {
    this.City = this.belongsTo(models.City, {
      as: "TeacherCity",
      foreignKey: "cityId",
      constraints: false,
    }); // 1
    this.State = this.belongsTo(models.State, {
      as: "TeacherState",
      foreignKey: "stateId",
      constraints: false,
    }); // 1
  };
  Teacher.prototype.comparePassword = async function (pw) {
    let err, pass;
    if (!this.password) TE("Password not set");

    [err, pass] = await to(bcrypt.compare(pw, this.password));
    if (err) TE(err);

    if (!pass) TE("Invalid password");

    return this;
  };

  Teacher.prototype.getJWT = function () {
    let expiration_time = parseInt(CONFIG.jwt_expiration);
    return (
      "Bearer " +
      jwt.sign({ user_id: this.id }, CONFIG.jwt_encryption, {
        expiresIn: expiration_time,
      })
    );
  };
  Teacher.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };
  return Teacher;
};
