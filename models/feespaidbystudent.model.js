// Import Sequelize
const { DataTypes } = require('sequelize');

// Define the Sequelize model for 'feespaidbystudent' table
module.exports = (sequelize) => {
  const FeesPaidByStudent = sequelize.define('FeesPaidByStudent', {
    paymentId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    admissionId: {
      type: DataTypes.INTEGER,   
    },
    studentId: {
      type: DataTypes.INTEGER,
    },
    feeId: {
      type: DataTypes.INTEGER,
    },
    classId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    divId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    paymentAmount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    remainingAmount: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    paymentDate: {
      type: DataTypes.DATE,
    },
    paymentMethod: {
      type: DataTypes.STRING(50),
      allowNull: false,
    },
    paymentDetail: {
      type: DataTypes.STRING(100),
    },
    isPartial: {
      type: DataTypes.BOOLEAN,
    },
    feesPaymentDetails: {
      type: DataTypes.TEXT,
      length: 'long',
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
  }, {
    freezeTableName: true,
  });
  FeesPaidByStudent.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
};
  return FeesPaidByStudent;
};
