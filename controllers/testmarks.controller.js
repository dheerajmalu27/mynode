const { Testmarks }          = require('../models');
const { Student }       = require('../models');
const { Class }         = require('../models');
const { Division }      = require('../models');
const { Teacher }       = require('../models');
const { Subject }       = require('../models');
const { Test }         = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, testmarksObj;
    let testmarksInfo = req.body;
    console.log(testmarksInfo);
    [err, testmarksObj] = await to(Testmarks.create(testmarksInfo));
    if(err) return ReE(res, err, 422);
    
    [err, testmarksObj] = await to(testmarksObj.save());
    if(err) return ReE(res, err, 422);
    
    let testmarksJson = testmarksObj.toWeb();
   
    return ReS(res, {testmarks:testmarksJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let testmarksId = req.params.testmarksId;
    [err, testmarksObj] = await to(Testmarks.findByPk(testmarksId));
    if(err)  return ReE(res, err, 422);

    let testmarksJson = testmarksObj.toWeb();
   
    return ReS(res, {testmarks:testmarksJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, testmarksObj, data
    testmarksObj = req.testmarks;
    data = req.body;
   
    testmarksObj.set(data);
 
    [err, testmarksObj] = await to(testmarksObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Testmarks: '+testmarksObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let testmarksObj, err;
    testmarksObj = req.testmarks;

    [err, testmarksObj] = await to(testmarksObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete testmarks');

    return ReS(res, {message:'Deleted Testmarks'}, 204);
}
module.exports.remove = remove;

const getAll = async function (req, res) {
    try {
        const testmarks = await Testmarks.findAll({});
        return ReS(res, { testmarks });
    } catch (error) {
        return ReE(res, { error });
    }
};

module.exports.getAll = getAll;

const gettestmarkspendinglist = async function (req, res) {
    try {
        const response = await db.sequelize.query('SELECT * FROM testmarkspendingteacherlistview', { type: db.sequelize.QueryTypes.SELECT });
        return ReS(res, response);
    } catch (err) {
        return ReE(res, err);
    }
};

module.exports.gettestmarkspendinglist = gettestmarkspendinglist;

const gettestmarkslist = async function (req, res) {
    try {
        const response = await db.sequelize.query('SELECT * FROM testmarkslistview', { type: db.sequelize.QueryTypes.SELECT });
        return ReS(res, response);
    } catch (err) {
        return ReE(res, err);
    }
};

module.exports.gettestmarkslist = gettestmarkslist;

const getAddTestmarkStudentList = async function (req, res) {
    try {
        const { classId, divId, testId, subId } = req.query;
        let teacherId = 1;
        let teacherName = 'admin';

        const checkRecord = await db.sequelize.query('SELECT count(id) as counter FROM `testmarks` WHERE `classId`=' + classId + ' AND `divId`=' + divId + ' AND `testId`=' + testId + ' AND `subId`=' + subId, { type: db.sequelize.QueryTypes.SELECT });

        if (checkRecord[0].counter <= 0) {
            const subjectTeacherRecord = await db.sequelize.query('SELECT `teacherId`, `teacherName`,subName FROM `subjectteacherview` WHERE  classId=' + classId + ' AND divId=' + divId, { type: db.sequelize.QueryTypes.SELECT });

            if (subjectTeacherRecord.length > 0) {
                teacherId = subjectTeacherRecord[0].teacherId;
                teacherName = subjectTeacherRecord[0].teacherName;
            }

            const response = await db.sequelize.query('SELECT stl.`id` as studentId, stl.`studentName`, stl.`classId`, stl.`className`,stl.`divId`, stl.`divName`, stl.`rollNo`,' + testId + ' as testId,sb.`id` as subId,' + teacherId + ' as teacherId,"' + teacherName + '" as teacherName,sb.`subName` as subName,0 as getMarks,100 as totalMarks  FROM `studentlistview` stl ,subject sb WHERE stl.classId=' + classId + ' AND stl.divId=' + divId + ' AND sb.id=' + subId + ' ORDER BY stl.rollNo', { type: db.sequelize.QueryTypes.SELECT });

            return ReS(res, response);
        }
    } catch (err) {
        return ReE(res, err);
    }
};

module.exports.getAddTestmarkStudentList = getAddTestmarkStudentList;

const bulkCreate = async function (req, res) {
    try {
        const TestMarkData = req.body;
        const testmark = await Testmarks.bulkCreate(TestMarkData, {
            updateOnDuplicate: ['id', 'studentId', 'classId', 'divId', 'testId', 'subId', 'teacherId', 'getMarks', 'totalMarks'],
        });

        return ReS(res, { testmarks: testmark });
    } catch (error) {
        return ReS(res, { error });
    }
};

module.exports.bulkCreate = bulkCreate;


const getByRecord = async function (req, res) {
    try {
        const { classId, divId, testId, subId } = req.query;

        const tm = await Testmarks.findAll({
            where: { classId, divId, testId, subId },
            include: [
                {
                    model: Student,
                    as: 'TestmarksStudent',
                    attributes: ['rollNo', 'firstName', 'lastName'],
                    required: false,
                },
                {
                    model: Class,
                    as: 'TestmarksClass',
                    attributes: ['className'],
                    required: false,
                },
                {
                    model: Division,
                    as: 'TestmarksDivision',
                    attributes: ['divName'],
                    required: false,
                },
                {
                    model: Test,
                    as: 'TestmarksTest',
                    attributes: ['testName'],
                    required: false,
                },
                {
                    model: Subject,
                    as: 'TestmarksSubject',
                    attributes: ['subName'],
                    required: false,
                },
                {
                    model: Teacher,
                    as: 'TestmarksTeacher',
                    attributes: ['firstName', 'lastName'],
                    required: false,
                },
            ],
        });

        return ReS(res, { testmarksstudentlist: tm });
    } catch (error) {
        return ReS(res, { testmarksstudentlist: error });
    }
};

module.exports.getByRecord = getByRecord;

