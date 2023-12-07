const { Teachersubject}          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, teachersubjectObj;
    let teachersubjectInfo = req.body;
    console.log(teachersubjectInfo);
    [err, teachersubjectObj] = await to(Teachersubject.create(teachersubjectInfo));
    if(err) return ReE(res, err, 422);
    
    [err, teachersubjectObj] = await to(teachersubjectObj.save());
    if(err) return ReE(res, err, 422);
    
    let teachersubjectJson = teachersubjectObj.toWeb();
   
    return ReS(res, {teachersubject:teachersubjectJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let teachersubjectId = req.params.teachersubjectId;
    [err, teachersubjectObj] = await to(Teachersubject.findByPk(teachersubjectId));
    if(err) return ReE(res, err, 422);

    let teachersubjectJson = teachersubjectObj.toWeb();
   
    return ReS(res, {teachersubject:teachersubjectJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, teachersubjectObj, data
    teachersubjectObj = req.teachersubject;
    data = req.body;
   
    teachersubjectObj.set(data);
 
    [err, teachersubjectObj] = await to(teachersubjectObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Teachersubject: '+teachersubjectObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let teachersubjectObj, err;
    teachersubjectObj = req.teachersubject;

    [err, teachersubjectObj] = await to(teachersubjectObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete teachersubject');

    return ReS(res, {message:'Deleted Teachersubject'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    Teachersubject.findAll({})
        .then(att =>ReS(res, {teachersubject:att}))
        .catch(error => ReS(res, {teachersubject:error}));
}
module.exports.getAll = getAll;

const teacherSubjectList = async function(req, res){
    let teacherSubjectListData=new Object();
    console.log(req.query);
    let classId = req.query.classId;
    let testId = req.query.testId;
    let divId = req.query.divId;
    db.sequelize.query('SELECT * FROM all_teacherclassdivisionsubject', { type: db.sequelize.QueryTypes.SELECT }).then(function(testdata){
        teacherSubjectListData.subjectteacherlist=testdata;
        res.json(teacherSubjectListData);
       }).catch(function(err){
          res.json(err);
    });
}
module.exports.teacherSubjectList = teacherSubjectList;
const updateTeacherSubject = async function (req, res) {
    const data = req.body; // The data you want to update or insert
    const classId = req.body.classId;
    const divId = req.body.divId;
    const subId = req.body.subId;

    // Define the WHERE conditions to find the record
    const whereConditions = {
        classId: classId,
        divId: divId,
        subId: subId,
        // Add additional conditions as needed
    };

    // Find or create the record based on the conditions
    const [err, result] = await to(
        Teachersubject.findOrCreate({
            where: whereConditions,
            defaults: data, // Data to insert if it doesn't exist
        })
    );

    if (err) {
        return ReE(res, err, 422);
    }

    if (result[1]) {
        // Record was inserted
        return ReS(res, { message: 'Inserted TeacherSubject: classId=' + classId + ', divId=' + divId + ', subId=' + subId });
    } else {
        // Record was found and updated
        return ReS(res, { message: 'Updated TeacherSubject: classId=' + classId + ', divId=' + divId + ', subId=' + subId });
    }
};

module.exports.updateTeacherSubject = updateTeacherSubject;


