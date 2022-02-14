/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3360
 Source Schema         : warehousing

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 15/02/2022 05:53:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_update` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
BEGIN;
INSERT INTO `tbl_category` VALUES (1, 'Dầu ăn', '3/22/2022', '2/28/2022'), (7, 'Bột ngọt', '2/22/2022', '2/22/2022'), (8, 'Mì ba miền', '6/8/2022', '6/8/2022'), (11, 'sdsad', '2022-02-09', '2022-02-09'), (12, 'sdsad', '2022-02-09', '2022-02-09'), (13, 'cmm', '2022-02-09', '2022-02-09');
COMMIT;

-- ----------------------------
-- Table structure for tbl_export_slip
-- ----------------------------
DROP TABLE IF EXISTS `tbl_export_slip`;
CREATE TABLE `tbl_export_slip`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_export_slip
-- ----------------------------
BEGIN;
INSERT INTO `tbl_export_slip` VALUES ('Th01', 'sa', 'sad', 'sad', '2022-02-15');
COMMIT;

-- ----------------------------
-- Table structure for tbl_export_slip_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_export_slip_detail`;
CREATE TABLE `tbl_export_slip_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `suppplier` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `production_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `expiration_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total_price` float NULL DEFAULT NULL,
  `export_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_export_slip_detail
-- ----------------------------
BEGIN;
INSERT INTO `tbl_export_slip_detail` VALUES (7, 'Mì ăn liền hảo hảo', 'Hanayki', '25000', 'Hộp', '2022-02-22', '2022-02-25', 150000, 'Th01', 6);
COMMIT;

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price_import` float NULL DEFAULT NULL,
  `retail_price` float NULL DEFAULT NULL,
  `selling_price` float NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `quantily` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------
BEGIN;
INSERT INTO `tbl_product` VALUES (1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL), (2, 'Mì ăn liền hảo hảo', 'Thảonp', NULL, 3000, 3000, 8, 4, '2', '1'), (3, 'tên là thảo', 'sdf', 6000, 69000, 369996, 7, 3, '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for tbl_receipt
-- ----------------------------
DROP TABLE IF EXISTS `tbl_receipt`;
CREATE TABLE `tbl_receipt`  (
  `order_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_receipt
-- ----------------------------
BEGIN;
INSERT INTO `tbl_receipt` VALUES ('h123', 'dsds', 'Thảo', 'hhhhsadsa', '2022-02-14'), ('xzc', 'cxz', 'cxz', 'cxz', '2022-02-13');
COMMIT;

-- ----------------------------
-- Table structure for tbl_reciept_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reciept_detail`;
CREATE TABLE `tbl_reciept_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `suppplier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` float NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `production_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `expiration_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total_price` float NOT NULL,
  `receipt_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_reciept_detail
-- ----------------------------
BEGIN;
INSERT INTO `tbl_reciept_detail` VALUES (28, 'Mì ăn liền hảo hảo', 'Hanayki', 10000, 'Hộp', '2022-01-31', '2022-03-02', 30000, 'xzc', 3), (29, 'Mì ăn liền hảo hảo', 'Hanayki', 10000, 'Hộp', '2022-01-31', '2022-03-02', 30000, 'xzc', 3), (31, 'tên là thảo', 'Tosiba', 4000, 'Gói', '2022-02-20', '2022-03-11', 12000, 'h123', 3);
COMMIT;

-- ----------------------------
-- Table structure for tbl_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE `tbl_supplier`  (
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_supplier
-- ----------------------------
BEGIN;
INSERT INTO `tbl_supplier` VALUES (2, 'Tosiba'), (3, 'Hanayki');
COMMIT;

-- ----------------------------
-- Table structure for tbl_unit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_unit`;
CREATE TABLE `tbl_unit`  (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_unit
-- ----------------------------
BEGIN;
INSERT INTO `tbl_unit` VALUES (1, 'Gói'), (3, 'Hộp'), (4, 'Thùng');
COMMIT;

-- ----------------------------
-- Table structure for tbl_warehouse_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_warehouse_data`;
CREATE TABLE `tbl_warehouse_data`  (
  `product__id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product__id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_warehouse_data
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
