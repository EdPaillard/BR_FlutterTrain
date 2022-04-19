const express = require('express');
const mysql = require('mysql'); 
const app = express();
const cors = require('cors');
require('dotenv').config();



//Connexion Database
var con = mysql.createConnection({
    host: "localhost",
    user: "yourusername",
    password: "yourpassword"
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });

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
app.use(usersRouter);
app.use(fragsRouter);
app.use(tropheesRouter);
app.use(timelineRouter);
app.use(heroesRouter);


module.exports = app;