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
    console.log("data"+data);
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

    return ReS(res, {message:'Deleted Subject'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Subject.findAll({})
        .then(att =>ReS(res, {subject:att}))
        .catch(error => ReS(res, {subject:error}));
}
module.exports.getAll = getAll;

const getSubjectTestList = async function(req, res){
    let testSubjectData=new Object();
    console.log(req.query)
;    let classId = req.query.classId;
    db.sequelize.query('SELECT sb.id, sb.subName as text FROM subject sb WHERE sb.active=1 AND FIND_IN_SET(sb.id,(SELECT cl.subjectIds FROM class cl WHERE cl.id='+classId+'))' , { type: db.sequelize.QueryTypes.SELECT }).then(function(subjectdata){
        testSubjectData.subjectlist=subjectdata;
        db.sequelize.query('SELECT ts.id, ts.testName as text FROM test ts WHERE ts.active=1 AND FIND_IN_SET(ts.id,(SELECT cl.subjectIds FROM class cl WHERE cl.id='+classId+'))', { type: db.sequelize.QueryTypes.SELECT }).then(function(testdata){
            testSubjectData.testlist=testdata;
            res.json(testSubjectData);
           }).catch(function(err){
              res.json(err);
        });
       
       }).catch(function(err){
          res.json(err);
    });
  
}
module.exports.getSubjectTestList = getSubjectTestList;
