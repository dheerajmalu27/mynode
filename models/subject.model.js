const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Subject = sequelize.define('Subject', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      allowNull: false,
    },
    subName: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {
    freezeTableName: true,
  });
  Subject.associate = function(models) {
    this.Classes = this.belongsToMany(models.Class, {through: 'SubjectClass'});
    this.Divisions = this.belongsToMany(models.Division, {through: 'SubjectDivision'});
  };
  Subject.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Subject;
};