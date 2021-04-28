const Joi = require('@hapi/joi');

const schemas = {
    create: Joi.object().keys({
        nombre: Joi.string().required(),
        apellido: Joi.string().required(),
        dni: Joi.number().required(),
        fecha_de_nacimiento: Joi.date().required(),
        edad: Joi.number().required(),
        obra_social: Joi.number().required(), 
    }),
  
}

module.exports = {schemas}