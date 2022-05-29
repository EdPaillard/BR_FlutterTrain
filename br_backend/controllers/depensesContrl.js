const comptesDataMapper = require("../models/comptesDataMapper");
const depensesDataMapper = require("../models/depensesDataMapper");
const accountsCtrl = require("../middlewares/accountControl");

const depensesController = {


    spendMoney: async (req, res) => {
        try {
            const money = req.body;
            // comptesDataMapper.getLastComptes(req.params.user, async (err, response) => {
            //     const lastCourant = await response[0].courant;
            //     const lastEpargne = await response[0].epargne;

            //     const amount = parseInt(money.amount, 10);
            //     const newCourant = lastCourant - amount

            //     comptesDataMapper.setComptes(req.params.user, newCourant, lastEpargne, () => {})
            // })
            accountsCtrl.amountFlux(req.params.user, money.amount, "depense");
            depensesDataMapper.postDepense(req.params.user, money.label, money.amount, money.createdAt, (err, response) => {
                res.status(200).json({"success" : "Vous vous êtes appauvri !"});
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getOneDepense: (req, res) => {
        try {
            depensesDataMapper.checkOneDepense(req.params.id, (err, response) => {
                const depense = response;
                res.json(depense);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getDepenses: (req, res) => {
        try {
            depensesDataMapper.CheckDepenses(req.params.user, (err, response) => {
                const depense = response;
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
                const depense = response;
                res.json(depense);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyDepense: async (req, res) => {
        // try {
            const depense = req.body;
            const user = await accountsCtrl.fetchUser(req.params.id, "depense");
            const oldAmount = await accountsCtrl.fetchAmount(req.params.id, "depense");
            console.log('ICI')
            console.log(oldAmount);
            const comptes = await accountsCtrl.getLastAmount(user);
            console.log('ET LA')
            console.log(comptes)
            accountsCtrl.updateDepenseAccount(user, oldAmount, depense.amount, comptes.courant, comptes.epargne, "upDep")
            depensesDataMapper.modifyOneDepense(req.params.id, depense.amount, (err, response) => {
                res.status(200).json({'success' : 'Dépense modifiée !'});
            })
        // } catch (error) {
        //     console.trace(error);
        //     res.status(500);
        // }
    },
    deleteDepense: async (req, res) => {
        try {
            const user = await accountsCtrl.fetchUser(req.params.id, "depense");
            const oldAmount = await accountsCtrl.fetchAmount(req.params.id, "depense");
            const comptes = await accountsCtrl.getLastAmount(user);
            accountsCtrl.updateDepenseAccount(user, oldAmount, 0, comptes.courant, comptes.epargne, "delDep")
            depensesDataMapper.deleteDepense(req.params.id, (err, response) => {
                res.status(200).json({'success' : 'Dépense supprimée !'});
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }

}

module.exports = depensesController