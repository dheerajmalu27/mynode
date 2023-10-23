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
/** 
 * @swagger 
 * /: 
 *   get: 
 *     description: this api for testing purpose only
 *     responses:  
 *       200: 
 *         description: Success  
 *   
 */ 
router.get('/', function(req, res, next) {
  res.json({status:"success", message:"Parcel Pending API", data:{"version_number":"v1.0.0"}})
});

/**
 * @swagger
 * /users:
 *   post:
 *     summary: Create a JSONPlaceholder user.
 *     responses:
 *       201:
 *         description: Created
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   type: object
 *                   properties:
 *                     email:
 *                       type: string
 *                       description: The user email id.
 *                       example: 0
 *                     password:
 *                       type: string
 *                       description: The user password .
 *                       example: Leanne Graham
*/
router.post(    '/users',           UserController.create);                                                    // C
router.get(     '/users',            UserController.get);        // R
router.put(     '/users',            UserController.update);     // U
router.delete(  '/users',            UserController.remove);     // D
router.post(    '/users/login',     UserController.login);

router.post(    '/todo',              TodoController.create);                  // C
router.get(     '/todo',              TodoController.getAll);                  // R
router.get('/todo/:todo_id',  custom.todo, TodoController.get);     // R
router.put('/todo/:todo_id',  custom.todo, TodoController.update);  // U
router.delete('/todo/:todo_id',  custom.todo, TodoController.remove);  // D


router.get('/dashboard', HomeController.getDashBoardData);                  // R

router.post('/attendance', AttendanceController.create);                  // C
router.post('/bulkattendance', AttendanceController.bulkCreate);                  // C
router.get('/attendance', AttendanceController.getAll);                  // R
router.get('/getattendancelist', AttendanceController.getAttendanceList);                  // R
router.get('/getbyrecord', AttendanceController.getByRecord);                  // R
router.get('/attendance/:attendanceId',  custom.attendance, AttendanceController.get);     // R
router.get('/pendingattendance',  AttendanceController.getpendinglist);     // R
router.put('/attendance/:attendanceId',  custom.attendance, AttendanceController.update);  // U
router.delete('/attendance/:attendanceId',  custom.attendance, AttendanceController.remove);  // D
router.get('/addattendancestudentlist',  AttendanceController.getAddattendanceStudentList);     // R
router.get('/attendancedatewisereport',  AttendanceController.getAddattendanceDateWiseReport);     // R

router.post('/city', CityController.create);                  // C
router.get('/city', CityController.getAll);                  // R
router.get('/citylist/:stateId', CityController.getAllList);                  // R
router.get('/city/:cityId',  custom.city, CityController.get);     // R
router.put('/city/:cityId',  custom.city, CityController.update);  // U
router.delete('/city/:cityId',  custom.city, CityController.remove);  // D

router.post('/class', ClassController.create);                  // C
router.get('/class', ClassController.getAll);                  // R
router.get('/classlist', ClassController.getAllList);                  // R
router.get('/class/:classId',  custom.class, ClassController.get);     // R
router.put('/class/:classId',  custom.class, ClassController.update);  // U
router.delete('/class/:classId',  custom.class, ClassController.remove);  // D

router.post('/division', DivisionController.create);                  // C
router.get('/division', DivisionController.getAll);                  // R
router.get('/divisionlist', DivisionController.getAllList);                  // R
router.get('/division/:divisionId',  custom.division, DivisionController.get);     // R
router.put('/division/:divisionId',  custom.division, DivisionController.update);  // U
router.delete('/division/:divisionId',  custom.division, DivisionController.remove);  // D


router.post('/holidays', HolidaysController.create);                  // C
router.get('/holidays', HolidaysController.getAll);                  // R
router.get('/holidays', HolidaysController.getAllList);                  // R
router.get('/holidays/:Id',  custom.holidays, HolidaysController.get);     // R
router.put('/holidays/:Id',  custom.holidays, HolidaysController.update);  // U
router.delete('/holidays/:Id',  custom.holidays, HolidaysController.remove);  // D



router.post('/finalresult', FinalresultController.create);                  // C
router.get('/finalresult', FinalresultController.getAll);                  // R
router.get('/finalresult/:finalresultId',  custom.finalresult, FinalresultController.get);     // R
router.put('/finalresult/:finalresultId',  custom.finalresult, FinalresultController.update);  // U
router.delete('/finalresult/:finalresultId',  custom.finalresult, FinalresultController.remove);  // D

router.post('/state', StateController.create);                  // C
router.get('/state', StateController.getAll);                  // R
router.get('/statelist', StateController.getAllList); 
router.get('/state/:stateId',  custom.state, StateController.get);     // R
router.put('/state/:stateId',  custom.state, StateController.update);  // U
router.delete('/state/:stateId',  custom.state, StateController.remove);  // D


router.post('/student', StudentController.create);                  // C
router.get('/student', StudentController.getAll);                  // R
router.get('/absentstudent', StudentController.getAllAbsentStudent);                  // R
router.get('/todayabsentstudent', StudentController.getTodayAbsentStudent);                  // R
router.get('/student/:studentId',  custom.student, StudentController.get);     // R
router.get('/studentprofile/:studentId',  custom.student, StudentController.getprofile);     // R
router.put('/student/:studentId',  custom.student, StudentController.update);  // U
router.delete('/student/:studentId',  custom.student, StudentController.remove);  // D

router.post('/subject', SubjectController.create);                  // C
router.get('/subject', SubjectController.getAll);
router.get('/getsubjecttestlist', SubjectController.getSubjectTestList);                  // R
router.get('/subject/:finalresultId',  custom.subject, SubjectController.get);     // R
router.put('/subject/:finalresultId',  custom.subject, SubjectController.update);  // U
router.delete('/subject/:finalresultId',  custom.subject, SubjectController.remove);  // D

router.post('/teacher', TeacherController.create);                  // C
router.get('/teacher', TeacherController.getAll);                  // R
router.get('/teacher/:teacherId',  custom.teacher, TeacherController.get);     // R
router.get('/teacherprofile/:teacherId',  custom.teacher, TeacherController.getprofile);     // R
router.put('/teacher/:teacherId',  custom.teacher, TeacherController.update);  // U
router.delete('/teacher/:teacherId',  custom.teacher, TeacherController.remove);  // D

router.post('/teachersubject', TeachersubjectController.create);                  // C
router.get('/teachersubject', TeachersubjectController.getAll);                  // R
router.get('/teachersubject/:teachersubjectId',  custom.teachersubject, TeachersubjectController.get);     // R
router.put('/teachersubject/:teachersubjectId',  custom.teachersubject, TeachersubjectController.update);  // U
router.delete('/teachersubject/:teachersubjectId',  custom.teachersubject, TeachersubjectController.remove);  // D

router.post('/test', TestController.create);                  // C
router.get('/test', TestController.getAll); 
router.get('/testlist', TestController.getAllList);                  // R
router.get('/test/:testId',  custom.test, TestController.get);     // R
router.put('/test/:testId',  custom.test, TestController.update);  // U
router.delete('/test/:testId',  custom.test, TestController.remove);  // D
router.get('/testclassreportlist', TestController.testClassReportList); 
router.get('/gettestclassdivisionreportlist', TestController.testClassDivisionReportList); 
router.get('/getbyrecordtestmarks', TestmarksController.getByRecord);                  // R
router.post('/bulktestmarks', TestmarksController.bulkCreate);                  // C
router.post('/testmarks', TestmarksController.create);                  // C
router.get('/testmarks', TestmarksController.getAll);                  // R
router.get('/getaddtestmarkstudentlist',  TestmarksController.getAddTestmarkStudentList);     // R
router.get('/testmarks/:testmarksId',  custom.testmarks, TestmarksController.get);     // R
router.put('/testmarks/:testmarksId',  custom.testmarks, TestmarksController.update);  // U
router.delete('/testmarks/:testmarksId',  custom.testmarks, TestmarksController.remove);  // D
router.get('/gettestmarkspendinglist',  TestmarksController.gettestmarkspendinglist);     // R
router.get('/gettestmarkslist',  TestmarksController.gettestmarkslist);     // R

router.get('/dashboard', HomeController.Dashboard)

router.post('/bulktimetable', TimetableController.bulkCreate);                  // C
router.get('/gettimetable', TimetableController.getClassTimeTable); 
router.get('/gettimetablelist', TimetableController.getTimeTableBatchList); 
//********* API DOCUMENTATION **********
// router.use('/docs/api.json',            express.static(path.join(__dirname, '/../public/v1/documentation/api.json')));
// router.use('/docs',                     express.static(path.join(__dirname, '/../public/v1/documentation/dist')));
module.exports = router;
