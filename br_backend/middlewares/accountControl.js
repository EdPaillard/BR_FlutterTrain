const comptesDataMapper = require("../models/comptesDataMapper");
const depensesDataMapper = require("../models/depensesDataMapper");
const recettesDataMapper = require("../models/recettesDataMapper");

const accountsCtrl = {
    amountFlux: async (user, money, router) => {
        comptesDataMapper.getLastComptes(user, async (err, response) => {
            const lastCourant = await response[0].courant;
            const lastEpargne = await response[0].epargne;
            console.log(lastCourant);

            const amount = parseInt(money, 10);
            let newCourant;
            if (router == "recette") {
                newCourant = lastCourant + amount
            } else {
                newCourant = lastCourant - amount
            }

            comptesDataMapper.setComptes(user, newCourant, lastEpargne, () => {})
        })
    },
    // depenseFlux: async (user, money) => {
    //     comptesDataMapper.getLastComptes(user, async (err, response) => {
    //         const lastCourant = await response[0].courant;
    //         const lastEpargne = await response[0].epargne;

    //         const amount = parseInt(money, 10);
    //         const newCourant = lastCourant - amount

    //         comptesDataMapper.setComptes(user, newCourant, lastEpargne, () => {})
    //     })
    // },
    fetchUser: async (id, router) => {
            if(router === "recette") {
                return new Promise(
                    (resolve, reject) => {
                        recettesDataMapper.getUserFromID(id, async (err, response) => {
                            if(err) reject(err)
                            const user = response[0].user;
                            resolve(user);
                        })

                    }
                )
    
            } else {
                return new Promise(
                    (resolve, reject) => {
                        depensesDataMapper.getUserFromID(id, async (err, response) => {
                            if(err) reject(err)
                            const user = response[0].user;
                            resolve(user);
                        })

                    }
                )
            }
        
    },
    fetchAmount: async (id, router) => {
        if(router == "recette") {
            return new Promise(
                (resolve, reject) => {
                    recettesDataMapper.checkOneRecette(id, async (err, response) => {
                        if(err) reject(err)
                        const amount = await response[0].amount;
                        resolve(amount);
                    })
                }
            )

        } else {
            return new Promise(
                (resolve, reject) => {
                    depensesDataMapper.checkOneDepense(id, async (err, response) => {
                        if(err) reject(err)
                        const amount = await response[0].amount;
                        resolve(amount);
                    })
                }
            )
        }
    },
    updateDepenseAccount: async (user, oldAmount, newAmount, courant, epargne, router) => {
        switch (router) {
            case "upDep":
                if (oldAmount > newAmount) {
                    courant += oldAmount - newAmount;
                    comptesDataMapper.setComptes(user, courant, epargne, () => {})
                } else {
                    courant -= newAmount - oldAmount;
                    comptesDataMapper.setComptes(user, courant, epargne, () => {})
                }         
                break;
            case "upRec":
                if (oldAmount > newAmount) {
                    courant -= oldAmount - newAmount;
                    comptesDataMapper.setComptes(user, courant, epargne, () => {})
                } else {
                    courant += newAmount - oldAmount;
                    comptesDataMapper.setComptes(user, courant, epargne, () => {})
                }  
                break;
            case "delDep":
                courant += oldAmount;
                comptesDataMapper.setComptes(user, courant, epargne, () => {})
                break;
            case "delRec":
                courant -= oldAmount;
                comptesDataMapper.setComptes(user, courant, epargne, () => {})
                break;
        
            default:
                break;
        }
    },
    getLastAmount: async (user) => {
        return new Promise(
            (resolve, reject) => {
                comptesDataMapper.getLastComptes(user, async (err, response) => {
                    if(err) reject(err)
                    const lastAmount = response[0];
                    console.log("getLastAmount" + lastAmount);
                    resolve(lastAmount);
                })
            }
        )
    }

}

module.exports = accountsCtrl;