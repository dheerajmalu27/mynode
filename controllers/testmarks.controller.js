const {
  Testmarks,
  Student,
  Class,
  Division,
  Teacher,
  Subject,
  Test,
} = require("../models");
const { db } = require("../models/index");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, testmarksObj;
  let testmarksInfo = req.body;
  console.log(testmarksInfo);
  [err, testmarksObj] = await to(Testmarks.create(testmarksInfo));
  if (err) return ReE(res, err, 422);

  [err, testmarksObj] = await to(testmarksObj.save());
  if (err) return ReE(res, err, 422);

  let testmarksJson = testmarksObj.toWeb();

  return ReS(res, { testmarks: testmarksJson }, 201);
};
const _create = create;
exports.create = _create;

const get = async function (req, res) {
  let testmarksId = req.params.testmarksId;
  let err, testmarksresult;
  [err, testmarksresult] = await to(Testmarks.findByPk(testmarksId));
  if (err) return ReE(res, err, 422);

  let testmarksJson = testmarksresult.toWeb();

  return ReS(res, { testmarks: testmarksJson }, 201);
};
const _get = get;
exports.get = _get;

const update = async function (req, res) {
  let err, testmarksObj, data;
  testmarksObj = req.testmarks;
  data = req.body;

  testmarksObj.set(data);

  [err, testmarksObj] = await to(testmarksObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Testmarks: " + testmarksObj.id });
};
const _update = update;
exports.update = _update;

const remove = async function (req, res) {
  let testmarksObj, err;
  testmarksObj = req.testmarks;

  [err, testmarksObj] = await to(testmarksObj.destroy());
  if (err) return ReE(res, "error occurred trying to delete testmarks");

  return ReS(res, { message: testmarksObj }, 200);
};
const _remove = remove;
exports.remove = _remove;

const getAll = async function (_req, res) {
  try {
    const testmarks = await Testmarks.findAll({});
    return ReS(res, { testmarks });
  } catch (error) {
    return ReE(res, { error });
  }
};

const _getAll = getAll;
exports.getAll = _getAll;

const gettestmarkspendinglist = async function (_req, res) {
  try {
    const response = await db.sequelize.query(
      "SELECT * FROM testmarkspendingteacherlistview",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, response);
  } catch (err) {
    return ReE(res, err);
  }
};

const _gettestmarkspendinglist = gettestmarkspendinglist;
exports.gettestmarkspendinglist = _gettestmarkspendinglist;

const gettestmarkslist = async function (req, res) {
  try {
    let query = "SELECT * FROM testmarkslistview";

    if (req.query.teacherId) {
      // If teacherId is provided, add a WHERE clause to filter by teacherId
      query += ` WHERE teacherId = ${req.query.teacherId}`;
    }

    const response = await db.sequelize.query(query, {
      type: db.sequelize.QueryTypes.SELECT,
    });

    return ReS(res, response);
  } catch (err) {
    return ReE(res, err);
  }
};

const _gettestmarkslist = gettestmarkslist;
exports.gettestmarkslist = _gettestmarkslist;

const getAddTestmarkStudentList = async function (req, res) {
  try {
    const { classId, divId, testId, subId } = req.query;
    let teacherId = 1;
    let teacherName = "admin";

    const checkRecord = await db.sequelize.query(
      "SELECT count(id) as counter FROM `testmarks` WHERE `classId`=" +
        classId +
        " AND `divId`=" +
        divId +
        " AND `testId`=" +
        testId +
        " AND `subId`=" +
        subId,
      { type: db.sequelize.QueryTypes.SELECT }
    );

    if (checkRecord[0].counter <= 0) {
      const subjectTeacherRecord = await db.sequelize.query(
        "SELECT `teacherId`, `teacherName`,subName FROM `subjectteacherview` WHERE  classId=" +
          classId +
          " AND divId=" +
          divId,
        { type: db.sequelize.QueryTypes.SELECT }
      );

      if (subjectTeacherRecord.length > 0) {
        teacherId = subjectTeacherRecord[0].teacherId;
        teacherName = subjectTeacherRecord[0].teacherName;
      }

      const response = await db.sequelize.query(
        "SELECT stl.`id` as studentId, stl.`studentName`, stl.`classId`, stl.`className`,stl.`divId`, stl.`divName`, stl.`rollNo`," +
          testId +
          " as testId,sb.`id` as subId," +
          teacherId +
          ' as teacherId,"' +
          teacherName +
          '" as teacherName,sb.`subName` as subName,0 as getMarks,100 as totalMarks  FROM `studentlistview` stl ,subject sb WHERE stl.classId=' +
          classId +
          " AND stl.divId=" +
          divId +
          " AND sb.id=" +
          subId +
          " ORDER BY stl.rollNo",
        { type: db.sequelize.QueryTypes.SELECT }
      );

      return ReS(res, response);
    }
  } catch (err) {
    return ReE(res, err);
  }
};

const _getAddTestmarkStudentList = getAddTestmarkStudentList;
exports.getAddTestmarkStudentList = _getAddTestmarkStudentList;

const bulkCreate = async function (req, res) {
  try {
    const TestMarkData = req.body;
    const testmark = await Testmarks.bulkCreate(TestMarkData, {
      updateOnDuplicate: [
        "id",
        "studentId",
        "classId",
        "divId",
        "testId",
        "subId",
        "teacherId",
        "getMarks",
        "totalMarks",
      ],
    });

    return ReS(res, { testmarks: testmark });
  } catch (error) {
    return ReS(res, { error });
  }
};

const _bulkCreate = bulkCreate;
exports.bulkCreate = _bulkCreate;

const getByRecord = async function (req, res) {
  try {
    const { classId, divId, testId, subId } = req.query;

    const tm = await Testmarks.findAll({
      where: { classId, divId, testId, subId },
      include: [
        {
          model: Student,
          as: "TestmarksStudent",
          attributes: ["rollNo", "firstName", "lastName"],
          required: false,
        },
        {
          model: Class,
          as: "TestmarksClass",
          attributes: ["className"],
          required: false,
        },
        {
          model: Division,
          as: "TestmarksDivision",
          attributes: ["divName"],
          required: false,
        },
        {
          model: Test,
          as: "TestmarksTest",
          attributes: ["testName"],
          required: false,
        },
        {
          model: Subject,
          as: "TestmarksSubject",
          attributes: ["subName"],
          required: false,
        },
        {
          model: Teacher,
          as: "TestmarksTeacher",
          attributes: ["firstName", "lastName"],
          required: false,
        },
      ],
    });

    return ReS(res, { testmarksstudentlist: tm });
  } catch (error) {
    return ReS(res, { testmarksstudentlist: error });
  }
};

const _getByRecord = getByRecord;
exports.getByRecord = _getByRecord;

const deleteRecordByClassDivTestSub = async function (req, res) {
  const { classId, divId, testId, subId } = req.params;

  let err, testmarksObj;

  [err, testmarksObj] = await to(
    Testmarks.destroy({
      where: {
        classId: classId,
        divId: divId,
        testId: testId,
        subId: subId,
      },
    })
  );

  if (err) {
    return ReE(res, "Error occurred trying to delete testmarks");
  }

  if (testmarksObj === 0) {
    // If no rows were affected, it means no record was found
    return ReE(res, "Testmarks not found", 404);
  }

  return ReS(res, { message: "Deleted Testmarks" }, 200);
};

const _deleteRecordByClassDivTestSub = deleteRecordByClassDivTestSub;
exports.deleteRecordByClassDivTestSub = _deleteRecordByClassDivTestSub;
const getStudentTestMarks = async function (req, res) {
  try {
    const studentId = req.query.studentId;
    const testId = req.query.testId;
    const testMarks = await db.sequelize.query(
      `
      SELECT
        tmv.id,
        tmv.studentId,
        tmv.teacherId,
        tmv.testId,
        tmv.subId,
        tmv.classId,
        tmv.divId,
        tmv.getMarks,
        tmv.totalMarks,
        tmv.testName,
        tmv.className,
        tmv.divName,
        tmv.subName,
        tmv.teacherName,
        tmv.studentName,
        tmv.rollNo,
        tmv.createdAt,
        tmv.updatedAt
      FROM
        school.testmarksview tmv
      WHERE
        tmv.studentId = :studentId
        ${testId ? "AND tmv.testId = :testId" : ""};
      `,
      {
        replacements: { studentId, testId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );
    console.log(testMarks);
    return ReS(res, testMarks);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getStudentTestMarks = getStudentTestMarks;
