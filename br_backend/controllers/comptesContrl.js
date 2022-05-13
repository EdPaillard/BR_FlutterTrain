const comptesDataMapper = require("../models/comptesDataMapper");

const comptesController = {
    
    saveMoney: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.setCourant(money.user, money.amount,(err, response) => {
                if (err) {
                    console.trace(err);
                    return res.status(500);
                };
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
        }
    },
    saveMoreMoney: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.setEpargne(money.user, money.amount,(err, response) => {
                if (err) {
                    console.trace(err);
                    return res.status(500);
                };
                res.status(200);
            })
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    getMyMoney: (req, res) => {
        try {
            comptesDataMapper.getCourant(req.params.user, (err, response) => {
                const myMoney = response.rows;
                console.log(myMoney);
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
                const myMoney = response.rows;
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
            console.log('HEY');
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
            comptesDataMapper.getAllEpargne(req.params.user, (err, response) => {
                const myMoney = response.rows;
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
                console.log('PLOP');
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
                const myMoney = response.rows;
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
            comptesDataMapper.modifyCourant(money.amount, money.user, (req, res) => {
                res.status(200);
            })            
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    },
    modifyEpargne: (req, res) => {
        try {
            const money = req.body;
            comptesDataMapper.modifyEpargne(money.amount, money.user, (req, res) => {
                res.status(200);
            })            
        } catch (error) {
            console.trace(error);
            res.status(500);
        }
    }
}

module.exports = comptesController;