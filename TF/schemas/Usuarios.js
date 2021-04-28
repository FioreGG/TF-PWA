const Joi = require('@hapi/joi');

const schemas = {
    create: Joi.object().keys({
        user: Joi.string().required(),
        pass: Joi.number().min(3).max(15).required(),
    }),
    update: Joi.object().keys({
        user: Joi.string().required(),
        pass: Joi.required(),
        admin: Joi.number().min(0).max(1).required(),
    }),
}

module.exports = {schemas}