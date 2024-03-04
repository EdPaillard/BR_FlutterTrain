const express = require('express');
const router = express.Router();

const comptesContrl = require('../controllers/comptesContrl');

router.post('/api/:user_id/comptes', comptesContrl.saveMoney);
//router.post('/api/:user/epargne', comptesContrl.saveMoreMoney);
router.get('/api/:user_id/courant', comptesContrl.getMyMoney);
router.get('/api/:user_id/epargne', comptesContrl.getSavedMoney);
router.get('/api/courant/all', comptesContrl.getAllMoney);
router.get('/api/epargne/all', comptesContrl.getAllSavedMoney);
router.get('/api/account/:user/infos', comptesContrl.getUserAccountInfos);
router.get('/api/account/info/all', comptesContrl.getAllAccountInfos);
router.put('/api/courant/:id', comptesContrl.modifyCourant);
router.put('/api/epargne/:id', comptesContrl.modifyEpargne);
// router.delete('/api/:user/:courant', comptesContrl.deleteCourant);
// router.delete('/api/:user/:epargne', comptesContrl.deleteEpargne);

module.exports = router;