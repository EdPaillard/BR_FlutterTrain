const express = require('express');
const app = express();
const cors = require('cors');
require('dotenv').config();
const comptesRouter = require("./routes/comptesRouter");
const depensesRouter = require("./routes/depensesRouter");
const recettesRouter = require("./routes/recettesRouter");



//Connexion Database
// const con = mysql.createConnection({
//     host: process.env.MYSQL_HOST,
//     user: process.env.MYSQL_USER,
//     password: process.env.MYSQL_PASSWORD,
//     database: process.env.MYSQL_DATABASE
//   });
  
//   con.connect(function(err) {
//     if (err) throw err;
//     console.log("Connected!");
//   });

//Gestion du format url-encoded
app.use(
  express.urlencoded({
    extended: true,
  })
);
//Gestion du format JSON
app.use(express.json());
app.use(cors());

// app.use(htmlRouter);
app.use(comptesRouter);
app.use(depensesRouter);
app.use(recettesRouter);

module.exports = app;