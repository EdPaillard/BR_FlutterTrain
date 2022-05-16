const express = require('express');
const router = express.Router();

const comptesContrl = require('../controllers/comptesContrl');

router.post('/api/:user/courant', comptesContrl.saveMoney);
router.post('/api/:user/epargne', comptesContrl.saveMoreMoney);
router.get('/api/:user/courant', comptesContrl.getMyMoney);
router.get('/api/:user/epargne', comptesContrl.getSavedMoney);
router.get('/api/courant/all', comptesContrl.getAllMoney);
router.get('/api/epargne/all', comptesContrl.getAllSavedMoney);
router.get('/api/account/:user/infos', comptesContrl.getUserAccountInfos);
router.get('/api/account/info/all', comptesContrl.getAllAccountInfos);
router.put('/api/:user/:courant', comptesContrl.modifyCourant);
router.put('/api/:user/:epargne', comptesContrl.modifyEpargne);
// router.delete('/api/:user/:courant', comptesContrl.deleteCourant);
// router.delete('/api/:user/:epargne', comptesContrl.deleteEpargne);

module.exports = router;