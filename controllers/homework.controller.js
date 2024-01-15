const { Homework } = require("../models");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, homeworkObj;
  let homeworkInfo = req.body;
  console.log(homeworkInfo);
  [err, homeworkObj] = await to(Homework.create(homeworkInfo));
  if (err) return ReE(res, err, 422);

  [err, homeworkObj] = await to(homeworkObj.save());
  if (err) return ReE(res, err, 422);

  let homeworkJson = homeworkObj.toWeb();

  return ReS(res, { homework: homeworkJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let homeworkId = req.params.homeworkId;
  [err, homeworkObj] = await to(Homework.findByPk(homeworkId));
  if (err) return ReE(res, err, 422);

  let homeworkJson = homeworkObj.toWeb();

  return ReS(res, { homework: homeworkJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, homeworkObj, data;
  homeworkObj = req.homework;
  data = req.body;
  console.log(data);
  homeworkObj.set(data);

  [err, homeworkObj] = await to(homeworkObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Homework: " + homeworkObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let homeworkObj, err;
  homeworkObj = req.homework;

  [err, homeworkObj] = await to(homeworkObj.destroy());
  if (err) return ReE(res, "error occured trying to delete homework");

  return ReS(res, { message: homeworkObj }, 200);
};
module.exports.remove = remove;

const getAll = async function (_req, res) {
  try {
    db.sequelize
      .query(
        "SELECT h.id, h.classId, h.divId, h.subId, h.title, h.description, h.deadline, h.isCompleted, h.createdAt, h.createdBy, h.updatedAt, h.updatedBy, h.active, c.className, d.divName, s.subName FROM homework h JOIN class c ON h.classId = c.id JOIN division d ON h.divId = d.id JOIN subject s ON h.subId = s.id",
        { type: db.sequelize.QueryTypes.SELECT }
      )
      .then(function (homework) {
        ReS(res, { homework: homework });
      })
      .catch(function (err) {
        console.log(err);
        ReS(res, { homework: err });
      });
  } catch (error) {
    return ReE(res, { homework: error });
  }
};
module.exports.getAll = getAll;
const getTeacherHomeWorkData = async function (req, res) {
  let homeworkData, err;

  // Assuming you have the teacherId in the request parameters
  const teacherId = req.query.teacherId;

  // Assuming homework_view is the name of the view
  const query = `
    SELECT
      hv.id,
      hv.classId,
      hv.divId,
      hv.subId,
      hv.title,
      hv.description,
      hv.deadline,
      hv.isCompleted,
      hv.createdAt,
      hv.createdBy,
      hv.updatedAt,
      hv.updatedBy,
      hv.active,
      hv.className,
      hv.divName,
      hv.subName
    FROM school.homework_view hv
    WHERE hv.teacherId = :teacherId
  `;
  console.log(query);
  [err, homeworkData] = await to(
    db.sequelize.query(query, {
      replacements: { teacherId: teacherId },
      type: db.sequelize.QueryTypes.SELECT,
    })
  );

  if (err) {
    return ReE(res, "error occurred while trying to find homework");
  }

  if (!homeworkData || homeworkData.length === 0) {
    return ReE(res, "homework not found for the specified teacherId");
  }
  // console.log(err);
  // console.log(homeworkData);
  // Assuming you want to send homework data as a response
  return ReS(res, homeworkData, 200);
};

module.exports.getTeacherHomeWorkData = getTeacherHomeWorkData;
