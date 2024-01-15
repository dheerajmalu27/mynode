const { SchoolOtherDocs } = require('../models'); // Adjust the path accordingly
const { to, ReE, ReS } = require('../services/util.service');

const create = async function (req, res) {
  let err, schoolOtherDocsObj;
  let schoolOtherDocsInfo = req.body;
  console.log(schoolOtherDocsInfo);
  console.log(req.file);
  if (req.file) {
    schoolOtherDocsInfo.filePath = req.file.filename;
  }


  [err, schoolOtherDocsObj] = await to(SchoolOtherDocs.create(schoolOtherDocsInfo));
  if (err) return ReE(res, err, 422);

  [err, schoolOtherDocsObj] = await to(schoolOtherDocsObj.save());
  if (err) return ReE(res, err, 422);

  let schoolOtherDocsJson = schoolOtherDocsObj.toWeb();

  return ReS(res, { schoolOtherDocs: schoolOtherDocsJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let schoolOtherDocsId = req.params.schoolOtherDocsId;
  [err, schoolOtherDocsObj] = await to(SchoolOtherDocs.findByPk(schoolOtherDocsId));
  if (err) return ReE(res, err, 422);

  let schoolOtherDocsJson = schoolOtherDocsObj.toWeb();

  return ReS(res, { schoolOtherDocs: schoolOtherDocsJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, schoolOtherDocsObj, data;
  schoolOtherDocsObj = req.schoolOtherDocs;
  data = req.body;
  console.log(req.file);
 

  schoolOtherDocsObj.set(data);
  if (req.file) {
    schoolOtherDocsObj.filePath = req.file.filename;
  }
  [err, schoolOtherDocsObj] = await to(schoolOtherDocsObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: 'Updated SchoolOtherDocs: ' + schoolOtherDocsObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let schoolOtherDocsObj, err;
  schoolOtherDocsObj = req.schoolOtherDocs;

  [err, schoolOtherDocsObj] = await to(schoolOtherDocsObj.destroy());
  if (err) return ReE(res, 'error occurred trying to delete SchoolOtherDocs');

  return ReS(res, { message: schoolOtherDocsObj }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  SchoolOtherDocs.findAll({})
    .then(docs => ReS(res, { schoolOtherDocs: docs }))
    .catch(error => ReS(res, { schoolOtherDocs: error }));
};
module.exports.getAll = getAll;

const getAllList = async function (req, res) {
  SchoolOtherDocs.findAll({ attributes: ['id', ['docName', 'text']] })
    .then(docs => ReS(res, { schoolOtherDocs: docs }))
    .catch(error => ReS(res, { schoolOtherDocs: error }));
};
module.exports.getAllList = getAllList;
