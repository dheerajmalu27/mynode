const { Test } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const moment = require("moment");
const create = async function (req, res) {
  let err, testObj;
  let testInfo = req.body;
  [err, testObj] = await to(Test.create(testInfo));
  if (err) return ReE(res, err, 422);

  [err, testObj] = await to(testObj.save());
  if (err) return ReE(res, err, 422);

  let testJson = testObj.toWeb();

  return ReS(res, { test: testJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let testId = req.params.testId;
  [err, testObj] = await to(Test.findByPk(testId));
  if (err) return ReE(res, err, 422);

  let testJson = testObj.toWeb();

  return ReS(res, { test: testJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, testObj, data;
  testObj = req.test;
  data = req.body;

  testObj.set(data);

  [err, testObj] = await to(testObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Test: " + testObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let testObj, err;
  testObj = req.test;

  [err, testObj] = await to(testObj.destroy());
  if (err) return ReE(res, "error occured trying to delete test");

  return ReS(res, { message: "Deleted Test" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const test = await Test.findAll({});
    return ReS(res, { test });
  } catch (error) {
    return ReE(res, { test: error });
  }
};
module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  try {
    const test = await Test.findAll({
      attributes: ["id", ["testName", "text"]],
    });
    return ReS(res, { test });
  } catch (error) {
    return ReE(res, { test: error });
  }
};
module.exports.getAllList = getAllList;

const testClassReportList = async function (req, res) {
  try {
    const testClassList = new Object();
    const testwiseclasslist = await db.sequelize.query(
      "CALL testwiseclasslist();"
    );
    testClassList.testreportclasslist = testwiseclasslist;
    return ReS(res, testClassList);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.testClassReportList = testClassReportList;

const finalResultClassReportList = async function (req, res) {
  try {
    // Create an object to store the final result class list
    const finalResultClassListObj = {};

    // Use Sequelize to execute the query
    const finalResultClassList = await db.sequelize.query(
      "SELECT * FROM finalresultclassdivisionlist"
    );

    // Assign the result directly without wrapping it in another array
    finalResultClassListObj.finalresultclasslist = finalResultClassList[0];

    // Send a successful response using ReS
    return ReS(res, finalResultClassListObj);
  } catch (error) {
    // Handle errors and send an error response using ReE
    return ReE(res, error);
  }
};
module.exports.finalResultClassReportList = finalResultClassReportList;

const testClassDivisionReportList = async function (req, res) {
  try {
    const testClassDivisionReportListData = new Object();

    const classId = req.query.classId;
    const testId = req.query.testId;
    const divId = req.query.divId;

    const testdata = await db.sequelize.query(
      "SELECT * FROM testmarksview where testId=" +
        testId +
        " and classId=" +
        classId +
        " and divId=" +
        divId +
        " order by rollNo, subName",
      { type: db.sequelize.QueryTypes.SELECT }
    );

    testClassDivisionReportListData.reportlist = convertReportList(testdata);
    return ReS(res, testClassDivisionReportListData);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.testClassDivisionReportList = testClassDivisionReportList;

const convertReportList = (originalReportList) => {
  const convertedReportList = [];
  const studentMap = [];

  originalReportList.forEach((report) => {
    const {
      studentId,
      teacherId,
      testId,
      classId,
      divId,
      testName,
      className,
      divName,
      teacherName,
      studentName,
      rollNo,
      subId,
      subName,
      getMarks,
      totalMarks,
    } = report;

    if (!studentMap[studentId]) {
      studentMap[studentId] = {
        studentId,
        teacherId,
        testId,
        classId,
        divId,
        testName,
        className,
        divName,
        teacherName,
        studentName,
        rollNo,
        subjectData: [],
        sumGetMarks: 0,
        sumTotalMarks: 0,
        percentage: 0,
      };
      convertedReportList.push(studentMap[studentId]);
    }

    studentMap[studentId].subjectData.push({
      subId,
      subName,
      getMarks,
      totalMarks,
    });

    studentMap[studentId].sumGetMarks += parseInt(getMarks, 10);
    studentMap[studentId].sumTotalMarks += parseInt(totalMarks, 10);

    const percentage =
      (studentMap[studentId].sumGetMarks /
        studentMap[studentId].sumTotalMarks) *
      100;
    studentMap[studentId].percentage = percentage.toFixed(2);
  });

  convertedReportList.sort((a, b) => b.percentage - a.percentage);

  convertedReportList.forEach((student, index) => {
    student.rank = index + 1;
  });

  return convertedReportList;
};

function calculateSubjectAverages(testResults) {
  const subjects = {};

  testResults.forEach((item) => {
    const { subName, getMarks, totalMarks } = item;
    if (!subjects[subName]) {
      subjects[subName] = [];
    }
    subjects[subName].push(`${getMarks}/${totalMarks}`);
  });

  const subjectTotals = Object.entries(subjects).map(
    ([subject, marksArray]) => {
      const totalMarks = marksArray.reduce((acc, marks) => {
        const [get, total] = marks.split("/").map(Number);
        return acc + get;
      }, 0);

      return {
        [subject]: `${totalMarks}/${marksArray.length * 100}`,
      };
    }
  );

  const subjectAverages = {};

  Object.entries(subjects).forEach(([subject, marksArray]) => {
    const totalMarks = marksArray.reduce((acc, marks) => {
      const [get, total] = marks.split("/").map(Number);
      return acc + get;
    }, 0);

    const averageMarks = totalMarks / marksArray.length;

    subjectAverages[subject] = `${averageMarks.toFixed(2)}/100`;
  });

  const grandTotal = Object.values(subjectAverages).reduce((acc, avg) => {
    const [get, total] = avg.split("/").map(Number);
    return acc + get;
  }, 0);

  subjectAverages.Total = `${grandTotal}/500`;

  return { subjectTotals, subjectAverages };
}
// Function to calculate the average of each subject from all tests

// Function to insert records into the finalresult table
async function insertFinalResultRecords(req, res) {
  try {
    const classId = req.query.classId;
    const divId = req.query.divId;
    // Get all studentIds by divId and classId from the student table
    const studentIds = await db.sequelize.query(
      `
      SELECT 
        student.id as studentId, 
        CONCAT(student.firstName, ' ', student.lastName) as studentName, 
        class.className,
        division.divName
      FROM student
      JOIN class ON student.classId = class.id
      JOIN division ON student.divId = division.id
      WHERE classId = :classId AND divId = :divId;
    `,
      {
        replacements: { classId: parseInt(classId), divId: parseInt(divId) },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    // Loop through each studentId and insert/update the corresponding record in finalresult
    for (const { studentId, studentName, className, divName } of studentIds) {
      // Fetch attendance data
      const attendanceData = await db.sequelize.query(
        `
        SELECT attendanceMonth as month, presentdays as pdays, totaldays as tdays,monthAvg as per
        FROM studentmonthlyattendanceview
        WHERE studentId = :studentId AND classId = :classId AND divId = :divId;
      `,
        {
          replacements: { studentId, classId, divId },
          type: db.sequelize.QueryTypes.SELECT,
        }
      );

      // Fetch test result data
      const testResults = await db.sequelize.query(
        `
        SELECT testId, subId, getMarks, totalMarks, testName, subName
        FROM testmarksview
        WHERE studentId = :studentId AND classId = :classId AND divId = :divId;
      `,
        {
          replacements: { studentId, classId, divId },
          type: db.sequelize.QueryTypes.SELECT,
        }
      );

      // Calculate average of each subject from all tests
      const { subjectTotals, subjectAverages } =
        calculateSubjectAverages(testResults);

      // Check if the record already exists
      const existingRecord = await db.sequelize.query(
        `
        SELECT id, getMarks, totalMarks
        FROM finalresult
        WHERE studentId = :studentId AND classId = :classId AND divId = :divId;
      `,
        {
          replacements: { studentId, classId, divId },
          type: db.sequelize.QueryTypes.SELECT,
        }
      );
      console.log("existingRecord");
      console.log(existingRecord);

      if (existingRecord.length > 0) {
        // Record exists, update it
        //         await db.sequelize.query(`
        //   UPDATE finalresult
        //   SET resultData = :resultData,
        //       getMarks = :getMarks,
        //       totalMarks = :totalMarks,
        //       resultDate = :resultDate,
        //       testResultData = :testResultData,
        //       attendanceData = :attendanceData,
        //       updatedAt = NOW(),
        //       updatedBy = :updatedBy,
        //       active = :active
        //   WHERE id = :id;
        // `, {
        //             replacements: {
        //                 id: existingRecord[0].id,
        //                 resultData: JSON.stringify(subjectAverages),
        //                 getMarks: parseFloat(subjectAverages.Total.split('/')[0]), // Add the actual getMarks
        //                 totalMarks: parseFloat(subjectAverages.Total.split('/')[1]), // Add the actual totalMarks
        //                 resultDate: moment().format('DD-MM-YYYY'), // Replace with the actual resultDate
        //                 testResultData: JSON.stringify(subjectTotals),
        //                 attendanceData: JSON.stringify(attendanceData),
        //                 updatedBy: 1, // Replace with the actual updatedBy
        //                 active: 1, // Replace with the actual active status
        //             },
        //             type: db.sequelize.QueryTypes.UPDATE,
        //         });
      } else {
        // Record does not exist, insert it
        await db.sequelize.query(
          `
          INSERT INTO finalresult (studentId, studentName, classId, className, divId, divName, resultData, getMarks, totalMarks, resultDate, testResultData, attendanceData, createdAt, createdBy, updatedAt, updatedBy, active)
          VALUES (:studentId, :studentName, :classId, :className, :divId, :divName, :resultData, :getMarks, :totalMarks, :resultDate, :testResultData, :attendanceData, NOW(), :createdBy, NOW(), :updatedBy, :active);
        `,
          {
            replacements: {
              studentId,
              studentName: studentName,
              classId,
              className: className,
              divId,
              divName: divName,
              resultData: JSON.stringify(subjectAverages),
              getMarks: parseFloat(subjectAverages.Total.split("/")[0]), // Add the actual getMarks
              totalMarks: parseFloat(subjectAverages.Total.split("/")[1]), // Add the actual totalMarks
              resultDate: moment().format("DD-MM-YYYY"), // Replace with the actual resultDate
              testResultData: JSON.stringify(subjectTotals),
              attendanceData: JSON.stringify(attendanceData),
              createdBy: 1, // Replace with the actual createdBy
              updatedBy: 1, // Replace with the actual updatedBy
              active: 1, // Replace with the actual active status
            },
            type: db.sequelize.QueryTypes.INSERT,
          }
        );
        deleteAttendanceRecords(studentId, classId, divId);
        deleteTestMarksRecords(studentId, classId, divId);
      }
    }
    const result = await getFinalResultRecords(classId, divId);
    return ReS(res, { finalResultData: result });
  } catch (error) {
    console.error("Error inserting/updating records:", error);
    return res
      .status(500)
      .json({ success: false, message: "Internal Server Error" });
  }
}
module.exports.insertFinalResultRecords = insertFinalResultRecords;

const deleteAttendanceRecords = async (studentId, classId, divId) => {
  try {
    const deletedRows = await db.sequelize.query(
      `
        DELETE FROM attendance
        WHERE studentId = :studentId AND classId = :classId AND divId = :divId;
        `,
      {
        replacements: {
          studentId: studentId,
          classId: classId,
          divId: divId,
        },
        type: db.sequelize.QueryTypes.DELETE,
      }
    );

    console.log(`Deleted ${deletedRows} rows from the Attendance table`);
  } catch (error) {
    console.error("Error deleting records:", error);
  }
};

const deleteTestMarksRecords = async (studentId, classId, divId) => {
  try {
    const deletedRows = await db.sequelize.query(
      `
        DELETE FROM testmarks
        WHERE studentId = :studentId AND classId = :classId AND divId = :divId;
        `,
      {
        replacements: {
          studentId: studentId,
          classId: classId,
          divId: divId,
        },
        type: db.sequelize.QueryTypes.DELETE,
      }
    );

    console.log(`Deleted ${deletedRows} rows from the TestMarks table`);
  } catch (error) {
    console.error("Error deleting records:", error);
  }
};

const getFinalResultRecords = async (classId, divId) => {
  try {
    const finalResultRecords = await db.sequelize.query(
      `
        SELECT *,
        RANK() OVER (PARTITION BY classId, divId ORDER BY getMarks DESC) as "rank"
        FROM finalresult
        WHERE classId = :classId AND divId = :divId
        ORDER BY "rank" ASC;
      `,
      {
        replacements: {
          classId: classId,
          divId: divId,
        },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    return finalResultRecords;
  } catch (error) {
    console.error("Error retrieving records:", error);
    return [];
  }
};
