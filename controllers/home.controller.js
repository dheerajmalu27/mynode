const db = require("../models/index").db;
const authService = require("../services/auth.service");
const { to, ReE, ReS } = require("../services/util.service");
const cache = require("memory-cache");
const Dashboard = function (req, res) {
  let user = req.user.id;
  return ReS(res, {
    success: true,
    message: "it worked",
    data: "user name is :",
  });
};
module.exports.Dashboard = Dashboard;
const getDashBoardData = async function (req, res) {
  try {
    // Check if data is cached
    const cachedData = cache.get("dashboardData");
    if (cachedData) {
      console.log("Data retrieved from cache");
      return res.json(cachedData);
    }

    // Execute queries concurrently using Promise.all
    const [
      dashboarddatacounter,
      attendancependinglist,
      absentstudentlist,
      seatavailibility,
      weeklyattendance,
      feesdetail,
      newsevent,
    ] = await Promise.all([
      db.sequelize.query("Call dashboarddatacount();"),
      db.sequelize.query("Call todayattendancependinglist();"),
      db.sequelize.query(
        `SELECT id, studentId, rollNo, studentName, fatherName, mobNumber, 
          classId, className, divId, divName, classTeacherId, teacherName, 
          attendanceDate, attendanceResult 
          FROM absentstudentlistview 
          WHERE attendanceDate = CURDATE()
        `,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      db.sequelize.query(
        `SELECT className, availableSeats, totalSeats 
          FROM school.classdetailsview
        `,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      db.sequelize.query(
        `SELECT 
        DAYNAME(selectedDate) AS dayOfWeek,
        ROUND((totalPresent / total) * 100, 2) AS presentPercentage 
        FROM (
            SELECT 
                selectedDate, 
                SUM(totalPresent) AS totalPresent, 
                SUM(total) AS total 
            FROM school.attendancelistview 
            WHERE WEEK(selectedDate) = WEEK(NOW()) 
            GROUP BY selectedDate
        ) AS subquery;
        `,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      db.sequelize.query(
        `SELECT 
        SUM(totalPaidFees) AS totalPaidFeesSum,
        SUM(remainingFees) AS remainingFeesSum
          FROM (
              SELECT 
                  fps.studentId, 
                  SUM(fps.paymentAmount) AS totalPaidFees, 
                  (SUM(fees.totalFee) - SUM(fps.paymentAmount)) AS remainingFees 
              FROM school.feespaidbystudent AS fps 
              JOIN school.fees AS fees ON fps.classId = fees.classId 
              JOIN (
                  SELECT classId, SUM(totalFee) AS totalFee 
                  FROM school.fees 
                  GROUP BY classId
              ) AS f ON f.classId = fps.classId 
              GROUP BY fps.studentId
          ) AS subquery;    
        `,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
      db.sequelize.query(
        `SELECT id, newsEventType, newsEventTitle, newsEventDetail, newsEventDate, createdAt, createdBy, updatedAt, updatedBy, active FROM school.news WHERE newsEventDate >= DATE_SUB(NOW(), INTERVAL 7 DAY);`,
        { type: db.sequelize.QueryTypes.SELECT }
      ),
    ]);

    // Assign query results to dashboard data object
    const dashboarddata = {
      dashboarddata: dashboarddatacounter,
      todayattendancependinglist: attendancependinglist,
      todayabsentstudentlist: absentstudentlist,
      seatavailibility: seatavailibility,
      weeklyattendancelist: weeklyattendance,
      feesdetaillist: feesdetail,
      newseventlist: newsevent,
    };

    // Cache the data
    cache.put("dashboardData", dashboarddata, 900000); // Cache for 1 hour (in milliseconds)

    console.log("Data retrieved from database");
    return res.json(dashboarddata);
  } catch (err) {
    // Proper error handling
    console.error(err);
    return ReE(res, err);
  }
};

module.exports.getDashBoardData = getDashBoardData;
