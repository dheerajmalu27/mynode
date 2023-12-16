// models/Admission.js
const { DataTypes } = require('sequelize');

module.exports = (sequelize, DataTypes) => {
  const Admission = sequelize.define('Admission', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    studentId: DataTypes.INTEGER,
    firstName: DataTypes.STRING,
    middleName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    profileImage: DataTypes.STRING,
    gender: DataTypes.STRING,
    dateOfBirth: DataTypes.DATE,
    classId: DataTypes.INTEGER,
    divId: DataTypes.INTEGER,
    rollNo: DataTypes.INTEGER,
    motherName: DataTypes.STRING,
    motherQual: DataTypes.STRING,
    motherProf: DataTypes.STRING,
    fatherName: DataTypes.STRING,
    fatherQual: DataTypes.STRING,
    fatherProf: DataTypes.STRING,
    parentNumber: DataTypes.STRING,
    parentNumberSecond: DataTypes.STRING,
    nationality: DataTypes.STRING,
    religion: DataTypes.STRING,
    caste: DataTypes.STRING,
    bloodGroup: DataTypes.STRING,
    address: DataTypes.STRING,
    cityId: DataTypes.INTEGER,
    stateId: DataTypes.INTEGER,
    pincode: DataTypes.STRING,
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    createdBy: {
      type: DataTypes.INTEGER,
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updatedBy: {
      type: DataTypes.INTEGER,
    },
    active: {
      type: DataTypes.BOOLEAN,
    },
    paymentId: DataTypes.INTEGER,
  }, {
    freezeTableName: true,
  });

  Admission.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };

  return Admission;
};
