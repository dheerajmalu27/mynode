const Todo 			= require('./../models').Todo;
const Attendance 	= require('./../models').Attendance;
const City 			= require('./../models').City;
const Classes 	    = require('./../models').Class;
const Division 	    = require('./../models').Division;
const Finalresult 	    = require('./../models').Finalresult;
const State 	    = require('./../models').State;
const Student 	    = require('./../models').Student;
const Subject 	    = require('./../models').Subject;
const Teacher	    = require('./../models').Teacher;
const Holidays   = require('./../models').Holidays;
const Homework   = require('./../models').Homework;
const Books   = require('./../models').Books;
const Borrowedbooks   = require('./../models').Borrowedbooks;
const Classteacher 	    = require('./../models').Classteacher;
const Teachersubject 	    = require('./../models').Teachersubject;
const Schoolprofile 	    = require('./../models').Schoolprofile;
const Test 	    = require('./../models').Test;
const Testmarks 	    = require('./../models').Testmarks;
const  Timetable        =  require('./../models').Timetable;
const  Leavingcertificate= require('../models').Leavingcertificate;
const { to, ReE, ReS } = require('../services/util.service');

let todo = async function (req, res, next) {
    let todo_id, err, todo;
    todo_id = req.params.todo_id;

    [err, todo] = await to(Todo.findOne({where:{id:todo_id}}));
    if(err) return ReE(res, "err finding todo");

    if(!todo) return ReE(res, "todo not found with id: "+todo_id);
   
    req.todo = todo;
    next();
}
module.exports.todo = todo;

let attendance = async function (req, res, next) {
    let attendanceId, err, attendanceObj;
    attendanceId = req.params.attendanceId;

    [err, attendanceObj] = await to(Attendance.findOne({where:{id:attendanceId}}));
    if(err) return ReE(res, "err finding attendance");

    if(!attendanceObj) return ReE(res, "attendance not found with id: "+attendanceId);
   
    req.attendance = attendanceObj;
    next();
}
module.exports.attendance = attendance;

let city = async function (req, res, next) {
    let cityId, err, cityObj;
    cityId = req.params.cityId;

    [err, cityObj] = await to(City.findOne({where:{id:cityId}}));
    if(err) return ReE(res, "err finding city");

    if(!cityObj) return ReE(res, "city not found with id: "+cityId);
   
    req.city = cityObj;
    next();
}
module.exports.city = city;

let classes = async function (req, res, next) {
    let classId, err, classObj;
    classId = req.params.classId;

    [err, classObj] = await to(Classes.findOne({where:{id:classId}}));
    if(err) return ReE(res, "err finding class");

    if(!classObj) return ReE(res, "class not found with id: "+classId);
   
    req.class = classObj;
    next();
}
module.exports.class = classes;



let division = async function (req, res, next) {
    let divisionId, err, divisionObj;
    divisionId = req.params.divisionId;

    [err, divisionObj] = await to(Division.findOne({where:{id:divisionId}}));
    if(err) return ReE(res, "err finding division");

    if(!divisionObj) return ReE(res, "division not found with id: "+divisionId);
   
    req.division = divisionObj;
    next();
}
module.exports.division = division;

let holidays = async function (req, res, next) {
    let holidayId, err, holidaysObj;
    holidayId = req.params.Id;

    [err, holidaysObj] = await to(Holidays.findOne({where:{id:holidayId}}));
    if(err) return ReE(res, "err finding holidays");

    if(!holidaysObj) return ReE(res, "holidays not found with id: "+holidayId);
   
    req.holiday = holidaysObj;
    next();
}
module.exports.holidays = holidays;

let homework = async function (req, res, next) {
    let homeworkId, err, homeworkObj;
    homeworkId = req.params.Id;

    [err, homeworkObj] = await to(Homework.findOne({where:{id:homeworkId}}));
    if(err) return ReE(res, "err finding homework");

    if(!homeworkObj) return ReE(res, "homework not found with id: "+homeworkId);
   
    req.homework = homeworkObj;
    next();
}
module.exports.homework = homework;

let books = async function (req, res, next) {
    let bookId, err, booksObj;
    bookId = req.params.bookId;

    [err, booksObj] = await to(Books.findOne({where:{bookId:bookId}}));
    if(err) return ReE(res, "err finding books");

    if(!booksObj) return ReE(res, "books not found with id: "+bookId);
   
    req.book = booksObj;
    next();
}
module.exports.books = books;

let borrowedbooks = async function (req, res, next) {
    let borrowId, err, borrowedbooksObj;
    borrowId = req.params.borrowId;

    [err, borrowedbooksObj] = await to(Borrowedbooks.findOne({where:{borrowId:borrowId}}));
    if(err) return ReE(res, "err finding borrowedbooks");

    if(!borrowedbooksObj) return ReE(res, "borrowedbooks not found with id: "+borrowId);
   
    req.borrowedbook = borrowedbooksObj;
    next();
}
module.exports.borrowedbooks = borrowedbooks;

let leavingcertificates = async function (req, res, next) {
    let leavingcertificateId, err, leavingcertificatesObj;
    leavingcertificateId = req.params.Id;

    [err, leavingcertificatesObj] = await to(Leavingcertificate.findOne({where:{id:leavingcertificateId}}));
    if(err) return ReE(res, "err finding leavingcertificates");

    if(!leavingcertificatesObj) return ReE(res, "leavingcertificates not found with id: "+leavingcertificateId);
   
    req.leavingcertificate = leavingcertificatesObj;
    next();
}
module.exports.leavingcertificates = leavingcertificates;

let finalresult = async function (req, res, next) {
    let finalresultId, err, finalresultObj;
    finalresultId = req.params.finalresultId;

    [err, finalresultObj] = await to(Finalresult.findOne({where:{id:finalresultId}}));
    if(err) return ReE(res, "err finding finalresult");

    if(!finalresultObj) return ReE(res, "finalresult not found with id: "+finalresultId);
   
    req.finalresult = finalresultObj;
    next();
}
module.exports.finalresult = finalresult;

let state = async function (req, res, next) {
    let stateId, err, stateObj;
    stateId = req.params.stateId;

    [err, stateObj] = await to(State.findOne({where:{id:stateId}}));
    if(err) return ReE(res, "err finding state");

    if(!stateObj) return ReE(res, "state not found with id: "+stateId);
   
    req.state = stateObj;
    next();
}
module.exports.state = state;

let student = async function (req, res, next) {
    let studentId, err, studentObj;
    studentId = req.params.studentId;

    [err, studentObj] = await to(Student.findOne({where:{id:studentId}}));
    if(err) return ReE(res, "err finding student");

    if(!studentObj) return ReE(res, "student not found with id: "+studentId);
   
    req.student = studentObj;
    next();
}
module.exports.student = student;

let subject = async function (req, res, next) {
    let subjectId, err, subjectObj;
    subjectId = req.params.subjectId;

    [err, subjectObj] = await to(Subject.findOne({where:{id:subjectId}}));
    if(err) return ReE(res, "err finding subject");

    if(!subjectObj) return ReE(res, "subject not found with id: "+subjectId);
   
    req.subject = subjectObj;
    next();
}
module.exports.subject = subject;

let teacher = async function (req, res, next) {
   
    let teacherId, err, teacherObj;
    teacherId = req.params.teacherId;
    // console.log(req.params);
    console.log(req.body);
    [err, teacherObj] = await to(Teacher.findOne({where:{id:teacherId}}));
    if(err) return ReE(res, "err finding teacher");

    if(!teacherObj) return ReE(res, "teacher not found with id: "+teacherId);
   
    req.teacher = teacherObj;
    next();
}
module.exports.teacher = teacher;


let teachersubject = async function (req, res, next) {
    let teachersubjectId, err, teachersubjectObj;
    teachersubjectId = req.params.teachersubjectId;

    [err, teachersubjectObj] = await to(Teachersubject.findOne({where:{id:teachersubjectId}}));
    if(err) return ReE(res, "err finding teachersubject");

    if(!teachersubjectObj) return ReE(res, "teachersubject not found with id: "+teachersubjectId);
   
    req.teachersubject = teachersubjectObj;
    next();
}
module.exports.teachersubject = teachersubject;

let classteacher = async function (req, res, next) {
    let classteacherId, err, classteacherObj;
    classteacherId = req.params.classteacherId;

    [err, classteacherObj] = await to(Classteacher.findOne({where:{id:classteacherId}}));
    if(err) return ReE(res, "err finding classteacher");

    if(!classteacherObj) return ReE(res, "classteacher not found with id: "+classteacherId);
   
    req.classteacher = classteacherObj;
    next();
}
module.exports.classteacher = classteacher;


let schoolprofile = async function (req, res, next) {
   
    let schoolprofileId, err, schoolprofileObj;
    schoolprofileId = req.params.schoolprofileId;
    // console.log(req.params);
    console.log(req.body);
    [err,schoolprofileObj] = await to(Schoolprofile.findOne({where:{id:schoolprofileId}}));
    if(err) return ReE(res, "err finding school profile");

    if(!schoolprofileObj) return ReE(res, "school profile not found with id: "+schoolprofileId);
   
    req.schoolprofile = schoolprofileObj;
    next();
}
module.exports.schoolprofile = schoolprofile;


let test = async function (req, res, next) {
    let testId, err, testObj;
    testId = req.params.testId;

    [err, testObj] = await to(Test.findOne({where:{id:testId}}));
    if(err) return ReE(res, "err finding test");

    if(!testObj) return ReE(res, "test not found with id: "+testId);
   
    req.test = testObj;
    next();
}
module.exports.test = test;


let testmarks = async function (req, res, next) {
    let testmarksId, err, testmarksObj;
    testmarksId = req.params.testmarksId;

    [err, testmarksObj] = await to(Testmarks.findOne({where:{id:testmarksId}}));
    if(err) return ReE(res, "err finding testmarks");

    if(!testmarksObj) return ReE(res, "testmarks not found with id: "+testmarksId);
   
    req.testmarks = testmarksObj;
    next();
}
module.exports.testmarks = testmarks;


let timetable = async function (req, res, next) {
    let timetableId, err, testmarksObj;
    timetableId = req.params.timetableId;

    [err, timetableObj] = await to(Timetable.findOne({where:{id:timetableId}}));
    if(err) return ReE(res, "err finding testmarks");

    if(!timetableObj) return ReE(res, "Timetable not found with id: "+timetableId);
   
    req.timetable = timetableObj;
    next();
}
module.exports.timetable = timetable;