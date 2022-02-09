'use strict';
module.exports = function(app) {
  var CategoryCtrl = require('./controllers/CategoryController');
  var UnitCtrl = require('./controllers/UnitController');
  var SupplierCtrl = require('./controllers/SupplierController');
  var ProductCtrl = require('./controllers/ProductsController');

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
};
