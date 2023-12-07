const { Finalresult }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, finalresultObj;
    let finalresultInfo = req.body;
    console.log(finalresultInfo);
    [err, finalresultObj] = await to(Finalresult.create(finalresultInfo));
    if(err) return ReE(res, err, 422);
    
    [err, finalresultObj] = await to(finalresultObj.save());
    if(err) return ReE(res, err, 422);
    
    let finalresultJson = finalresultObj.toWeb();
   
    return ReS(res, {finalresult:finalresultJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let finalresultId = req.params.finalresultId;
    [err, finalresultObj] = await to(Finalresult.findByPk(finalresultId));
    if(err) return ReE(res, err, 422);

    let finalresultJson = finalresultObj.toWeb();
   
    return ReS(res, {finalresult:finalresultJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, finalresultObj, data
    finalresultObj = req.finalresult;
    data = req.body;
   
    finalresultObj.set(data);
 
    [err, finalresultObj] = await to(finalresultObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Finalresult: '+finalresultObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let finalresultObj, err;
    finalresultObj = req.finalresult;

    [err, finalresultObj] = await to(finalresultObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete finalresult');

    return ReS(res, {message:'Deleted Finalresult'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Finalresult.findAll({})
        .then(att =>ReS(res, {finalresult:att}))
        .catch(error => ReS(res, {finalresult:error}));
}
module.exports.getAll = getAll;
