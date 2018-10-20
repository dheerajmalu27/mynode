const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Todo = sequelize.define('Todo', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    title: DataTypes.STRING,
    description: DataTypes.STRING
  }, {});
  Todo.associate = function(models) {
    // associations can be defined here
  };
  Todo.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Todo;
};