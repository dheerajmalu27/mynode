const { Timetable }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, timetableObj;
    let timetableInfo = req.body;
    console.log(timetableInfo);
    [err, timetableObj] = await to(Timetable.create(timetableInfo));
    if(err) return ReE(res, err, 422);
    
    [err, timetableObj] = await to(timetableObj.save());
    if(err) return ReE(res, err, 422);
    
    let timetableJson = timetableObj.toWeb();
   
    return ReS(res, {timetable:timetableJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let timetableId = req.params.timetableId;
    [err, timetableObj] = await to(Timetable.findByPk(timetableId));
    if(err) return ReE(res, err, 422);

    let timetableJson = timetableObj.toWeb();
   
    return ReS(res, {timetable:timetableJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, timetableObj, data
    timetableObj = req.holiday;
    data = req.body;
    console.log(data);
    timetableObj.set(data);
 
    [err, timetableObj] = await to(timetableObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Timetable: '+timetableObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let timetableObj, err;
    timetableObj = req.holiday;

    [err, timetableObj] = await to(timetableObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete timetable');

    return ReS(res, {message:'Deleted Timetable'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Timetable.findAll({})
        .then(att =>ReS(res, {timetable:att}))
        .catch(error => ReS(res, {timetable:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Timetable.findAll({ attributes: ['id', ['holidayDate', 'text']]})
        .then(att =>ReS(res, {timetable:att}))
        .catch(error => ReS(res, {timetable:error}));
}
module.exports.getAllList = getAllList;


const getTimeTableBatchList = async function(req, res){
    let TimeTableData=new Object();   
        db.sequelize.query('SELECT classId, divId, className, divName FROM timetabledetailview GROUP BY classId, divId', { type: db.sequelize.QueryTypes.SELECT }).then(function(timetabledata){
            TimeTableData.timetabledatalist=timetabledata;
            res.json(TimeTableData);
           }).catch(function(err){
              res.json(err);
        });
}
module.exports.getTimeTableBatchList = getTimeTableBatchList;

const getClassTimeTable = async function(req, res){
    let TimeTableData=new Object(); 
    let classId = req.query.classId;
    let divId = req.query.divId;  
        db.sequelize.query('SELECT `id`, `teacherId`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`, `textData`, `updatedAt`, `className`, `divName`, `subName` as title, `teacherName`,SUBSTRING_INDEX(`timeSlot`,"-",1) AS `start`,SUBSTRING_INDEX(`timeSlot`,"-",-1) AS `end` FROM `timetabledetailview` WHERE classId='+classId+' and divId='+divId, { type: db.sequelize.QueryTypes.SELECT }).then(function(timetabledata){
            TimeTableData.classtimetabledata=timetabledata;
            res.json(TimeTableData);
           }).catch(function(err){
              res.json(err);
        });
}
module.exports.getClassTimeTable = getClassTimeTable;

const bulkCreate = async function(req, res){
    
    let TimeTableData= req.body;
    console.log(TimeTableData);
    Timetable.bulkCreate(TimeTableData, {
        updateOnDuplicate: [`id`,`teacherId`, `classId`, `divId`, `subId`, `dayId`, `timeSlot`]
       
    }).then(() => { // Notice: There are no arguments here, as of right now you'll have to...
    
      }).then(timetable =>{return ReS(res, {timetable:timetable})})
   
}
module.exports.bulkCreate = bulkCreate;