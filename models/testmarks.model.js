const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Testmarks = sequelize.define('Testmarks', {
    id: {
      type: DataTypes.BIGINT,
      autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      primaryKey: true,
      allowNull: false,
    },
    studentId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'student',
        key: 'id',
      },
    },
    classId:{
      type: DataTypes.INTEGER,
      references: {
        model: 'class',
        key: 'id',
      },
    },
    divId:{
      type: DataTypes.INTEGER,
      references: {
        model: 'division',
        key: 'id',
      },
    },
    teacherId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'teacher',
        key: 'id',
      },
    },
    testId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'test',
        key: 'id',
      },
    },
    subId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'subject',
        key: 'id',
      },
    },

    getMarks: DataTypes.STRING,
    totalMarks: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  Testmarks.associate = function(models) {

    this.Students =this.belongsTo(models.Student, { as: 'TestmarksStudent', foreignKey: 'studentId', constraints: false}); // 1 
    this.Classes = this.belongsTo(models.Class, { as: 'TestmarksClass', foreignKey: 'classId', constraints: false});
    this.Divisions = this.belongsTo(models.Division,  { as: 'TestmarksDivision', foreignKey: 'divId', constraints: false});
    this.Teachers = this.belongsTo(models.Teacher, { as: 'TestmarksTeacher', foreignKey: 'teacherId', constraints: false});
    this.Tests =this.belongsTo(models.Test, { as: 'TestmarksTest', foreignKey: 'testId', constraints: false});
    this.Subjects =this.belongsTo(models.Subject, { as: 'TestmarksSubject', foreignKey: 'subId', constraints: false});
    // this.Students = this.belongsToMany(models.Student, {through: 'TestmarksStudent'});
    // this.Test = this.belongsToMany(models.Test, {through: 'TestmarksTest'});
    // this.Classes = this.belongsToMany(models.Class, {through: 'TestmarksClass'});
    // this.Divisions = this.belongsToMany(models.Division, {through: 'TestmarksDivision'});
    // this.Teachers = this.belongsToMany(models.Teacher, {through: 'TestmarksTeacher'});
    // this.Subjects = this.belongsToMany(models.Subject, {through: 'TestmarksSubject'});
  };
  Testmarks.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Testmarks;
};