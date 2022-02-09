'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../db')

const table = 'products'

module.exports = {
    get: (req, res) => {
        let sql = 'SELECT * FROM tbl_supplier'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_supplier WHERE supplier_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json(response[0])
        })
    },
    update: (req, res) => {
        let data = req.body;
        let Id = req.params.productId;
        let sql = 'UPDATE tbl_supplier SET ? WHERE supplier_id = ?'
        db.query(sql, [data, Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Update success!'})
        })
    },
    store: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_supplier SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    delete: (req, res) => {
        let sql = 'DELETE FROM tbl_supplier WHERE supplier_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    }
}