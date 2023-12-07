const { TE, to } = require('../services/util.service');

module.exports = (sequelize, DataTypes) => {
  const Permissions = sequelize.define('Permissions', {
    permissionId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    permissionName: {
      type: DataTypes.STRING,
      unique: true,
    },
    createdBy: {
      type: DataTypes.INTEGER,
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updatedBy: {
      type: DataTypes.INTEGER,
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      onUpdate: DataTypes.NOW,
    },
    active: {
      type: DataTypes.BOOLEAN,
    },
  });

  return Permissions;
};
