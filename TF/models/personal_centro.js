const pool = require("./../utils/bd"); 
const TABLA_PERSONAL = "personal_centro";
const TABLA_PACIENTES = "pacientes";
const TABLA_CONSULTAS= "consultas";
const TABLA_MEDICOS = "medicos";
const TABLA_OBRAS_SOCIALES = "obras_sociales";
const TABLA_SUGERENCIAS = "sugerencias";


const create = async (obj) => {
    const query = 'INSERT INTO ?? SET ?';
    const params = [TABLA_PACIENTES, obj];
    const rows = await pool.query(query, params);
    return rows;
}

const ObraSocial= async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = true";
    const params = [TABLA_OBRAS_SOCIALES, obj];
    const rows = await pool.query(query, params);
    //console.log(rows); 
    return rows;
}   

const consultas = async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = true";
    const params = [TABLA_CONSULTAS, obj];
    const rows = await pool.query(query, params);
    console.log(rows); 
    return rows;
} 

const single = async (id) => {
    const query = "SELECT cons.id, cons.nombre_paciente, cons.apellido_paciente, cons.dx, cons.tratamiento, med.nombre, med.apellido FROM ?? as cons INNER JOIN ?? as med ON cons.id_medico = med.id WHERE cons.id = ? AND cons.habilitado = true";
    const params = [TABLA_CONSULTAS,TABLA_MEDICOS, id];
    const rows = await pool.query (query, params);
    //console.log(rows);
    return rows;
}

const newCons = async (obj) => {
    const query = 'INSERT INTO ?? SET ?';
    const params = [TABLA_CONSULTAS, obj];
    const rows = await pool.query(query, params);
    console.log(rows);
    return rows;
}

const update = async(id, obj) => {
    const query = `UPDATE ?? AS cons SET ? WHERE cons.id = ?`;
    const params = [TABLA_CONSULTAS, obj, id];
    const rows = await pool.query(query,params);
    return rows;
}


const singleConsulta = async (id) => {
    const query = "SELECT cons.id, cons.nombre_paciente, cons.apellido_paciente, cons.dx, cons.tratamiento, cons.id_medico, med.nombre, med.apellido FROM ?? as cons INNER JOIN ?? as med ON cons.id_medico = med.id WHERE cons.id = ? AND cons.habilitado = true";
    const params = [TABLA_CONSULTAS,TABLA_MEDICOS, id];
    const rows = await pool.query (query, params);
    console.log(rows);
    return rows;
}

const eliminar = async(id) => {
    const query = 'UPDATE ?? as cons SET habilitado = false WHERE cons.id = ?';
    const params = [TABLA_CONSULTAS, id];
    return await pool.query(query, params);
}

const borrados = async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = false";
    const params = [TABLA_CONSULTAS, obj];
    const rows = await pool.query(query, params)
    //console.log(rows);
    return rows ;
}

const recuperar = async (id) => {
    const query = 'UPDATE ?? AS cons SET habilitado = true WHERE cons.id = ?';
    const params = [TABLA_CONSULTAS, id];
    const rows = await pool.query(query, params);
    console.log(rows);
    return rows;
}

const createSugerencia = async (obj) => {
    const query = 'INSERT INTO ?? SET ?';
    const params = [TABLA_SUGERENCIAS, obj];
    const rows = await pool.query(query, params);
    console.log(rows);
    return rows;
}


module.exports = {create, createSugerencia, ObraSocial, consultas, single, newCons, update, singleConsulta, eliminar, borrados, recuperar};