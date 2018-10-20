'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('division', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      divName:{
        type: Sequelize.STRING, 
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
    return queryInterface.dropTable('division');
  },
};