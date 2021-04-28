const express = require ('express');
const router = express.Router();


const get = (req, res) => {
    res.render('cartilla');
}

router.get('/', get);

module.exports = router;