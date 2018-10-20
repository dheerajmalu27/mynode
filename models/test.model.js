const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Test = sequelize.define('Test', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    testName: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  // Test.associate = function(models) {

  // };
  Test.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Test;
};