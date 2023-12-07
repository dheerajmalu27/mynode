const { Roles }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, rolesObj;
    let rolesInfo = req.body;
    console.log(rolesInfo);
    [err, rolesObj] = await to(Roles.create(rolesInfo));
    if(err) return ReE(res, err, 422);
    
    [err, rolesObj] = await to(rolesObj.save());
    if(err) return ReE(res, err, 422);
    
    let rolesJson = rolesObj.toWeb();
   
    return ReS(res, {roles:rolesJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let rolesId = req.params.rolesId;
    [err, rolesObj] = await to(Roles.findByPk(rolesId));
    if(err) return ReE(res, err, 422);

    let rolesJson = rolesObj.toWeb();
   
    return ReS(res, {roles:rolesJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, rolesObj, data
    rolesObj = req.holiday;
    data = req.body;
    console.log(data);
    rolesObj.set(data);
 
    [err, rolesObj] = await to(rolesObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Roles: '+rolesObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let rolesObj, err;
    rolesObj = req.holiday;

    [err, rolesObj] = await to(rolesObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete roles');

    return ReS(res, {message:'Deleted Roles'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Roles.findAll({})
        .then(att =>ReS(res, {roles:att}))
        .catch(error => ReS(res, {roles:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Roles.findAll({ attributes: ['id', ['roleName', 'text']]})
        .then(att =>ReS(res, {roles:att}))
        .catch(error => ReS(res, {roles:error}));
}
module.exports.getAllList = getAllList;
