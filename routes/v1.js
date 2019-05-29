const express 			= require('express');
const router 			= express.Router();

const UserController 	= require('../controllers/user.controller');
const AttendanceController = require('../controllers/attendance.controller');
const CityController = require('../controllers/city.controller');
const ClassController = require('../controllers/class.controller');
const DivisionController = require('../controllers/division.controller');
const FinalresultController = require('../controllers/finalresult.controller');
const StateController = require('../controllers/state.controller');
const StudentController = require('../controllers/student.controller');
const SubjectController = require('../controllers/subject.controller');
const TeacherController = require('../controllers/teacher.controller');
const TeachersubjectController = require('../controllers/teachersubject.controller');
const TestController = require('../controllers/test.controller');
const TestmarksController = require('../controllers/testmarks.controller');
const HolidaysController = require('../controllers/holidays.controller');
const TodoController = require('../controllers/todo.controller');
const HomeController 	= require('../controllers/home.controller');
const TimetableController 	= require('../controllers/timetable.controller');
const custom 	        = require('./../middleware/custom');

const passport      	= require('passport');
const path              = require('path');


require('./../middleware/passport')(passport)
/* GET home page. */
console.log("test data");
router.get('/', function(req, res, next) {
  res.json({status:"success", message:"Parcel Pending API", data:{"version_number":"v1.0.0"}})
});


router.post(    '/users',           UserController.create);                                                    // C
router.get(     '/users',           passport.authenticate('jwt', {session:false}), UserController.get);        // R
router.put(     '/users',           passport.authenticate('jwt', {session:false}), UserController.update);     // U
router.delete(  '/users',           passport.authenticate('jwt', {session:false}), UserController.remove);     // D
router.post(    '/users/login',     UserController.login);

router.post(    '/todo',             passport.authenticate('jwt', {session:false}), TodoController.create);                  // C
router.get(     '/todo',             passport.authenticate('jwt', {session:false}), TodoController.getAll);                  // R
router.get('/todo/:todo_id', passport.authenticate('jwt', {session:false}), custom.todo, TodoController.get);     // R
router.put('/todo/:todo_id', passport.authenticate('jwt', {session:false}), custom.todo, TodoController.update);  // U
router.delete('/todo/:todo_id', passport.authenticate('jwt', {session:false}), custom.todo, TodoController.remove);  // D


router.get('/dashboard',passport.authenticate('jwt', {session:false}), HomeController.getDashBoardData);                  // R

router.post('/attendance',passport.authenticate('jwt', {session:false}), AttendanceController.create);                  // C
router.post('/bulkattendance',passport.authenticate('jwt', {session:false}), AttendanceController.bulkCreate);                  // C
router.get('/attendance',passport.authenticate('jwt', {session:false}), AttendanceController.getAll);                  // R
router.get('/getattendancelist',passport.authenticate('jwt', {session:false}), AttendanceController.getAttendanceList);                  // R
router.get('/getbyrecord',passport.authenticate('jwt', {session:false}), AttendanceController.getByRecord);                  // R
router.get('/attendance/:attendanceId', passport.authenticate('jwt', {session:false}), custom.attendance, AttendanceController.get);     // R
router.get('/pendingattendance', passport.authenticate('jwt', {session:false}), AttendanceController.getpendinglist);     // R
router.put('/attendance/:attendanceId', passport.authenticate('jwt', {session:false}), custom.attendance, AttendanceController.update);  // U
router.delete('/attendance/:attendanceId', passport.authenticate('jwt', {session:false}), custom.attendance, AttendanceController.remove);  // D
router.get('/addattendancestudentlist', passport.authenticate('jwt', {session:false}), AttendanceController.getAddattendanceStudentList);     // R
router.get('/attendancedatewisereport', passport.authenticate('jwt', {session:false}), AttendanceController.getAddattendanceDateWiseReport);     // R

router.post('/city',passport.authenticate('jwt', {session:false}), CityController.create);                  // C
router.get('/city',passport.authenticate('jwt', {session:false}), CityController.getAll);                  // R
router.get('/citylist/:stateId',passport.authenticate('jwt', {session:false}), CityController.getAllList);                  // R
router.get('/city/:cityId', passport.authenticate('jwt', {session:false}), custom.city, CityController.get);     // R
router.put('/city/:cityId', passport.authenticate('jwt', {session:false}), custom.city, CityController.update);  // U
router.delete('/city/:cityId', passport.authenticate('jwt', {session:false}), custom.city, CityController.remove);  // D

router.post('/class',passport.authenticate('jwt', {session:false}), ClassController.create);                  // C
router.get('/class',passport.authenticate('jwt', {session:false}), ClassController.getAll);                  // R
router.get('/classlist',passport.authenticate('jwt', {session:false}), ClassController.getAllList);                  // R
router.get('/class/:classId', passport.authenticate('jwt', {session:false}), custom.class, ClassController.get);     // R
router.put('/class/:classId', passport.authenticate('jwt', {session:false}), custom.class, ClassController.update);  // U
router.delete('/class/:classId', passport.authenticate('jwt', {session:false}), custom.class, ClassController.remove);  // D

router.post('/division',passport.authenticate('jwt', {session:false}), DivisionController.create);                  // C
router.get('/division',passport.authenticate('jwt', {session:false}), DivisionController.getAll);                  // R
router.get('/divisionlist',passport.authenticate('jwt', {session:false}), DivisionController.getAllList);                  // R
router.get('/division/:divisionId', passport.authenticate('jwt', {session:false}), custom.division, DivisionController.get);     // R
router.put('/division/:divisionId', passport.authenticate('jwt', {session:false}), custom.division, DivisionController.update);  // U
router.delete('/division/:divisionId', passport.authenticate('jwt', {session:false}), custom.division, DivisionController.remove);  // D


router.post('/holidays',passport.authenticate('jwt', {session:false}), HolidaysController.create);                  // C
router.get('/holidays',passport.authenticate('jwt', {session:false}), HolidaysController.getAll);                  // R
router.get('/holidays',passport.authenticate('jwt', {session:false}), HolidaysController.getAllList);                  // R
router.get('/holidays/:Id', passport.authenticate('jwt', {session:false}), custom.holidays, HolidaysController.get);     // R
router.put('/holidays/:Id', passport.authenticate('jwt', {session:false}), custom.holidays, HolidaysController.update);  // U
router.delete('/holidays/:Id', passport.authenticate('jwt', {session:false}), custom.holidays, HolidaysController.remove);  // D



router.post('/finalresult',passport.authenticate('jwt', {session:false}), FinalresultController.create);                  // C
router.get('/finalresult',passport.authenticate('jwt', {session:false}), FinalresultController.getAll);                  // R
router.get('/finalresult/:finalresultId', passport.authenticate('jwt', {session:false}), custom.finalresult, FinalresultController.get);     // R
router.put('/finalresult/:finalresultId', passport.authenticate('jwt', {session:false}), custom.finalresult, FinalresultController.update);  // U
router.delete('/finalresult/:finalresultId', passport.authenticate('jwt', {session:false}), custom.finalresult, FinalresultController.remove);  // D

router.post('/state',passport.authenticate('jwt', {session:false}), StateController.create);                  // C
router.get('/state',passport.authenticate('jwt', {session:false}), StateController.getAll);                  // R
router.get('/statelist',passport.authenticate('jwt', {session:false}), StateController.getAllList); 
router.get('/state/:stateId', passport.authenticate('jwt', {session:false}), custom.state, StateController.get);     // R
router.put('/state/:stateId', passport.authenticate('jwt', {session:false}), custom.state, StateController.update);  // U
router.delete('/state/:stateId', passport.authenticate('jwt', {session:false}), custom.state, StateController.remove);  // D


router.post('/student',passport.authenticate('jwt', {session:false}), StudentController.create);                  // C
router.get('/student',passport.authenticate('jwt', {session:false}), StudentController.getAll);                  // R
router.get('/absentstudent',passport.authenticate('jwt', {session:false}), StudentController.getAllAbsentStudent);                  // R
router.get('/todayabsentstudent',passport.authenticate('jwt', {session:false}), StudentController.getTodayAbsentStudent);                  // R
router.get('/student/:studentId', passport.authenticate('jwt', {session:false}), custom.student, StudentController.get);     // R
router.get('/studentprofile/:studentId', passport.authenticate('jwt', {session:false}), custom.student, StudentController.getprofile);     // R
router.put('/student/:studentId', passport.authenticate('jwt', {session:false}), custom.student, StudentController.update);  // U
router.delete('/student/:studentId', passport.authenticate('jwt', {session:false}), custom.student, StudentController.remove);  // D

router.post('/subject',passport.authenticate('jwt', {session:false}), SubjectController.create);                  // C
router.get('/subject',passport.authenticate('jwt', {session:false}), SubjectController.getAll);
router.get('/getsubjecttestlist',passport.authenticate('jwt', {session:false}), SubjectController.getSubjectTestList);                  // R
router.get('/subject/:finalresultId', passport.authenticate('jwt', {session:false}), custom.subject, SubjectController.get);     // R
router.put('/subject/:finalresultId', passport.authenticate('jwt', {session:false}), custom.subject, SubjectController.update);  // U
router.delete('/subject/:finalresultId', passport.authenticate('jwt', {session:false}), custom.subject, SubjectController.remove);  // D

router.post('/teacher',passport.authenticate('jwt', {session:false}), TeacherController.create);                  // C
router.get('/teacher',passport.authenticate('jwt', {session:false}), TeacherController.getAll);                  // R
router.get('/teacher/:teacherId', passport.authenticate('jwt', {session:false}), custom.teacher, TeacherController.get);     // R
router.get('/teacherprofile/:teacherId', passport.authenticate('jwt', {session:false}), custom.teacher, TeacherController.getprofile);     // R
router.put('/teacher/:teacherId', passport.authenticate('jwt', {session:false}), custom.teacher, TeacherController.update);  // U
router.delete('/teacher/:teacherId', passport.authenticate('jwt', {session:false}), custom.teacher, TeacherController.remove);  // D

router.post('/teachersubject',passport.authenticate('jwt', {session:false}), TeachersubjectController.create);                  // C
router.get('/teachersubject',passport.authenticate('jwt', {session:false}), TeachersubjectController.getAll);                  // R
router.get('/teachersubject/:teachersubjectId', passport.authenticate('jwt', {session:false}), custom.teachersubject, TeachersubjectController.get);     // R
router.put('/teachersubject/:teachersubjectId', passport.authenticate('jwt', {session:false}), custom.teachersubject, TeachersubjectController.update);  // U
router.delete('/teachersubject/:teachersubjectId', passport.authenticate('jwt', {session:false}), custom.teachersubject, TeachersubjectController.remove);  // D

router.post('/test',passport.authenticate('jwt', {session:false}), TestController.create);                  // C
router.get('/test',passport.authenticate('jwt', {session:false}), TestController.getAll); 
router.get('/testlist',passport.authenticate('jwt', {session:false}), TestController.getAllList);                  // R
router.get('/test/:testId', passport.authenticate('jwt', {session:false}), custom.test, TestController.get);     // R
router.put('/test/:testId', passport.authenticate('jwt', {session:false}), custom.test, TestController.update);  // U
router.delete('/test/:testId', passport.authenticate('jwt', {session:false}), custom.test, TestController.remove);  // D
router.get('/testclassreportlist',passport.authenticate('jwt', {session:false}), TestController.testClassReportList); 

router.get('/getbyrecordtestmarks',passport.authenticate('jwt', {session:false}), TestmarksController.getByRecord);                  // R
router.post('/bulktestmarks',passport.authenticate('jwt', {session:false}), TestmarksController.bulkCreate);                  // C
router.post('/testmarks',passport.authenticate('jwt', {session:false}), TestmarksController.create);                  // C
router.get('/testmarks',passport.authenticate('jwt', {session:false}), TestmarksController.getAll);                  // R
router.get('/getaddtestmarkstudentlist', passport.authenticate('jwt', {session:false}), TestmarksController.getAddTestmarkStudentList);     // R
router.get('/testmarks/:testmarksId', passport.authenticate('jwt', {session:false}), custom.testmarks, TestmarksController.get);     // R
router.put('/testmarks/:testmarksId', passport.authenticate('jwt', {session:false}), custom.testmarks, TestmarksController.update);  // U
router.delete('/testmarks/:testmarksId', passport.authenticate('jwt', {session:false}), custom.testmarks, TestmarksController.remove);  // D
router.get('/gettestmarkspendinglist', passport.authenticate('jwt', {session:false}), TestmarksController.gettestmarkspendinglist);     // R
router.get('/gettestmarkslist', passport.authenticate('jwt', {session:false}), TestmarksController.gettestmarkslist);     // R

router.get('/dash', passport.authenticate('jwt', {session:false}),HomeController.Dashboard)

router.post('/bulktimetable',passport.authenticate('jwt', {session:false}), TimetableController.bulkCreate);                  // C
router.get('/gettimetable',passport.authenticate('jwt', {session:false}), TimetableController.getClassTimeTable); 
router.get('/gettimetablelist',passport.authenticate('jwt', {session:false}), TimetableController.getTimeTableBatchList); 
//********* API DOCUMENTATION **********
// router.use('/docs/api.json',            express.static(path.join(__dirname, '/../public/v1/documentation/api.json')));
// router.use('/docs',                     express.static(path.join(__dirname, '/../public/v1/documentation/dist')));
module.exports = router;
