const { Leavingcertificate } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, leavingcertificatesObj;
  let leavingcertificatesInfo = req.body;
  console.log(leavingcertificatesInfo);
  [err, leavingcertificatesObj] = await to(
    Leavingcertificate.create(leavingcertificatesInfo)
  );
  if (err) return ReE(res, err, 422);

  [err, leavingcertificatesObj] = await to(leavingcertificatesObj.save());
  if (err) return ReE(res, err, 422);

  let leavingcertificatesJson = leavingcertificatesObj.toWeb();

  return ReS(res, { leavingcertificates: leavingcertificatesJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let leavingcertificatesId = req.params.leavingcertificateId;

  [err, leavingcertificatesObj] = await to(
    Leavingcertificate.findByPk(leavingcertificatesId)
  );
  if (err) return ReE(res, err, 422);

  let leavingcertificatesJson = leavingcertificatesObj.toWeb();

  return ReS(res, { leavingcertificates: leavingcertificatesJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, leavingcertificatesObj, data;
  leavingcertificatesObj = req.leavingcertificate;
  data = req.body;
  console.log(data);
  leavingcertificatesObj.set(data);

  [err, leavingcertificatesObj] = await to(leavingcertificatesObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, {
    message: "Updated Leavingcertificate: " + leavingcertificatesObj.id,
  });
};
module.exports.update = update;

const remove = async function (req, res) {
  let leavingcertificatesObj, err;
  leavingcertificatesObj = req.leavingcertificate;

  [err, leavingcertificatesObj] = await to(leavingcertificatesObj.destroy());
  if (err)
    return ReE(res, "error occured trying to delete leavingcertificates");

  return ReS(res, { message: "Deleted Leavingcertificate" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  Leavingcertificate.findAll({})
    .then((att) => ReS(res, { leavingcertificates: att }))
    .catch((error) => ReS(res, { leavingcertificates: error }));
};
module.exports.getAll = getAll;
const getAllList = async function (req, res) {
  Leavingcertificate.findAll({
    attributes: [
      "id",
      "firstName",
      "lastName",
      "className",
      "divName",
      "dateOfCertificate",
    ],
  })
    .then((att) => ReS(res, { leavingcertificates: att }))
    .catch((error) => ReS(res, { leavingcertificates: error }));
};
module.exports.getAllList = getAllList;
