const { Fees }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, feesObj;
    let feesInfo = req.body;
    console.log(feesInfo);
    [err, feesObj] = await to(Fees.create(feesInfo));
    if(err) return ReE(res, err, 422);
    
    [err, feesObj] = await to(feesObj.save());
    if(err) return ReE(res, err, 422);
    
    let feesJson = feesObj.toWeb();
   
    return ReS(res, {fees:feesJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let feeId = req.params.feeId;
    [err, feesObj] = await to(Fees.findByPk(feeId));
    if(err) return ReE(res, err, 422);

    let feesJson = feesObj.toWeb();
   
    return ReS(res, {fees:feesJson}, 201);
}
module.exports.get = get;


const getFeesDataByClass = async function(req, res){
    let classId = req.params.Id;
console.log(classId);
// Find fees based on classId
let err, feesList;
[err, feesList] = await to(Fees.findAll({
  where: {
    classId: classId,
  },
}));

if (err) {
  return ReE(res, err, 422);
}
// console.log(feesList);
// Map the feesList to JSON format
let feesJsonList = feesList.map(fees => fees.toWeb());
// console.log(feesJsonList);
// Return the fees data
return ReS(res, { fees: feesJsonList[0] }, 200);
}
module.exports.getFeesDataByClass = getFeesDataByClass;

const update = async function(req, res){
    let err, feesObj, data
    feesObj = req.fees;
    data = req.body;
    console.log(data);
    feesObj.set(data);
 
    [err, feesObj] = await to(feesObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Fees: '+feesObj.feeId});
}
module.exports.update = update;

const remove = async function(req, res){
    let feesObj, err;
    feesObj = req.fees;

    [err, feesObj] = await to(feesObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete fees');

    return ReS(res, {message:'Deleted Fees'}, 200);
}
module.exports.remove = remove;

const getAll = async function(req, res){
   
    try {
     
        db.sequelize.query('SELECT fees.feeId, fees.classId, fees.tuitionFee, fees.developmentFee, fees.examinationFee, fees.sportsFee, fees.transportationFee, fees.libraryFee, fees.labFee, fees.securityFee, fees.otherFee, fees.totalFee, fees.paymentFrequency, fees.dueDate, fees.lateFee, fees.discount, fees.createdAt, fees.updatedAt, class.className FROM fees JOIN class ON fees.classId = class.id', { type: db.sequelize.QueryTypes.SELECT }).then(function(fees){
       
            ReS(res, {fees:fees});
           }).catch(function(err){
            console.log(err);
            ReS(res, {fees:err})
        });
    } catch (error) {
        return ReE(res, {fees: error});
    }

    // Fees.findAll({})
    //     .then(att =>ReS(res, {fees:att}))
    //     .catch(error => ReS(res, {fees:error}));
}
module.exports.getAll = getAll;
