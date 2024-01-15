const { Subject }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, subjectObj;
    let subjectInfo = req.body;
    console.log(subjectInfo);
    [err, subjectObj] = await to(Subject.create(subjectInfo));
    if(err) return ReE(res, err, 422);
    
    [err, subjectObj] = await to(subjectObj.save());
    if(err) return ReE(res, err, 422);
    
    let subjectJson = subjectObj.toWeb();
   
    return ReS(res, {subject:subjectJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let subjectId = req.params.subjectId;
    [err, subjectObj] = await to(Subject.findByPk(subjectId));
    if(err) return ReE(res, err, 422);

    let subjectJson = subjectObj.toWeb();
   
    return ReS(res, {subject:subjectJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, subjectObj, data
    subjectObj = req.subject;
    data = req.body;
   
    subjectObj.set(data);
 
    [err, subjectObj] = await to(subjectObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Subject: '+subjectObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let subjectObj, err;
    subjectObj = req.subject;

    [err, subjectObj] = await to(subjectObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete subject');

    return ReS(res, {message:'Deleted Subject'}, 200);
}
module.exports.remove = remove;
const getAll = async function (req, res) {
    try {
        const subject = await Subject.findAll({});
        return ReS(res, { subject });
    } catch (error) {
        return ReE(res, { subject: error });
    }
};
module.exports.getAll = getAll;

const getAllList = async function (req, res) {
    try {
        const subject = await Subject.findAll({ attributes: ['id', ['subName', 'text']] });
        return ReS(res, { subject });
    } catch (error) {
        return ReE(res, { subject: error });
    }
};
module.exports.getAllList = getAllList;

const getSubjectTestList = async function (req, res) {
    try {
        const testSubjectData = new Object();
        console.log(req.query);
        const classId = req.query.classId;

        const subjectdata = await db.sequelize.query(
            'SELECT sb.id, sb.subName as text FROM subject sb WHERE sb.active=1 AND FIND_IN_SET(sb.id,(SELECT cl.subjectIds FROM class cl WHERE cl.id=' + classId + '))',
            { type: db.sequelize.QueryTypes.SELECT }
        );

        testSubjectData.subjectlist = subjectdata;

        const testdata = await db.sequelize.query(
            'SELECT ts.id, ts.testName as text FROM test ts WHERE ts.active=1 AND FIND_IN_SET(ts.id,(SELECT cl.subjectIds FROM class cl WHERE cl.id=' + classId + '))',
            { type: db.sequelize.QueryTypes.SELECT }
        );

        testSubjectData.testlist = testdata;

        return ReS(res, testSubjectData);
    } catch (error) {
        return ReE(res, error);
    }
};
module.exports.getSubjectTestList = getSubjectTestList;
