const { Class } = require('../models');
const authService = require('../services/auth.service');
const { ReE, ReS } = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res) {
    let classInfo = req.body;
    console.log(classInfo);

    try {
        let classObj = await Class.create(classInfo);
        let classJson = classObj.toWeb();
        return ReS(res, {class: classJson}, 201);
    } catch (err) {
        return ReE(res, err, 422);
    }
}
module.exports.create = create;

const get = async function(req, res) {
    let classId = req.params.classId;

    try {
        let classObj = await Class.findByPk(classId);
        let classJson = classObj.toWeb();
        return ReS(res, {class: classJson}, 201);
    } catch (err) {
        return ReE(res, err, 422);
    }
}
module.exports.get = get;

const update = async function(req, res) {
    let classObj = req.class;
    let data = req.body;
    console.log("data" + data);
    classObj.set(data);

    try {
        await classObj.save();
        return ReS(res, {message: 'Updated class: ' + classObj.id});
    } catch (err) {
        return ReE(res, err, 422);
    }
}
module.exports.update = update;

const remove = async function(req, res) {
    let classObj = req.class;

    try {
        await classObj.destroy();
        return ReS(res, {message: 'Deleted class'}, 204);
    } catch (err) {
        return ReE(res, 'error occurred trying to delete class');
    }
}
module.exports.remove = remove;

const getAll = async function(req, res) {
    try {
        let classes = await Class.findAll({});
        return ReS(res, {class: classes});
    } catch (error) {
        return ReE(res, {class: error});
    }
}
module.exports.getAll = getAll;

const getAllList = async function(req, res) {
    try {
        let classList = await Class.findAll({ attributes: ['id', ['className', 'text']] });
        return ReS(res, {class: classList});
    } catch (error) {
        return ReE(res, {class: error});
    }
}
module.exports.getAllList = getAllList;


const getClassDetails = async function(req, res) {

      
    let classData=new Object();
    db.sequelize.query('SELECT * FROM classdetailsview', { type: db.sequelize.QueryTypes.SELECT }).then(function(student){
        classData.class=student;
        
        res.json(classData);
       }).catch(function(err){
          res.json(err);
    });
    // try {
    //     const data = await db.sequelize.query('SELECT * FROM classdetailsview', { type: db.sequelize.QueryTypes.SELECT });
    //     console.log(data);
    //     return ReS(res, { class: data });
    // } catch (err) {
    //     return ReE(res, { class: err });
    // }
}

module.exports.getClassDetails = getClassDetails;

const getAllListOfSubjectByClassId = async function(req, res) {
    try {
        let classId = req.params.classId;
        db.sequelize.query('SELECT s.id,s.subName as text FROM subject s JOIN class c ON FIND_IN_SET(s.id, c.subjectIds) > 0 OR FIND_IN_SET(s.id, c.optionalSubjectIds) > 0 WHERE c.id ='+classId, { type: db.sequelize.QueryTypes.SELECT }).then(function(subject){
       
            ReS(res, {subject:subject});
           }).catch(function(err){
            ReS(res, {subject:err})
        });
    } catch (error) {
        return ReE(res, {subject: error});
    }
}
module.exports.getAllListOfSubjectByClassId = getAllListOfSubjectByClassId;


const getAllListOfDivisionByClassId = async function(req, res) {
    try {
        let classId = req.params.classId;
        db.sequelize.query('SELECT d.id,d.divName as text FROM division d JOIN class c ON FIND_IN_SET(d.id, c.divIds) > 0 WHERE c.id ='+classId, { type: db.sequelize.QueryTypes.SELECT }).then(function(division){
       
            ReS(res, {division:division});
           }).catch(function(err){
            ReS(res, {division:err})
        });
    } catch (error) {
        return ReE(res, {division: error});
    }
}
module.exports.getAllListOfDivisionByClassId = getAllListOfDivisionByClassId;

