const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Timetable = sequelize.define('Timetable', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      allowNull: false,
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
    subId:{
      type: DataTypes.BIGINT,
      references: {
        model: 'subject',
        key: 'id',
      },
    },
    timeSlot: DataTypes.STRING,
    textData: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  Timetable.associate = function(models) {   
    this.Classes = this.belongsTo(models.Class, { as: 'TimetableClass', foreignKey: 'classId', constraints: false});
    this.Divisions = this.belongsTo(models.Division,  { as: 'TimetableDivision', foreignKey: 'divId', constraints: false});
    this.Subjects =this.belongsTo(models.Subject, { as: 'TimetableSubject', foreignKey: 'subId', constraints: false});
  };
  // Class.associate = function(models) {
    
  // };
  Timetable.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Timetable;
};