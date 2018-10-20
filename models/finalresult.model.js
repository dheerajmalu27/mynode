const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const Finalresult = sequelize.define('Finalresult', {
    id: {
      type: DataTypes.BIGINT,
      primaryKey: true,
      autoIncrement: true // Automatically gets converted to SERIAL for postgres
    },
    getMarks: DataTypes.INTEGER,
    totalMarks: DataTypes.INTEGER,
    resultDate: DataTypes.STRING,
    active: DataTypes.BOOLEAN
  }, {});
  Finalresult.associate = function(models) {
    this.Students = this.belongsToMany(models.Student, {through: 'FinalresultStudent'});
    this.Classes = this.belongsToMany(models.Class, {through: 'FinalresultClass'});
    this.Divisions = this.belongsToMany(models.Division, {through: 'FinalresultDivision'});
    this.Subjects = this.belongsToMany(models.Subject, {through: 'FinalresultSubject'});
  };
  Finalresult.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Finalresult;
};