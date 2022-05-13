const depensesDataMapper = require("../models/depensesDataMapper");

const depensesController = {


    spendMoney: (req, res) => {
        try {
            const money = req.body
            depensesDataMapper.postDepense(money.label, money.amount, money.createdAt, money.user, (err, response) => {
                res.status(200);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getOneDepense: (req, res) => {
        try {
            depensesDataMapper.checkOneDepense(req.params.id, (err, response) => {
                const depense = response.rows[0];
                res.json(depense);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getDepenses: (req, res) => {
        try {
            depensesDataMapper.CheckDepenses((err, response) => {
                const depense = response.rows;
                res.json(depense);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getAllDepenses: (req, res) => {
        try {
            depensesDataMapper.CheckAllDepenses((err, response) => {
                const depense = response.rows;
                res.json(depense);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyDepense: (req, res) => {
        try {
            const depense = req.body;
            depensesDataMapper.modifyOneDepense(req.params.id, depense.amount, (err, response) => {
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    deleteDepense: (req, res) => {
        try {
            depensesDataMapper.deleteDepense(req.params.id, (err, response) => {
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }

}

module.exports = depensesController