const comptesDataMapper = require("../models/comptesDataMapper");

const comptesController = {
       
    saveMoney: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.setComptes(money.user, money.amount1, money.amount2, (err, response) => {
                if (err) {
                    console.trace(err);
                    return res.status(500);
                };
                res.status(200).json({'success': 'bravo'});
            });
        } catch (error) {
            console.trace(error);
        }
    },
    // saveMoreMoney: (req, res) => {
    //     try {
    //         const money = req.body;
    //         comptesDataMapper.setEpargne(money.user, money.amount,(err, response) => {
    //             if (err) {
    //                 console.trace(err);
    //                 return res.status(500);
    //             };
    //             res.status(200);
    //         })
    //     } catch (error) {
    //         console.trace(error);
    //         res.status(500);
    //     }
    // },
    getMyMoney: (req, res) => {
        try {
            comptesDataMapper.getCourant(req.params.user, (err, response) => {
                const myMoney = response;
                console.log(myMoney);
                console.log(myMoney[myMoney.length - 1].courant)
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getSavedMoney: (req, res) => {
        try {
            comptesDataMapper.getEpargne(req.params.user, (err, response) => {
                const myMoney = response;
                console.log(myMoney);
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getAllMoney: (req, res) => {
        try {
            comptesDataMapper.getAllCourant((err, response) => {
                const myMoney = response;
                console.log(myMoney);
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getAllSavedMoney: (req, res) => {
        try {
            comptesDataMapper.getAllEpargne((err, response) => {
                const myMoney = response;
                console.log(myMoney);
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getUserAccountInfos: (req, res) => {
        try {
            comptesDataMapper.getUserComptes(req.params.user, (err, response) => {
                const myMoney = response;
                console.log(myMoney);
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getAllAccountInfos: (req, res) => {
        try {
            comptesDataMapper.getAllComptes((err, response) => {
                const myMoney = response;
                console.log(myMoney);
                res.json(myMoney);
            });
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyCourant: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.modifyCourant(req.params.id, money.amount, (req, response) => {
                res.status(201).json({'success':'Montant modifié !'}).end();
            })            
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyEpargne: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.modifyEpargne(req.params.id, money.amount, (req, response) => {
                res.status(201).json({'success':'Montant modifié !'}).end();
            })            
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }
}

module.exports = comptesController;