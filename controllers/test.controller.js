const { Test }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, testObj;
    let testInfo = req.body;
    console.log(testInfo);
    [err, testObj] = await to(Test.create(testInfo));
    if(err) return ReE(res, err, 422);
    
    [err, testObj] = await to(testObj.save());
    if(err) return ReE(res, err, 422);
    
    let testJson = testObj.toWeb();
   
    return ReS(res, {test:testJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let testId = req.params.testId;
    [err, testObj] = await to(Test.findById(testId));
    if(err) return ReE(res, err, 422);

    let testJson = testObj.toWeb();
   
    return ReS(res, {test:testJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, testObj, data
    testObj = req.test;
    data = req.body;
    console.log("data"+data);
    testObj.set(data);
 
    [err, testObj] = await to(testObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Test: '+testObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let testObj, err;
    testObj = req.test;

    [err, testObj] = await to(testObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete test');

    return ReS(res, {message:'Deleted Test'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Test.findAll({})
        .then(att =>ReS(res, {test:att}))
        .catch(error => ReS(res, {test:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Test.findAll({ attributes: ['id', ['testName', 'text']]})
        .then(tst =>ReS(res, {test:tst}))
        .catch(error => ReS(res, {test:error}));
}
module.exports.getAllList = getAllList;