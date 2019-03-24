const { Testmarks }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, testmarksObj;
    let testmarksInfo = req.body;
    console.log(testmarksInfo);
    [err, testmarksObj] = await to(Testmarks.create(testmarksInfo));
    if(err) return ReE(res, err, 422);
    
    [err, testmarksObj] = await to(testmarksObj.save());
    if(err) return ReE(res, err, 422);
    
    let testmarksJson = testmarksObj.toWeb();
   
    return ReS(res, {testmarks:testmarksJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let testmarksId = req.params.testmarksId;
    [err, testmarksObj] = await to(Testmarks.findById(testmarksId));
    if(err)  return ReE(res, err, 422);

    let testmarksJson = testmarksObj.toWeb();
   
    return ReS(res, {testmarks:testmarksJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, testmarksObj, data
    testmarksObj = req.testmarks;
    data = req.body;
    console.log("data"+data);
    testmarksObj.set(data);
 
    [err, testmarksObj] = await to(testmarksObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Testmarks: '+testmarksObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let testmarksObj, err;
    testmarksObj = req.testmarks;

    [err, testmarksObj] = await to(testmarksObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete testmarks');

    return ReS(res, {message:'Deleted Testmarks'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Testmarks.findAll({})
        .then(att =>ReS(res, {testmarks:att}))
        .catch(error => ReS(res, {testmarks:error}));
}
module.exports.getAll = getAll;
const gettestmarkspendinglist = async function(req, res){
    db.sequelize.query('SELECT * FROM testmarkspendingteacherlistview',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
               
                res.json(response);
               }).error(function(err){
                  res.json(err);
           });
}
module.exports.gettestmarkspendinglist = gettestmarkspendinglist;

const gettestmarkslist = async function(req, res){
    db.sequelize.query('SELECT * FROM testmarkslistview',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
               
                res.json(response);
               }).error(function(err){
                  res.json(err);
           });
}
module.exports.gettestmarkslist = gettestmarkslist;