'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('testMarks', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.BIGINT,
      },
      studentId:{
        type: Sequelize.BIGINT,
        references: {
          model: 'student',
          key: 'id',
        },
      },
      teacherId:{
        type: Sequelize.BIGINT,
        references: {
          model: 'teacher',
          key: 'id',
        },
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
      testId:{
        type: Sequelize.BIGINT,
        references: {
          model: 'test',
          key: 'id',
        },
      },
      subId:{
        type: Sequelize.INTEGER,
        references: {
          model: 'subject',
          key: 'id',
        },
      },
      getMarks:{
        type: Sequelize.STRING, 
      },
      totalMarks: {
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
    return queryInterface.dropTable('testMarks');
  },
};