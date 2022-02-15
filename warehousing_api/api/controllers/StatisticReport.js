'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../db')

const table = 'products'

module.exports = {
    Im_Ex_report: (req, res) => {
        let sql = 'SELECT re.product_name,COALESCE(SUM(re.quantity),0) as tongNhap,COALESCE(SUM(ex.quantity),0) as tongXuat from tbl_reciept_detail as re LEFT JOIN tbl_export_slip_detail as ex ON re.product_name = ex.product_name GROUP BY product_name'
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