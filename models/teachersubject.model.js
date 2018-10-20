const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Teachersubject = sequelize.define('Teachersubject', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    active: DataTypes.BOOLEAN
  }, {});
  Teachersubject.associate = function(models) {
    this.Subjects = this.belongsToMany(models.Subject, {through: 'TeachersubjectSubjects'});
    this.Classes = this.belongsToMany(models.Class, {through: 'TeachersubjectClass'});
    this.Divisions = this.belongsToMany(models.Division, {through: 'TeachersubjectDivision'});
    this.Teachers = this.belongsToMany(models.Teacher, {through: 'TeachersubjectTeacher'});
  };
  Teachersubject.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Teachersubject;
};