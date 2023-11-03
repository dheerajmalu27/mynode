const { Attendance }    = require('../models');
const { Student }       = require('../models');
const { Class }         = require('../models');
const { Division }      = require('../models');
const { Teacher }       = require('../models');
const db  = require('../models/index').db;
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const { Op } = require('sequelize'); // Add this line to import Op

const create = async function(req, res){
    let err, attendanceObj;
    let attendanceInfo = req.body;
   
    [err, attendanceObj] = await to(Attendance.create(attendanceInfo));
    if(err) return ReE(res, err, 422);
    
    [err, attendanceObj] = await to(attendanceObj.save());
    if(err) return ReE(res, err, 422);
    
    let attendanceJson = attendanceObj.toWeb();
   
    return ReS(res, {attendance:attendanceJson}, 201);
}
module.exports.create = create;


const bulkCreate = async function(req, res){
    
    let attendanceInfo = req.body;
    console.log("test");
    console.log(req.body);

    Attendance.bulkCreate(attendanceInfo, {
        updateOnDuplicate: [`id`,`studentId`,`classId`,`divId`,`classTeacherId`,`attendanceDate`,`attendanceResult`,`active`,`createdAt`,`updatedAt`]
    }).then(att =>{return ReS(res, {attendance:att})})
      .catch(error =>{
        console.log(error);
         ReS(res, {attendance:error})});
}
module.exports.bulkCreate = bulkCreate;

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

const getByRecord = async function(req, res){
    let classID = req.query.classId;
    let divID = req.query.divId;
    let selectedDate = req.query.date;
  
   Attendance.findAll({where:{classId:classID,divId:divID,attendanceDate:selectedDate},
        include: [{
        model: Student,
        as: 'AttendanceStudent',
       attributes: ['rollNo','firstName','lastName'],
       required: false,
    },
    {
        model: Class,
        as: 'AttendanceClass', 
       attributes: ['className'],
       required: false, 
    },
    {
        model: Division,
        as: 'AttendanceDivision', 
       attributes: ['divName'],
       required: false,
    },{
        model: Teacher,
        as: 'AttendanceClassTeacher', 
       attributes: ['firstName','lastName'],
       required: false,
    }],}).then(att =>ReS(res, {attendancestudentList:att}))
    .catch(error => ReS(res, {attendancestudentList:error}));
    
}
module.exports.getByRecord = getByRecord;


const update = async function(req, res){
    let err, attendanceObj, data
    attendanceObj = req.attendance;
    data = req.body;
    
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
               }).catch(function(err){
                  res.json(err);
           });
}
module.exports.getpendinglist = getpendinglist;

const getAttendanceList = async function(req, res){
           db.sequelize.query('SELECT `classId`, `divId`, `className`, `divName`, `teacherName`, `teacherId`, `selectedDate`, `totalPresent`, `total` FROM `attendancelistview` ',{ type: db.sequelize.QueryTypes.SELECT })
  .then(result => {
    res.json(result);
  })
  .catch(error => {
    res.json(error);
    // Handle any errors that occurred during the query
  });
}
module.exports.getAttendanceList = getAttendanceList;
const getAddattendanceStudentList = async function(req, res){
    let classId = req.query.classId;
    let divId = req.query.divId;
    let AttDate = req.query.date;
    db.sequelize.query('SELECT count(id) as counter FROM `attendance` WHERE `classId`='+classId+' AND `divId`='+divId+' AND `attendanceDate`="'+AttDate+'"', { type: db.sequelize.QueryTypes.SELECT }).then(function(checkRecord){
     
        if(checkRecord[0].counter<=0){
            db.sequelize.query('SELECT `studentId`, `studentName`, `classId`,`className`, `divId`,`divName`, `rollNo`, `classTeacherId`,DATE("'+AttDate+'") as attendanceDate,"true" as attendanceResult FROM `addattendancestudentlistview` where classId='+classId+' AND divId='+divId+' ORDER BY rollNo',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
               
                res.json(response);
               }).catch(function(err){
                  res.json(err);
           });
        }
        
       }).catch(function(err){
          res.json(err);
    });

   
}
module.exports.getAddattendanceStudentList = getAddattendanceStudentList;


// const { Op } = require('sequelize');
// const db = require('./db'); // Assuming you have the database connection

const getByRecordWithDateRange = async function (req, res) {
    let classID = req.query.classId;
    let divID = req.query.divId;
    let startDate = req.query.startDate; // Start of the date range
    let endDate = req.query.endDate;     // End of the date range

    const query = `
        SELECT
            A.studentId,
            A.attendanceDate,
            A.attendanceResult,
            ASt.rollNo AS 'rollNo',
            CONCAT(ASt.firstName, ' ', ASt.lastName) AS 'fullName'
        FROM
            Attendance AS A
        RIGHT OUTER JOIN Student AS ASt ON A.studentId = ASt.id AND
            A.classId = :classID AND A.divId = :divID AND A.attendanceDate BETWEEN :startDate AND :endDate
        ORDER BY ASt.rollNo, A.attendanceDate;
    `;

    db.sequelize
        .query(query, {
            replacements: {
                classID,
                divID,
                startDate,
                endDate,
            },
            type: db.sequelize.QueryTypes.SELECT,
        })
        .then((result) => {
            // Filter out rows with null studentId
            const filteredResult = result.filter((record) => record.studentId !== null);

            const pivotData = {};

            filteredResult.forEach((record) => {
                const { studentId, attendanceDate, attendanceResult, fullName,rollNo } = record;

                if (!pivotData[studentId]) {
                    pivotData[studentId] = {
                        rollNo,
                        fullName
                        
                    };
                }
                if(attendanceResult){
                    pivotData[studentId][attendanceDate]='P'; 
                }else{
                    pivotData[studentId][attendanceDate]='A'; 
                }
                // pivotData[studentId][attendanceDate] = attendanceResult ;
            });

            const pivotDataArray = Object.values(pivotData);

            // Get all unique dates within the date range
            const uniqueDates = [...new Set(filteredResult.map((record) => record.attendanceDate))];

            // Add 'NA' for missing dates
            pivotDataArray.forEach((studentData) => {
                uniqueDates.forEach((date) => {
                    if (!studentData[date]) {
                        studentData[date] = 'NA';
                    }
                });
            });

   

            ReS(res, { attendancestudentList: pivotDataArray });
        })
        .catch((error) => {
            ReS(res, { attendancestudentList: error });
        });
};

module.exports.getByRecordWithDateRange = getByRecordWithDateRange;


// const getByRecordWithDateRange = async function (req, res) {
//     let classID = req.query.classId;
//     let divID = req.query.divId;
//     let startDate = req.query.startDate; // Start of the date range
//     let endDate = req.query.endDate;     // End of the date range

//     Attendance.findAll({
//         where: {
//             classId: classID,
//             divId: divID,
//             attendanceDate: {
//                 [Op.between]: [startDate, endDate],
//             },
//         }
//     })
//         .then((att) => {
//             const pivotData = {};

//             // Transform data
//             att.forEach((record) => {
//                 console.log(record);
//                 const { studentId, attendanceDate, attendanceResult } = record;

//                 if (!pivotData[studentId]) {
//                     pivotData[studentId] = {};
//                 }

//                 pivotData[studentId][attendanceDate] = attendanceResult;
//             });

//             // Convert pivot data to an array of objects
//             const pivotDataArray = Object.keys(pivotData).map((studentId) => ({
//                 studentId,
//                 ...pivotData[studentId],
//             }));

//             // Print the pivot data
//             console.log(pivotDataArray);

//             ReS(res, { attendancestudentList: pivotDataArray });
//         })
//         .catch((error) => ReS(res, { attendancestudentList: error }));
// };

// module.exports.getByRecordWithDateRange = getByRecordWithDateRange;
