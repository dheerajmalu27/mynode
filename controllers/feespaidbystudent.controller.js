const { FeesPaidByStudent } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, feespaidbystudentObj;
  let feespaidbystudentInfo = req.body;
  console.log(feespaidbystudentInfo);
  [err, feespaidbystudentObj] = await to(
    FeesPaidByStudent.create(feespaidbystudentInfo)
  );
  if (err) return ReE(res, err, 422);

  [err, feespaidbystudentObj] = await to(feespaidbystudentObj.save());
  if (err) return ReE(res, err, 422);

  let feespaidbystudentJson = feespaidbystudentObj.toWeb();

  return ReS(res, { feespaidbystudent: feespaidbystudentJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let feeId = req.params.feeId;
  [err, feespaidbystudentObj] = await to(FeesPaidByStudent.findByPk(feeId));
  if (err) return ReE(res, err, 422);

  let feespaidbystudentJson = feespaidbystudentObj.toWeb();

  return ReS(res, { feespaidbystudent: feespaidbystudentJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, feespaidbystudentObj, data;
  feespaidbystudentObj = req.feespaidbystudent;
  data = req.body;
  console.log(data);
  feespaidbystudentObj.set(data);

  [err, feespaidbystudentObj] = await to(feespaidbystudentObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, {
    message: "Updated FeesPaidByStudent: " + feespaidbystudentObj.feeId,
  });
};
module.exports.update = update;

const remove = async function (req, res) {
  let feespaidbystudentObj, err;
  feespaidbystudentObj = req.feespaidbystudent;

  [err, feespaidbystudentObj] = await to(feespaidbystudentObj.destroy());
  if (err) return ReE(res, "error occured trying to delete feespaidbystudent");

  return ReS(res, { message: "Deleted FeesPaidByStudent" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const feesPaidByStudent = await db.sequelize.query(
      `SELECT fps.paymentId, fps.studentId, fps.feeId, fps.paymentAmount, fps.remainingAmount, fps.paymentDate, fps.paymentMethod, fps.paymentDetail, fps.isPartial, fps.createdAt, fps.updatedAt, CONCAT(stu.firstName, ' ', stu.lastName) AS studentName, class.className, div.divName
            FROM feespaidbystudent AS fps
            JOIN students AS stu ON fps.studentId = stu.studentId
            JOIN fees AS fee ON fps.feeId = fee.feeId
            JOIN class AS class ON fee.classId = class.id
            JOIN division AS div ON class.divId = div.id`,
      { type: db.sequelize.QueryTypes.SELECT }
    );

    ReS(res, { feespaidbystudent: feesPaidByStudent });
  } catch (error) {
    console.error(error);
    ReE(res, { feespaidbystudent: error });
  }
};

module.exports.getAll = getAll;

const getPendingFeesList = async function (req, res) {
  try {
    const pendingFeesStudentResult = await db.sequelize.query(
      `SELECT * FROM school.pendingfeesstudentlistview;`,
      { type: db.sequelize.QueryTypes.SELECT }
    );

    ReS(res, { pendingfeesstudent: pendingFeesStudentResult });
  } catch (error) {
    console.error(error);
    ReE(res, { pendingfeesstudent: error });
  }
};

module.exports.getPendingFeesList = getPendingFeesList;
