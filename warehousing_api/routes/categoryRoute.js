const express = require('express');
const router = express.Router();
const categoryService = require('../services/categoryService');

/* GET programming languages. */
router.get('/', async function(req, res, next) {
  try {
    res.json(await categoryService.getListProduct(req.query.page));
  } catch (err) {
    console.error(`Error while getting list category`, err.message);
    next(err);
  }
});

module.exports = router;