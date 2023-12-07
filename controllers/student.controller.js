const { Student }          = require('../models');
const { City }          = require('../models');
const { State }          = require('../models');
const { Class }          = require('../models');
const { Division }          = require('../models');
const db  = require('../models/index').db;
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, studentObj;
    let studentInfo = req.body;
    delete studentInfo.id;

    console.log(req.file);
    if (req.file) {
        // If an image was successfully uploaded, save the image name to the 'profileImage' column
        studentInfo.profileImage = req.file.filename;
      }
      delete studentInfo.image;
      // Check if the 'profileImage' field is not present in the request or if it's empty
    //   if (!req.body.profileImage) {
    //     // Set 'profileImage' to the existing value to preserve it
    //     studentInfo.profileImage = studentInfo.profileImage;
    //   }
    console.log(studentInfo);
    [err, studentObj] = await to(Student.create(studentInfo));
    if(err) return ReE(res, err, 422);
    
    [err, studentObj] = await to(studentObj.save());
    if(err) return ReE(res, err, 422);
    
    let studentJson = studentObj.toWeb();
   
    return ReS(res, {student:studentJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let studentId = req.params.studentId;
    [err, studentObj] = await to(Student.findByPk(studentId));
    if(err) return ReE(res, err, 422);

    let studentJson = studentObj.toWeb();
   
    return ReS(res, {student:studentJson}, 201);
}
module.exports.get = get;

const getprofile = async function(req, res){
    let studentId = req.params.studentId;
    let studentData=new Object();
//     db.sequelize.query('CALL test_proc();').then(function(response){
//         console.log(response);
//         res.json(response);
//        }).catch(function(err){
//           res.json(err);
//    });


    Student.findAll({where:{id:studentId},
        include: [{
        model: Class,
        as: 'StudentClass', 
       attributes: ['className'],
     },{
        model: Division,
        as: 'StudentDivision', 
       attributes: ['divName'], 
    },{
        model: City,
        as: 'StudentCity', 
       attributes: ['cityName'],
    },{
        model: State,
        as: 'StudentState', 
       attributes: ['stateName'], 
    }],}).then(function(data){
        studentData.info=data;
        db.sequelize.query('SELECT * FROM subjectteacherview WHERE classId=(SELECT st.classId FROM student as st WHERE st.id='+studentId+') AND divId=(SELECT st1.divId FROM student as st1 WHERE st1.id='+studentId+')', { type: db.sequelize.QueryTypes.SELECT }).then(function(subject){
            studentData.subject=subject;
            db.sequelize.query('SELECT tm.testId,tm.subId,tm.subName,tm.testName,ROUND((tm.getMarks/tm.totalMarks)*100) AS totalAvg FROM testmarksview as tm WHERE tm.studentId='+studentId+' AND tm.classId=(SELECT st.classId FROM student as st WHERE st.id='+studentId+') AND divId=(SELECT st1.divId FROM student as st1 WHERE st1.id='+studentId+') ORDER BY subId,testId', { type: db.sequelize.QueryTypes.SELECT }).then(function(testmarks){
                studentData.testmarks=testmarks;
                db.sequelize.query('SELECT at.* FROM attendance as at WHERE at.studentId='+studentId, { type: db.sequelize.QueryTypes.SELECT }).then(function(attendance){
                    studentData.attendance=attendance;
                    db.sequelize.query('SELECT mp.attendanceMonth AS month,mp.monthAvg AS result FROM studentmonthlyattendanceview as mp WHERE mp.studentId='+studentId, { type: db.sequelize.QueryTypes.SELECT }).then(function(monthlyattendance){
                        studentData.monthlyattendance=monthlyattendance;
                        db.sequelize.query('SELECT stv.testName,stv.totalAvg AS result FROM  studenttestresultview as stv WHERE stv.studentId='+studentId, { type: db.sequelize.QueryTypes.SELECT }).then(function(testresult){
                            studentData.testresult=testresult;
                            db.sequelize.query('SELECT mp.* FROM messageportal as mp WHERE mp.studentId='+studentId, { type: db.sequelize.QueryTypes.SELECT }).then(function(messageportal){
                                studentData.messageportal=messageportal;
                                res.json(studentData);
                               }).catch(function(err){
                                  res.json(err);
                            });
                           
                           }).catch(function(err){
                              res.json(err);
                        });
                       
                       }).catch(function(err){
                          res.json(err);
                    });
                   }).catch(function(err){
                      res.json(err);
                });
               }).catch(function(err){
                  res.json(err);
            });


           }).catch(function(err){
              res.json(err);
        });
       
    })
    .catch(error => ReS(res, {student:error}));

    
    
    
}
module.exports.getprofile = getprofile;

const update = async function(req, res){
    let err, studentObj, data
    studentObj = req.student;
    data = req.body;
    console.log(req.file);
    if (req.file) {
        // If an image was successfully uploaded, save the image name to the 'profileImage' column
        data.profileImage = req.file.filename;
      }

      // Check if the 'profileImage' field is not present in the request or if it's empty
      if (!req.body.profileImage) {
        // Set 'profileImage' to the existing value to preserve it
        data.profileImage = data.profileImage;
      }
      console.log("data");
      console.log(data);
    studentObj.set(data);
 
    [err, studentObj] = await to(studentObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Student: '+studentObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let studentObj, err;
    studentObj = req.student;

    [err, studentObj] = await to(studentObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete student');

    return ReS(res, {message:'Deleted Student'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    
    let studentData=new Object();
    db.sequelize.query('SELECT st.*,cl.className,d.divName FROM student AS st LEFT JOIN class AS cl ON cl.id=st.classId LEFT JOIN division AS d ON d.id=st.divId', { type: db.sequelize.QueryTypes.SELECT }).then(function(student){
        studentData.student=student;
        
        res.json(studentData);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    let studentData = new Object();
    db.sequelize.query(
      'SELECT st.id, CONCAT(st.firstName, " ", st.lastName, "-", cl.className, "-", d.divName) AS text ' +
      'FROM student AS st ' +
      'LEFT JOIN class AS cl ON cl.id=st.classId ' +
      'LEFT JOIN division AS d ON d.id=st.divId ' +
      'WHERE st.active = 1', // Add the condition here
      { type: db.sequelize.QueryTypes.SELECT }
    )
      .then(function (students) {
        studentData.student = students;
        res.json(studentData);
      })
      .catch(function (err) {
        res.json(err);
      });
    
}
module.exports.getAllList = getAllList;
const getAllAbsentStudent = async function(req, res){
    db.sequelize.query('SELECT `id`, `studentId`, `rollNo`, `studentName`, `fatherName`, `mobNumber`,`className`, `divName`, `classTeacherId`, `teacherName`, `attendanceDate` FROM `absentstudentlistview`',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
              console.log(response); 
                res.json(response);
               }).catch(function(err){
                  res.json(err);
           });
}
module.exports.getAllAbsentStudent = getAllAbsentStudent;
const getTodayAbsentStudent = async function(req, res){
    
    db.sequelize.query('SELECT `id`, `studentId`, `rollNo`, `studentName`, `fatherName`, `mobNumber`,`className`, `divName`, `classTeacherId`, `teacherName`, `attendanceDate` FROM absentstudentlistview where attendanceDate=CURDATE()',{ type: db.sequelize.QueryTypes.SELECT }).then(function(response){
               
                res.json(response);
               }).catch(function(err){
                  res.json(err);
           });
}
module.exports.getTodayAbsentStudent = getTodayAbsentStudent;
const getStudentInfoAll = async function(req, res){
    let studentId = req.params.studentId;
    
    let studentData=new Object();
    db.sequelize.query('SELECT st.*,cl.className,d.divName FROM student AS st LEFT JOIN class AS cl ON cl.id=st.classId LEFT JOIN division AS d ON d.id=st.divId where st.id='+studentId, { type: db.sequelize.QueryTypes.SELECT }).then(function(student){
        // studentData.studentinfo=student;
        
        res.json(student);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.getStudentInfoAll = getStudentInfoAll;