const multer = require("multer");

const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
const passport = require("passport");
const pe = require("parse-error");

const cors = require("cors");
var http = require("http");
const path = require("path"); // Add this line
const v1 = require("./routes/v1");
const app = express();
const swagger = require("./swagger");

const CONFIG = require("./config/config");
var server = http.createServer(app);
server.listen(3000);
console.log("Express server started on port %s", server.address().port);
app.use(logger("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
// app.use(cookieParser());
// app.use(express.static(path.join(__dirname, 'public')));
app.use("/uploads", express.static("uploads"));
//Passport
app.use(passport.initialize());

//Log Env
console.log("Environment:", CONFIG.app);
console.log("Environment:", CONFIG.port);
//DATABASE
const models = require("./models");
models.sequelize
  .authenticate()
  .then(() => {
    console.log("Connected to SQL database:", CONFIG.db_name);
  })
  .catch((err) => {
    console.error("Unable to connect to SQL database:", CONFIG.db_name, err);
  });
var Storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./Images");
  },
  filename: function (req, file, callback) {
    callback(null, file.fieldname + "_" + Date.now() + "_" + file.originalname);
  },
});
if (CONFIG.app === "dev") {
  // models.sequelize.sync();//creates table if they do not already exist
  // models.sequelize.sync({ force: true });//deletes all tables then recreates them useful for testing and development purposes
}
// CORS
app.use(cors());

app.use("/api", v1);
swagger(app);
app.use("/", function (req, res) {
  res.statusCode = 200; //send the appropriate status code
  res.json({ status: "success", message: "Parcel Pending API", data: {} });
});

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error("Not Found");
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;

//This is here to handle all the uncaught promise rejections
process.on("unhandledRejection", (error) => {
  console.error("Uncaught Error", pe(error));
});
