const { schemas } = require('../schemas/Ingreso_Medico');

const verifyMedico = (req, res, next) => {
    const {error, value} = schemas.create.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}
const verifyUpdateMedico = (req, res, next) => {
    const {error, value} = schemas.update.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}

module.exports = {verifyMedico, verifyUpdateMedico};