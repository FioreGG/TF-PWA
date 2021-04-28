const Joi = require('@hapi/joi');

const schemas = {
    create: Joi.object().keys({
        nombre_paciente: Joi.string().required(),
        apellido_paciente: Joi.string().required(),
        tratamiento: Joi.string().required(),
        dx: Joi.string().required(),
        id_medico: Joi.number().min(1).max(35).required(),
    }),
    update: Joi.object().keys({
        nombre_paciente: Joi.string().required(),
        apellido_paciente: Joi.string().required(),
        tratamiento: Joi.string().required(),
        dx: Joi.string().required(),
        id_medico: Joi.number().min(1).max(35).required(),
    }),
}

module.exports = {schemas}