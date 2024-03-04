const client = require("../database");

const recettesDataMapper = {

    postRecette: (label, amount, createdAt, user, cb) => {
        const recette = `INSERT INTO recettes (label, amount, createdAt, user_id) VALUES (?)`;
        const values = [
            label, amount, createdAt, user
        ]
        client.query(recette, [values], cb);
    },
    checkOneRecette: (id, cb) => {
        const recette = `SELECT amount FROM recettes WHERE id=?`;
        client.query(recette, [id], cb);
    },
    CheckRecette: (user, cb) => {
        const recette = `SELECT amount FROM recettes WHERE user_id=?`;
        const values = [
            user
        ]
        client.query(recette, [values], cb);
    },
    CheckAllRecette: (cb) => {
        const recette = `SELECT amount FROM recettes`;
        client.query(recette, cb);
    },
    modifyOneRecette: (id, amount, cb) => {
        const recette = 'UPDATE recettes SET amount =? WHERE id =?';

        client.query(recette, [amount, id], cb);
    },
    deleteRecette: (id, cb) => {
        const recette = 'DELETE FROM recettes WHERE id =?';
        const values = [
            id
        ]
        client.query(recette, [values], cb);
    },
    getUserFromID: (id, cb) => {
        const sql = 'SELECT user_id FROM recettes WHERE id =?'
        client.query(sql, [id], cb);
    }
}

module.exports = recettesDataMapper;