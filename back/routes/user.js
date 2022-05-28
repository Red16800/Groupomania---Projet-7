const express = require('express');
const router = express.Router();
const auth = require("../middleware/auth");

const userCtrl = require('../controllers/user');

router.post('/signup', userCtrl.signup);
router.post('/login', userCtrl.login);

router.get("/profile/:id", userCtrl.getOneProfile);
router.get("/profile/:id/posts",  userCtrl.getAllPostProfile);
router.put("/profile/:id",  userCtrl.modifyProfile);
router.delete("/profile/:id",  userCtrl.deleteProfile);
module.exports = router;