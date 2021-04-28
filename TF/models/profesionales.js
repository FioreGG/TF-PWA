const { response } = require("express");
const pool = require("./../utils/bd"); 
TABLA_PROFESIONALES = "medicos";
TABLA_ESPECIALIDADES = "especialidades_medicas";
T_PROFESIONALES_IMG = "medicos_imagenes";

const all = async (obj) => {
    const query = "SELECT prof.*, prof_img.uid FROM ?? as prof JOIN ?? as prof_img ON prof.id = prof_img.idMedicos WHERE prof.habilitado = true";
    const params = [TABLA_PROFESIONALES, T_PROFESIONALES_IMG, obj];
    const rows = await pool.query(query, params);
    //console.log(rows); 
    return rows;
} 

const single = async (id) => {
    const query = "SELECT prof.id, prof.edad, prof.nombre, prof.apellido, prof.fecha_de_nacimiento, prof.especialidad, prof.habilitado, prof.antiguedad, esp.especialidad_medica FROM ?? as prof INNER JOIN ?? as esp ON prof.especialidad = esp.id WHERE prof.id = ? AND prof.habilitado = true";
    const params = [TABLA_PROFESIONALES,TABLA_ESPECIALIDADES, id];
    const rows = await pool.query (query, params);
    //console.log(rows);
    return rows;
}

const newdoctor = async (obj) => {
    const query = 'INSERT INTO ?? SET ?';
    const params = [TABLA_PROFESIONALES, obj];
    const rows = await pool.query(query, params);
    //console.log(rows);
    return rows;
}

const createImg = async (obj) => {
    const query = "INSERT ?? SET ?";
    const params = [T_PROFESIONALES_IMG, obj];
    const rows = await pool.query(query, params);
    //console.log(rows);
    return rows;
}

const singleConsulta = async (id) => {
    const query = `SELECT prof.*, esp.especialidad_medica  FROM ?? as prof JOIN ?? as esp ON prof.especialidad = esp.id WHERE prof.id = ? AND prof.habilitado = true`;
    const params = [TABLA_PROFESIONALES, TABLA_ESPECIALIDADES, id];
    const rows = await pool.query (query, params);
   // console.log(rows);
    return rows;
}

const update = async(id, obj) => {
    const query = `UPDATE ?? AS prof SET ? WHERE prof.id = ?`;
    const params = [TABLA_PROFESIONALES, obj, id];
    const rows = await pool.query(query,params);
    return rows;
}

const eliminar = async(id) => {
    const query = 'UPDATE ?? as prof SET habilitado = false WHERE prof.id = ?';
    const params = [TABLA_PROFESIONALES, id];
    return await pool.query(query, params);
}

const borrados = async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = false";
    const params = [TABLA_PROFESIONALES, obj];
    const rows = await pool.query(query, params);
    return rows ;
}

const recuperar = async (id) => {
    const query = 'UPDATE ?? AS prof SET habilitado = true WHERE prof.id = ?';
    const params = [TABLA_PROFESIONALES, id];
    const rows = await pool.query(query, params);
    return rows;
}


module.exports = {all, single, newdoctor, update, singleConsulta, eliminar, borrados, recuperar, createImg};