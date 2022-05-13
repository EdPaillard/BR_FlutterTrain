const recettesDataMapper = require("../models/recettesDataMapper");

const recettesController = {

    saveMoney: async (req, res) => {
        try {
            const money = req.body
            console.log(money);
            recettesDataMapper.postRecette(money.label, money.amount, money.createdAt, req.headers.user, (err, response) => {
                res.status(200);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getOneRecette: (req, res) => {
        try {
            recettesDataMapper.checkOneRecette(req.params.id, (err, response) => {
                const recette = response.rows[0];
                res.json(recette);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getRecettes: (req, res) => {
        try {
            recettesDataMapper.CheckRecette((err, response) => {
                const recette = response.rows;
                res.json(recette);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getAllRecettes: (req, res) => {
        try {
            recettesDataMapper.CheckAllRecette((err, response) => {
                const recette = response.rows;
                res.json(recette);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyRecette: (req, res) => {
        try {
            const recette = req.body;
            recettesDataMapper.modifyOneRecette(req.params.id, recette.amount, (err, response) => {
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    deleteRecette: (req, res) => {
        try {
            recettesDataMapper.deleteRecette(req.params.id, (err, response) => {
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }

}

module.exports = recettesController;