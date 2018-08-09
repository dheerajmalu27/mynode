var http = require("http");
var express = require('express');
var app = express();
var mysql= require('mysql');
var bodyParser = require('body-parser');
var jwt = require('jsonwebtoken');
var router=express.Router();
var cors = require('cors');
//start mysql connection
var util = require('util');
var expressValidator = require('express-validator');
var authenticateController=require('./controllers/authenticate-controller');

var connection = require('./config');

//end mysql connection
process.env.SECRET_KEY="Mysecretkey";

//start body-parser configuration
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
}));
//end body-parser configuration
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "GET,PUT,POST,DELETE,PATCH,OPTIONS");
  res.header('Access-Control-Expose-Headers', 'Authorization');
  next();
});
app.use(cors());
app.use(expressValidator());
//create app server
var server = app.listen(3000,  "127.0.0.1", function () {

  var host = server.address().address
  var port = server.address().port

  console.log("Example app listening at http://%s:%s", host, port)

});

//rest api to get all customers

app.post('/api/authenticate',authenticateController.authenticate);

app.use('/secure-api',router);
// validation middleware
router.use(function(req,res,next){
    var token=req.body.token || req.headers['token'];
    if(token){
        jwt.verify(token,process.env.SECRET_KEY,function(err,ress){
            if(err){
                res.status(401).send('Token Invalid');
            }else{
                next();
            }
        })
    }else{
        res.send('Please send a token')
    }
})


router.get('/customer',cors(), function (req, res) {
   connection.query('select `Id`, `Name`, `Email`, `Address`, `Phone`, `Created_on`, `Updated_on` from users', function (error, results, fields) {
	  if (error) throw error;
	  res.end(JSON.stringify(results));
	});
});
//rest api to get a single customer data
router.get('/customer/:id',cors(), function (req, res) {
        req.checkParams('id', 'id is required').notEmpty();
        req.checkParams('id', 'id is Numeric').isNumeric();

  // check for errors!
  var errors = req.validationErrors();
  if (errors) {
    res.send('There have been validation errors: ' + util.inspect(errors), 400);
    return;
  }
    
   connection.query('select  `Id`, `Name`, `Email`, `Address`, `Phone`, `Created_on`, `Updated_on`  from users where Id=?', [req.params.id], function (error, results, fields) {
	  if (error) throw error;
          if(results.length>0)
          {
              res.end(JSON.stringify(results));
          }
          else
          {
               res.send('Invalid Parameter id', 400);
        return;
          }
	  
	});
});

//rest api to create a new customer record into mysql database
router.post('/customer',cors(), function (req, res) {
   var params  = req.body;
   
    req.checkBody('Name', 'Username is required.').notEmpty();
   req.checkBody('Email', 'Email is required.').notEmpty();
    req.checkBody('Email', 'Email is not valid').isEmail();
    req.checkBody('Phone', 'Phone number is not valid').isNumeric();
    req.checkBody('Address', 'Address is required.').notEmpty();
    req.checkBody('Address', 'Address is required.').notEmpty();
   

    // check for errors!
    var errors = req.validationErrors();
    if (errors) {
        res.send('There have been validation errors: ' + util.inspect(errors), 400);
        return;
    }
  
   connection.query('INSERT INTO users SET ?', params, function (error, results, fields) {
	  if (error) throw error;
	  res.end(JSON.stringify(results));
	});
});

//rest api to update record into mysql database
router.put('/customer',cors(), function (req, res) {
    
    req.checkBody('Name', 'Username is required.').notEmpty();
    req.checkBody('Email', 'Email is required.').notEmpty();
    req.checkBody('Email', 'Email is not valid').isEmail();
    req.checkBody('Phone', 'Phone number is not valid').isNumeric();
    req.checkBody('Address', 'Address is required.').notEmpty();
    req.checkBody('Id', 'Invalid user id is required.').notEmpty();

    // check for errors!
    var errors = req.validationErrors();
    if (errors) {
        res.send('There have been validation errors: ' + util.inspect(errors), 400);
        return;
    }
    
   connection.query('UPDATE `users` SET `Name`=?,`Email`=?,`Phone`=?,`Address`=? where `Id`=?', [req.body.Name,req.body.Email, req.body.Phone, req.body.Address	, req.body.Id], function (error, results, fields) {
	  if (error) throw error;
	  res.end(JSON.stringify(results));
	});
});

//rest api to delete record from mysql database
router.delete('/customer', function (req, res) {
   
    req.checkBody('Id', 'Id is required.').notEmpty();
   

    // check for errors!
    var errors = req.validationErrors();
    if (errors) {
        res.send('There have been validation errors: ' + util.inspect(errors), 400);
        return;
    }
   connection.query('DELETE FROM `users` WHERE `Id`=?', [req.body.Id], function (error, results, fields) {
	  if (error) throw error;
	  res.end(JSON.stringify('Record has been deleted!'));
	});
});