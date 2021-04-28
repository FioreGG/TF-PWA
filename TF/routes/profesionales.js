const express = require ('express');
const model = require('./../models/profesionales');
const router = express.Router();
const multer = require ('multer');
const config = {dest: `./public/tmp`};
const upload = multer(config);
const service = require ('./../services/medicos');
const { verifyMedico, verifyUpdateMedico } = require('../midlewares/Ingreso_Medico');

const getAll = async (req, res) => {
    const profesionales = await model.all();
    //console.log(profesionales);
    res.render('profesionales', {profesionales});      
}

const single = async (req, res) => {
    const id = req.params.id;
    const profesional = await model.single(id);
    //console.log(profesional);
    res.render('profesional', {profesional});
}

const newDoctor = async (req, res) => {
    const idFile = await service.createDoctor(req.body, req.file);
    res.redirect('/profesionales');
}


const getUpdate = async (req, res) => {
    const id = req.params.id;
    const doctor = await model.singleConsulta(id);
    res.render('modificar_medico', {doctor});
}

const UpdateDoctor = async(req,res) => {
    const id = req.params.id;
    const DoctorAct = req.body;
    console.log(DoctorAct);
    const DoctorModif = await model.update(id, DoctorAct);
    res.redirect('/profesionales');
}




const deshabilitar = async (req, res) => {
    const id = req.params.id;
    const borrado = await model.eliminar(id);
    res.redirect('/profesionales');
}

// Recupero de consulta "eliminada"

const recuperar = async (req, res) => {
    const id =req.params.id;
    const recuperado = await model.recuperar(id);
    res.redirect('/profesionales');
}


const medicosBorrados = async(req, res) => {
    const obj = req.body;
    const MedicosEliminados = await model.borrados(obj);
    res.render('medicos_eliminados', {MedicosEliminados});
}




router.get('/', getAll)
router.get('/single/:id', single);
router.get('/create', (req,res) => res.render('nuevo_medico'));
router.post('/create',verifyMedico, upload.single("imagen"), newDoctor);
router.post('/update/:id',verifyUpdateMedico, UpdateDoctor);
router.get('/update/:id', getUpdate);
router.get('/delete/:id', deshabilitar);
router.get('/disabled/:id', recuperar);
router.get('/disabled', medicosBorrados);

module.exports = router;