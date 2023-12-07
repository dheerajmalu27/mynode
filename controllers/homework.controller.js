const { Homework }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, homeworkObj;
    let homeworkInfo = req.body;
    console.log(homeworkInfo);
    [err, homeworkObj] = await to(Homework.create(homeworkInfo));
    if(err) return ReE(res, err, 422);
    
    [err, homeworkObj] = await to(homeworkObj.save());
    if(err) return ReE(res, err, 422);
    
    let homeworkJson = homeworkObj.toWeb();
   
    return ReS(res, {homework:homeworkJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let homeworkId = req.params.homeworkId;
    [err, homeworkObj] = await to(Homework.findByPk(homeworkId));
    if(err) return ReE(res, err, 422);

    let homeworkJson = homeworkObj.toWeb();
   
    return ReS(res, {homework:homeworkJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, homeworkObj, data
    homeworkObj = req.homework;
    data = req.body;
    console.log(data);
    homeworkObj.set(data);
 
    [err, homeworkObj] = await to(homeworkObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Homework: '+homeworkObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let homeworkObj, err;
    homeworkObj = req.holiday;

    [err, homeworkObj] = await to(homeworkObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete homework');

    return ReS(res, {message:'Deleted Homework'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    try {
     
        db.sequelize.query('SELECT h.id, h.classId, h.divId, h.subId, h.title, h.description, h.deadline, h.isCompleted, h.createdAt, h.createdBy, h.updatedAt, h.updatedBy, h.active, c.className, d.divName, s.subName FROM homework h JOIN class c ON h.classId = c.id JOIN division d ON h.divId = d.id JOIN subject s ON h.subId = s.id', { type: db.sequelize.QueryTypes.SELECT }).then(function(homework){
       
            ReS(res, {homework:homework});
           }).catch(function(err){
            console.log(err);
            ReS(res, {homework:err})
        });
    } catch (error) {
        return ReE(res, {homework: error});
    }

    // Homework.findAll({})
    //     .then(att =>ReS(res, {homework:att}))
    //     .catch(error => ReS(res, {homework:error}));
}
module.exports.getAll = getAll;
