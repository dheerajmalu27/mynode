const { TE, to } = require('../services/util.service');

module.exports = (sequelize, DataTypes) => {
  const RolePermissions = sequelize.define('RolePermissions', {
    rolePermissionID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    roleId: {
      type: DataTypes.INTEGER,
    },
    permissionId: {
      type: DataTypes.INTEGER,
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

  return RolePermissions;
};
