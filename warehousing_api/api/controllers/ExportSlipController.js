'use strict'

const util = require('util')
const mysql = require('mysql')
const db = require('../db')

const table = 'products'

module.exports = {
    get: (req, res) => {
        let sql = 'SELECT * FROM tbl_export_slip'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    getProductExportList: (req, res) => {
        let sql = 'SELECT product_name,suppplier, unit, SUM(quantity) as tongsl ,SUM(price) as tongprice from tbl_export_slip_detail GROUP BY product_name'
        db.query(sql, (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_export_slip WHERE id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json(response[0])
        })
    },
    reciept_detail: (req, res) => {
        let sql = 'SELECT * FROM tbl_export_slip_detail WHERE export_id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json(response)
        })
    },
    update: (req, res) => {
        let data = req.body;
        let Id = req.params.Id;
        let sql = 'UPDATE tbl_export_slip SET ? WHERE id = ?'
        db.query(sql, [data, Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Update success!'})
        })
    },
    store: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_export_slip SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    store_detail: (req, res) => {
        let data = req.body;
        let sql = 'INSERT INTO tbl_export_slip_detail SET ?'
        db.query(sql, [data], (err, response) => {
            if (err) throw err
            res.json({message: 'Insert success!'})
        })
    },
    delete: (req, res) => {
        let sql = 'DELETE FROM tbl_export_slip WHERE id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    },
    delete_detail: (req, res) => {
        let sql = 'DELETE FROM tbl_export_slip_detail WHERE id = ?'
        db.query(sql, [req.params.Id], (err, response) => {
            if (err) throw err
            res.json({message: 'Delete success!'})
        })
    },
   
}