const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getListProduct(){
  const rows = await db.query(
    `select * from tbl_category`, 
  );
  const data = helper.emptyOrRows(rows);
  return {
    data
  }
}

module.exports = {
    getListProduct
}