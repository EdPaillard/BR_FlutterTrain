const express = require('express');
const router = express.Router();

const usersContrl = require('../controllers/usersContrl');

router.post('/api/register', usersContrl.register);
router.post('/api/login', usersContrl.login);
// router.get('/api/users', usersContrl.getAllUsers);
// router.put('/api/user/:id', usersContrl.modifyUser);
// router.delete('/api/user/:id', usersContrl.deleteUser);

module.exports = router;