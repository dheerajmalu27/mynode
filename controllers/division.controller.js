const { Division } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, divisionObj;
  let divisionInfo = req.body;
  console.log(divisionInfo);
  [err, divisionObj] = await to(Division.create(divisionInfo));
  if (err) return ReE(res, err, 422);

  [err, divisionObj] = await to(divisionObj.save());
  if (err) return ReE(res, err, 422);

  let divisionJson = divisionObj.toWeb();

  return ReS(res, { division: divisionJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let divisionId = req.params.divisionId;
  [err, divisionObj] = await to(Division.findByPk(divisionId));
  if (err) return ReE(res, err, 422);

  let divisionJson = divisionObj.toWeb();

  return ReS(res, { division: divisionJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, divisionObj, data;
  divisionObj = req.division;
  data = req.body;

  divisionObj.set(data);

  [err, divisionObj] = await to(divisionObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Division: " + divisionObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let divisionObj, err;
  divisionObj = req.division;

  [err, divisionObj] = await to(divisionObj.destroy());
  if (err) return ReE(res, "error occured trying to delete division");

  return ReS(res, { message: "Deleted Division" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  Division.findAll({})
    .then((att) => ReS(res, { division: att }))
    .catch((error) => ReS(res, { division: error }));
};
module.exports.getAll = getAll;
const getAllList = async function (req, res) {
  Division.findAll({ attributes: ["id", ["divName", "text"]] })
    .then((att) => ReS(res, { division: att }))
    .catch((error) => ReS(res, { division: error }));
};
module.exports.getAllList = getAllList;
