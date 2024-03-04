const client = require("../database");

const comptesDataMapper = {
    //getter
    getCourant: (user, cb) => {
        const courAmount_query = `SELECT courant FROM comptes WHERE user_id=?`;
        const queryUser= user;

        client.query(courAmount_query, [queryUser], cb);
    },
    getEpargne: (user, cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes WHERE user_id=?`;
        const queryUser= user;

        client.query(spareAmount_query, [queryUser], cb);
    },
    getUserComptes: (user, cb) => {
        const spareAmount_query = `SELECT * FROM comptes WHERE user_id=? ORDER BY atTime ASC`;
        const queryUser= user;

        client.query(spareAmount_query, [queryUser], cb);
    },
    getAllComptes: (cb) => {
        const spareAmount_query = `SELECT * FROM comptes ORDER BY atTime;`;
        client.query(spareAmount_query, cb);
    },
    getAllCourant: (cb) => {
        const courAmount_query = 'SELECT courant FROM comptes';
        client.query(courAmount_query, cb);
    },
    getAllEpargne: (cb) => {
        const spareAmount_query = `SELECT epargne FROM comptes`;
        client.query(spareAmount_query, cb);
    },
    getLastComptes: (user, cb) => {
        const sql = 'SELECT courant, epargne FROM comptes WHERE user_id =? ORDER BY id DESC LIMIT 1'
        const queryUser = user;
        client.query(sql, [queryUser], cb);
    },
    //poster
    setComptes: (user, amount, epargne, cb) => {
        // amount2,
        const courAmount_query = `INSERT INTO comptes (courant, epargne, user_id, atTime) VALUES (?)`;
        const today = new Date();

        const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();

        const values = [
            amount, epargne, user, date
        ]
        client.query(courAmount_query, [values], cb);
    },
    // setEpargne: (user, amount, cb) => {
    //     const spareAmount_query = `INSERT INTO comptes (epargne, courant, user, atTime) VALUES (?)`;
    //     const today = new Date();

    //     const date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
    //     const epargne = this.getCourant(user, (res) => {
    //         return res[res.length - 1].courant;
    //     })
    //     const values = [
    //         amount, epargne, user, date
    //     ]
    //     client.query(spareAmount_query, [values], cb);
    // },
    //puter
    modifyCourant: (id, amount, cb) => {
        const courAmount_query = 'UPDATE comptes SET courant =? WHERE id =?';
        
        console.log(amount + ' ' + id)
        client.query(courAmount_query, [amount, id], cb);
    },
    modifyEpargne: (id, amount, cb) => {
        const spareAmount_query = 'UPDATE comptes SET epargne =? WHERE id =?';
        
        console.log(amount + ' ' + id)
        client.query(spareAmount_query, [amount, id], cb);
    }
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