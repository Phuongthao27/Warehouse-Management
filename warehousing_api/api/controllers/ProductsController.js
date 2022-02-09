'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../db')

const table = 'products'

module.exports = {
    get: (req, res) => {
        let sql = 'SELECT product_id,name,creater,price_import,retail_price,selling_price,category_name,unit_name,quantily,state FROM tbl_product, tbl_category,tbl_unit WHERE tbl_product.category_id = tbl_category.id AND tbl_product.unit_id = tbl_unit.unit_id'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_product WHERE product_id = ?'
        db.query(sql, [req.params.productId], (err, response) => {
            if (err) throw err
            res.json(response[0])
        })
    },
    update: (req, res) => {
        let data = req.body;
        let productId = req.params.productId;
        let sql = 'UPDATE tbl_product SET ? WHERE product_id = ?'
        db.query(sql, [data, productId], (err, response) => {
            if (err) throw err
            res.json({message: 'Update success!'})
        })
    },
    store: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_product SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    delete: (req, res) => {
        let sql = 'DELETE FROM tbl_product WHERE product_id = ?'
        db.query(sql, [req.params.productId], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    }
}