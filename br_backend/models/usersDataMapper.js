const client = require("../database");

const usersDataMapper = {

    registerUser: (email, pass, cb) => {
        const query = `INSERT INTO users (email, pass) VALUES (?)`;
        console.log(query);
        const values = [
            email, pass
        ]
        client.query(query, [values], cb);
    },
    loginUser: (email, cb) => {
        const query = `SELECT * FROM users WHERE email=?`;
        const values = email;
        client.query(query, [values], cb);
    },
   
}

module.exports = usersDataMapper;