const { Post, User } = require("../models");
const fs = require("fs-extra");

exports.createPost = (req, res, next) => {
  if (req.body.title === "" || req.body.content === "") {
    return res.status(400).json({ error: "Merci de remplir tous les champs." });
  }

  Post.create({
    idUser: res.locals.userId,
    title: req.body.title,
    content: req.body.content,
    image:
      req.body.content && req.file
        ? `${req.protocol}://${req.get("host")}/images/${req.file.filename}`
        : null,
  })
    .then(() => {
      alert(res);
        res.status(201).json({ message: "Message enregistréeeeeeee !" });
        if(!res.locals.userId){
          alert('ok');
        }
    })
    .catch((error) => res.status(400).json({ error }));
};


exports.getAllPosts = (_req, res) => {
  Post.findAll({
    order: [["createdAt", "DESC"]],
    attributes: [
      "id",
      "idUser",
      "title",
      "content",
      "image",
      "createdAt",
      "updatedAt",
    ],
    include: [{ model: User, attributes: ["firstname", "lastname"] }],
  })
    .then((posts) => {
      res.status(200).json(posts);
    })
    .catch((error) => {
      res.status(400).json({
        error: error,
      });
    });
};

exports.getOnePost = async (req, res, next) => {
  try {
    const post = await Post.findOne({
      attributes: [
        "id",
        "idUser",
        "title",
        "content",
        "image",
        "createdAt",
        "updatedAt",
      ],
      where: { id: req.params.id },
    });
    if (!post) {
      res.status(404).json({
        message: "post not found",
      });
      return;
    }
    res.status(200).json(post);
  } catch (error) {
    res.status(404).json({
      error: error,
    });
  }
};

exports.deletePost = async (req, res, next) => {
  try {
    const post = await Post.findOne({ where: { id: req.params.id } });
    if (!post) {
      res.status(404).json({
        message: "Post not found",
      });
      return;
    }

    if (post.idUser !== res.locals.userId && !res.locals.isAdmin) {
      res.status(403).json({
        message: "Not authorized",
      });
      return;
    }

    if (post.image !== null) {
      const filename = post.image.split("/images/")[1];
      await fs.unlink(`images/${filename}`);
      await post.update({
        image: null       
      });

    }

    await post.destroy();
    res.status(200).json({
      message: "Post deleted",
    });
  } catch (error) {
    res.status(400).json({
      message: error.message,
    });
  }
};