const usersDataMapper = require("../models/usersDataMapper");

const usersController = {

    register: async (req, res) => {
        console.log(req.body);
        try {
            const user = req.body;
            usersDataMapper.registerUser(user.email, user.password, (err, response) => {
                res.status(200).json({"email" : user.email, "password" : user.password})
            })
        } catch (error) {
            res.status(500).json(`${error}`)
        }
    },
    login: async (req, res) => {
        try {
            const user = req.body;
            usersDataMapper.loginUser(user.email, (err, response) => {
                try {
                    console.log(response[0]);
                    if (response[0].pass == user.password) {
                        res.status(200).json({"id" : response[0].id, "email" : user.email, "password" : user.password})
                    } else {
                        res.status(403).json({"Forbidden" : "Invalid credentials !"})
                    }
                } catch (error) {
                    res.status(500).json(`${error}`)
                }
            })
        } catch (error) {
            res.status(500).json(`${error}`)
        }
    },
    // getAllUsers: async (req, res) => {

    // }
}

module.exports = usersController;