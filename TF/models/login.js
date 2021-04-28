const pool = require ("./../utils/bd");
const TABLA_PERSONAL = 'personal_centro'; 

const auth = async ({user, pass}) => {
    const query = 'SELECT id, admin FROM ?? WHERE user = ? AND pass = ?';
    const params = [TABLA_PERSONAL, user, pass];
    const rows = await pool.query(query, params);
    return rows;
    console.log(rows);
}

module.exports = {auth};