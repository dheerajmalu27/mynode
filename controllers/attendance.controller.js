const { Attendance }    = require('../models');
const { Student }       = require('../models');
const { Class }         = require('../models');
const { Division }      = require('../models');
const { Teacher }       = require('../models');
const db  = require('../models/index').db;
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, attendanceObj;
    let attendanceInfo = req.body;
    console.log(attendanceInfo);
    [err, attendanceObj] = await to(Attendance.create(attendanceInfo));
    if(err) return ReE(res, err, 422);
    
    [err, attendanceObj] = await to(attendanceObj.save());
    if(err) return ReE(res, err, 422);
    
    let attendanceJson = attendanceObj.toWeb();
   
    return ReS(res, {attendance:attendanceJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let attendanceId = req.params.attendanceId;
   Attendance.findAll({where:{id:attendanceId},
        include: [{
        model: Student,
        as: 'AttendanceStudent',
       attributes: ['firstName','lastName'],
       
    },
    {
        model: Class,
        as: 'AttendanceClass', 
       attributes: ['className'],
       
    },
    {
        model: Division,
        as: 'AttendanceDivision', 
       attributes: ['divName'],
       
    },{
        model: Teacher,
        as: 'AttendanceClassTeacher', 
       attributes: ['firstName','lastName'],
       
    }],}).then(att =>ReS(res, {attendance:att}))
    .catch(error => ReS(res, {attendance:error}));
    
}
module.exports.get = get;

const update = async function(req, res){
    let err, attendanceObj, data
    attendanceObj = req.attendance;
    data = req.body;
    console.log("data"+data);
    attendanceObj.set(data);
 
    [err, attendanceObj] = await to(attendanceObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Attendance: '+attendanceObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let attendanceObj, err;
    attendanceObj = req.attendance;

    [err, attendanceObj] = await to(attendanceObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete attendance');

    return ReS(res, {message:'Deleted Attendance'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Attendance.findAll({
        include: [{
            model: Student,
            as: 'AttendanceStudent',
           attributes: ['firstName','lastName'],
           
        },
        {
            model: Class,
            as: 'AttendanceClass', 
           attributes: ['className'],
           
        },
        {
            model: Division,
            as: 'AttendanceDivision', 
           attributes: ['divName'],
           
        },{
            model: Teacher,
            as: 'AttendanceClassTeacher', 
           attributes: ['firstName','lastName'],
           
        }],
    })
        .then(att =>ReS(res, {attendance:att}))
        .catch(error => ReS(res, {attendance:error}));
}
module.exports.getAll = getAll;

const getpendinglist = async function(req, res){
    db.sequelize.query('CALL attendancependinglist();').then(function(response){
               
                res.json(response);
               }).error(function(err){
                  res.json(err);
           });
}
module.exports.getpendinglist = getpendinglist;

const getAttendanceList = async function(req, res){
    db.sequelize.query('SELECT `classId`, `divId`, `className`, `divName`, `teacherName`, `teacherId`, `selectedDate`, `totalPresent`, `total` FROM `attendancelistview` ',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
              console.log(response); 
                res.json(response);
               }).error(function(err){
                  res.json(err);
           });
}
module.exports.getAttendanceList = getAttendanceList;