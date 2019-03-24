const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Teacher = sequelize.define('Teacher', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    firstName: DataTypes.STRING,
    middleName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    profileImage: DataTypes.STRING,
    gender: DataTypes.INTEGER,
    dateOfBirth: DataTypes.STRING,
    qualification: DataTypes.STRING,
    nationality:DataTypes.STRING,
    bloodGroup:DataTypes.STRING,
    caste:DataTypes.STRING,
    experience: DataTypes.STRING,
    mobileNumber: DataTypes.INTEGER,
    mobileNumberSecond: DataTypes.INTEGER,
    address: DataTypes.TEXT,
    pincode: DataTypes.STRING,
    joiningDate: DataTypes.STRING,
    endDate: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  Teacher.associate = function(models) {
    this.City = this.belongsTo(models.City,{ as: 'TeacherCity', foreignKey: 'cityId', constraints: false}); // 1 
    this.State = this.belongsTo(models.State,{ as: 'TeacherState', foreignKey: 'stateId', constraints: false}); // 1 
  };
  Teacher.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Teacher;
};