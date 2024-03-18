const { TE, to } = require("../services/util.service");
module.exports = (sequelize, DataTypes) => {
  const Schoolprofile = sequelize.define(
    "Schoolprofile",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true, // Automatically gets converted to SERIAL for postgres
        allowNull: false,
      },
      schoolName: DataTypes.STRING,
      schoolLogo: DataTypes.STRING,
      schoolAddress: DataTypes.STRING,
      contactNo1: DataTypes.STRING,
      contactNo2: DataTypes.STRING,
      regNo: DataTypes.STRING,
      schoolStartDate: DataTypes.STRING,
      schoolEndDate: DataTypes.STRING,
      website: DataTypes.STRING,
      emailId: DataTypes.STRING,
      active: DataTypes.BOOLEAN,
    },
    {
      freezeTableName: true,
    }
  );
  // Schoolprofile.associate = function(models) {

  // };
  Schoolprofile.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };
  return Schoolprofile;
};
