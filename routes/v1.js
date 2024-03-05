const express = require("express");
const router = express.Router();
const NewsController = require("../controllers/news.controller");
const UserController = require("../controllers/user.controller");
const AdmissionController = require("../controllers/admission.controller");
const AttendanceController = require("../controllers/attendance.controller");
const CityController = require("../controllers/city.controller");
const ClassController = require("../controllers/class.controller");
const DivisionController = require("../controllers/division.controller");
const SchoolProfileController = require("../controllers/schoolprofile.controller");
const FinalresultController = require("../controllers/finalresult.controller");
const StateController = require("../controllers/state.controller");
const StudentController = require("../controllers/student.controller");
const SubjectController = require("../controllers/subject.controller");
const TeacherController = require("../controllers/teacher.controller");
const ClassteacherController = require("../controllers/classteacher.controller");
const TeachersubjectController = require("../controllers/teachersubject.controller");
const TestController = require("../controllers/test.controller");
const SchoolOtherDocsController = require("../controllers/schoolotherdocs.controller");
const TestmarksController = require("../controllers/testmarks.controller");
const HolidaysController = require("../controllers/holidays.controller");
const HomeworkController = require("../controllers/homework.controller");
const FeesController = require("../controllers/fees.controller");
const FeesPaidByStudentController = require("../controllers/feespaidbystudent.controller");
const BooksController = require("../controllers/books.controller");
const BorrowedbooksController = require("../controllers/borrowedbooks.controller");
const LeavingcertificatesController = require("../controllers/leavingcertificate.controller");
const TodoController = require("../controllers/todo.controller");
const HomeController = require("../controllers/home.controller");
const TimetableController = require("../controllers/timetable.controller");
const custom = require("../middleware/custom");
const passport = require("passport");
const path = require("path");
const multer = require("multer");

// The rest of your code remains unchanged

const storage = multer.diskStorage({
  destination: (_req, _file, cb) => {
    // Specify the destination folder for uploaded files
    cb(null, "uploads/");
  },
  filename: (_req, file, cb) => {
    const timestamp = Date.now();

    // Use the timestamp and the original file extension to create the image name.
    const extname = path.extname(file.originalname);
    const imageName = `${timestamp}${extname}`;
    // Specify how the uploaded file should be named
    cb(null, imageName);
  },
});

const upload = multer({ storage: storage });
require("./../middleware/passport")(passport);
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
router.get("/", function (_req, res, _next) {
  res.json({
    status: "success",
    message: "Parcel Pending API",
    data: { version_number: "v1.0.0" },
  });
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
router.post("/users", UserController.create); // C
router.get(
  "/users",
  passport.authenticate("jwt", { session: false }),
  UserController.get
); // R
router.put(
  "/users",
  passport.authenticate("jwt", { session: false }),
  UserController.update
); // U
router.delete(
  "/users",
  passport.authenticate("jwt", { session: false }),
  UserController.remove
); // D
router.post("/users/login", UserController.login);

router.post(
  "/todo",
  passport.authenticate("jwt", { session: false }),
  TodoController.create
); // C
router.get(
  "/todo",
  passport.authenticate("jwt", { session: false }),
  TodoController.getAll
); // R
router.get(
  "/todo/:todo_id",
  passport.authenticate("jwt", { session: false }),
  custom.todo,
  TodoController.get
); // R
router.put(
  "/todo/:todo_id",
  passport.authenticate("jwt", { session: false }),
  custom.todo,
  TodoController.update
); // U
router.delete(
  "/todo/:todo_id",
  passport.authenticate("jwt", { session: false }),
  custom.todo,
  TodoController.remove
); // D

router.get(
  "/dashboard",
  passport.authenticate("jwt", { session: false }),
  HomeController.getDashBoardData
); // R

router.post(
  "/attendance",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.create
); // C
router.post(
  "/bulkattendance",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.bulkCreate
); // C
router.get(
  "/attendance",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getAll
); // R
router.get(
  "/getattendancelist",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getAttendanceList
); // R
router.get(
  "/getbyrecord",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getByRecord
); // R
router.get(
  "/attendance/:attendanceId",
  passport.authenticate("jwt", { session: false }),
  custom.attendance,
  AttendanceController.get
); // R
router.get(
  "/pendingattendance",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getpendinglist
); // R
router.put(
  "/attendance/:attendanceId",
  passport.authenticate("jwt", { session: false }),
  custom.attendance,
  AttendanceController.update
); // U
router.delete(
  "/attendance/:attendanceId",
  passport.authenticate("jwt", { session: false }),
  custom.attendance,
  AttendanceController.remove
); // D
router.delete(
  "/attendance/:classId/:divId/:date",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.deleteRecordByClassDivDate
); // D

router.get(
  "/addattendancestudentlist",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getAddattendanceStudentList
); // R
router.get(
  "/attendancedatewisereport",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getByRecordWithDateRange
); // R

router.get(
  "/getBbyrecordwithdaterange",
  passport.authenticate("jwt", { session: false }),
  AttendanceController.getByRecordWithDateRange
); // R
router.post(
  "/city",
  passport.authenticate("jwt", { session: false }),
  CityController.create
); // C
router.get(
  "/city",
  passport.authenticate("jwt", { session: false }),
  CityController.getAll
); // R
router.get(
  "/citylist/:stateId",
  passport.authenticate("jwt", { session: false }),
  CityController.getAllList
); // R
router.get(
  "/city/:cityId",
  passport.authenticate("jwt", { session: false }),
  custom.city,
  CityController.get
); // R
router.put(
  "/city/:cityId",
  passport.authenticate("jwt", { session: false }),
  custom.city,
  CityController.update
); // U
router.delete(
  "/city/:cityId",
  passport.authenticate("jwt", { session: false }),
  custom.city,
  CityController.remove
); // D

router.post(
  "/class",
  passport.authenticate("jwt", { session: false }),
  ClassController.create
); // C
router.get(
  "/class",
  passport.authenticate("jwt", { session: false }),
  ClassController.getAll
); // R
router.get(
  "/classlist",
  passport.authenticate("jwt", { session: false }),
  ClassController.getAllList
); // R
router.get(
  "/class/:classId",
  passport.authenticate("jwt", { session: false }),
  custom.class,
  ClassController.get
); // R
router.put(
  "/class/:classId",
  passport.authenticate("jwt", { session: false }),
  custom.class,
  ClassController.update
); // U
router.delete(
  "/class/:classId",
  passport.authenticate("jwt", { session: false }),
  custom.class,
  ClassController.remove
); //
router.get(
  "/classdetails",
  passport.authenticate("jwt", { session: false }),
  ClassController.getClassDetails
);

router.get(
  "/classlistforfees",
  passport.authenticate("jwt", { session: false }),
  ClassController.getClassListForFees
);

router.get(
  "/classdivision/:classId",
  passport.authenticate("jwt", { session: false }),
  ClassController.getAllListOfDivisionByClassId
);
router.get(
  "/classsubject/:classId",
  passport.authenticate("jwt", { session: false }),
  ClassController.getAllListOfSubjectByClassId
);

router.post(
  "/division",
  passport.authenticate("jwt", { session: false }),
  DivisionController.create
); // C
router.get(
  "/division",
  passport.authenticate("jwt", { session: false }),
  DivisionController.getAll
); // R
router.get(
  "/divisionlist",
  passport.authenticate("jwt", { session: false }),
  DivisionController.getAllList
); // R
router.get(
  "/division/:divisionId",
  passport.authenticate("jwt", { session: false }),
  custom.division,
  DivisionController.get
); // R
router.put(
  "/division/:divisionId",
  passport.authenticate("jwt", { session: false }),
  custom.division,
  DivisionController.update
); // U
router.delete(
  "/division/:divisionId",
  passport.authenticate("jwt", { session: false }),
  custom.division,
  DivisionController.remove
); // D

router.post(
  "/schoolotherdocs",
  passport.authenticate("jwt", { session: false }),
  upload.single("filePath"),
  SchoolOtherDocsController.create
); // C
router.get(
  "/schoolotherdocs",
  passport.authenticate("jwt", { session: false }),
  SchoolOtherDocsController.getAll
); // R
router.get(
  "/schoolotherdocslist",
  passport.authenticate("jwt", { session: false }),
  SchoolOtherDocsController.getAllList
); // R
router.get(
  "/schoolotherdocs/:schoolOtherDocsId",
  passport.authenticate("jwt", { session: false }),
  custom.schoolOtherDocs,
  SchoolOtherDocsController.get
); // R
router.put(
  "/schoolotherdocs/:schoolOtherDocsId",
  passport.authenticate("jwt", { session: false }),
  custom.schoolOtherDocs,
  upload.single("filePath"),
  SchoolOtherDocsController.update
); // U
router.delete(
  "/schoolotherdocs/:schoolOtherDocsId",
  passport.authenticate("jwt", { session: false }),
  custom.schoolOtherDocs,
  SchoolOtherDocsController.remove
); // D
router.get(
  "/news",
  passport.authenticate("jwt", { session: false }),
  NewsController.getAll
); // R

// router.get(
//   "/news",
//   passport.authenticate("jwt", { session: false }),
//   NewsController.getAllList
// ); // R

router.get(
  "/news/:newsId",
  passport.authenticate("jwt", { session: false }),
  custom.news,
  NewsController.get
); // R

router.put(
  "/news/:newsId",
  passport.authenticate("jwt", { session: false }),
  custom.news,
  NewsController.update
); // U

router.delete(
  "/news/:newsId",
  passport.authenticate("jwt", { session: false }),
  custom.news,
  NewsController.remove
); // D
router.post(
  "/holidays",
  passport.authenticate("jwt", { session: false }),
  HolidaysController.create
); // C
router.get(
  "/holidays",
  passport.authenticate("jwt", { session: false }),
  HolidaysController.getAll
); // R
router.get(
  "/holidays",
  passport.authenticate("jwt", { session: false }),
  HolidaysController.getAllList
); // R
router.get(
  "/holidays/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.holidays,
  HolidaysController.get
); // R
router.put(
  "/holidays/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.holidays,
  HolidaysController.update
); // U
router.delete(
  "/holidays/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.holidays,
  HolidaysController.remove
); // D

router.post(
  "/homework",
  passport.authenticate("jwt", { session: false }),
  HomeworkController.create
); // C
router.get(
  "/homework",
  passport.authenticate("jwt", { session: false }),
  HomeworkController.getAll
);
router.get(
  "/getteacherhomeworklist",
  passport.authenticate("jwt", { session: false }),
  HomeworkController.getTeacherHomeWorkData
);

router.get(
  "/homework/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.homework,
  HomeworkController.get
); // R
router.put(
  "/homework/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.homework,
  HomeworkController.update
); // U
router.delete(
  "/homework/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.homework,
  HomeworkController.remove
); // D

router.post(
  "/fees",
  passport.authenticate("jwt", { session: false }),
  FeesController.create
); // C
router.get(
  "/fees",
  passport.authenticate("jwt", { session: false }),
  FeesController.getAll
);
router.get(
  "/pendingfees",
  passport.authenticate("jwt", { session: false }),
  FeesPaidByStudentController.getPendingFeesList
);
router.get(
  "/feesdatabyclass/:Id",
  passport.authenticate("jwt", { session: false }),
  FeesController.getFeesDataByClass
); // R
router.get(
  "/fees/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.fees,
  FeesController.get
); // R
router.put(
  "/fees/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.fees,
  FeesController.update
); // U
router.delete(
  "/fees/:Id",
  passport.authenticate("jwt", { session: false }),
  custom.fees,
  FeesController.remove
); // D

router.post(
  "/books",
  passport.authenticate("jwt", { session: false }),
  BooksController.create
); // C
router.get(
  "/books",
  passport.authenticate("jwt", { session: false }),
  BooksController.getAll
); // R
router.get(
  "/bookslist",
  passport.authenticate("jwt", { session: false }),
  BooksController.getAllList
); // R
router.get(
  "/books/:bookId",
  passport.authenticate("jwt", { session: false }),
  custom.books,
  BooksController.get
); // R
router.put(
  "/books/:bookId",
  passport.authenticate("jwt", { session: false }),
  custom.books,
  BooksController.update
); // U
router.delete(
  "/books/:bookId",
  passport.authenticate("jwt", { session: false }),
  custom.books,
  BooksController.remove
); // D

router.post(
  "/borrowedbooks",
  passport.authenticate("jwt", { session: false }),
  BorrowedbooksController.create
); // C
router.get(
  "/borrowedbooks",
  passport.authenticate("jwt", { session: false }),
  BorrowedbooksController.getAll
);
router.get(
  "/borrowedbooks/:borrowId",
  passport.authenticate("jwt", { session: false }),
  custom.borrowedbooks,
  BorrowedbooksController.get
); // R
router.put(
  "/borrowedbooks/:borrowId",
  passport.authenticate("jwt", { session: false }),
  custom.borrowedbooks,
  BorrowedbooksController.update
); // U
router.delete(
  "/borrowedbooks/:borrowId",
  passport.authenticate("jwt", { session: false }),
  custom.borrowedbooks,
  BorrowedbooksController.remove
); // D

router.post(
  "/leavingcertificates",
  passport.authenticate("jwt", { session: false }),
  LeavingcertificatesController.create
); // C
router.get(
  "/leavingcertificates",
  passport.authenticate("jwt", { session: false }),
  LeavingcertificatesController.getAll
);
router.get(
  "/leavingcertificates/:leavingcertificateId",
  passport.authenticate("jwt", { session: false }),
  custom.leavingcertificates,
  LeavingcertificatesController.get
); // R
router.put(
  "/leavingcertificates/:leavingcertificateId",
  passport.authenticate("jwt", { session: false }),
  custom.leavingcertificates,
  LeavingcertificatesController.update
); // U
router.delete(
  "/leavingcertificates/:leavingcertificateId",
  passport.authenticate("jwt", { session: false }),
  custom.leavingcertificates,
  LeavingcertificatesController.remove
); // D

router.post(
  "/finalresult",
  passport.authenticate("jwt", { session: false }),
  FinalresultController.create
); // C
router.get(
  "/finalresult",
  passport.authenticate("jwt", { session: false }),
  FinalresultController.getAll
); // R
router.get(
  "/finalresult/:finalresultId",
  passport.authenticate("jwt", { session: false }),
  custom.finalresult,
  FinalresultController.get
); // R
router.put(
  "/finalresult/:finalresultId",
  passport.authenticate("jwt", { session: false }),
  custom.finalresult,
  FinalresultController.update
); // U
router.delete(
  "/finalresult/:finalresultId",
  passport.authenticate("jwt", { session: false }),
  custom.finalresult,
  FinalresultController.remove
); // D

router.post(
  "/state",
  passport.authenticate("jwt", { session: false }),
  StateController.create
); // C
router.get(
  "/state",
  passport.authenticate("jwt", { session: false }),
  StateController.getAll
); // R
router.get(
  "/statelist",
  passport.authenticate("jwt", { session: false }),
  StateController.getAllList
);
router.get(
  "/state/:stateId",
  passport.authenticate("jwt", { session: false }),
  custom.state,
  StateController.get
); // R
router.put(
  "/state/:stateId",
  passport.authenticate("jwt", { session: false }),
  custom.state,
  StateController.update
); // U
router.delete(
  "/state/:stateId",
  passport.authenticate("jwt", { session: false }),
  custom.state,
  StateController.remove
); // D

router.post(
  "/admission",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  AdmissionController.create
); // C
router.get(
  "/admission",
  passport.authenticate("jwt", { session: false }),
  AdmissionController.getAll
);

router.get(
  "/admission/:admissionId",
  passport.authenticate("jwt", { session: false }),
  AdmissionController.get
); // R
router.put(
  "/admission/:admissionId",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  custom.admission,
  AdmissionController.update
); // U
router.delete(
  "/admission/:admissionId",
  passport.authenticate("jwt", { session: false }),
  custom.admission,
  AdmissionController.remove
); // D
router.get("/allocateallstudents", AdmissionController.allocateAllStudents);
router.get(
  "/allocatstudentsbyclass/:classId",
  AdmissionController.allocatStudentsByClass
);

router.post(
  "/student",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  StudentController.create
); // C
router.get(
  "/student",
  passport.authenticate("jwt", { session: false }),
  StudentController.getAll
);
router.get(
  "/activestudentlist",
  passport.authenticate("jwt", { session: false }),
  StudentController.getAllList
);
router.get(
  "/finalresultstudentlist",
  passport.authenticate("jwt", { session: false }),
  StudentController.getFinalResultStudentList
);
// R
router.get(
  "/absentstudent",
  passport.authenticate("jwt", { session: false }),
  StudentController.getAllAbsentStudent
); // R
router.get(
  "/todayabsentstudent",
  passport.authenticate("jwt", { session: false }),
  StudentController.getTodayAbsentStudent
); // R
router.get(
  "/student/:studentId",
  passport.authenticate("jwt", { session: false }),
  custom.student,
  StudentController.get
); // R
router.get(
  "/studentinfo/:studentId",
  passport.authenticate("jwt", { session: false }),
  custom.student,
  StudentController.getStudentInfoAll
); // R
router.get(
  "/studentdetailinfo/:studentId",
  passport.authenticate("jwt", { session: false }),
  custom.student,
  StudentController.getStudentDetailInfoAll
); // R
router.get(
  "/studentprofile/:studentId",
  passport.authenticate("jwt", { session: false }),
  custom.student,
  StudentController.getprofile
); // R
router.put(
  "/student/:studentId",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  custom.student,
  StudentController.update
); // U
router.delete(
  "/student/:studentId",
  passport.authenticate("jwt", { session: false }),
  custom.student,
  StudentController.remove
); // D
router.get(
  "/getallclassdivisionstudentlist",
  passport.authenticate("jwt", { session: false }),
  StudentController.getAllClassDivisionStudentList
); // R

router.post(
  "/subject",
  passport.authenticate("jwt", { session: false }),
  SubjectController.create
); // C
router.get(
  "/subject",
  passport.authenticate("jwt", { session: false }),
  SubjectController.getAll
);
router.get(
  "/subjectlist",
  passport.authenticate("jwt", { session: false }),
  SubjectController.getAllList
); // R
router.get(
  "/getsubjecttestlist",
  passport.authenticate("jwt", { session: false }),
  SubjectController.getSubjectTestList
); // R
router.get(
  "/subject/:subjectId",
  passport.authenticate("jwt", { session: false }),
  custom.subject,
  SubjectController.get
); // R
router.put(
  "/subject/:subjectId",
  passport.authenticate("jwt", { session: false }),
  custom.subject,
  SubjectController.update
); // U
router.delete(
  "/subject/:subjectId",
  passport.authenticate("jwt", { session: false }),
  custom.subject,
  SubjectController.remove
); // D

router.post("/teacher/login", TeacherController.teacherLogin);

router.post(
  "/teacher",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  TeacherController.create
); // C
router.get(
  "/teacher",
  passport.authenticate("jwt", { session: false }),
  TeacherController.getAll
); // R
router.get(
  "/teacherlist",
  passport.authenticate("jwt", { session: false }),
  TeacherController.getAllList
); // R
router.get(
  "/teacher/:teacherId",
  passport.authenticate("jwt", { session: false }),
  custom.teacher,
  TeacherController.get
); // R
router.get(
  "/teacherprofile/:teacherId",
  passport.authenticate("jwt", { session: false }),
  custom.teacher,
  TeacherController.getprofile
); // R

router.put(
  "/teacher/:teacherId",
  passport.authenticate("jwt", { session: false }),
  upload.single("image"),
  custom.teacher,
  TeacherController.update
); // U
// router.put('/teacher/:id', upload.single('image'), (req, res) => {
//   console.log(req.body);
router.post(
  "/teachersubject",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.create
); // C
router.get(
  "/teachersubject",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.getAll
); // R
router.get(
  "/teacherclassdivlist",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.teacherClassDivList
); // R
router.get(
  "/teachersubjectclasslist",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.teacherSubjectClassDivList
); // R
router.get(
  "/teachersubject/:teachersubjectId",
  passport.authenticate("jwt", { session: false }),
  custom.teachersubject,
  TeachersubjectController.get
); // R
router.put(
  "/teachersubject/:teachersubjectId",
  passport.authenticate("jwt", { session: false }),
  custom.teachersubject,
  TeachersubjectController.update
); // U
router.delete(
  "/teachersubject/:teachersubjectId",
  passport.authenticate("jwt", { session: false }),
  custom.teachersubject,
  TeachersubjectController.remove
); // D
router.get(
  "/teachersubjectlist",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.teacherSubjectList
);
router.post(
  "/updateteachersubject",
  passport.authenticate("jwt", { session: false }),
  TeachersubjectController.updateTeacherSubject
); // U

router.post(
  "/classteacher",
  passport.authenticate("jwt", { session: false }),
  ClassteacherController.create
); // C
router.get(
  "/classteacher",
  passport.authenticate("jwt", { session: false }),
  ClassteacherController.getAll
); // R
router.get(
  "/classteacher/:classteacherId",
  passport.authenticate("jwt", { session: false }),
  custom.classteacher,
  ClassteacherController.get
); // R
router.put(
  "/classteacher/:classteacherId",
  passport.authenticate("jwt", { session: false }),
  custom.classteacher,
  ClassteacherController.update
); // U
router.delete(
  "/classteacher/:classteacherId",
  passport.authenticate("jwt", { session: false }),
  custom.classteacher,
  ClassteacherController.remove
);
router.post(
  "/updateclassteacher",
  passport.authenticate("jwt", { session: false }),
  ClassteacherController.updateClassTeacher
); // U

router.get(
  "/test",
  passport.authenticate("jwt", { session: false }),
  TestController.getAll
);
router.get(
  "/testlist",
  passport.authenticate("jwt", { session: false }),
  TestController.getAllList
); // R
router.get(
  "/test/:testId",
  passport.authenticate("jwt", { session: false }),
  custom.test,
  TestController.get
); // R
router.put(
  "/test/:testId",
  passport.authenticate("jwt", { session: false }),
  custom.test,
  TestController.update
); // U
router.delete(
  "/test/:testId",
  passport.authenticate("jwt", { session: false }),
  custom.test,
  TestController.remove
); // D
router.get(
  "/testclassreportlist",
  passport.authenticate("jwt", { session: false }),
  TestController.testClassReportList
);
router.get(
  "/finalresultclassreportlist",
  passport.authenticate("jwt", { session: false }),
  TestController.finalResultClassReportList
);
router.get(
  "/finalresultbyclass",
  passport.authenticate("jwt", { session: false }),
  TestController.insertFinalResultRecords
);

router.get(
  "/gettestclassdivisionreportlist",
  passport.authenticate("jwt", { session: false }),
  TestController.testClassDivisionReportList
);
router.get(
  "/getbyrecordtestmarks",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.getByRecord
); // R
router.get(
  "/getstudenttestmarks",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.getStudentTestMarks
); // R

router.post(
  "/bulktestmarks",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.bulkCreate
); // C
router.post(
  "/testmarks",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.create
); // C
router.get(
  "/testmarks",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.getAll
); // R
router.get(
  "/getaddtestmarkstudentlist",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.getAddTestmarkStudentList
); // R
router.get(
  "/testmarks/:testmarksId",
  passport.authenticate("jwt", { session: false }),
  custom.testmarks,
  TestmarksController.get
); // R
router.put(
  "/testmarks/:testmarksId",
  passport.authenticate("jwt", { session: false }),
  custom.testmarks,
  TestmarksController.update
); // U
router.delete(
  "/testmarks/:testmarksId",
  passport.authenticate("jwt", { session: false }),
  custom.testmarks,
  TestmarksController.remove
); // D
router.delete(
  "/testmarks/:classId/:divId/:testId/:subId",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.deleteRecordByClassDivTestSub
); // D
router.get(
  "/gettestmarkspendinglist",
  passport.authenticate("jwt", { session: false }),
  TestmarksController.gettestmarkspendinglist
); // R
router.get(
  "/gettestmarkslist",
  // passport.authenticate("jwt", { session: false }),
  TestmarksController.gettestmarkslist
); // R

router.get(
  "/dashboard",
  passport.authenticate("jwt", { session: false }),
  HomeController.Dashboard
);

router.post(
  "/bulktimetable",
  passport.authenticate("jwt", { session: false }),
  TimetableController.bulkCreate
);
router.delete(
  "/timetable/:timetableId",
  passport.authenticate("jwt", { session: false }),
  custom.timetable,
  TimetableController.remove
); // D
router.get(
  "/gettimetable",
  passport.authenticate("jwt", { session: false }),
  TimetableController.getClassTimeTable
);
router.get(
  "/getteachertimetable",
  passport.authenticate("jwt", { session: false }),
  TimetableController.getTeacherTimeTable
);
router.get(
  "/gettodaysteachertimetable",
  passport.authenticate("jwt", { session: false }),
  TimetableController.getTodaysTeacherTimeTable
);
router.get(
  "/gettimetablelist",
  passport.authenticate("jwt", { session: false }),
  TimetableController.getTimeTableBatchList
);
//********* API DOCUMENTATION **********
// router.use('/docs/api.json',            express.static(path.join(__dirname, '/../public/v1/documentation/api.json')));
// router.use('/docs',                     express.static(path.join(__dirname, '/../public/v1/documentation/dist')));

router.post(
  "/schoolprofile",
  passport.authenticate("jwt", { session: false }),
  SchoolProfileController.create
); // C
router.get(
  "/schoolprofile",
  passport.authenticate("jwt", { session: false }),
  SchoolProfileController.getAll
); // R
router.get(
  "/schoolprofilelist",
  passport.authenticate("jwt", { session: false }),
  SchoolProfileController.getAllList
);
router.put(
  "/schoolprofile/:schoolprofileId",
  passport.authenticate("jwt", { session: false }),
  custom.schoolprofile,
  SchoolProfileController.update
); // U

module.exports = router;
