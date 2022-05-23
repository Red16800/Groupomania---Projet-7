const express = require('express');
const bodyParser = require('body-parser');

const path = require('path');
const mysql = require('mysql2');

const userRoutes = require('./routes/user');
const postRoutes = require('./routes/post.js');

const app = express();

const dbConnexion = mysql.createConnection({
  host: 'localhost' ,
  port: '3306' ,
  user: 'root' ,
  password: 'mohamed' ,
  database: 'groupo'
})

dbConnexion.connect();


app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use('/images', express.static(path.join(__dirname, 'images')));

app.use('/api/user', userRoutes);
app.use('/api/post', postRoutes);


module.exports = app;