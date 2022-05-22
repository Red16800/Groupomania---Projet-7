const { Sequelize } = require('sequelize');
const sequelize = new Sequelize({
    host: "localhost",
    port: "3306",
    username: "root",
    password: "mohamed",
    database: "groupo",
    dialect: "mysql"
});

module.exports = sequelize;