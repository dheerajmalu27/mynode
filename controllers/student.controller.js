const { Student } = require("../models");
const { City } = require("../models");
const { State } = require("../models");
const { Class } = require("../models");
const { Division } = require("../models");
const db = require("../models/index").db;
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, studentObj;
  let studentInfo = req.body;
  delete studentInfo.id;

  console.log(req.file);
  if (req.file) {
    // If an image was successfully uploaded, save the image name to the 'profileImage' column
    studentInfo.profileImage = req.file.filename;
  }
  delete studentInfo.image;
  // Check if the 'profileImage' field is not present in the request or if it's empty
  //   if (!req.body.profileImage) {
  //     // Set 'profileImage' to the existing value to preserve it
  //     studentInfo.profileImage = studentInfo.profileImage;
  //   }
  console.log(studentInfo);
  [err, studentObj] = await to(Student.create(studentInfo));
  if (err) return ReE(res, err, 422);

  [err, studentObj] = await to(studentObj.save());
  if (err) return ReE(res, err, 422);

  let studentJson = studentObj.toWeb();

  return ReS(res, { student: studentJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let studentId = req.params.studentId;
  [err, studentObj] = await to(Student.findByPk(studentId));
  if (err) return ReE(res, err, 422);

  let studentJson = studentObj.toWeb();

  return ReS(res, { student: studentJson }, 201);
};
module.exports.get = get;

const getprofile = async function (req, res) {
  try {
    const studentId = req.params.studentId;

    const studentData = {
      info: await Student.findOne({
        where: { id: studentId },
        include: [
          { model: Class, as: "StudentClass", attributes: ["className"] },
          { model: Division, as: "StudentDivision", attributes: ["divName"] },
          { model: City, as: "StudentCity", attributes: ["cityName"] },
          { model: State, as: "StudentState", attributes: ["stateName"] },
        ],
      }),
      homework: await db.sequelize.query(
        "SELECT h.id, h.classId, h.divId, h.subId, h.title, h.description, h.deadline, h.isCompleted, h.createdAt, h.createdBy, h.updatedAt, h.updatedBy, h.active, c.className, d.divName, s.subName FROM homework h JOIN class c ON h.classId = c.id JOIN division d ON h.divId = d.id JOIN subject s ON h.subId = s.id WHERE h.classId=(SELECT st.classId FROM student as st WHERE st.id=? ) AND h.divId=(SELECT st1.divId FROM student as st1 WHERE st1.id=?)",
        {
          replacements: [studentId, studentId],
          type: db.sequelize.QueryTypes.SELECT,
        }
      ),
      subject: await db.sequelize.query(
        "SELECT * FROM subjectteacherview WHERE classId=(SELECT st.classId FROM student as st WHERE st.id=? ) AND divId=(SELECT st1.divId FROM student as st1 WHERE st1.id=?)",
        {
          replacements: [studentId, studentId],
          type: db.sequelize.QueryTypes.SELECT,
        }
      ),
      testmarks: await db.sequelize.query(
        "SELECT tm.testId,tm.subId,tm.subName,tm.testName,ROUND((tm.getMarks/tm.totalMarks)*100) AS totalAvg FROM testmarksview as tm WHERE tm.studentId=? AND tm.classId=(SELECT st.classId FROM student as st WHERE st.id=?) AND divId=(SELECT st1.divId FROM student as st1 WHERE st1.id=?) ORDER BY subId,testId",
        {
          replacements: [studentId, studentId, studentId],
          type: db.sequelize.QueryTypes.SELECT,
        }
      ),
      finalresult: await db.sequelize.query(
        'SELECT fr.className,fr.divName,fr.resultData,SUBSTRING_INDEX(fr.resultDate, "-", -1) AS resultYear,fr.getMarks,fr.totalMarks,ROUND((fr.getMarks / fr.totalMarks) * 100) AS totalAvg FROM finalresult as fr WHERE fr.studentId=? ',
        { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }
      ),
      // attendance: await db.sequelize.query('SELECT at.* FROM attendance as at WHERE at.studentId=?', { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }),
      monthlyattendance: await db.sequelize.query(
        "SELECT mp.attendanceMonth AS month,mp.monthAvg AS result FROM studentmonthlyattendanceview as mp WHERE mp.studentId=?",
        { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }
      ),
      testresult: await db.sequelize.query(
        "SELECT stv.testName,stv.totalAvg AS result FROM  studenttestresultview as stv WHERE stv.studentId=?",
        { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }
      ),
      messageportal: await db.sequelize.query(
        "SELECT mp.* FROM messageportal as mp WHERE mp.studentId=?",
        { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }
      ),
      feespayment: await db.sequelize.query(
        "SELECT paymentId,paymentAmount,remainingAmount,className,divName,paymentDate FROM school.fees_paid_by_student_view where studentId=?",
        { replacements: [studentId], type: db.sequelize.QueryTypes.SELECT }
      ),
    };
    return ReS(res, studentData);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getprofile = getprofile;

const update = async function (req, res) {
  let err, studentObj, data;
  studentObj = req.student;
  data = req.body;
  console.log(req.file);
  if (req.file) {
    // If an image was successfully uploaded, save the image name to the 'profileImage' column
    data.profileImage = req.file.filename;
  }

  // Check if the 'profileImage' field is not present in the request or if it's empty
  if (!req.body.profileImage) {
    // Set 'profileImage' to the existing value to preserve it
    data.profileImage = data.profileImage;
  }
  console.log("data");
  console.log(data);
  studentObj.set(data);

  [err, studentObj] = await to(studentObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Student: " + studentObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let studentObj, err;
  studentObj = req.student;

  [err, studentObj] = await to(studentObj.destroy());
  if (err) return ReE(res, "error occured trying to delete student");

  return ReS(res, { message: "Deleted Student" }, 200);
};
module.exports.remove = remove;
const getAll = async function (req, res) {
  try {
    let query =
      "SELECT st.*, cl.className, d.divName FROM student AS st " +
      "LEFT JOIN class AS cl ON cl.id=st.classId " +
      "LEFT JOIN division AS d ON d.id=st.divId";

    // Check if 'active' parameter is provided in the request
    if (req.query.active) {
      // Assuming 'active' is a boolean value
      const isActive = parseInt(req.query.active) === 1;

      // Add WHERE clause based on the 'active' parameter
      query += ` WHERE st.active = ${isActive}`;
    }

    const studentData = await db.sequelize.query(query, {
      type: db.sequelize.QueryTypes.SELECT,
    });
    return ReS(res, { student: studentData });
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  try {
    const students = await db.sequelize.query(
      'SELECT st.id, CONCAT(st.firstName, " ", st.lastName, "-", cl.className, "-", d.divName) AS text ' +
        "FROM student AS st " +
        "LEFT JOIN class AS cl ON cl.id=st.classId " +
        "LEFT JOIN division AS d ON d.id=st.divId " +
        "WHERE st.active = 1",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, { student: students });
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getAllList = getAllList;

const getFinalResultStudentList = async function (req, res) {
  try {
    const students = await db.sequelize.query(
      "SELECT st.id, CONCAT(st.firstName, ' ', st.lastName, '-', cl.className, '-', d.divName) AS text FROM student AS st JOIN finalresult AS fr ON fr.studentId=st.id AND fr.classId = st.classId AND fr.divId = st.divId  LEFT JOIN class AS cl ON cl.id=st.classId LEFT JOIN division AS d ON d.id=st.divId JOIN finalresultclassdivisionlist AS frcl ON frcl.classId=st.classId AND frcl.divId=st.divId WHERE st.active=1;",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, { student: students });
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getFinalResultStudentList = getFinalResultStudentList;
const getAllAbsentStudent = async function (req, res) {
  try {
    const response = await db.sequelize.query(
      "SELECT `id`, `studentId`, `rollNo`, `studentName`, `fatherName`, `mobNumber`,`className`, `divName`, `classTeacherId`, `teacherName`, `attendanceDate` " +
        "FROM `absentstudentlistview`",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, response);
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getAllAbsentStudent = getAllAbsentStudent;

const getTodayAbsentStudent = async function (req, res) {
  try {
    const response = await db.sequelize.query(
      "SELECT `id`, `studentId`, `rollNo`, `studentName`, `fatherName`, `mobNumber`,`className`, `divName`, `classTeacherId`, `teacherName`, `attendanceDate` FROM absentstudentlistview WHERE attendanceDate = CURDATE();",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    console.log(response);
    return ReS(res, response);
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getTodayAbsentStudent = getTodayAbsentStudent;

const getStudentInfoAll = async function (req, res) {
  try {
    const studentId = req.params.studentId;
    const studentData = await db.sequelize.query(
      "SELECT st.*, cl.className, d.divName FROM student AS st " +
        "LEFT JOIN class AS cl ON cl.id=st.classId " +
        "LEFT JOIN division AS d ON d.id=st.divId " +
        "WHERE st.id=" +
        studentId,
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, studentData);
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getStudentInfoAll = getStudentInfoAll;

const getStudentDetailInfoAll = async function (req, res) {
  try {
    const studentId = req.params.studentId;

    // First Query
    const [studentData] = await db.sequelize.query(
      `
      SELECT 
        st.*, 
        cl.className, 
        d.divName,
        ROUND((COUNT(CASE WHEN att.attendanceResult = 1 THEN 1 END) / COUNT(*)) * 100, 2) AS attendancePercentage,
        ROUND((SUM(tm.getMarks) / SUM(tm.totalMarks)) * 100, 2) AS marksPercentage
      FROM student AS st
      LEFT JOIN class AS cl ON cl.id = st.classId
      LEFT JOIN division AS d ON d.id = st.divId
      LEFT JOIN attendance AS att ON att.studentId = st.id
      LEFT JOIN testmarks AS tm ON tm.studentId = st.id
      WHERE st.id = :studentId
      GROUP BY st.id, cl.className, d.divName;
      `,
      {
        replacements: { studentId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );
    // console.log(studentData);
    // Check if studentData exists
    if (!studentData || studentData.length === 0) {
      return ReE(res, { message: "Student not found" }, 404);
    }

    // Extract classId and divId from the first query result
    const { classId, divId } = studentData;

    // Second Query
    const testList = await db.sequelize.query(
      `SELECT * FROM (
        SELECT
          cl.className,
          di.divName,
          t.testName,
          tm.classId,
          tm.divId,
          tm.testId,
          COUNT(DISTINCT tm.subId) testSubTotal,
          (LENGTH(cl.subjectIds) - LENGTH(REPLACE(cl.subjectIds, ',', '')) + 1) as totalSub
        FROM
          testmarks tm
          INNER JOIN division di ON di.id = tm.divId
          INNER JOIN class cl ON cl.id = tm.classId
          INNER JOIN test t ON t.id = tm.testId
        WHERE
          tm.classId = :classId AND
          tm.divId = :divId
        GROUP BY
          tm.testId, tm.classId, tm.divId
        ORDER BY
          tm.testId, tm.classId, tm.divId
      ) as ft
      WHERE
        ft.testSubTotal = ft.totalSub`,
      {
        replacements: { classId, divId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );
    console.log(testList);
    // Attach testList in response
    const response = {
      studentData: studentData,
      testlist: testList,
    };

    return ReS(res, response);
  } catch (err) {
    return ReE(res, err);
  }
};
module.exports.getStudentDetailInfoAll = getStudentDetailInfoAll;

const getAllClassDivisionStudentList = async function (req, res) {
  try {
    const { classId, divId } = req.query; // Assuming classId and divId are parameters in the request

    const studentData = await db.sequelize.query(
      'SELECT st.id, st.rollNo, CONCAT(st.firstName, " ", st.lastName) AS fullName,st.fatherName,st.parentNumber, st.profileImage, cl.className, d.divName ' +
        "FROM student AS st " +
        "LEFT JOIN class AS cl ON cl.id = st.classId " +
        "LEFT JOIN division AS d ON d.id = st.divId " +
        "WHERE st.classId = :classId AND st.divId = :divId AND st.active=1 " +
        "ORDER BY st.rollNo", // Added ORDER BY clause
      {
        replacements: { classId, divId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    return ReS(res, { students: studentData }); // Returning an array of students
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getAllClassDivisionStudentList = getAllClassDivisionStudentList;
