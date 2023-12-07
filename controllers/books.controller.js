const { Books }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');
const db  = require('../models/index').db;
const create = async function(req, res){
    let err, booksObj;
    let booksInfo = req.body;
    console.log(booksInfo);
    [err, booksObj] = await to(Books.create(booksInfo));
    if(err) return ReE(res, err, 422);
    
    [err, booksObj] = await to(booksObj.save());
    if(err) return ReE(res, err, 422);
    
    let booksJson = booksObj.toWeb();
   
    return ReS(res, {books:booksJson}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let booksId = req.params.booksId;
    [err, booksObj] = await to(Books.findByPk(booksId));
    if(err) return ReE(res, err, 422);

    let booksJson = booksObj.toWeb();
   
    return ReS(res, {books:booksJson}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, booksObj, data
    booksObj = req.book;
    data = req.body;
    console.log(data);
    booksObj.set(data);
 
    [err, booksObj] = await to(booksObj.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Books: '+booksObj.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let booksObj, err;
    booksObj = req.book;

    [err, booksObj] = await to(booksObj.destroy());
    if(err) return ReE(res, 'error occured trying to delete books');

    return ReS(res, {message:'Deleted Books'}, 204);
}
module.exports.remove = remove;

const getAll = async function(req, res){
    db.sequelize.query('SELECT `books`.`bookId`,`books`.`title`,`books`.`author`,`books`.`isbn`,`books`.`genre`, `books`.`quantity`, `books`.`active`, (`books`.`quantity` - COALESCE(COUNT(CASE WHEN `borrowedbooks`.`returnDate` IS NULL AND  `borrowedbooks`.`bookId` IS NOT NULL THEN 1 END), 0)) AS availableQuantity FROM `school`.`books` LEFT JOIN `school`.`borrowedbooks` ON `books`.`bookId` = `borrowedbooks`.`bookId` GROUP BY `books`.`bookId`, `books`.`title`, `books`.`author`, `books`.`isbn`, `books`.`genre`, `books`.`quantity`', { type: db.sequelize.QueryTypes.SELECT }).then(function(book){
       
        ReS(res, {books:book});
       }).catch(function(err){
        ReS(res, {books:err})
    });


    // Books.findAll({})
    //     .then(att =>ReS(res, {books:att}))
    //     .catch(error => ReS(res, {books:error}));
}
module.exports.getAll = getAll;
const getAllList = async function(req, res){
   
    db.sequelize.query('SELECT `books`.`bookId` as id,`books`.`title` as text FROM `school`.`books` LEFT JOIN `school`.`borrowedbooks` ON `books`.`bookId` = `borrowedbooks`.`bookId` GROUP BY `books`.`bookId`, `books`.`title`, `books`.`author`, `books`.`isbn`, `books`.`genre`, `books`.`quantity` HAVING (`books`.`quantity` - COALESCE(COUNT(CASE WHEN `borrowedbooks`.`returnDate` IS NULL AND `borrowedbooks`.`bookId` IS NOT NULL THEN 1 END), 0)) > 0', { type: db.sequelize.QueryTypes.SELECT }).then(function(book){
       
        ReS(res, {books:book});
       }).catch(function(err){
        ReS(res, {books:err})
    });

    // Books.findAll({ attributes: [ ['bookId', 'id'], ['title', 'text']]})
    //     .then(att =>ReS(res, {books:att}))
    //     .catch(error => ReS(res, {books:error}));
}
module.exports.getAllList = getAllList;
