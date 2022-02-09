const express = require('express')
var cors = require('cors')
const app = express()
const bodyParser = require('body-parser')
require('dotenv').load()
const port = process.env.PORT || 3001

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

app.use(function (req, res, next) {

  // Website you wish to allow to connect
  res.setHeader('Access-Control-Allow-Origin', '*');
  
  // Request methods you wish to allow
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

  // Request headers you wish to allow
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

  // Set to true if you need the website to include cookies in the requests sent
  // to the API (e.g. in case you use sessions)
  res.setHeader('Access-Control-Allow-Credentials', true);

  // Pass to next layer of middleware
  next();
});
let routes = require('./api/routes') //importing route
routes(app)

// app.use(function(req, res, next) {
//      res.status(404).send({url: req.originalUrl + ' not found'})
//      res.header('Cross-Origin-Resource-Policy','cross-origin')
//     //  res.setHeader('Access-Control-Allow-Origin', '*');
//     //  req.header('Access-Control-Allow-Origin', '*');
//     // // res.setHeader('Access-Control-Allow-Headers', 'Origin, Accept, Accept-  Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version, X-Response-Time, X-PINGOTHER, X-CSRF-Token,Authorization');
//     // // res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
//     // res.header("Access-Control-Allow-Origin", "*");
//     // res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//     req.header('Access-Control-Allow-Origin','*')
//     res.setHeader('Access-Control-Allow-Origin:*');
//     res.setHeader('Access-Control-Allow-Origin','*');
//     res.setHeader('Access-Control-Allow-Methods','GET, POST, OPTIONS, PUT, PATCH, DELETE');
//     res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
//     res.setHeader('Access-Control-Allow-Credentials', true);
//     next()
// })

app.use(cors())

app.listen(port)

console.log('RESTful API server started on: ' + port)
