const { News } = require("../models");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, newsObj;
  let newsInfo = req.body;
  console.log(newsInfo);
  [err, newsObj] = await to(News.create(newsInfo));
  if (err) return ReE(res, err, 422);

  [err, newsObj] = await to(newsObj.save());
  if (err) return ReE(res, err, 422);

  let newsJson = newsObj.toWeb();

  return ReS(res, { news: newsJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let newsId = req.params.newsId;
  [err, newsObj] = await to(News.findByPk(newsId));
  if (err) return ReE(res, err, 422);

  let newsJson = newsObj.toWeb();

  return ReS(res, { news: newsJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, newsObj, data;
  newsObj = req.news;
  data = req.body;
  console.log(data);
  newsObj.set(data);

  [err, newsObj] = await to(newsObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated News: " + newsObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let newsObj, err;
  newsObj = req.news;

  [err, newsObj] = await to(newsObj.destroy());
  if (err) return ReE(res, "error occurred trying to delete news");

  return ReS(res, { message: "Deleted News" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  News.findAll({})
    .then((news) => ReS(res, { news }))
    .catch((error) => ReS(res, { news: error }));
};
module.exports.getAll = getAll;
