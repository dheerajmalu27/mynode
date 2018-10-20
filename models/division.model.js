const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Division = sequelize.define('Division', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    divName: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  // Division.associate = function(models) {
   
  // };
  Division.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Division;
};