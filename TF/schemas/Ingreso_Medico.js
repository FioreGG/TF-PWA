const Joi = require('@hapi/joi');

const schemas = {
    create: Joi.object().keys({
        nombre: Joi.string().required(),
        apellido: Joi.string().required(),
        edad: Joi.number().required(),
        fecha_de_nacimiento: Joi.date().required(),
        especialidad: Joi.number().min(1).max(20).required(),
        antiguedad: Joi.number().required(), 
    }),
    update: Joi.object().keys({
        nombre: Joi.string().required(),
        apellido: Joi.string().required(),
        edad: Joi.number().required(),
        fecha_de_nacimiento: Joi.date().required(),
        especialidad: Joi.number().min(1).max(20).required(),
        antiguedad: Joi.number().required(), 
    }),
  
}

module.exports = {schemas}