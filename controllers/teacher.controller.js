const { Teacher } = require("../models");
const { City } = require("../models");
const { State } = require("../models");
const db = require("../models/index").db;
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const classTeacher = require("../controllers/classteacher.controller");
const create = async function (req, res) {
  let err, teacherObj;
  let teacherInfo = req.body;
  console.log(teacherInfo);
  [err, teacherObj] = await to(Teacher.create(teacherInfo));
  if (err) return ReE(res, err, 422);

  [err, teacherObj] = await to(teacherObj.save());
  if (err) return ReE(res, err, 422);

  let teacherJson = teacherObj.toWeb();

  return ReS(res, { teacher: teacherJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let teacherId = req.params.teacherId;
  console.log("teacherId" + teacherId);
  [err, teacherObj] = await to(Teacher.findByPk(teacherId));
  if (err) return ReE(res, err, 422);

  let teacherJson = teacherObj.toWeb();

  return ReS(res, { teacher: teacherJson }, 201);
};
module.exports.get = get;

const getprofile = async function (req, res) {
  try {
    const teacherId = req.params.teacherId;

    const teacherData = {
      info: await Teacher.findAll({
        where: { id: teacherId },
        include: [
          { model: City, as: "TeacherCity", attributes: ["cityName"] },
          { model: State, as: "TeacherState", attributes: ["stateName"] },
        ],
      }),
      subjects: await db.sequelize.query(
        "SELECT * FROM subjectteacherview WHERE teacherId=" + teacherId,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      testmarks: await db.sequelize.query(
        'SELECT CONCAT(tm.subName,"-",tm.className,"-",tm.divName) as classSubName,tm.testName,tm.avgRecord FROM teachersubjectrecordview as tm WHERE tm.teacherId=' +
          teacherId,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      monthlyattendance: await db.sequelize.query(
        "SELECT ct.attendanceMonth AS month,ct.monthAvg AS result FROM classmonthlyattendanceview as ct WHERE ct.teacherId=" +
          teacherId,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      classtestresult: await db.sequelize.query(
        "SELECT ctv.testName,ctv.totalAvg AS result FROM classtestresultview as ctv WHERE ctv.teacherId=" +
          teacherId,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      timetable: await db.sequelize.query(
        'SELECT CONCAT(tt.`subName`,"-", tt.`className`,"-", tt.`divName`) AS title, tt.`dayName` AS dow,SUBSTRING_INDEX(tt.`timeSlot`,"-",1) AS `start`,SUBSTRING_INDEX(tt.`timeSlot`,"-",-1) AS `end` FROM `timetabledetailview` AS tt WHERE tt.teacherId=' +
          teacherId,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
    };

    return ReS(res, teacherData);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getprofile = getprofile;

const update = async function (req, res) {
  let err, teacherObj, data;
  teacherObj = req.teacher;
  data = req.body;
  //
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
  teacherObj.set(data);

  [err, teacherObj] = await to(teacherObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Teacher: " + teacherObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let teacherObj, err;
  teacherObj = req.teacher;

  [err, teacherObj] = await to(teacherObj.destroy());
  if (err) return ReE(res, "error occured trying to delete teacher");

  return ReS(res, { message: "Deleted Teacher" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const teacherData = {
      teacher: await db.sequelize.query(
        "SELECT te.*, cl.className, d.divName FROM (SELECT t.`id`, t.`firstName`, t.`lastName`, t.`mobileNumber`, t.`joiningDate`, t.`active`, ct.divId, ct.classId FROM `teacher` AS t LEFT JOIN `classteacher` AS ct ON ct.`teacherId`=t.`id`) AS te LEFT JOIN class AS cl ON cl.id=te.classId LEFT JOIN division AS d ON d.id=te.divId",
        { type: db.sequelize.QueryTypes.SELECT }
      ),
    };

    return ReS(res, teacherData);
  } catch (err) {
    return ReE(res, err);
  }
};

module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  Teacher.findAll({
    attributes: [
      "id",
      [db.sequelize.literal('CONCAT(firstName, " ", lastName)'), "text"],
    ],
  })
    .then((att) => ReS(res, { teacher: att }))
    .catch((error) => ReS(res, { teacher: error }));
};
module.exports.getAllList = getAllList;

const teacherLogin = async function (req, res) {
  const body = req.body;
  let err, teacher;
  let classteacherJson = {};
  [err, teacher] = await to(authService.authTeacher(req.body));

  if (err) return ReE(res, err, 422);

  if (teacher && teacher.id) {
    classteacherJson = await classTeacher.getClassteacherById(teacher.id);
    // console.log(classteacherJson);
    // if (classteacherJson) {
    //   // Include classteacher data in the response
    //   teacher.classteacher = classteacherJson;
    // }
  }
  console.log({
    token: teacher.getJWT(),
    teacher: teacher.toWeb(),
    classteacher: classteacherJson,
  });
  return ReS(res, {
    token: teacher.getJWT(),
    teacher: teacher.toWeb(),
    classteacher: classteacherJson,
  });
};

module.exports.teacherLogin = teacherLogin;
