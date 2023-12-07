const { TE, to } = require('../services/util.service');

module.exports = (sequelize, DataTypes) => {
  const Borrowedbooks = sequelize.define('Borrowedbooks', {
    borrowId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    bookId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    studentId: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    borrowDate: {
      type: DataTypes.DATE,
      allowNull: true,
    },
    returnDate: {
      type: DataTypes.DATE,
      allowNull: true,
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
  }, {
    freezeTableName: true,
  });

  Borrowedbooks.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };

  return Borrowedbooks;
};
