const { TE, to } = require('../services/util.service');

module.exports = (sequelize, DataTypes) => {
  const UserRole = sequelize.define('UserRole', {
    userRoleId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    userId: {
      type: DataTypes.INTEGER,
    },
    roleId: {
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

  return UserRole;
};
