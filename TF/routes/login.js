const express = require ('express');
const router = express.Router();
const {auth} = require ("./../models/login");
const sha1 = require('sha1');
const { verifyLogin } = require('../midlewares/login');


const get = (req, res) => {
    res.render('login');
}

const login = async(req, res) => {
    try{
    req.body.pass = sha1(req.body["pass"]);
    var obj = req.body;
    console.log(obj);
    var result = await auth(obj);
    console.log(result);
    if(result.length === 0){
        res.redirect('/login');
    }

    const [{id, admin}] = result
    console.log(id, admin);
    req.session.idUser = id; 
    req.session.admin = admin;

    res.redirect('/administrador');
}
    catch(e){
    console.log(e);
}
}


router.get('/', get);
router.post('/',verifyLogin, login);




module.exports = router;


