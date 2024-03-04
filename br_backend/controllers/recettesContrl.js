const recettesDataMapper = require("../models/recettesDataMapper");
const comptesDataMapper = require("../models/comptesDataMapper");
const accountsCtrl = require("../middlewares/accountControl");

const recettesController = {

    saveMoney: async (req, res) => {
        try {
            const money = req.body
            // comptesDataMapper.getLastComptes(req.params.user, async (err, response) => {
            //     const lastCourant = await response[0].courant;
            //     const lastEpargne = await response[0].epargne;

            //     const amount = parseInt(money.amount, 10);
            //     const newCourant = lastCourant + amount

            //     comptesDataMapper.setComptes(req.params.user, newCourant, lastEpargne, () => {})
            // })
            accountsCtrl.amountFlux(req.params.user_id, money.amount, "recette");
            recettesDataMapper.postRecette(money.label, money.amount, money.createdAt, req.params.user_id, (err, response) => {
                res.status(200).json({'Success' : 'Vous voilà plus riche !'});
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getOneRecette: (req, res) => {
        try {
            recettesDataMapper.checkOneRecette(req.params.id, (err, response) => {
                const recette = response;
                res.json(recette);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getRecettes: (req, res) => {
        try {
            recettesDataMapper.CheckRecette(req.params.user_id, (err, response) => {
                const recette = response;
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
                const recette = response;
                console.log(response);
                res.json(recette);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyRecette: async (req, res) => {
        try {
            const recette = req.body;
            const user = await accountsCtrl.fetchUser(req.params.id, "recette");
            const oldAmount = await accountsCtrl.fetchAmount(req.params.id, "recette");
            const comptes = await accountsCtrl.getLastAmount(user);
            accountsCtrl.updateDepenseAccount(user, oldAmount, recette.amount, comptes.courant, comptes.epargne, "upRec")
            recettesDataMapper.modifyOneRecette(req.params.id, recette.amount, (err, response) => {
                res.status(200).json({'success' : 'update'});
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    deleteRecette: async (req, res) => {
        try {
            const user = await accountsCtrl.fetchUser(req.params.id, "recette");
            const oldAmount = await accountsCtrl.fetchAmount(req.params.id, "recette");
            const comptes = await accountsCtrl.getLastAmount(user);
            accountsCtrl.updateDepenseAccount(user, oldAmount, 0, comptes.courant, comptes.epargne, "delRec")
            recettesDataMapper.deleteRecette(req.params.id, (err, response) => {
                res.status(200).json({'success' : 'delete'});
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }

}

module.exports = recettesController;