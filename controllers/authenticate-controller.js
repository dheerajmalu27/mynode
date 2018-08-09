var jwt = require('jsonwebtoken');
var md5 = require('md5');


var connection = require('./../config');

module.exports.authenticate = function (req, res) {
    console.log(req.body);
    var email = req.body.email;
    var password = req.body.password;

    connection.query('SELECT * FROM users WHERE Email = ?', [email], function (error, results, fields) {
        if (error) {
            res.json({
                status: false,
                message: 'there are some error with query'
            })
        } else {
            if (results.length > 0) {

                if (md5(password) == results[0].Password) {
                    console.log(results);
                    var user = {
                        id: results[0].Id,
                        username: results[0].Name,
                        email: results[0].Email
                    };
                    var token = jwt.sign(user, process.env.SECRET_KEY, {
                        expiresIn: 5000
                    });
                    var userData = {
                        id: results[0].Id,
                        username: results[0].Name,
                        email: results[0].Email,
                        token: token
                    };
                    res.json({
                        user: userData,
                        status: true,
                          token: token
                    })
                } else {
                    res.json({
                        status: false,
                        message: "Email and password does not match"
                    });
                }

            } else {
                res.json({
                    status: false,
                    message: "Email does not exits"
                });
            }
        }
    });
}