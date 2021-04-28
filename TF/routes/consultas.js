const express = require ('express');
const { verifyUpdateConsulta, verifyConsulta } = require('../midlewares/Consulta');
const model = require('./../models/personal_centro');
const router = express.Router();


const consultas= async (req, res) => {
    const consultas = await model.consultas();
    //console.log(consultas);
    res.render('consultas', {consultas});      
}

const single = async (req, res) => {
    const id = req.params.id;
    const consulta = await model.single(id);
    //console.log(consulta);
    res.render('consulta', {consulta});
}

const newConsulta = async (req, res) => {
    const obj = req.body;
    console.log(obj);
    const NuevaConsulta = await model.newCons(obj);
    console.log(NuevaConsulta);
    res.redirect('/consultas');
}

const getUpdate = async (req, res) => {
    const id = req.params.id;
    const consulta = await model.singleConsulta(id);
    res.render('modificar_consulta', {consulta});
}

const updateConsulta = async(req,res) => {
    const id = req.params.id;
    const consultaMod= req.body;
    console.log(consultaMod);
    const consultaM = await model.update(id, consultaMod);
    res.redirect('/consultas');
}

const deshabilitar = async (req, res) => {
    const id = req.params.id;
    const borrado = await model.eliminar(id);
    res.redirect('/consultas');
}

// Recupero de consulta "eliminada"

const recuperar = async (req, res) => {
    const id =req.params.id;
    const recuperado = await model.recuperar(id);
    res.redirect('/consultas');
}


const consultasBorradas = async(req, res) => {
    const obj = req.body;
    const consultasEliminadas = await model.borrados(obj);
    res.render('consultas_eliminadas', {consultasEliminadas});
}





router.get('/', consultas);
router.get('/single/:id', single);
router.get('/create', (req,res) => res.render('cargar_consulta'));
router.post('/create',verifyConsulta, newConsulta);
router.get('/update/:id', getUpdate);
router.post('/update/:id',verifyUpdateConsulta, updateConsulta);
router.get('/delete/:id', deshabilitar);
router.get('/disabled/:id', recuperar);
router.get('/disabled', consultasBorradas);



module.exports = router;



 
 
