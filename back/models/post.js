const { DataTypes } = require('sequelize');
const sequelize = require('./database');

const Post = sequelize.define('Post', {
    content: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    imageUrl: {
        type: DataTypes.STRING,
        allowNull: true
    },
})

module.exports = Post;