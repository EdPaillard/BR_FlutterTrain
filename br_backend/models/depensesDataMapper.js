const client = require("../database");

const depensesDataMapper = {

    postDepense: (label, amount, createdAt, user, cb) => {
        const depense = `INSERT INTO depenses (label, amount, createdAt, user) VALUES ?`;
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
        console.log("FAART")
        client.query(depense, cb);
    },
    modifyOneDepense: (amount, id, cb) => {
        const depense = `UPDATE depenses SET amount=? WHERE id=?`;
        const values = [
            amount, id
        ]
        client.query(depense, [values], cb);
    },
    deleteDepense: (id, cb) => {
        const depense = `DELETE FROM depenses WHERE id=?`;
        const values = [
            id
        ]
        client.query(depense, [values], cb);
    }

}

module.exports = depensesDataMapper;