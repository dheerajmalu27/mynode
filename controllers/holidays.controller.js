const { Holidays }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, holidaysObj;
    let holidaysInfo = req.body;
    console.log(holidaysInfo);
    [err, holidaysObj] = await to(Holidays.create(holidaysInfo));
    if(err) return ReE(res, err, 422);
    
    [err, holidaysObj] = await to(holidaysObj.save());
    if(err) return ReE(res, err, 422);
    
    let holidaysJson = holidaysObj.toWeb();
   
    return ReS(res, {holidays:holidaysJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let holidaysId = req.params.holidaysId;
    [err, holidaysObj] = await to(Holidays.findByPk(holidaysId));
    if(err) return ReE(res, err, 422);

    let holidaysJson = holidaysObj.toWeb();
   
    return ReS(res, {holidays:holidaysJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, holidaysObj, data
    holidaysObj = req.holiday;
    data = req.body;
    console.log(data);
    holidaysObj.set(data);
 
    [err, holidaysObj] = await to(holidaysObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Holidays: '+holidaysObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let holidaysObj, err;
    holidaysObj = req.holiday;

    [err, holidaysObj] = await to(holidaysObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete holidays');

    return ReS(res, {message:'Deleted Holidays'}, 200);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Holidays.findAll({})
        .then(att =>ReS(res, {holidays:att}))
        .catch(error => ReS(res, {holidays:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Holidays.findAll({ attributes: ['id', ['holidayDate', 'text']]})
        .then(att =>ReS(res, {holidays:att}))
        .catch(error => ReS(res, {holidays:error}));
}
module.exports.getAllList = getAllList;
