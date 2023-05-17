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

 Date: 17/05/2023 13:41:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `post_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_product_id`(`product_id` ASC) USING BTREE,
  INDEX `comment_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comment_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_info
-- ----------------------------

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `follow_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`follow_id`) USING BTREE,
  INDEX `follow_p_id`(`product_id` ASC) USING BTREE,
  INDEX `follow_u_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `follow_p_id` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_u_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (73, 1684293398818, 15152345678);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `product`(`product_id` ASC) USING BTREE,
  INDEX `history_u_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `history_p_id` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `history_u_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (243, 1684287196844, 17662585993);
INSERT INTO `history` VALUES (244, 1684287196844, 0);
INSERT INTO `history` VALUES (245, 1684290004310, 17662585993);
INSERT INTO `history` VALUES (246, 1684293398818, 17662585993);
INSERT INTO `history` VALUES (247, 1684290004310, 17662585993);
INSERT INTO `history` VALUES (248, 1684288508559, 17662585993);
INSERT INTO `history` VALUES (249, 1684287710209, 17662585993);
INSERT INTO `history` VALUES (250, 1684287550108, 17662585993);
INSERT INTO `history` VALUES (251, 1684287196844, 17662585993);
INSERT INTO `history` VALUES (252, 1684287710209, 17662585993);
INSERT INTO `history` VALUES (253, 1684300786200, 17662585993);
INSERT INTO `history` VALUES (254, 1684300786200, 15152345678);
INSERT INTO `history` VALUES (255, 1684293398818, 15152345678);
INSERT INTO `history` VALUES (256, 1684288508559, 222222);
INSERT INTO `history` VALUES (257, 1684301345139, 222222);
INSERT INTO `history` VALUES (258, 1684287550108, 111111);
INSERT INTO `history` VALUES (259, 1684288508559, 111111);
INSERT INTO `history` VALUES (260, 1684293398818, 111111);
INSERT INTO `history` VALUES (261, 1684290004310, 111111);
INSERT INTO `history` VALUES (262, 1684288508559, 111111);

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info`  (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `notice_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `notice_hits` int NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_info
-- ----------------------------
INSERT INTO `notice_info` VALUES (17, ' 这是公告标题666', '这是公告内容！！！666', 0, '2023-04-12 08:45:22', '2023-04-12 08:45:22');
INSERT INTO `notice_info` VALUES (37, '周六服务器维修', '本周六服务器维修，给大家造成的不便，敬请谅解！', 0, '2023-04-14 11:54:05', '2023-04-14 11:54:05');

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
  UNIQUE INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `p_user_id`(`product_owner` ASC) USING BTREE,
  CONSTRAINT `p_user_id` FOREIGN KEY (`product_owner`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (1684287196844, '全新牙膏', 6, '狮王全新牙膏。165g，原价20...现价6元，需要自提！！！！！！！！！哈哈哈哈哈！！', 0, 17662585993, 3, NULL, '生活用品', 1);
INSERT INTO `product_info` VALUES (1684287296283, '立白洗衣液', 9.9, '全新立白洗衣液！原价30，3kg的，现价10元，不能接受小刀。哈哈哈哈哈哈哈哈哈！！！喜欢的联系我！！！', 0, 17662585993, 2, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1684287550108, '布娃娃', 20, '玩偶，巨大的玩偶，布娃娃，太大了，带回家不方便，原价100，亏本出！！！喜欢的快联系我！！！', 0, 19861552169, 3, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1684287710209, '耳机', 12, '华为耳机，freebuds 4。自定义九成新，只有轻微使用痕迹。换了新耳机，便宜出，原价700，500出！！！哈哈哈哈哈哈哈哈！！！', 0, 19861552169, 4, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1684288508559, '计算机网络', 12, '计算机网络，第八版，正版，用了一个学期，正常使用痕迹。', 0, 19861552169, 2, NULL, '书本', 1);
INSERT INTO `product_info` VALUES (1684290004310, '鼠标', 79.9, '鼠标，罗技G102，原价129，换新鼠标了，809出', 0, 111111, 3, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1684293398818, '全新水杯', 10, '全新水杯，hhhh吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼哈哈哈哈哈哈哈！！！！!', 0, 111111, 2, NULL, '生活用品', 1);
INSERT INTO `product_info` VALUES (1684300786200, '普林斯顿微积分读本', 20, '普林斯顿微积分读本，几乎全新！！！需上门自取！！！！', 0, 17662585993, 1, NULL, '书本', 0);
INSERT INTO `product_info` VALUES (1684300906410, '华为充电宝', 199, '充电宝，用了半个月，原价300多，199出了。欢迎咨询。！！！', 0, 15152345678, 4, NULL, '电子产品', 0);
INSERT INTO `product_info` VALUES (1684300981323, 'C primer plus', 20, 'C语言经典教材！！！欢迎咨询！！！', 0, 15152345678, 3, NULL, '书本', 1);
INSERT INTO `product_info` VALUES (1684301084449, '抽纸！一箱', 30, '一箱子抽纸，整箱带走，不单出。欢迎咨询！！！直接加我QQ就行，qq738881907', 0, 15152345678, 3, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1684301345139, '考研数学真题', 10, '全新考研数学真题。解析详细！！！欢迎咨询！！！', 0, 222222, 2, NULL, '书本', 1);

-- ----------------------------
-- Table structure for swiper_info
-- ----------------------------
DROP TABLE IF EXISTS `swiper_info`;
CREATE TABLE `swiper_info`  (
  `pic_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
  `user_password` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_role` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (119, 17662585890, '$2a$10$i/VSXpxvS6.aJ.9FFOJNKecO7FkVyftRX8RMQjc0.0R4gH2UwYJTG', '738881967@163.com', 2);
INSERT INTO `user_info` VALUES (120, 111111, '$2a$10$6QLZh1OKOGWdpvndVSYk0.Vb/eUrsA2xcKKxXe51h5gxn7bEgO0IK', '12321312@123.com', 2);
INSERT INTO `user_info` VALUES (122, 0, '$2a$10$H4jU0Eg7vNuVKwVakGnoKOLvklpBNGagChv9OTiaY8b1Yf3v/gdka', 'admin', 0);
INSERT INTO `user_info` VALUES (129, 777, '$2a$10$DkwD8I9XGOh61gPcG.RM4OUhv2Pyrm17si2t72Yq0QqfmjzcMRYlq', '777', 2);
INSERT INTO `user_info` VALUES (130, 22222, '$2a$10$r/lILNkUeUFgeFhw6hxZjO7PuoTeymOZ1Ka64Xbi08JxZ82i0fbTa', '22222', 2);
INSERT INTO `user_info` VALUES (131, 15152345678, '$2a$10$ZIBUyBWRurv9qbeXc3jcxuV/lwrMVEMqSq.fruPlUfC8Inps2I2Ia', '76768798@163.com', 2);
INSERT INTO `user_info` VALUES (132, 222222, '$2a$10$iG3QS5oLvU40ef1qntGei.Se7Pwwy7jiRnFOL/yRYzb5qECVGYJ5.', '239874@123.com', 2);
INSERT INTO `user_info` VALUES (135, 333333, '$2a$10$oiec96qqg2bzRbfIyjdhaOadT4t6NidfPQYSJW04BpxNd0aJthR6m', 'lisa989@123.com', 2);
INSERT INTO `user_info` VALUES (136, 999999, '$2a$10$x8AfLdpkN7MPfZgb0SzVVOwLoD0vFyBBEr45mnXuMKMmvWA31S1I2', '999999@123.com', 2);
INSERT INTO `user_info` VALUES (137, 17662585993, '$2a$10$0NPEvYfUHXRUqzXirTkHI.8KqjgxYWss/fuA/181PdEaHRcr9g.2W', '738881948@qq.com', 2);
INSERT INTO `user_info` VALUES (138, 19861552169, '$2a$10$aHvuonXycHnB6W9K0jSt6uoLb1jyUqndMWcSmTrJr6Pqf4KoI2XMW', '2082159676@qq.com', 2);

-- ----------------------------
-- Table structure for wantbuy_info
-- ----------------------------
DROP TABLE IF EXISTS `wantbuy_info`;
CREATE TABLE `wantbuy_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `wantBuyName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wantBuyDetail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isBuy` int NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wantbuy_info
-- ----------------------------
INSERT INTO `wantbuy_info` VALUES (21, '计算机组成原理', '收一本计算机组成原理，第三版，唐朔飞', '123456@qq.com', 0, 17662585890);
INSERT INTO `wantbuy_info` VALUES (22, '篮球', '收一个篮球，最好是新一些', '12334589@123.com', 0, 17662585890);
INSERT INTO `wantbuy_info` VALUES (23, '足球', '收一个足球', '1213@123.com', 0, 17662585890);
INSERT INTO `wantbuy_info` VALUES (24, '雨伞', '收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！', '123982349@qq.com', 0, 17662585890);
INSERT INTO `wantbuy_info` VALUES (25, '鼠标', '想收个鼠标，能用就行，越便宜越好，哈哈哈', '0932148932@123.com', 0, 111111);
INSERT INTO `wantbuy_info` VALUES (26, '1212', '1212', '2121212', 1, 111111);

SET FOREIGN_KEY_CHECKS = 1;
