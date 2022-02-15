'use strict';
module.exports = function(app) {
  var CategoryCtrl = require('./controllers/CategoryController');
  var UnitCtrl = require('./controllers/UnitController');
  var SupplierCtrl = require('./controllers/SupplierController');
  var ProductCtrl = require('./controllers/ProductsController');
  var RecieptCtrl = require('./controllers/RecieptController');
  var ExportCtrl = require('./controllers/ExportSlipController');
  var ReportCtrl = require('./controllers/StatisticReport');

  // Report Routes
  app.route('/report1')
    .get(ReportCtrl.Im_Ex_report);
    
  // Category List Routes
  app.route('/products')
    .get(CategoryCtrl.get)
    .post(CategoryCtrl.store);


  app.route('/products/:productId')
    .get(CategoryCtrl.detail)
    .put(CategoryCtrl.update)
    .delete(CategoryCtrl.delete);

  // Unit list route
  app.route('/units')
    .get(UnitCtrl.get)
    .post(UnitCtrl.store);

    app.route('/units/:unitsId')
    .get(UnitCtrl.detail)
    .put(UnitCtrl.update)
    .delete(UnitCtrl.delete);

  // Supplier list route
  app.route('/supplier')
    .get(SupplierCtrl.get)
    .post(SupplierCtrl.store);

    app.route('/supplier/:Id')
    .get(SupplierCtrl.detail)
    .put(SupplierCtrl.update)
    .delete(SupplierCtrl.delete);

  // Products list route
  app.route('/product')
    .get(ProductCtrl.get)
    .post(ProductCtrl.store);

    app.route('/product/:Id')
    .get(ProductCtrl.detail)
    .put(ProductCtrl.update)
    .delete(ProductCtrl.delete);
  
  // Receipt list route
  app.route('/receipt')
    .get(RecieptCtrl.get)
    .post(RecieptCtrl.store);
  app.route('/receipt/ProductList')
    .get(RecieptCtrl.getProductImportList);
    

    app.route('/receipt/:Id')
    .get(RecieptCtrl.detail)
    .put(RecieptCtrl.update)
    .delete(RecieptCtrl.delete);

    app.route('/receiptDetail/:Id')
    .delete(RecieptCtrl.delete_detail);

  app.route('/receipt/detail/:Id')
    .get(RecieptCtrl.reciept_detail);

  app.route('/receipt/detail')
    .post(RecieptCtrl.store_detail);

  // Export list route
  app.route('/export')
    .get(ExportCtrl.get)
    .post(ExportCtrl.store);
  app.route('/Export/ProductList')
    .get(ExportCtrl.getProductExportList);

    app.route('/export/:Id')
    .get(ExportCtrl.detail)
    .put(ExportCtrl.update)
    .delete(ExportCtrl.delete);
    
    app.route('/exportDetail/:Id')
    .delete(ExportCtrl.delete_detail);

  app.route('/export/detail/:Id')
    .get(ExportCtrl.reciept_detail);

  app.route('/export/detail')
    .post(ExportCtrl.store_detail);
};
