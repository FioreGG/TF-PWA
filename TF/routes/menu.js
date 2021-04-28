const express = require ('express');
const { verifySugerencia } = require('../midlewares/sugerencia');
const router = express.Router();
const model = require('./../models/personal_centro');


const get = (req, res) => {
    res.render('index');
}


const newSugerencia = async (req, res) => {
    const obj = req.body;
    console.log(obj);
    const NuevaSug = await model.createSugerencia(obj);
    console.log(NuevaSug);
    res.redirect('/menu');
}




router.get('/', get);
router.post('/create',verifySugerencia, newSugerencia);

module.exports = router;