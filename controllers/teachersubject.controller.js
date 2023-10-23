const { Teachersubject }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, teachersubjectObj;
    let teachersubjectInfo = req.body;
    console.log(teachersubjectInfo);
    [err, teachersubjectObj] = await to(Teachersubject.create(teachersubjectInfo));
    if(err) return ReE(res, err, 422);
    
    [err, teachersubjectObj] = await to(teachersubjectObj.save());
    if(err) return ReE(res, err, 422);
    
    let teachersubjectJson = teachersubjectObj.toWeb();
   
    return ReS(res, {teachersubject:teachersubjectJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let teachersubjectId = req.params.teachersubjectId;
    [err, teachersubjectObj] = await to(Teachersubject.findByPk(teachersubjectId));
    if(err) return ReE(res, err, 422);

    let teachersubjectJson = teachersubjectObj.toWeb();
   
    return ReS(res, {teachersubject:teachersubjectJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, teachersubjectObj, data
    teachersubjectObj = req.teachersubject;
    data = req.body;
    console.log("data"+data);
    teachersubjectObj.set(data);
 
    [err, teachersubjectObj] = await to(teachersubjectObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Teachersubject: '+teachersubjectObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let teachersubjectObj, err;
    teachersubjectObj = req.teachersubject;

    [err, teachersubjectObj] = await to(teachersubjectObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete teachersubject');

    return ReS(res, {message:'Deleted Teachersubject'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Teachersubject.findAll({})
        .then(att =>ReS(res, {teachersubject:att}))
        .catch(error => ReS(res, {teachersubject:error}));
}
module.exports.getAll = getAll;
