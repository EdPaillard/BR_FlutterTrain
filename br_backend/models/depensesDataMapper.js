const client = require("../database");

const depensesDataMapper = {

    postDepense: (user, label, amount, createdAt, cb) => {
        const depense = `INSERT INTO depenses (label, amount, createdAt, user) VALUES (?)`;
        const values = [
            label, amount, createdAt, user
        ]
        client.query(depense, [values], cb);
    },
    checkOneDepense: (id, cb) => {
        const depense = `SELECT amount FROM depenses WHERE id=?`;
        const values = [
            id
        ]
        client.query(depense, [values], cb);
    },
    CheckDepenses: (user, cb) => {
        const depense = `SELECT amount FROM depenses WHERE user=?`;
        const values = [
            user
        ]
        client.query(depense, [values], cb);
    },
    CheckAllDepenses: (cb) => {
        const depense = 'SELECT amount FROM depenses';
        client.query(depense, cb);
    },
    modifyOneDepense: (id, amount, cb) => {
        const depense = 'UPDATE depenses SET amount =? WHERE id =?';
        client.query(depense, [amount, id], cb);
    },
    deleteDepense: (id, cb) => {
        const depense = 'DELETE FROM depenses WHERE id =?';
        client.query(depense, [id], cb);
    },
    getUserFromID: (id, cb) => {
        const sql = 'SELECT user FROM depenses WHERE id =?'
        client.query(sql, [id], cb);
    }

}

module.exports = depensesDataMapper;