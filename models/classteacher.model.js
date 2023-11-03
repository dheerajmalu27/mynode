const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Classteacher = sequelize.define('Classteacher', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    teacherId: DataTypes.BIGINT, // Use DataTypes for specifying data types
    // subId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    classId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    divId: DataTypes.INTEGER, // Use DataTypes for specifying data types
    active: DataTypes.BOOLEAN
  },  {
    freezeTableName: true,
  });
  Classteacher.associate = function(models) {
     this.Class = this.belongsToMany(models.Class, {through: 'ClassteacherClass'});
    this.Division = this.belongsToMany(models.Division, {through: 'ClassteacherDivision'});
    this.Teacher = this.belongsToMany(models.Teacher, {through: 'ClassteacherTeacher'});
  };
  Classteacher.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Classteacher;
};