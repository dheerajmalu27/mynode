const { TE, to } = require("../services/util.service");
module.exports = (sequelize, DataTypes) => {
  const Leavingcertificate = sequelize.define(
    "Leavingcertificate",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      },
      studentId: DataTypes.INTEGER,
      firstName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      middleName: DataTypes.STRING,
      className: DataTypes.STRING,
      divName: DataTypes.STRING,
      gender: DataTypes.INTEGER,
      dateOfBirth: DataTypes.STRING,
      rollNo: DataTypes.STRING,
      motherName: DataTypes.STRING,
      fatherName: DataTypes.STRING,
      nationality: DataTypes.STRING,
      religion: DataTypes.STRING,
      caste: DataTypes.STRING,
      lastResult: DataTypes.STRING,
      generalConduct: DataTypes.STRING,
      dateOfCertificate: DataTypes.STRING,
      leavingReason: DataTypes.STRING,
      remark: DataTypes.TEXT,
      otherData: DataTypes.TEXT,
      active: DataTypes.BOOLEAN,
    },
    {
      freezeTableName: true,
    }
  );
  Leavingcertificate.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };
  return Leavingcertificate;
};
