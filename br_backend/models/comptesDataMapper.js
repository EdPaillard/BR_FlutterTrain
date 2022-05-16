const client = require("../database");

const comptesDataMapper = {
    //getter
    getCourant: (user, cb) => {
        const courAmount_query = `SELECT courant FROM comptes WHERE user=?`;
        const queryUser= user;

        client.query(courAmount_query, [queryUser], cb);
    },
    getEpargne: (user, cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes WHERE user=?`;
        const queryUser= user;

        client.query(spareAmount_query, [queryUser], cb);
    },
    getUserComptes: (user, cb) => {
        const spareAmount_query = `SELECT * FROM comptes WHERE user=? ORDER BY atTime`;
        const queryUser= user;

        client.query(spareAmount_query, [queryUser], cb);
    },
    getAllComptes: (cb) => {
        const spareAmount_query = `SELECT * FROM comptes ORDER BY atTime;`;
        client.query(spareAmount_query, cb);
    },
    getAllCourant: (cb) => {
        const courAmount_query = 'SELECT courant FROM comptes';
        client.query(courAmount_query, {cb});
    },
    getAllEpargne: (cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes`;
        client.query(spareAmount_query, cb);
    },
    //poster
    setCourant: (user, amount, cb) => {
        const courAmount_query = `INSERT INTO comptes (courant, user) VALUES ?`;
        const values = [
            amount, user
        ]
        client.query(courAmount_query, [values], cb);
    },
    setEpargne: (user, amount, cb) => {
        const spareAmount_query = `INSERT INTO comptes (epargne, user) VALUES ?`;
        const values = [
            amount, user
        ]
        client.query(spareAmount_query, [values], cb);
    },
    //puter
    modifyCourant: (amount, user, cb) => {
        const courAmount_query = `UPDATE comptes SET courant=? WHERE user=?`;
        const values = [
            amount, user
        ]
        client.query(courAmount_query, [values], cb);
    },
    modifyEpargne: (amount, user, cb) => {
        const spareAmount_query = `UPDATE comptes SET courant=? WHERE user=?`;
        const values = [
            amount, user
        ]
        client.query(spareAmount_query, [values], cb);
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