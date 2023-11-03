const { Classteacher}          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, classteacherObj;
    let classteacherInfo = req.body;
    console.log(classteacherInfo);
    [err, classteacherObj] = await to(Classteacher.create(classteacherInfo));
    if(err) return ReE(res, err, 422);
    
    [err, classteacherObj] = await to(classteacherObj.save());
    if(err) return ReE(res, err, 422);
    
    let classteacherJson = classteacherObj.toWeb();
   
    return ReS(res, {classteacher:classteacherJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let classteacherId = req.params.classteacherId;
    [err, classteacherObj] = await to(Classteacher.findByPk(classteacherId));
    if(err) return ReE(res, err, 422);

    let classteacherJson = classteacherObj.toWeb();
   
    return ReS(res, {classteacher:classteacherJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, classteacherObj, data
    classteacherObj = req.classteacher;
    data = req.body;
    console.log("data"+data);
    classteacherObj.set(data);
 
    [err, classteacherObj] = await to(classteacherObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Classteacher: '+classteacherObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let classteacherObj, err;
    classteacherObj = req.classteacher;

    [err, classteacherObj] = await to(classteacherObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete classteacher');

    return ReS(res, {message:'Deleted Classteacher'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   

     db.sequelize.query("SELECT * FROM school.all_classteacherlistview", { type: db.sequelize.QueryTypes.SELECT })
        .then(att =>ReS(res, {classteacher:att}))
        .catch(error => ReE(res, {classteacher:error}));
}
module.exports.getAll = getAll;

const classTeacherList = async function(req, res){
    let classTeacherListData=new Object();
    console.log(req.query);
    let classId = req.query.classId;
    let testId = req.query.testId;
    let divId = req.query.divId;
    db.sequelize.query('SELECT * FROM school.all_teacherclassdivisionsubject', { type: db.sequelize.QueryTypes.SELECT }).then(function(testdata){
        classTeacherListData.subjectteacherlist=testdata;
        res.json(classTeacherListData);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.classTeacherList = classTeacherList;
const updateClassTeacher = async function (req, res) {
    const data = req.body; // The data you want to update or insert
    const classId = req.body.classId;
    const divId = req.body.divId;

    // Define the WHERE conditions to find the record
    const whereConditions = {
        classId: classId,
        divId: divId,
        // Add additional conditions as needed
    };

    // Use the upsert method to insert or update the record
    const [err, result] = await to(
        Classteacher.upsert(data, {
            where: whereConditions,
        })
    );

    if (err) {
        return ReE(res, err, 422);
    }

    const message = result ? 'Inserted' : 'Updated';
    return ReS(res, { message: `${message} ClassTeacher: classId=${classId}, divId=${divId}` });
};

module.exports.updateClassTeacher = updateClassTeacher;



