const { schemas } = require('../schemas/Consulta');

const verifyConsulta = (req, res, next) => {
    const {error, value} = schemas.create.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}
const verifyUpdateConsulta = (req, res, next) => {
    const {error, value} = schemas.update.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}

module.exports = {verifyConsulta, verifyUpdateConsulta};