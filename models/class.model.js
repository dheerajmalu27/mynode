const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Class = sequelize.define('Class', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      allowNull: false,
    },
    className: DataTypes.STRING,
    divIds: DataTypes.TEXT,
    subjectIds: DataTypes.TEXT,
    testIds: DataTypes.TEXT,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  // Class.associate = function(models) {
    
  // };
  Class.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Class;
};