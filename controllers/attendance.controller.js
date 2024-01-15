const { Attendance } = require("../models");
const { Student } = require("../models");
const { Class } = require("../models");
const { Division } = require("../models");
const { Teacher } = require("../models");
const db = require("../models/index").db;
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const { Op } = require("sequelize"); // Add this line to import Op

const create = async function (req, res) {
  let err, attendanceObj;
  let attendanceInfo = req.body;

  [err, attendanceObj] = await to(Attendance.create(attendanceInfo));
  if (err) return ReE(res, err, 422);

  [err, attendanceObj] = await to(attendanceObj.save());
  if (err) return ReE(res, err, 422);

  let attendanceJson = attendanceObj.toWeb();

  return ReS(res, { attendance: attendanceJson }, 201);
};
module.exports.create = create;

const bulkCreate = async function (req, res) {
  try {
    let attendanceInfo = req.body;

    const att = await Attendance.bulkCreate(attendanceInfo, {
      updateOnDuplicate: [
        "id",
        "studentId",
        "classId",
        "divId",
        "classTeacherId",
        "attendanceDate",
        "attendanceResult",
        "active",
        "createdAt",
        "updatedAt",
      ],
    });

    return ReS(res, { attendance: att });
  } catch (error) {
    console.log(error);
    return ReS(res, { attendance: error });
  }
};

module.exports.bulkCreate = bulkCreate;

const get = async function (req, res) {
  try {
    let attendanceId = req.params.attendanceId;
    const att = await Attendance.findAll({
      where: { id: attendanceId },
      include: [
        {
          model: Student,
          as: "AttendanceStudent",
          attributes: ["firstName", "lastName"],
        },
        {
          model: Class,
          as: "AttendanceClass",
          attributes: ["className"],
        },
        {
          model: Division,
          as: "AttendanceDivision",
          attributes: ["divName"],
        },
        {
          model: Teacher,
          as: "AttendanceClassTeacher",
          attributes: ["firstName", "lastName"],
        },
      ],
    });

    return ReS(res, { attendance: att });
  } catch (error) {
    return ReS(res, { attendance: error });
  }
};

module.exports.get = get;
const getByRecord = async function (req, res) {
  try {
    let classID = req.query.classId;
    let divID = req.query.divId;
    let selectedDate = req.query.date;

    const att = await Attendance.findAll({
      where: { classId: classID, divId: divID, attendanceDate: selectedDate },
      include: [
        {
          model: Student,
          as: "AttendanceStudent",
          attributes: ["rollNo", "firstName", "lastName", "profileImage"],
          required: false,
        },
        {
          model: Class,
          as: "AttendanceClass",
          attributes: ["className"],
          required: false,
        },
        {
          model: Division,
          as: "AttendanceDivision",
          attributes: ["divName"],
          required: false,
        },
        {
          model: Teacher,
          as: "AttendanceClassTeacher",
          attributes: ["firstName", "lastName"],
          required: false,
        },
      ],
    });

    return ReS(res, { attendancestudentList: att });
  } catch (error) {
    return ReS(res, { attendancestudentList: error });
  }
};

module.exports.getByRecord = getByRecord;

const update = async function (req, res) {
  let err, attendanceObj, data;
  attendanceObj = req.attendance;
  data = req.body;

  attendanceObj.set(data);

  [err, attendanceObj] = await to(attendanceObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Attendance: " + attendanceObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let attendanceObj, err;
  attendanceObj = req.attendance;

  [err, attendanceObj] = await to(attendanceObj.destroy());
  if (err) return ReE(res, "error occured trying to delete attendance");

  return ReS(res, { message: attendanceObj }, 200);
};
module.exports.remove = remove;

const getAll = async function (_req, res) {
  try {
    const att = await Attendance.findAll({
      include: [
        {
          model: Student,
          as: "AttendanceStudent",
          attributes: ["firstName", "lastName"],
        },
        {
          model: Class,
          as: "AttendanceClass",
          attributes: ["className"],
        },
        {
          model: Division,
          as: "AttendanceDivision",
          attributes: ["divName"],
        },
        {
          model: Teacher,
          as: "AttendanceClassTeacher",
          attributes: ["firstName", "lastName"],
        },
      ],
    });

    return ReS(res, { attendance: att });
  } catch (error) {
    return ReS(res, { attendance: error });
  }
};
module.exports.getAll = getAll;

const getpendinglist = async function (_req, res) {
  try {
    const response = await db.sequelize.query("CALL attendancependinglist();");

    return ReS(res, response);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.getpendinglist = getpendinglist;
const getAttendanceList = async function (req, res) {
  try {
    const classId = req.query.classId; // Assuming classId is part of the request query parameters
    const divId = req.query.divId; // Assuming divId is part of the request query parameters

    let query =
      "SELECT `classId`, `divId`, `className`, `divName`, `teacherName`, `teacherId`, `selectedDate`, `totalPresent`, `total` FROM `attendancelistview`";

    if (classId && divId) {
      query += " WHERE `classId` = :classId AND `divId` = :divId";
    } else if (classId) {
      query += " WHERE `classId` = :classId";
    } else if (divId) {
      query += " WHERE `divId` = :divId";
    }

    const result = await db.sequelize.query(query, {
      replacements: { classId, divId },
      type: db.sequelize.QueryTypes.SELECT,
    });

    return ReS(res, result);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getAttendanceList = getAttendanceList;

const getAddattendanceStudentList = async function (req, res) {
  try {
    let classId = req.query.classId;
    let divId = req.query.divId;
    let AttDate = req.query.date;

    const checkRecord = await db.sequelize.query(
      "SELECT count(id) as counter FROM `attendance` WHERE `classId`=" +
        classId +
        " AND `divId`=" +
        divId +
        ' AND `attendanceDate`="' +
        AttDate +
        '"',
      { type: db.sequelize.QueryTypes.SELECT }
    );

    if (checkRecord[0].counter <= 0) {
      const response = await db.sequelize.query(
        'SELECT `studentId`, `studentName`, `classId`,`className`, `divId`,`divName`, `rollNo`, `classTeacherId`,DATE("' +
          AttDate +
          '") as attendanceDate,"true" as attendanceResult FROM `addattendancestudentlistview` where classId=' +
          classId +
          " AND divId=" +
          divId +
          " ORDER BY rollNo",
        { type: db.sequelize.QueryTypes.SELECT }
      );

      return ReS(res, response);
    }
  } catch (error) {
    return ReE(res, error);
  }
};

module.exports.getAddattendanceStudentList = getAddattendanceStudentList;

const getByRecordWithDateRange = async function (req, res) {
  try {
    let classID = req.query.classId;
    let divID = req.query.divId;
    let startDate = req.query.startDate; // Start of the date range
    let endDate = req.query.endDate; // End of the date range

    const query = `
            SELECT
                A.studentId,
                A.attendanceDate,
                A.attendanceResult,
                ASt.rollNo AS 'rollNo',
                CONCAT(ASt.firstName, ' ', ASt.lastName) AS 'fullName'
            FROM
                Attendance AS A
            RIGHT OUTER JOIN Student AS ASt ON A.studentId = ASt.id AND
                A.classId = :classID AND A.divId = :divID AND A.attendanceDate BETWEEN :startDate AND :endDate
            ORDER BY ASt.rollNo, A.attendanceDate;
        `;

    const result = await db.sequelize.query(query, {
      replacements: {
        classID,
        divID,
        startDate,
        endDate,
      },
      type: db.sequelize.QueryTypes.SELECT,
    });

    // Filter out rows with null studentId
    const filteredResult = result.filter((record) => record.studentId !== null);

    const pivotData = {};

    filteredResult.forEach((record) => {
      const { studentId, attendanceDate, attendanceResult, fullName, rollNo } =
        record;

      if (!pivotData[studentId]) {
        pivotData[studentId] = {
          rollNo,
          fullName,
        };
      }

      if (attendanceResult) {
        pivotData[studentId][attendanceDate] = "P";
      } else {
        pivotData[studentId][attendanceDate] = "A";
      }
    });

    const pivotDataArray = Object.values(pivotData);

    // Get all unique dates within the date range
    const uniqueDates = [
      ...new Set(filteredResult.map((record) => record.attendanceDate)),
    ];

    // Add 'NA' for missing dates
    pivotDataArray.forEach((studentData) => {
      uniqueDates.forEach((date) => {
        if (!studentData[date]) {
          studentData[date] = "NA";
        }
      });
    });

    ReS(res, { attendancestudentList: pivotDataArray });
  } catch (error) {
    ReS(res, { attendancestudentList: error });
  }
};

module.exports.getByRecordWithDateRange = getByRecordWithDateRange;

const deleteRecordByClassDivDate = async function (req, res) {
  const { classId, divId, date } = req.params; // Assuming these are parameters in the URL

  let err, attendanceObj;

  // Assuming you have a Sequelize model named "Attendance"
  [err, attendanceObj] = await to(
    Attendance.destroy({
      where: {
        classId: classId,
        divId: divId,
        attendanceDate: date,
      },
    })
  );

  if (err) {
    return ReE(res, "Error occurred trying to delete attendance");
  }

  if (attendanceObj === 0) {
    // If no rows were affected, it means no record was found
    return ReE(res, "Attendance not found", 404);
  }

  return ReS(res, { message: "Deleted Attendance" }, 200);
};

module.exports.deleteRecordByClassDivDate = deleteRecordByClassDivDate;
