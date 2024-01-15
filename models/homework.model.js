// models/Homework.js
const { DataTypes } = require("sequelize");
const { TE, to } = require("../services/util.service");

module.exports = (sequelize, DataTypes) => {
  const Homework = sequelize.define(
    "Homework",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      classId: DataTypes.INTEGER,
      divId: DataTypes.INTEGER,
      subId: DataTypes.INTEGER,
      teacherId: DataTypes.INTEGER,
      title: DataTypes.STRING,
      description: DataTypes.TEXT,
      deadline: DataTypes.DATE,
      // isCompleted: DataTypes.BOOLEAN,
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
    },
    {
      freezeTableName: true,
    }
  );

  Homework.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };

  return Homework;
};
