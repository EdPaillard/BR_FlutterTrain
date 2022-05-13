const client = require("../database");

const depensesDataMapper = {

    postDepense: (label, amount, createdAt, user, cb) => {
        const depense = `INSERT INTO depenses (label, amount, createdAt, user) VALUES(${label}, ${amount}, ${createdAt}, ${user});`;
        client.query(depense, cb);
    },
    checkOneDepense: (id, cb) => {
        const depense = `SELECT amount FROM depenses WHERE id=${id};`;
        client.query(depense, cb);
    },
    CheckDepenses: (user, cb) => {
        const depense = `SELECT amount FROM depenses WHERE user=${user};`;
        client.query(depense, cb);
    },
    CheckAllDepenses: (user, cb) => {
        const depense = `SELECT amount FROM depenses;`;
        client.query(depense, cb);
    },
    modifyOneDepense: (amount, id, cb) => {
        const depense = `UPDATE depenses SET amount=${amount} WHERE id=${id};`;
        client.query(depense, cb);
    },
    deleteDepense: (id, cb) => {
        const depense = `DELETE FROM depenses WHERE id=${id};`;
        client.query(depense, cb);
    }

}

module.exports = depensesDataMapper;