const { schemas } = require('../schemas/Usuarios');

const verifyUsuario = (req, res, next) => {
    const {error, value} = schemas.create.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}
const verifyUpdateUsuario = (req, res, next) => {
    const {error, value} = schemas.update.validate(req.body);
    error ? res.status(422).json({error : error.details[0].message}) : next();
}

module.exports = {verifyUsuario, verifyUpdateUsuario};