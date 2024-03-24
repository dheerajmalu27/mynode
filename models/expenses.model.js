const { DataTypes } = require("sequelize");
module.exports = (sequelize) => {
  const Expenses = sequelize.define("Expenses", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
    },
    id_no: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    expense_type: {
      type: DataTypes.STRING(100),
      allowNull: false,
    },
    amount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    phone: {
      type: DataTypes.STRING(15),
    },
    email: {
      type: DataTypes.STRING(255),
    },
    status: {
      type: DataTypes.STRING(50),
    },
    date: {
      type: DataTypes.DATE,
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    createdBy: {
      type: DataTypes.STRING(255),
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      onUpdate: DataTypes.NOW,
    },
    updatedBy: {
      type: DataTypes.STRING(255),
    },
    active: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
  });

  Expenses.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };

  return Expenses;
};
