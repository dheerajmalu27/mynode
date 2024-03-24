const { Expenses } = require("../models");
const { to, ReE, ReS } = require("../services/util.service");

const create = async function (req, res) {
  let err, expensesObj;
  let expensesInfo = req.body;

  [err, expensesObj] = await to(Expenses.create(expensesInfo));
  if (err) return ReE(res, err, 422);

  let expensesJson = expensesObj.toWeb();

  return ReS(res, { expenses: expensesJson }, 201);
};
module.exports.create = create;

const get = async function (req, res) {
  let expenseId = req.params.expenseId;

  [err, expensesObj] = await to(Expenses.findByPk(expenseId));
  if (err) return ReE(res, err, 422);

  let expensesJson = expensesObj.toWeb();

  return ReS(res, { expenses: expensesJson }, 201);
};
module.exports.get = get;

const getExpensesDataById = async function (req, res) {
  let id = req.params.id;

  [err, expensesObj] = await to(Expenses.findByPk(id));
  if (err) return ReE(res, err, 422);

  let expensesJson = expensesObj.toWeb();

  return ReS(res, { expenses: expensesJson }, 200);
};
module.exports.getExpensesDataById = getExpensesDataById;

const update = async function (req, res) {
  let err, expensesObj, data;
  expensesObj = req.expenses;
  data = req.body;

  expensesObj.set(data);

  [err, expensesObj] = await to(expensesObj.save());
  if (err) return ReE(res, err, 422);

  return ReS(res, { message: "Updated Expenses: " + expensesObj.id });
};
module.exports.update = update;

const remove = async function (req, res) {
  let expensesObj, err;
  expensesObj = req.expenses;

  [err, expensesObj] = await to(expensesObj.destroy());
  if (err) return ReE(res, "error occured trying to delete expenses");

  return ReS(res, { message: "Deleted Expenses" }, 200);
};
module.exports.remove = remove;

const getAll = async function (req, res) {
  [err, expenses] = await to(Expenses.findAll());
  if (err) return ReE(res, err, 422);

  let expensesJsonList = expenses.map((expense) => expense.toWeb());

  return ReS(res, { expenses: expensesJsonList }, 200);
};
module.exports.getAll = getAll;
