const { Test }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, testObj;
    let testInfo = req.body;
    console.log(testInfo);
    [err, testObj] = await to(Test.create(testInfo));
    if(err) return ReE(res, err, 422);
    
    [err, testObj] = await to(testObj.save());
    if(err) return ReE(res, err, 422);
    
    let testJson = testObj.toWeb();
   
    return ReS(res, {test:testJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let testId = req.params.testId;
    [err, testObj] = await to(Test.findByPk(testId));
    if(err) return ReE(res, err, 422);

    let testJson = testObj.toWeb();
   
    return ReS(res, {test:testJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, testObj, data
    testObj = req.test;
    data = req.body;
   
    testObj.set(data);
 
    [err, testObj] = await to(testObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Test: '+testObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let testObj, err;
    testObj = req.test;

    [err, testObj] = await to(testObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete test');

    return ReS(res, {message:'Deleted Test'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Test.findAll({})
        .then(att =>ReS(res, {test:att}))
        .catch(error => ReS(res, {test:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    Test.findAll({ attributes: ['id', ['testName', 'text']]})
        .then(tst =>ReS(res, {test:tst}))
        .catch(error => ReS(res, {test:error}));
}
module.exports.getAllList = getAllList;


const testClassReportList = async function(req, res){
    let testClassList=new Object();
    db.sequelize.query('CALL testwiseclasslist();').then(function(testwiseclasslist){
        testClassList.testreportclasslist=testwiseclasslist;
        res.json(testClassList);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.testClassReportList = testClassReportList;

const testClassDivisionReportList = async function(req, res){
    let testClassDivisionReportListData=new Object();
    console.log(req.query);
    let classId = req.query.classId;
    let testId = req.query.testId;
    let divId = req.query.divId;
    db.sequelize.query('SELECT * FROM testmarksview where testId='+testId+' and classId='+classId+' and divId='+divId+' order by rollNo, subName', { type: db.sequelize.QueryTypes.SELECT }).then(function(testdata){
        testClassDivisionReportListData.reportlist=convertReportList(testdata);
        res.json(testClassDivisionReportListData);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.testClassDivisionReportList = testClassDivisionReportList;
const convertReportList = (originalReportList) => {
    const convertedReportList = [];
    const studentMap = [];

    // Iterate through the original report list
    originalReportList.forEach((report) => {
        const {
            studentId,
            teacherId,
            testId,
            classId,
            divId,
            testName,
            className,
            divName,
            teacherName,
            studentName,
            rollNo,
            subId,
            subName,
            getMarks,
            totalMarks,
        } = report;

        // Check if the student exists in the map
        if (!studentMap[studentId]) {
            studentMap[studentId] = {
                studentId,
                teacherId,
                testId,
                classId,
                divId,
                testName,
                className,
                divName,
                teacherName,
                studentName,
                rollNo,
                subjectData: [],
                sumGetMarks: 0,
                sumTotalMarks: 0,
                percentage: 0,
            };
            convertedReportList.push(studentMap[studentId]);
        }

        // Push the subject data for the student
        studentMap[studentId].subjectData.push({
            subId,
            subName,
            getMarks,
            totalMarks,
        });

        // Calculate the sum of getMarks and totalMarks for the student
        studentMap[studentId].sumGetMarks += parseInt(getMarks, 10);
        studentMap[studentId].sumTotalMarks += parseInt(totalMarks, 10);

        // Calculate the percentage
        const percentage = (studentMap[studentId].sumGetMarks / studentMap[studentId].sumTotalMarks) * 100;
        studentMap[studentId].percentage = percentage.toFixed(2);
    });

    // Sort the students based on their percentage in descending order
    convertedReportList.sort((a, b) => b.percentage - a.percentage);

    // Assign a rank to each student
    convertedReportList.forEach((student, index) => {
        student.rank = index + 1;
    });

    return convertedReportList;
};
