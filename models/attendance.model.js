const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Attendance = sequelize.define('Attendance', {
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
    classTeacherId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'teacher',
        key: 'id',
      },
    },
    attendanceDate: DataTypes.STRING,
    attendanceResult: DataTypes.BOOLEAN,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
});
  Attendance.associate = function(models) {
    this.Student =this.belongsTo(models.Student, { as: 'AttendanceStudent', foreignKey: 'studentId', constraints: false}); // 1 
    this.Classes = this.belongsTo(models.Class, { as: 'AttendanceClass', foreignKey: 'classId', constraints: false});
    this.Divisions = this.belongsTo(models.Division,  { as: 'AttendanceDivision', foreignKey: 'divId', constraints: false});
    this.Teachers = this.belongsTo(models.Teacher, { as: 'AttendanceClassTeacher', foreignKey: 'classTeacherId', constraints: false});

  };
  Attendance.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Attendance;
};