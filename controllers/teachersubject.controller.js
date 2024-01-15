const { Teachersubject } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, teachersubjectObj;
  let teachersubjectInfo = req.body;
  console.log(teachersubjectInfo);
  [err, teachersubjectObj] = await to(
    Teachersubject.create(teachersubjectInfo)
  );
  if (err) return ReE(res, err, 422);

  [err, teachersubjectObj] = await to(teachersubjectObj.save());
  if (err) return ReE(res, err, 422);

  let teachersubjectJson = teachersubjectObj.toWeb();

  return ReS(res, { teachersubject: teachersubjectJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let teachersubjectId = req.params.teachersubjectId;
  [err, teachersubjectObj] = await to(
    Teachersubject.findByPk(teachersubjectId)
  );
  if (err) return ReE(res, err, 422);

  let teachersubjectJson = teachersubjectObj.toWeb();

  return ReS(res, { teachersubject: teachersubjectJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, teachersubjectObj, data;
  teachersubjectObj = req.teachersubject;
  data = req.body;

  teachersubjectObj.set(data);

  [err, teachersubjectObj] = await to(teachersubjectObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, {
    message: "Updated Teachersubject: " + teachersubjectObj.id,
  });
};
module.exports.update = update;

const remove = async function (req, res) {
  let teachersubjectObj, err;
  teachersubjectObj = req.teachersubject;

  [err, teachersubjectObj] = await to(teachersubjectObj.destroy());
  if (err) return ReE(res, "error occured trying to delete teachersubject");

  return ReS(res, { message: "Deleted Teachersubject" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const teachersubject = await Teachersubject.findAll({});
    return ReS(res, { teachersubject });
  } catch (error) {
    return ReE(res, { teachersubject: error });
  }
};
module.exports.getAll = getAll;

const teacherSubjectList = async function (req, res) {
  try {
    const teacherSubjectListData = new Object();
    console.log(req.query);
    const classId = req.query.classId;
    const testId = req.query.testId;
    const divId = req.query.divId;
    const testdata = await db.sequelize.query(
      "SELECT * FROM all_teacherclassdivisionsubject",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    teacherSubjectListData.subjectteacherlist = testdata;
    return ReS(res, teacherSubjectListData);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.teacherSubjectList = teacherSubjectList;

const updateTeacherSubject = async function (req, res) {
  try {
    const data = req.body; // The data you want to update or insert
    const classId = req.body.classId;
    const divId = req.body.divId;
    const subId = req.body.subId;

    // Define the WHERE conditions to find the record
    const whereConditions = {
      classId: classId,
      divId: divId,
      subId: subId,
      // Add additional conditions as needed
    };

    // Find or create the record based on the conditions
    const [result, created] = await Teachersubject.findOrCreate({
      where: whereConditions,
      defaults: data, // Data to insert if it doesn't exist
    });

    if (created) {
      // Record was inserted
      return ReS(res, {
        message:
          "Inserted TeacherSubject: classId=" +
          classId +
          ", divId=" +
          divId +
          ", subId=" +
          subId,
      });
    } else {
      // Record was found and updated
      return ReS(res, {
        message:
          "Updated TeacherSubject: classId=" +
          classId +
          ", divId=" +
          divId +
          ", subId=" +
          subId,
      });
    }
  } catch (error) {
    return ReE(res, error, 422);
  }
};

module.exports.updateTeacherSubject = updateTeacherSubject;

const teacherClassDivList = async function (req, res) {
  try {
    const teacherSubjectListData = new Object();
    console.log(req.query);

    const teacherId = req.query.teacherId;

    const testdata = await db.sequelize.query(
      "SELECT `classId`, `divId`, `className`, `divName` FROM `school`.`subjectteacherview` WHERE `teacherId` = :teacherId GROUP BY `classId`, `divId`;",
      {
        type: db.sequelize.QueryTypes.SELECT,
        replacements: { teacherId: teacherId }, // Use the correct teacherId
      }
    );

    teacherSubjectListData.classdivlist = testdata;
    return ReS(res, teacherSubjectListData);
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    return ReE(res, "Error fetching data"); // Return an error response
  }
};

module.exports.teacherClassDivList = teacherClassDivList;

const teacherSubjectClassDivList = async function (req, res) {
  try {
    const teacherSubjectListData = new Object();
    console.log(req.query);

    const teacherId = req.query.teacherId;

    const testdata = await db.sequelize.query(
      "SELECT `classId`, `divId`, `className`, `divName`, `subId`, `subName` FROM `school`.`subjectteacherview` WHERE `teacherId` = :teacherId GROUP BY `classId`, `divId`, `subId`;",
      {
        type: db.sequelize.QueryTypes.SELECT,
        replacements: { teacherId: teacherId }, // Use the correct teacherId
      }
    );

    teacherSubjectListData.classdivlist = testdata;
    return ReS(res, teacherSubjectListData);
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    return ReE(res, "Error fetching data"); // Return an error response
  }
};

module.exports.teacherSubjectClassDivList = teacherSubjectClassDivList;
