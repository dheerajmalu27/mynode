const {TE, to}              = require('../services/util.service');
module.exports = (sequelize, DataTypes) => {
  const SchoolOtherDocs = sequelize.define('SchoolOtherDocs', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    docName: DataTypes.STRING,
    filePath: DataTypes.STRING,
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    createdBy: DataTypes.STRING,
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      onUpdate: DataTypes.NOW,
    },
    updatedBy: DataTypes.STRING,
    active: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  }, {
    freezeTableName: true,
  });
  // Division.associate = function(models) {
   
  // };
  SchoolOtherDocs.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return SchoolOtherDocs;
};