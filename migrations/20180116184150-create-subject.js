'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('subject', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      subName:{
        type: Sequelize.STRING,  
      },
      classId:{
        type: Sequelize.INTEGER,
        references: {
          model: 'class',
          key: 'id',
        },
      },
      divId:{
        type: Sequelize.INTEGER,
        references: {
          model: 'division',
          key: 'id',
        },
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
    return queryInterface.dropTable('subject');
  },
};