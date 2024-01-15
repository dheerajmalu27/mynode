const { Classteacher } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, classteacherObj;
  let classteacherInfo = req.body;
  console.log(classteacherInfo);
  [err, classteacherObj] = await to(Classteacher.create(classteacherInfo));
  if (err) return ReE(res, err, 422);

  [err, classteacherObj] = await to(classteacherObj.save());
  if (err) return ReE(res, err, 422);

  let classteacherJson = classteacherObj.toWeb();

  return ReS(res, { classteacher: classteacherJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let classteacherId = req.params.classteacherId;
  [err, classteacherObj] = await to(Classteacher.findByPk(classteacherId));
  if (err) return ReE(res, err, 422);

  let classteacherJson = classteacherObj.toWeb();

  return ReS(res, { classteacher: classteacherJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, classteacherObj, data;
  classteacherObj = req.classteacher;
  data = req.body;

  classteacherObj.set(data);

  [err, classteacherObj] = await to(classteacherObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Classteacher: " + classteacherObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let classteacherObj, err;
  classteacherObj = req.classteacher;

  [err, classteacherObj] = await to(classteacherObj.destroy());
  if (err) return ReE(res, "error occured trying to delete classteacher");

  return ReS(res, { message: "Deleted Classteacher" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const att = await db.sequelize.query(
      "SELECT * FROM all_classteacherlistview",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, { classteacher: att });
  } catch (error) {
    return ReE(res, { classteacher: error });
  }
};

module.exports.getAll = getAll;

const classTeacherList = async function (req, res) {
  try {
    let classTeacherListData = new Object();
    console.log(req.query);
    let classId = req.query.classId;
    let testId = req.query.testId;
    let divId = req.query.divId;

    const testdata = await db.sequelize.query(
      "SELECT * FROM all_teacherclassdivisionsubject",
      { type: db.sequelize.QueryTypes.SELECT }
    );

    classTeacherListData.subjectteacherlist = testdata;
    return ReS(res, classTeacherListData);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.classTeacherList = classTeacherList;

const updateClassTeacher = async function (req, res) {
  const data = req.body; // The data you want to update or insert
  const classId = req.body.classId;
  const divId = req.body.divId;

  // Define the WHERE conditions to find the record
  const whereConditions = {
    classId: classId,
    divId: divId,
    // Add additional conditions as needed
  };

  // Use the upsert method to insert or update the record
  const [err, result] = await to(
    Classteacher.upsert(data, {
      where: whereConditions,
    })
  );

  if (err) {
    return ReE(res, err, 422);
  }

  const message = result ? "Inserted" : "Updated";
  return ReS(res, {
    message: `${message} ClassTeacher: classId=${classId}, divId=${divId}`,
  });
};

module.exports.updateClassTeacher = updateClassTeacher;
const getClassteacherById = async function (classteacherId) {
  let err, classteacherObj;

  [err, classteacherObj] = await to(Classteacher.findByPk(classteacherId));
  if (err) {
    throw err; // or handle the error in a way that makes sense for your application
  }

  return classteacherObj ? classteacherObj.toWeb() : null;
};

module.exports.getClassteacherById = getClassteacherById;
