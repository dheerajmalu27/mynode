const { City }          = require('../models');
const { State }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, cityObj;
    let cityInfo = req.body;
    console.log(cityInfo);
    [err, cityObj] = await to(City.create(cityInfo));
    if(err) return ReE(res, err, 422);
    
    [err, cityObj] = await to(cityObj.save());
    if(err) return ReE(res, err, 422);
    
    let cityJson = cityObj.toWeb();
   
    return ReS(res, {city:cityJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let cityId = req.params.cityId;

    City.findAll({where:{id:cityId},
        include: [{
        model: State,
        as: 'CityState',
       attributes: ['stateName'],
       
    }],})
        .then(att =>ReS(res, {city:att}))
        .catch(error => ReS(res, {city:error}));
}
module.exports.get = get;

const update = async function(req, res){
    let err, cityObj, data
    cityObj = req.city;
    data = req.body;
    console.log("data"+data);
    cityObj.set(data);
 
    [err, cityObj] = await to(cityObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated City: '+cityObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let cityObj, err;
    cityObj = req.city;

    [err, cityObj] = await to(cityObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete city');

    return ReS(res, {message:'Deleted city'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    City.findAll({include: [{
        model: State,
        as: 'CityState',
       attributes: ['stateName'],
       
    }],})
        .then(att =>ReS(res, {city:att}))
        .catch(error => ReS(res, {city:error}));
}
module.exports.getAll = getAll;
