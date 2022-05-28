const User = require('./user');
const Post = require('./post');
const sequelize = require('./database');

const models = {};

User.hasMany(Post, {
    foreignKey: 'idUser',
    onDelete: 'cascade'
});

Post.belongsTo(User, {
    foreignKey: 'idUser',
    onDelete: 'cascade'
});


models.User = User;
models.Post = Post;

sequelize.sync();

module.exports = models;