const client = require("../database");

const recettesDataMapper = {

    postRecette: (label, amount, createdAt, user, cb) => {
        const userStr = user.toString();
        console.log(typeof userStr);
        console.log(typeof user);
        const recette = `INSERT INTO recettes (label, amount, createdAt, user) VALUES (${label}, ${amount}, ${createdAt}, "${user}");`;
        console.log(recette);
        client.query(recette, {cb});
    },
    checkOneRecette: (id, cb) => {
        const recette = `SELECT amount FROM recettes WHERE id=${id};`;
        client.query(recette, cb);
    },
    CheckRecette: (user, cb) => {
        const recette = `SELECT amount FROM recettes WHERE user=${user};`;
        client.query(recette, cb);
    },
    CheckAllRecette: (cb) => {
        const recette = `SELECT amount FROM recettes;`;
        client.query(recette, cb);
    },
    modifyOneRecette: (amount, id, cb) => {
        const recette = `UPDATE recettes SET amount=${amount} WHERE id=${id};`;
        client.query(recette, cb);
    },
    checkOneRecette: (id, cb) => {
        const recette = `DELETE FROM recettes WHERE id=${id};`;
        client.query(recette, cb);
    }
}

module.exports = recettesDataMapper;