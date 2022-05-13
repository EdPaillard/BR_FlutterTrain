const express = require('express');
const router = express.Router();

const recettesContrl = require('../controllers/recettesContrl');

router.post('/api/recette', recettesContrl.saveMoney);
router.get('/api/recette/:id', recettesContrl.getOneRecette);
router.get('/api/:user/recette', recettesContrl.getRecettes);
router.get('/api/recette/all', recettesContrl.getAllRecettes);
router.put('/api/recette/:id', recettesContrl.modifyRecette);
router.delete('/api/recette/:id', recettesContrl.deleteRecette);

module.exports = router;