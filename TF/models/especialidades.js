const pool = require("./../utils/bd"); 
const TABLA_ESPECIALIDADES = "especialidades_medicas";

const all = async (obj) => {
    const query = "SELECT * FROM ?? WHERE habilitado = true";
    const params = [TABLA_ESPECIALIDADES, obj];
    const rows = await pool.query(query, params);
    console.log(rows);
    return rows;
}


module.exports= {all};