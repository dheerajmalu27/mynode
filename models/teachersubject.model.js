const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Teachersubject= sequelize.define('Teachersubject', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    teacherId: DataTypes.BIGINT, // Use DataTypes for specifying data types
    subId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    classId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    divId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    active: DataTypes.BOOLEAN
  },  {
    freezeTableName: true,
  });
  Teachersubject.associate = function(models) {
    this.Subjects = this.belongsToMany(models.Subject, {through: 'TeachersubjectSubject'});
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