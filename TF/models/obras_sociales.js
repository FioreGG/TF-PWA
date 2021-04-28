const pool = require("./../utils/bd"); 
TABLA_OBRAS = "obras_sociales";

const all = async () => {
    const query = "SELECT obras.nombre_obra, obras.habilitado, obras.id FROM ?? as obras WHERE obras.habilitado = true";
    const params = [TABLA_OBRAS];
    const rows = await pool.query(query, params);
    return rows;
} 

module.exports = {all};