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

 Date: 16/01/2022 11:23:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for programming_languages
-- ----------------------------
DROP TABLE IF EXISTS `programming_languages`;
CREATE TABLE `programming_languages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `released_year` int(11) NOT NULL,
  `githut_rank` int(11) NULL DEFAULT NULL,
  `pypl_rank` int(11) NULL DEFAULT NULL,
  `tiobe_rank` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of programming_languages
-- ----------------------------
INSERT INTO `programming_languages` VALUES (1, 'JavaScript', 1995, 1, 3, 7, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (2, 'Python', 1991, 2, 1, 3, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (3, 'Java', 1995, 3, 2, 2, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (4, 'TypeScript', 2012, 7, 10, 42, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (5, 'C#', 2000, 9, 4, 5, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (6, 'PHP', 1995, 8, 6, 8, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (7, 'C++', 1985, 5, 5, 4, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (8, 'C', 1972, 10, 5, 1, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (9, 'Ruby', 1995, 6, 15, 15, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (10, 'R', 1993, 33, 7, 9, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (11, 'Objective-C', 1984, 18, 8, 18, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (12, 'Swift', 2015, 16, 9, 13, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (13, 'Kotlin', 2011, 15, 12, 40, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (14, 'Go', 2009, 4, 13, 14, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (15, 'Rust', 2010, 14, 16, 26, '2022-01-15 16:40:43', '2022-01-15 16:40:43');
INSERT INTO `programming_languages` VALUES (16, 'Scala', 2004, 11, 17, 34, '2022-01-15 16:40:43', '2022-01-15 16:40:43');

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `create_update` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES (1, 'đồ gia dụng', NULL, NULL);

-- ----------------------------
-- Table structure for tbl_export_slip
-- ----------------------------
DROP TABLE IF EXISTS `tbl_export_slip`;
CREATE TABLE `tbl_export_slip`  (
  `id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_export_slip
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_export_slip_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_export_slip_detail`;
CREATE TABLE `tbl_export_slip_detail`  (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `rice` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `unit_id` int(11) NULL DEFAULT NULL,
  `production-date` int(11) NULL DEFAULT NULL,
  `expiration_date` datetime(0) NULL DEFAULT NULL,
  `total_price` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_export_slip_detail
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_receipt
-- ----------------------------
DROP TABLE IF EXISTS `tbl_receipt`;
CREATE TABLE `tbl_receipt`  (
  `order_id` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `creater` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_reciept_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reciept_detail`;
CREATE TABLE `tbl_reciept_detail`  (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `suppplier_id` int(11) NOT NULL,
  `price` float NULL DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `production-date` datetime(0) NULL DEFAULT NULL,
  `expiration_date` datetime(0) NULL DEFAULT NULL,
  `total_price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_reciept_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE `tbl_supplier`  (
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_unit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_unit`;
CREATE TABLE `tbl_unit`  (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_unit
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_warehouse_data
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
