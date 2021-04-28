const express = require ('express');
const model = require('./../models/especialidades');
const router = express.Router();


const get = async (req, res) => {
    const especialidades = await model.all();
    res.render('especialidades', {especialidades});
}


router.get('/', get);



module.exports = router;