const { Timetable } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, timetableObj;
  let timetableInfo = req.body;
  console.log(timetableInfo);
  [err, timetableObj] = await to(Timetable.create(timetableInfo));
  if (err) return ReE(res, err, 422);

  [err, timetableObj] = await to(timetableObj.save());
  if (err) return ReE(res, err, 422);

  let timetableJson = timetableObj.toWeb();

  return ReS(res, { timetable: timetableJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let timetableId = req.params.timetableId;
  [err, timetableObj] = await to(Timetable.findByPk(timetableId));
  if (err) return ReE(res, err, 422);

  let timetableJson = timetableObj.toWeb();

  return ReS(res, { timetable: timetableJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, timetableObj, data;
  timetableObj = req.holiday;
  data = req.body;
  console.log(data);
  timetableObj.set(data);

  [err, timetableObj] = await to(timetableObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Timetable: " + timetableObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let timetableObj, err;
  timetableObj = req.timetable;

  [err, timetableObj] = await to(timetableObj.destroy());
  if (err) return ReE(res, "error occured trying to delete timetable");

  return ReS(res, { message: "Deleted Timetable" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const timetable = await Timetable.findAll({});
    return ReS(res, { timetable });
  } catch (error) {
    return ReE(res, { timetable: error });
  }
};
module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  try {
    const timetable = await Timetable.findAll({
      attributes: ["id", ["holidayDate", "text"]],
    });
    return ReS(res, { timetable });
  } catch (error) {
    return ReE(res, { timetable: error });
  }
};
module.exports.getAllList = getAllList;

const getTimeTableBatchList = async function (req, res) {
  try {
    const TimeTableData = new Object();
    const timetabledata = await db.sequelize.query(
      "SELECT classId, divId, className, divName FROM timetabledetailview GROUP BY classId, divId",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    TimeTableData.timetabledatalist = timetabledata;
    return ReS(res, TimeTableData);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.getTimeTableBatchList = getTimeTableBatchList;

const getClassTimeTable = async function (req, res) {
  try {
    const TimeTableData = new Object();
    const classId = req.query.classId;
    const divId = req.query.divId;
    const timetabledata = await db.sequelize.query(
      'SELECT `id`, `teacherId`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`, `textData`, `updatedAt`, `className`, `divName`, `subName` as title, `teacherName`,SUBSTRING_INDEX(`timeSlot`,"-",1) AS `start`,SUBSTRING_INDEX(`timeSlot`,"-",-1) AS `end` FROM `timetabledetailview` WHERE classId=' +
        classId +
        " and divId=" +
        divId,
      { type: db.sequelize.QueryTypes.SELECT }
    );
    TimeTableData.classtimetabledata = timetabledata;
    return ReS(res, TimeTableData);
  } catch (error) {
    return ReE(res, error);
  }
};
module.exports.getClassTimeTable = getClassTimeTable;

const getTeacherTimeTable = async function (req, res) {
  try {
    const TimeTableData = new Object();
    const teacherId = req.query.teacherId;

    const timetabledata = await db.sequelize.query(
      'SELECT `id`, `teacherId`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`, `textData`, `updatedAt`, `className`, `divName`, `subName` as title, `teacherName`, SUBSTRING_INDEX(`timeSlot`,"-",1) AS `start`, SUBSTRING_INDEX(`timeSlot`,"-",-1) AS `end` FROM `timetabledetailview` WHERE teacherId=:teacherId AND dayName=DAYNAME(CURDATE())',
      {
        replacements: { teacherId },
        type: db.sequelize.QueryTypes.SELECT,
      }
    );

    TimeTableData.teachertimetabledata = timetabledata;
    return ReS(res, TimeTableData);
  } catch (error) {
    return ReE(res, error);
  }
};

module.exports.getTeacherTimeTable = getTeacherTimeTable;

const bulkCreate = async function (req, res) {
  try {
    const TimeTableData = req.body;
    console.log(TimeTableData);
    await Timetable.bulkCreate(TimeTableData, {
      updateOnDuplicate: [
        `id`,
        `teacherId`,
        `classId`,
        `divId`,
        `subId`,
        `dayId`,
        `timeSlot`,
        `createdAt`,
        `updatedAt`,
      ],
    });
    const timetable = await Timetable.findAll({});
    return ReS(res, { timetable });
  } catch (error) {
    return ReE(res, { timetable: error });
  }
};
module.exports.bulkCreate = bulkCreate;
