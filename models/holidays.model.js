const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Holidays = sequelize.define('Holidays', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      allowNull: false,
    },
    holidayDate: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  // Class.associate = function(models) {
    
  // };
  Holidays.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Holidays;
};