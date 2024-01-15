module.exports = (sequelize, DataTypes) => {
  const Student = sequelize.define(
    "Student",
    {
      id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true, // Automatically gets converted to SERIAL for postgres
      },
      firstName: DataTypes.STRING,
      middleName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      profileImage: DataTypes.STRING,
      gender: DataTypes.INTEGER,
      dateOfBirth: DataTypes.STRING,
      rollNo: DataTypes.STRING,
      motherName: DataTypes.STRING,
      motherQual: DataTypes.STRING,
      motherProf: DataTypes.STRING,
      fatherName: DataTypes.STRING,
      fatherQual: DataTypes.STRING,
      fatherProf: DataTypes.STRING,
      parentNumber: DataTypes.INTEGER,
      parentNumberSecond: DataTypes.INTEGER,
      address: DataTypes.TEXT,
      pincode: DataTypes.STRING,
      nationality: DataTypes.STRING,
      religion: DataTypes.STRING,
      caste: DataTypes.STRING,
      bloodGroup: DataTypes.STRING,
      address: DataTypes.STRING,
      cityId: DataTypes.INTEGER,
      stateId: DataTypes.INTEGER,
      pincode: DataTypes.STRING,
      active: DataTypes.BOOLEAN,
    },
    {
      freezeTableName: true,
    }
  );
  Student.associate = function (models) {
    this.City = this.belongsTo(models.City, {
      as: "StudentCity",
      foreignKey: "cityId",
      constraints: false,
    }); // 1
    this.State = this.belongsTo(models.State, {
      as: "StudentState",
      foreignKey: "stateId",
      constraints: false,
    }); // 1
    this.Class = this.belongsTo(models.Class, {
      as: "StudentClass",
      foreignKey: "classId",
      constraints: false,
    }); // 1
    this.Division = this.belongsTo(models.Division, {
      as: "StudentDivision",
      foreignKey: "divId",
      constraints: false,
    }); // 1
    this.Attendance = this.hasMany(models.Attendance, {
      as: "AttendanceStudent",
      foreignKey: "studentId",
      constraints: false,
    });
    this.Testmarks = this.hasMany(models.Testmarks, {
      as: "StudentTestmarks",
      foreignKey: "studentId",
      constraints: false,
    });
  };
  Student.prototype.toWeb = function (pw) {
    let json = this.toJSON();
    return json;
  };
  return Student;
};
