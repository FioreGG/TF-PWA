const express = require ('express');
const router = express.Router();


const get = (req, res) => {
    res.render('Acceso_Adm');
}

router.get('/', get);

module.exports = router;