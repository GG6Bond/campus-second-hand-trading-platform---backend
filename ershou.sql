/*
 Navicat Premium Data Transfer

 Source Server         : lpz
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ershou

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 03/04/2023 17:05:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `follow_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`follow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (19, 1678257504560, 666);
INSERT INTO `follow` VALUES (56, 1678002663911, 666);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `product`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (1, 1678317405549, 666);
INSERT INTO `history` VALUES (2, 1678257843654, 666);
INSERT INTO `history` VALUES (3, 1678257843654, 1);
INSERT INTO `history` VALUES (4, 1678317405549, 1);
INSERT INTO `history` VALUES (5, 1678257504560, 1);
INSERT INTO `history` VALUES (6, 1678002663911, 1);
INSERT INTO `history` VALUES (7, 1678339026631, 1);
INSERT INTO `history` VALUES (8, 1678002663911, 666);
INSERT INTO `history` VALUES (9, 1678498888624, 666);
INSERT INTO `history` VALUES (10, 1678498807258, 666);
INSERT INTO `history` VALUES (11, 1678500051281, 666);
INSERT INTO `history` VALUES (12, 1678260423237, 666);
INSERT INTO `history` VALUES (13, 1678498888624, 1);
INSERT INTO `history` VALUES (14, 1678498807258, 1);
INSERT INTO `history` VALUES (15, 1678500051281, 1);
INSERT INTO `history` VALUES (16, 1678339476236, 1);
INSERT INTO `history` VALUES (20, 1678498807258, 1122);
INSERT INTO `history` VALUES (21, 1678498888624, 1122);
INSERT INTO `history` VALUES (22, 1678372027395, 1);
INSERT INTO `history` VALUES (23, 1678339026631, 666);
INSERT INTO `history` VALUES (24, 1678257504560, 666);
INSERT INTO `history` VALUES (25, 1678372027395, 666);
INSERT INTO `history` VALUES (26, 1678372027395, 1122);
INSERT INTO `history` VALUES (27, 1678260423237, 1122);
INSERT INTO `history` VALUES (28, 1680510319362, 1122);
INSERT INTO `history` VALUES (29, 1678500051281, 1122);

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `product_id` bigint NOT NULL,
  `product_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `product_price` float NOT NULL,
  `product_detail` varchar(999) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `product_status` int NULL DEFAULT NULL COMMENT '0上架 1交易中 2已完成 3删除',
  `product_owner` bigint NOT NULL,
  `product_image` int NULL DEFAULT NULL,
  `product_buyer` bigint NULL DEFAULT NULL,
  `product_classify` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_district` int NULL DEFAULT NULL COMMENT '0 东 1 西',
  PRIMARY KEY (`product_id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1677679276683, '鸡哥', 9.9, '这是我鸡哥', 1, 12345678, 1, 121, '书本', 1);
INSERT INTO `product_info` VALUES (1677760382334, '操作系统', 10, '操作系统第三版', 1, 1, 1, 11, '生活用品', 1);
INSERT INTO `product_info` VALUES (1677827873504, '111', 10, 'uuu', 2, 17662586774, 1, 13800138000, '书本', 0);
INSERT INTO `product_info` VALUES (1677853153101, '222', 1, '111', 1, 17662586774, 1, 0, '书本', 1);
INSERT INTO `product_info` VALUES (1678002663911, '111', 222, '2121', 0, 111111, 1, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1678257504560, '数据结构', 5, '严版数据结构', 1, 11, 3, 666, '书本', 1);
INSERT INTO `product_info` VALUES (1678257843654, '计算机组成原理', 5, '计算机组成原理', 0, 11, 1, NULL, '书本', 1);
INSERT INTO `product_info` VALUES (1678260423237, '机械键盘', 99, '99新机械键盘', 0, 11, 2, NULL, '电子产品', 0);
INSERT INTO `product_info` VALUES (1678317405549, '123', 10, '666', 1, 121, 1, 666, '生活用品', 0);
INSERT INTO `product_info` VALUES (1678337238842, '12121', 121, '1211', 2, 121, 1, 666, '书本', 0);
INSERT INTO `product_info` VALUES (1678339026631, '888', 121, '如何克服社交焦虑', 0, 666, 9, NULL, '电子产品', 0);
INSERT INTO `product_info` VALUES (1678339476236, '12166', 20, '12', 1, 1, 1, 666, '书本', 0);
INSERT INTO `product_info` VALUES (1678372027395, '数据结构', 12, '121', 0, 1, 2, NULL, '书本', 0);
INSERT INTO `product_info` VALUES (1678498807258, '手机', 12, '12345', 0, 666, 1, NULL, '电子产品', 0);
INSERT INTO `product_info` VALUES (1678498888624, '11111', 111, '212', 0, 666, 2, NULL, '书本', 0);
INSERT INTO `product_info` VALUES (1678500051281, '肥皂', 12, '全新肥皂，狮王正品', 0, 666, 1, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1680510319362, '键盘', 99, '键盘', 0, 1122, 1, NULL, '电子产品', 0);

-- ----------------------------
-- Table structure for swiper_info
-- ----------------------------
DROP TABLE IF EXISTS `swiper_info`;
CREATE TABLE `swiper_info`  (
  `pic_id` int NOT NULL,
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`pic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper_info
-- ----------------------------
INSERT INTO `swiper_info` VALUES (1, '/swiper/banner1.jpg');
INSERT INTO `swiper_info` VALUES (2, '/swiper/banner2.png');
INSERT INTO `swiper_info` VALUES (3, '/swiper/banner3.png');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_role` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 1, '000000', '管理员', 0);
INSERT INTO `user_info` VALUES (2, 11, '123456', '1号学生', 2);
INSERT INTO `user_info` VALUES (3, 111111, '123456', '2号学生', 1);
INSERT INTO `user_info` VALUES (5, 121, '121', '121', 2);
INSERT INTO `user_info` VALUES (6, 123456, '000000', '普通管理员', 2);
INSERT INTO `user_info` VALUES (7, 12345678, '123456', '12345678', 2);
INSERT INTO `user_info` VALUES (8, 13333333333, '123456', '123456', 1);
INSERT INTO `user_info` VALUES (9, 13800138000, '123456', '测试用户', 2);
INSERT INTO `user_info` VALUES (11, 66121, '11', '121', 2);
INSERT INTO `user_info` VALUES (111, 666, '666', '738881948@qq.com', 2);
INSERT INTO `user_info` VALUES (112, 1122, '000', '000', 2);
INSERT INTO `user_info` VALUES (113, 11111111111, '111111', '738881948@qq.com', 2);

SET FOREIGN_KEY_CHECKS = 1;
