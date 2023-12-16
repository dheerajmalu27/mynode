const db  = require('../models/index').db;
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const Dashboard = function (req, res) {
	let user = req.user.id;
	return ReS(res,{
		success: true,
		message: 'it worked',
		data: 'user name is :'
	});
}
module.exports.Dashboard = Dashboard;
const getDashBoardData = async function(req, res) {
    try {
        const dashboarddata = new Object();
        
        const dashboarddatacounter = await db.sequelize.query('Call dashboarddatacount();');
        dashboarddata.dashboarddata = dashboarddatacounter;

        const attendancependinglist = await db.sequelize.query('Call todayattendancependinglist();');
        dashboarddata.todayattendancependinglist = attendancependinglist;

        const absentstudentlist = await db.sequelize.query('SELECT id, studentId, rollNo, studentName, fatherName, mobNumber, classId, className, divId, divName, classTeacherId, teacherName, attendanceDate, attendanceResult FROM absentstudentlistview WHERE attendanceDate = CURDATE()', { type: db.sequelize.QueryTypes.SELECT });
        dashboarddata.todayabsentstudentlist = absentstudentlist;

        console.log(dashboarddata);
        return ReS(res, dashboarddata);
    } catch (err) {
        return ReE(res, err);
    }
};

module.exports.getDashBoardData = getDashBoardData;
