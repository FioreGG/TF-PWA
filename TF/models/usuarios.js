const pool = require("./../utils/bd"); 
const TABLA_USUARIOS = "personal_centro"


const create = async (obj) => {
    const query = 'INSERT INTO ?? SET ?';
    const params = [TABLA_USUARIOS, obj];
    const rows = await pool.query(query, params);
    return rows;
}

const usuarios = async () => {
    const query = "SELECT * FROM ?? WHERE habilitado = true";
    const params = [TABLA_USUARIOS];
    const rows = await pool.query(query, params);
    console.log(rows);
    return rows;
}


const singleConsulta = async (id) => {
    const query = "SELECT * FROM ?? WHERE id = ?";
    const params = [TABLA_USUARIOS, id];
    const rows = await pool.query (query, params);
    //console.log(rows);
    return rows;
}


const update = async(obj, id) => {
    const query = "UPDATE ?? as us SET ? WHERE us.id = ?";
    const params = [TABLA_USUARIOS, obj, id];
    const rows = await pool.query(query,params);
    //console.log(rows);
    return rows;
}

const eliminar = async(id) => {
    const query = 'UPDATE ?? as us SET habilitado = false WHERE us.id = ?';
    const params = [TABLA_USUARIOS, id];
    return await pool.query(query, params);
}

const borrados = async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = false";
    const params = [TABLA_USUARIOS, obj];
    const rows = await pool.query(query, params)
    console.log(rows);
    return rows ;
}

const recuperar = async (id) => {
    const query = 'UPDATE ?? AS us SET habilitado = true WHERE us.id = ?';
    const params = [TABLA_USUARIOS, id];
    const rows = await pool.query(query, params);
    //console.log(rows);
    return rows;
}


module.exports = {create, usuarios, update, singleConsulta, eliminar, borrados, recuperar};