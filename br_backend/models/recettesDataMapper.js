const client = require("../database");

const recettesDataMapper = {

    postRecette: (label, amount, createdAt, user, cb) => {
        const userStr = user.toString();
        console.log(typeof userStr);
        console.log(typeof user);
        const recette = `INSERT INTO recettes (label, amount, createdAt, user) VALUES ?`;
        const values = [
            label, amount, createdAt, user
        ]
        console.log(recette);
        client.query(recette, [values], {cb});
    },
    checkOneRecette: (id, cb) => {
        const recette = `SELECT amount FROM recettes WHERE id=?`;
        const values = [
            id
        ]
        client.query(recette, [values], cb);
    },
    CheckRecette: (user, cb) => {
        const recette = `SELECT amount FROM recettes WHERE user=?`;
        const values = [
            user
        ]
        client.query(recette, [values], cb);
    },
    CheckAllRecette: (cb) => {
        const recette = `SELECT amount FROM recettes;`;
        client.query(recette, cb);
    },
    modifyOneRecette: (amount, id, cb) => {
        const recette = `UPDATE recettes SET amount=? WHERE id=?`;
        const values = [
            amount, id
        ]
        client.query(recette, [values], cb);
    },
    checkOneRecette: (id, cb) => {
        const recette = `DELETE FROM recettes WHERE id=?`;
        const values = [
            id
        ]
        client.query(recette, [values], cb);
    }
}

module.exports = recettesDataMapper;