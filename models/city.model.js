const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const City = sequelize.define('City', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    cityName: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  City.associate = function(models) {
    this.States =this.belongsTo(models.State, { as: 'CityState', foreignKey: 'stateId', constraints: false}); // 1 
    
    
  };
  City.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return City;
};