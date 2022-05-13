const client = require("../database");

const comptesDataMapper = {
    //getter
    getCourant: (user, cb) => {
        const courAmount_query = `SELECT courant FROM comptes WHERE user=${user};`;
        client.query(courAmount_query, cb);
    },
    getEpargne: (user, cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes WHERE user=${user};`;
        client.query(spareAmount_query, cb);
    },
    getUserComptes: (user, cb) => {
        const spareAmount_query = `SELECT * FROM comptes WHERE user="${user}" ORDER BY atTime;`;
        console.log('THERE?');
        client.query(spareAmount_query, cb);
    },
    getAllComptes: (user, cb) => {
        const spareAmount_query = `SELECT * FROM comptes ORDER BY atTime;`;
        client.query(spareAmount_query, cb);
    },
    getAllCourant: (cb) => {
        const courAmount_query = `SELECT courant FROM comptes;`;
        client.query(courAmount_query, cb);
    },
    getAllEpargne: (cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes;`;
        client.query(spareAmount_query, cb);
    },
    //poster
    setCourant: (user, amount, cb) => {
        const courAmount_query = `INSERT INTO comptes (courant, user) VALUES(${amount}, ${user});`;
        client.query(courAmount_query, cb);
    },
    setEpargne: (user, amount, cb) => {
        const spareAmount_query = `INSERT INTO comptes (epargne, user) VALUES(${amount}, ${user});`;
        client.query(spareAmount_query, cb);
    },
    //puter
    modifyCourant: (amount, user, cb) => {
        const courAmount_query = `UPDATE comptes SET courant=${amount} WHERE user=${user};`;
        client.query(courAmount_query, cb);
    },
    modifyEpargne: (amount, user, cb) => {
        const spareAmount_query = `UPDATE comptes SET courant=${amount} WHERE user=${user};`;
        client.query(spareAmount_query, cb);
    },
    //deleter
    // deleteCourant: (user, cb) => {
    //     const courAmount_query = {
    //         text: `SELECT courant FROM comptes WHERE "user"=$1;`,
    //         values: [user]
    //     };
    //     client.query(courAmount_query, cb);
    // },
    // deleteEpargne: (user, cb) => {
    //     const courAmount_query = {
    //         text: `SELECT courant FROM comptes WHERE "user"=$1;`,
    //         values: [user]
    //     };
    //     client.query(courAmount_query, cb);
    // },
}

module.exports = comptesDataMapper;