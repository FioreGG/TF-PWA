const express = require ('express');
const model = require('../models/usuarios');
const router = express.Router();
const sha1 = require ('sha1');
const { verifyUsuario, verifyUpdateUsuario } = require('../midlewares/Usuarios');


const all = async (req, res) => {
    var usuarios = await model.usuarios();
    res.render('usuarios', {usuarios});
}

const create = async (req, res) => {
    req.body.pass = sha1(req.body.pass);
    const newLogin = req.body;
    console.log(newLogin)
    var newUsuario = await model.create(newLogin);
    res.redirect('/usuarios');
}

const getUpdate = async (req, res) => {
    const id = req.params.id;
    const usuario = await model.singleConsulta(id);
    //console.log(usuario);
    res.render('modificar_usuario', {usuario});
}


const updateUsuario = async (req,res) => {
    req.body.pass = sha1(req.body.pass);
    const id = req.params.id;
    const UpdateUser= req.body;
    //console.log(UpdateUser);
    const UserModificado = await model.update(UpdateUser, id);
    res.redirect('/usuarios');
}

const deshabilitar = async (req, res) => {
    const id = req.params.id;
    const borrado = await model.eliminar(id);
    res.redirect('/usuarios');
}

// Recupero de consulta "eliminada"

const recuperar = async (req, res) => {
    const id =req.params.id;
    const recuperado = await model.recuperar(id);
    res.redirect('/usuarios');
}


const UsuariosBorrados = async(req, res) => {
    const obj = req.body;
    const UsuariosEliminados = await model.borrados(obj);
    res.render('usuarios_eliminados', {UsuariosEliminados});
}



router.get('/', all);
router.get('/create',(req,res) => res.render('nuevo_usuario'));
router.post('/create',verifyUsuario, create);
router.get('/update/:id', getUpdate);
router.post('/update/:id',verifyUpdateUsuario, updateUsuario)
router.get('/delete/:id', deshabilitar);
router.get('/disabled/:id', recuperar);
router.get('/disabled', UsuariosBorrados);

module.exports = router;