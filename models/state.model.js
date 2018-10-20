const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const State = sequelize.define('State', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    stateName: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  State.associate = function(models) {

    this.City = this.hasMany(models.City, { as: 'CityState', foreignKey: 'stateId', constraints: false}); 
    
  };
  State.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return State;
};