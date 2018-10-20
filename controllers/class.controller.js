const { Class }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, classObj;
    let classInfo = req.body;
    console.log(classInfo);
    [err, classObj] = await to(Class.create(classInfo));
    if(err) return ReE(res, err, 422);
    
    [err, classObj] = await to(classObj.save());
    if(err) return ReE(res, err, 422);
    
    let classJson = classObj.toWeb();
   
    return ReS(res, {class:classJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let classId = req.params.classId;
    [err, classObj] = await to(Class.findById(classId));
    if(err) return ReE(res, err, 422);

    let classJson = classObj.toWeb();
   
    return ReS(res, {class:classJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, classObj, data
    classObj = req.class;
    data = req.body;
    console.log("data"+data);
    classObj.set(data);
 
    [err, classObj] = await to(classObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated class: '+classObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let classObj, err;
    classObj = req.class;

    [err, classObj] = await to(classObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete class');

    return ReS(res, {message:'Deleted class'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Class.findAll({})
        .then(att =>ReS(res, {class:att}))
        .catch(error => ReS(res, {class:error}));
}
module.exports.getAll = getAll;
