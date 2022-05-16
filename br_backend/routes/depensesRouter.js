const express = require('express');
const router = express.Router();

const depensesContrl = require('../controllers/depensesContrl');

router.post('/api/:user/depense', depensesContrl.spendMoney);
router.get('/api/depense/:id', depensesContrl.getOneDepense);
router.get('/api/:user/depense', depensesContrl.getDepenses);
router.get('/api/depenses/all', depensesContrl.getAllDepenses);
router.put('/api/depense/:id', depensesContrl.modifyDepense);
router.delete('/api/depense/:id', depensesContrl.deleteDepense);

module.exports = router;