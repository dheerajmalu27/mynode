const { State }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, stateObj;
    let stateInfo = req.body;
    console.log(stateInfo);
    [err, stateObj] = await to(State.create(stateInfo));
    if(err) return ReE(res, err, 422);
    
    [err, stateObj] = await to(stateObj.save());
    if(err) return ReE(res, err, 422);
    
    let stateJson = stateObj.toWeb();
   
    return ReS(res, {state:stateJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let stateId = req.params.stateId; 
    [err, stateObj] = await to(State.findById(stateId));
    if(err) return ReE(res, err, 422);

    let stateJson = stateObj.toWeb();
   
    return ReS(res, {state:stateJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, stateObj, data
    stateObj = req.state;
    data = req.body;
    console.log("data"+data);
    stateObj.set(data);
 
    [err, stateObj] = await to(stateObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated State: '+stateObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let stateObj, err;
    stateObj = req.state;

    [err, stateObj] = await to(stateObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete state');

    return ReS(res, {message:'Deleted State'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    State.findAll({})
        .then(att =>ReS(res, {state:att}))
        .catch(error => ReS(res, {state:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    State.findAll({ attributes: ['id', ['stateName', 'text']]})
        .then(att =>ReS(res, {state:att}))
        .catch(error => ReS(res, {state:error}));
}
module.exports.getAllList = getAllList;