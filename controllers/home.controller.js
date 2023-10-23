const db  = require('../models/index').db;
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const Dashboard = function (req, res) {
	let user = req.user.id;
	return res.json({
		success: true,
		message: 'it worked',
		data: 'user name is :'
	});
}
module.exports.Dashboard = Dashboard;
const getDashBoardData = async function (req, res) {
	let dashboarddata = new Object();
	db.sequelize.query('Call dashboarddatacount();').then(function (dashboarddatacounter) {
		dashboarddata.dashboarddata = dashboarddatacounter;
		db.sequelize.query('Call todayattendancependinglist();').then(function (attendancependinglist) {
			dashboarddata.todayattendancependinglist = attendancependinglist;

			db.sequelize.query('SELECT id, studentId, rollNo, studentName, fatherName, mobNumber, classId,className,divId,divName,classTeacherId,teacherName,attendanceDate,attendanceResult FROM absentstudentlistview WHERE attendanceDate=CURDATE()', {type: db.sequelize.QueryTypes.SELECT}).then(function (absentstudentlist) {
				dashboarddata.todayabsentstudentlist = absentstudentlist;
				console.log(dashboarddata);
				res.json(dashboarddata);

			}).catch(function (err) {
				res.json(err);
			});
		}).catch(function (err) {
			res.json(err);
		});
	}).catch(function (err) {
		res.json(err);
	});
}
module.exports.getDashBoardData = getDashBoardData;