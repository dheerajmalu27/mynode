'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('teacher', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.BIGINT,
      },
      firstName:{
        type: Sequelize.STRING, 
      },
      middleName:{
        type: Sequelize.STRING, 
      },
      lastName:{
        type: Sequelize.STRING, 
      },
      profileImage:{
        type: Sequelize.STRING, 
      },
      gender:{
        type: Sequelize.INTEGER, 
      },
      dateOfBirth:{
        type: Sequelize.STRING, 
      },
      qualification:{
        type: Sequelize.STRING, 
      },
      experience:{
        type: Sequelize.STRING, 
      },
      
      mobileNumber:{
        type: Sequelize.STRING, 
      },
      mobileNumberSecond:{
        type: Sequelize.STRING, 
      },
      address:{
        type: Sequelize.TEXT, 
      },
      cityId:{
        type: Sequelize.BIGINT,
        references: {
          model: 'city',
          key: 'id',
        },
      },
      stateId:{
        type: Sequelize.BIGINT,
        references: {
          model: 'state',
          key: 'id',
        },
      },
      pincode:{
        type: Sequelize.STRING, 
      },
      joiningDate:{
        type: Sequelize.STRING, 
      },
      endDate:{
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
    return queryInterface.dropTable('teacher');
  },
};