const { DataTypes } = require('sequelize');
const sequelize = require('./database');

const Post = sequelize.define('Post', {
    title: {
        type: DataTypes.STRING,
        allowNull: false
    },
    content: DataTypes.TEXT,
    image: DataTypes.STRING,
    
    
});

module.exports = Post;