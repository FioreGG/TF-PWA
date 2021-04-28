const Joi = require('@hapi/joi');

const schemas = {
    create: Joi.object().keys({
        email: Joi.string().required(),
        name: Joi.string().required(),
        message: Joi.string().min(3).max(255).required(),
    }),
  
}

module.exports = {schemas}