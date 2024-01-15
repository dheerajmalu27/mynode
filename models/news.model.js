const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  const News = sequelize.define(
    "News",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      newsEventType: {
        type: DataTypes.STRING,
      },
      newsEventTitle: {
        type: DataTypes.STRING,
      },
      newsEventDetail: {
        type: DataTypes.STRING,
      },
      newsEventDate: {
        type: DataTypes.STRING,
      },
      createdAt: {
        type: DataTypes.DATE,
      },
      createdBy: {
        type: DataTypes.STRING,
      },
      updatedAt: {
        type: DataTypes.DATE,
      },
      updatedBy: {
        type: DataTypes.STRING,
      },
      active: {
        type: DataTypes.BOOLEAN,
      },
    },
    {
      freezeTableName: true,
    }
  );

  News.prototype.toWeb = function () {
    const json = this.toJSON();
    return json;
  };

  return News;
};
