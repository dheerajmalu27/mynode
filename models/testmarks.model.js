const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Testmarks = sequelize.define('Testmarks', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    getMarks: DataTypes.STRING,
    totalMarks: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  Testmarks.associate = function(models) {
    this.Students = this.belongsToMany(models.Student, {through: 'TestmarksStudent'});
    this.Test = this.belongsToMany(models.Test, {through: 'TestmarksTest'});
    this.Classes = this.belongsToMany(models.Class, {through: 'TestmarksClass'});
    this.Divisions = this.belongsToMany(models.Division, {through: 'TestmarksDivision'});
    this.Teachers = this.belongsToMany(models.Teacher, {through: 'TestmarksTeacher'});
    this.Subjects = this.belongsToMany(models.Subject, {through: 'TestmarksSubject'});
  };
  Testmarks.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Testmarks;
};