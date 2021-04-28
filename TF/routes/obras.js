const express = require ('express');
const model = require('./../models/personal_centro');
const router = express.Router();


// const get = (req, res) => {
//     res.render('obras');
// }

const obras_sociales= async(req, res) => {

   const obras_sociales = await model.ObraSocial();
   //console.log(obras_sociales);
   res.render('obras', {obras_sociales});      
}

// router.get('/', get);

//router.get('/', get);
router.get('/', obras_sociales);



module.exports = router;

