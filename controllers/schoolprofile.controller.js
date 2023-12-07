const { Schoolprofile }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, schoolprofileObj;
    let schoolprofileInfo = req.body;
    console.log(schoolprofileInfo);
    [err, schoolprofileObj] = await to(Schoolprofile.create(schoolprofileInfo));
    if(err) return ReE(res, err, 422);
    
    [err, schoolprofileObj] = await to(schoolprofileObj.save());
    if(err) return ReE(res, err, 422);
    
    let schoolprofileJson = schoolprofileObj.toWeb();
   
    return ReS(res, {schoolprofile:schoolprofileJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let schoolprofileId = req.params.schoolprofileId;
    [err, schoolprofileObj] = await to(Schoolprofile.findByPk(schoolprofileId));
    if(err) return ReE(res, err, 422);

    let schoolprofileJson = schoolprofileObj.toWeb();
   
    return ReS(res, {schoolprofile:schoolprofileJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, schoolprofileObj, data
    schoolprofileObj = req.schoolprofile;
    data = req.body;
    console.log(data);
    schoolprofileObj.set(data);
 
    [err, schoolprofileObj] = await to(schoolprofileObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Schoolprofile: '+schoolprofileObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let schoolprofileObj, err;
    schoolprofileObj = req.schoolprofile;

    [err, schoolprofileObj] = await to(schoolprofileObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete schoolprofile');

    return ReS(res, {message:'Deleted Schoolprofile'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Schoolprofile.findAll({})
        .then(att =>ReS(res, {schoolprofile:att}))
        .catch(error => ReS(res, {schoolprofile:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Schoolprofile.findAll({ attributes: ['id', ['divName', 'text']]})
        .then(att =>ReS(res, {schoolprofile:att}))
        .catch(error => ReS(res, {schoolprofile:error}));
}
module.exports.getAllList = getAllList;
