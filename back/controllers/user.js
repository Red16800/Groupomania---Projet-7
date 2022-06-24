const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const passwordValidator = require("password-validator");
require("dotenv").config();
const { User, Post } = require("../models");

let schema = new passwordValidator();
schema
  .is()
  .min(8) //au moins 8 caractères
  .is()
  .max(20) // pas plus de 20 caractères
  .has()
  .uppercase() // au moins une minuscule
  .has()
  .lowercase() // au moins une majuscule
  .has()
  .digits(1) // au moins un chiffre
  .has()
  .not()
  .spaces() //pas d'espaces
  .is()
  .not()
  .oneOf(["Passw0rd", "Password123"]);

const regexEmail =
  /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

exports.signup = async (req, res, next) => { // export de la fonction signup
  const { email, firstname, lastname, password } = req.body;//infos dans la request email, firstname...
  if (!regexEmail.test(email)) {
    return res.status(400).json({ error: "Email incorrect" });
  }
  if (!schema.validate(password)) {
    res.status(400).json({
      error:
        "le mot de passe doit contenir au moins 8 caractères dont 1 chiffre, 1 lettre majuscule et 1 minuscule",
    });
    return;
  }
  const isFieldsEmpty = !email || !firstname || !lastname || !password;

  if (isFieldsEmpty) {
   
    res.status(400).json({ error: "Merci de remplir tous les champs !" });
    return;
  }
  try {
    const hash = await bcrypt.hash(password, 10);
    const user = await User.create({ 
      email: email,
      firstname: firstname,
      lastname: lastname,
      password: hash,
    });
    res.status(201).json({
      userId: user.id,
      isAdmin: user.isAdmin,
    });
  } catch (error) {
    res.status(500).json({ error });
  }
};

exports.login = async (req, res, next) => {
  const { email, password } = req.body;
  if (!email || !password) {
    return res
      .status(400)
      .json({ error: "Merci de remplir tous les champs !" });
  }
  try {
    const user = await User.findOne({ where: { email } }  );
    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) {
      res.status(401).json({ error: "Utilisateur non trouvé !" });
      return;
    }
    res.status(200).json({
      userId: user.id,
      isAdmin: user.isAdmin,
      firstname: user.firstname,
      lastname: user.lastname,
      token: jwt.sign(
        
        {
          userId: user.id,
          isAdmin: user.isAdmin,
        },
        process.env.TOKEN,
        { expiresIn: "24h" }
      ),
    });
  } catch (error) {
    res.status(500).json({ error });
  }
};

exports.getOneProfile = (req, res, next) => {
  User.findOne({
    attributes: ["id", "email", "firstname", "lastname"],
    where: { id: req.params.id },
  })
    .then((user) => {
      res.status(200).json(user);
    })
    .catch((error) => {
      res.status(404).json({
        error: error,
        message: "Utilisateur non trouvé !",
      });
    });
};

exports.modifyProfile = async (req, res, next) => {
  try {
    if (!req.body.firstname || !req.body.lastname) {
      res.status(400).json({
        error: "Veuillez remplir tous les champs !",
      });
      return;
    }
    const user = await User.findOne({ where: { id: req.params.id } });
    if (user.id === res.locals.userId || res.locals.isAdmin) {
      await user.update({
        firstname: req.body.firstname,
        lastname: req.body.lastname,
      });
      res.status(200).json({
        message: "Profil modifié !",
        user: {
          firstname: user.firstname,
          lastname: user.lastname,
          email: user.email,
        },
      });
    }
  } catch (error) {
    res.status(400).json({
      error: error.message,
    });
  }
};

exports.deleteProfile = async (req, res, next) => {
  try {
    const user = await User.findOne({ where: { id: req.params.id } });
    if (!user) {
      res.status(404).json({
        message: "user not found",
      });
      return;
    }
    if (user.id !== res.locals.userId && res.locals.isAdmin) {
      res.status(403).json({
        message: "Not authorized",
      });
      return;
    }
    await user.destroy();
    res.status(200).json({
      message: "user deleted",
    });
  } catch (error) {
    res.status(400).json({
      error: error.message,
    });
  }
};