'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../db')

const table = 'products'

module.exports = {
    get: (req, res) => {
        let sql = 'SELECT * FROM tbl_receipt'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    getProductImportList: (req, res) => {
        let sql = 'SELECT product_name,suppplier, unit, SUM(quantity) as tongsl ,SUM(price) as tongprice from tbl_reciept_detail GROUP BY product_name'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_receipt WHERE id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json(response[0])
        })
    },
    reciept_detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_reciept_detail WHERE receipt_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    update: (req, res) => {
        let data = req.body;
        let Id = req.params.Id;
        let sql = 'UPDATE tbl_receipt SET ? WHERE id = ?'
        db.query(sql, [data, Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Update success!'})
        })
    },
    store: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_receipt SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    store_detail: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_reciept_detail SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    delete: (req, res) => {
        let sql = 'DELETE FROM tbl_receipt WHERE order_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    },
    delete_detail: (req, res) => {
        let sql = 'DELETE FROM tbl_reciept_detail WHERE receipt_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    },
   
}