const { Borrowedbooks } = require("../models");
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const db = require("../models/index").db;
const create = async function (req, res) {
  let err, borrowedbooksObj;
  let borrowedbooksInfo = req.body;
  console.log(borrowedbooksInfo);
  [err, borrowedbooksObj] = await to(Borrowedbooks.create(borrowedbooksInfo));
  if (err) return ReE(res, err, 422);

  [err, borrowedbooksObj] = await to(borrowedbooksObj.save());
  if (err) return ReE(res, err, 422);

  let booksJson = borrowedbooksObj.toWeb();

  return ReS(res, { books: booksJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let borrowId = req.params.borrowId;
  [err, borrowedbooksObj] = await to(Borrowedbooks.findByPk(borrowId));
  if (err) return ReE(res, err, 422);

  let booksJson = borrowedbooksObj.toWeb();

  return ReS(res, { books: booksJson }, 201);
};
module.exports.get = get;

const update = async function (req, res) {
  let err, borrowedbooksObj, data;
  borrowedbooksObj = req.borrowedbook;
  data = req.body;
  console.log(data);
  borrowedbooksObj.set(data);

  [err, borrowedbooksObj] = await to(borrowedbooksObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Borrowedbooks: " + borrowedbooksObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let borrowedbooksObj, err;
  borrowedbooksObj = req.borrowedbook;

  [err, borrowedbooksObj] = await to(borrowedbooksObj.destroy());
  if (err) return ReE(res, "error occured trying to delete books");

  return ReS(res, { message: "Deleted Borrowedbooks" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  try {
    const result = await db.sequelize.query(
      "SELECT * FROM borrowed_books_view",
      { type: db.sequelize.QueryTypes.SELECT }
    );
    return ReS(res, { borrowedbooks: result });
  } catch (err) {
    return ReE(res, err);
    // Handle any errors that occurred during the query
  }
};

module.exports.getAll = getAll;
