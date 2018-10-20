'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('parentuser', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.BIGINT,
      },
      parentName:{
        type: Sequelize.STRING,
      },
      parentMobileNumber:{
        type: Sequelize.INTEGER,
      },
      parentPwd:{
        type: Sequelize.STRING,
      },
      studentIds:{
        type: Sequelize.STRING,
      },
      parentDevice:{
        type: Sequelize.STRING,
      },
      parentDeviceVerify:{
        type: Sequelize.INTEGER,
      },
      activeDevice:{
        type: Sequelize.INTEGER,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      createdBy:{
        type: Sequelize.BIGINT,
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedBy:{
        type: Sequelize.BIGINT,
      },
      active: {
        type: Sequelize.BOOLEAN, // have also tried Sequelize.INTEGER
        defaultValue:true,
      },
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('testMarks');
  },
};