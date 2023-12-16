// Import Sequelize
const { DataTypes } = require('sequelize');
const {TE, to}              = require('../services/util.service');
// Define the Sequelize model for 'fees' table
module.exports = (sequelize) => {
  const Fees = sequelize.define('Fees', {
    feeId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    classId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    tuitionFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    developmentFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    examinationFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    sportsFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    transportationFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    libraryFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    labFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    securityFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    otherFee: {
      type: DataTypes.DECIMAL(20, 2),
      allowNull: false,
    },
    totalFee: {
      type: DataTypes.DECIMAL(20, 2),
     
    },
    paymentFrequency: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    dueDate: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    lateFee: {
      type: DataTypes.DECIMAL(20, 2),
    },
    discount: {
      type: DataTypes.DECIMAL(20, 2),
    },
    createdAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
    updatedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
      onUpdate: DataTypes.NOW,
    },
  });
  Fees.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return Fees;
};
