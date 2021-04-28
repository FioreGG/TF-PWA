const express = require ('express');
const { verifyNewPaciente } = require('../midlewares/Paciente');
const model = require('../models/personal_centro');
const router = express.Router();
const {all} =require('./../models/obras_sociales');


const get = (req, res) => {
    res.render('nuevo_paciente');
}

const create = async(req, res) => {
    const obj = req.body;
    console.log(obj)
    const NewPaciente = await model.create(obj)
    console.log(NewPaciente);
    res.redirect('/administrador'); 
}




router.get('/', get);
router.post('/create',verifyNewPaciente, create);





module.exports = router;








