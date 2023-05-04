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

 Date: 04/05/2023 15:33:43
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
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
INSERT INTO `comment_info` VALUES (1, 1681441953312, 111111, '这个真不错', '2023-04-14 21:40:02');
INSERT INTO `comment_info` VALUES (2, 1681441953312, 111111, '计算机科学与技术导师', '2023-04-14 21:42:02');
INSERT INTO `comment_info` VALUES (3, 1681441953312, 111111, '挺好的', '2023-04-15 09:00:05');
INSERT INTO `comment_info` VALUES (4, 1681441953312, 111111, 'Tom lee', '2023-04-14 21:58:10');
INSERT INTO `comment_info` VALUES (5, 1681441953312, 111111, '真不错', '2023-04-14 22:02:19');
INSERT INTO `comment_info` VALUES (6, 1681441953312, 111111, '再便宜一点就好了！', '2023-04-14 22:07:39');
INSERT INTO `comment_info` VALUES (7, 1681441953312, 111111, '可以的', '2023-04-14 22:30:10');
INSERT INTO `comment_info` VALUES (9, 1681441953312, 111111, '建议便宜一些', '2023-04-15 09:10:22');
INSERT INTO `comment_info` VALUES (10, 1681440457897, 111111, '哈哈哈', '2023-04-15 10:03:08');
INSERT INTO `comment_info` VALUES (11, 1681524174275, 111111, '你的联系方式不对！！！我想要', '2023-04-15 10:06:22');
INSERT INTO `comment_info` VALUES (12, 1681524174275, 111111, '我要了', '2023-04-15 10:07:22');
INSERT INTO `comment_info` VALUES (13, 1681524174275, 0, ' 哈哈哈', '2023-04-15 10:12:24');
INSERT INTO `comment_info` VALUES (14, 1681524174275, 0, '推荐！！！', '2023-04-15 10:08:55');
INSERT INTO `comment_info` VALUES (17, 1681524174275, 111111, '666666', '2023-04-15 10:20:07');
INSERT INTO `comment_info` VALUES (18, 1681619574018, 111111, '1221212', '2023-04-16 12:33:01');
INSERT INTO `comment_info` VALUES (23, 1681619574018, 111111, '1212', '2023-04-22 09:55:59');
INSERT INTO `comment_info` VALUES (24, 1681619574018, 111111, '哈哈哈', '2023-04-22 09:56:05');
INSERT INTO `comment_info` VALUES (30, 1682246967454, 111111, '实话说，这个商品一般般，大家如果想要的话，可以联系我，肯定比楼主实惠！！！', '2023-04-24 21:35:25');
INSERT INTO `comment_info` VALUES (35, 1682246967454, 111111, '234321541', '2023-04-24 22:37:59');
INSERT INTO `comment_info` VALUES (39, 1682246967454, 111111, '222', '2023-04-24 22:38:06');
INSERT INTO `comment_info` VALUES (40, 1682349129155, 111111, '12312', '2023-04-24 23:15:18');
INSERT INTO `comment_info` VALUES (41, 1682349129155, 111111, '23123', '2023-04-24 23:15:21');
INSERT INTO `comment_info` VALUES (42, 1682388714887, 222222, '12121', '2023-04-25 10:32:27');
INSERT INTO `comment_info` VALUES (43, 1682350330207, 111111, '哈哈哈', '2023-04-25 13:49:08');
INSERT INTO `comment_info` VALUES (44, 1682350330207, 111111, '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '2023-04-25 13:49:16');
INSERT INTO `comment_info` VALUES (45, 1682387755022, 222222, '1312312', '2023-04-25 14:15:25');
INSERT INTO `comment_info` VALUES (46, 1682348150043, 111111, '这个好呀！！！', '2023-04-25 14:37:47');
INSERT INTO `comment_info` VALUES (60, 1682404830432, 111111, '这个我想要', '2023-04-25 14:49:20');
INSERT INTO `comment_info` VALUES (61, 1682404830432, 111111, '别抢了，这个是我的！！！', '2023-04-25 14:49:36');
INSERT INTO `comment_info` VALUES (63, 1682217445433, 111111, '3424324', '2023-04-27 19:33:27');
INSERT INTO `comment_info` VALUES (65, 1682648995688, 999999, '这个不错呀！', '2023-05-03 09:57:04');
INSERT INTO `comment_info` VALUES (66, 1682648995688, 111111, '联系我！！！', '2023-05-03 09:57:53');
INSERT INTO `comment_info` VALUES (67, 1682648995688, 17662585993, '请问有这本的习题解答吗？', '2023-05-03 10:02:55');
INSERT INTO `comment_info` VALUES (68, 1682648995688, 17662585993, '价格不错！！！', '2023-05-03 10:03:22');
INSERT INTO `comment_info` VALUES (69, 1682648627113, 17662585993, '价格不错！', '2023-05-03 10:03:43');
INSERT INTO `comment_info` VALUES (70, 1682388714887, 17662585993, '价格不错！！！', '2023-05-03 10:04:04');
INSERT INTO `comment_info` VALUES (71, 1682648995688, 19861552169, '可以再便宜一些吗？10块钱可以吗？', '2023-05-03 10:05:59');
INSERT INTO `comment_info` VALUES (72, 1683079986043, 999999, '不能再便宜了.', '2023-05-03 10:33:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (65, 1681440457897, 15152345678);
INSERT INTO `follow` VALUES (66, 1681440457897, 111111);
INSERT INTO `follow` VALUES (68, 1682648995688, 999999);
INSERT INTO `follow` VALUES (69, 1682648627113, 17662585993);
INSERT INTO `follow` VALUES (70, 1682388714887, 17662585993);
INSERT INTO `follow` VALUES (71, 1682648995688, 19861552169);

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
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (67, 1681524174275, 15152345678);
INSERT INTO `history` VALUES (68, 1681441953312, 15152345678);
INSERT INTO `history` VALUES (70, 1681441953312, 111111);
INSERT INTO `history` VALUES (71, 1681440457897, 111111);
INSERT INTO `history` VALUES (72, 1681440457897, 15152345678);
INSERT INTO `history` VALUES (74, 1682218470283, 111111);
INSERT INTO `history` VALUES (75, 1682217877347, 111111);
INSERT INTO `history` VALUES (78, 1682217980872, 111111);
INSERT INTO `history` VALUES (79, 1682246967454, 111111);
INSERT INTO `history` VALUES (80, 1682217276333, 111111);
INSERT INTO `history` VALUES (82, 1682217445433, 111111);
INSERT INTO `history` VALUES (83, 1682246967454, 222222);
INSERT INTO `history` VALUES (84, 1682348150043, 111111);
INSERT INTO `history` VALUES (86, 1682348421135, 111111);
INSERT INTO `history` VALUES (93, 1682350004971, 111111);
INSERT INTO `history` VALUES (96, 1682350330207, 222222);
INSERT INTO `history` VALUES (97, 1682348421135, 222222);
INSERT INTO `history` VALUES (99, 1682217877347, 222222);
INSERT INTO `history` VALUES (101, 1682349129155, 222222);
INSERT INTO `history` VALUES (102, 1682387755022, 222222);
INSERT INTO `history` VALUES (103, 1682387755022, 111111);
INSERT INTO `history` VALUES (105, 1682388714887, 222222);
INSERT INTO `history` VALUES (107, 1682348421135, 0);
INSERT INTO `history` VALUES (109, 1682348150043, 0);
INSERT INTO `history` VALUES (116, 1682404830432, 0);
INSERT INTO `history` VALUES (117, 1682388714887, 0);
INSERT INTO `history` VALUES (129, 1682404830432, 111111);
INSERT INTO `history` VALUES (130, 1682388714887, 111111);
INSERT INTO `history` VALUES (131, 1682349129155, 111111);
INSERT INTO `history` VALUES (132, 1682509239641, 111111);
INSERT INTO `history` VALUES (133, 1682404830432, 111111);
INSERT INTO `history` VALUES (134, 1682387755022, 222222);
INSERT INTO `history` VALUES (135, 1681441953312, 333333);
INSERT INTO `history` VALUES (137, 1682217445433, 111111);
INSERT INTO `history` VALUES (138, 1682388714887, 111111);
INSERT INTO `history` VALUES (139, 1682388714887, 111111);
INSERT INTO `history` VALUES (140, 1682217980872, 111111);
INSERT INTO `history` VALUES (141, 1682217980872, 111111);
INSERT INTO `history` VALUES (142, 1682217445433, 111111);
INSERT INTO `history` VALUES (143, 1682509239641, 111111);
INSERT INTO `history` VALUES (144, 1682648182673, 111111);
INSERT INTO `history` VALUES (145, 1682648627113, 111111);
INSERT INTO `history` VALUES (146, 1682648995688, 111111);
INSERT INTO `history` VALUES (147, 1681524174275, 111111);
INSERT INTO `history` VALUES (148, 1681524174275, 111111);
INSERT INTO `history` VALUES (149, 1682217276333, 111111);
INSERT INTO `history` VALUES (152, 1682648182673, 111111);
INSERT INTO `history` VALUES (153, 1682648627113, 111111);
INSERT INTO `history` VALUES (154, 1682648627113, 111111);
INSERT INTO `history` VALUES (155, 1682648182673, 111111);
INSERT INTO `history` VALUES (156, 1682509239641, 111111);
INSERT INTO `history` VALUES (157, 1682648995688, 111111);
INSERT INTO `history` VALUES (158, 1682217445433, 111111);
INSERT INTO `history` VALUES (159, 1682648995688, 111111);
INSERT INTO `history` VALUES (160, 1682218470283, 111111);
INSERT INTO `history` VALUES (161, 1682648182673, 999999);
INSERT INTO `history` VALUES (162, 1682648182673, 111111);
INSERT INTO `history` VALUES (163, 1682648995688, 999999);
INSERT INTO `history` VALUES (164, 1682648995688, 999999);
INSERT INTO `history` VALUES (165, 1682648995688, 111111);
INSERT INTO `history` VALUES (166, 1682648995688, 999999);
INSERT INTO `history` VALUES (167, 1682388714887, 111111);
INSERT INTO `history` VALUES (168, 1682648995688, 111111);
INSERT INTO `history` VALUES (169, 1682648995688, 17662585993);
INSERT INTO `history` VALUES (170, 1682648627113, 17662585993);
INSERT INTO `history` VALUES (171, 1682388714887, 17662585993);
INSERT INTO `history` VALUES (172, 1682648995688, 19861552169);
INSERT INTO `history` VALUES (173, 1682404830432, 19861552169);
INSERT INTO `history` VALUES (174, 1682404830432, 111111);
INSERT INTO `history` VALUES (175, 1683080165734, 111111);
INSERT INTO `history` VALUES (176, 1683080329597, 111111);
INSERT INTO `history` VALUES (177, 1683079986043, 111111);
INSERT INTO `history` VALUES (178, 1683079986043, 111111);
INSERT INTO `history` VALUES (179, 1683079986043, 999999);
INSERT INTO `history` VALUES (180, 1683079986043, 111111);

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
INSERT INTO `product_info` VALUES (1681440457897, '数据结构', 10, '王道数据结构，有明显使用痕迹', 1, 17662585890, 3, 111111, '书本', 1);
INSERT INTO `product_info` VALUES (1681441953312, '剃须刀', 20, '全新剃须刀', 0, 111111, 1, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1681524174275, '手机', 1000, 'iPhone SE 2020 128g 无拆机 无维修 电池90% 换新手机了，故出', 0, 111111, 2, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1681619574018, '鸡哥', 10, '121212', 1, 0, 2, 111111, '其它', 1);
INSERT INTO `product_info` VALUES (1682217276333, '12', 12, '121', 0, 111111, 3, NULL, '生活用品', 1);
INSERT INTO `product_info` VALUES (1682217445433, '121', 121, '123', 0, 111111, 4, NULL, '其它', 0);
INSERT INTO `product_info` VALUES (1682217877347, '123', 132312, '213123', 0, 111111, 2, NULL, '书本', 1);
INSERT INTO `product_info` VALUES (1682217980872, '3213', 2323, '2323', 0, 111111, 2, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1682218470283, '121', 2121, '13213', 0, 111111, 4, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1682246967454, '12', 12, '12', 0, 111111, 2, NULL, '电子产品', 0);
INSERT INTO `product_info` VALUES (1682348150043, '水杯', 5, '全新水杯，全新未使用，无拆封，无维修！喜欢的快来呀！！！', 0, 111111, 5, NULL, '生活用品', 1);
INSERT INTO `product_info` VALUES (1682348421135, '机械键盘', 200, 'vgn75pro，用了一个月', 0, 111111, 2, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1682349129155, '333', 333, '333333', 0, 222222, 1, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1682350004971, '12', 12, '4の432', 0, 111111, 4, NULL, '生活用品', 0);
INSERT INTO `product_info` VALUES (1682350330207, '32432423', 234, '3452352', 0, 111111, 4, NULL, '其它', 0);
INSERT INTO `product_info` VALUES (1682387755022, '21312', 2132, '2313', 1, 222222, 1, 111111, '生活用品', 0);
INSERT INTO `product_info` VALUES (1682388714887, '红宝书', 10, '红宝书，考研英语词汇书，轻微使用痕迹，几乎全新。详情见图，可小刀。', 1, 111111, 3, 17662585993, '书本', 1);
INSERT INTO `product_info` VALUES (1682404830432, '牙膏', 5, '全新牙膏，没拆包装，全新！！！狮王，大品牌！！！欢迎联系！！！', 1, 111111, 3, 19861552169, '生活用品', 1);
INSERT INTO `product_info` VALUES (1682509239641, '手机', 1000, '华为手机，P30，6+128，用了四年了,一直贴膜，带着壳子，无拆机，无维修，喜欢的快来联系我！！！', 0, 111111, 3, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1682648182673, '洗衣液', 9.9, '全新洗衣液，没拆封。东校自取！', 2, 111111, 2, 999999, '生活用品', 0);
INSERT INTO `product_info` VALUES (1682648627113, '蓝牙耳机', 520, '华为freebuds4，九成新，换新耳机了，故出。有需要的联系我。', 0, 111111, 6, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1682648995688, '计算机网络', 15, '计算机网络，第八版，正常使用痕迹，笔记很少。有兴趣的联系我！可小刀！！！', 0, 111111, 2, NULL, '书本', 1);
INSERT INTO `product_info` VALUES (1683079986043, '鼠标', 70, '全新鼠标，罗技G102，仅用了三天！！！，可小刀，有需要的快来联系！', 0, 999999, 3, NULL, '电子产品', 1);
INSERT INTO `product_info` VALUES (1683080165734, '自行车', 1000, '公路车，买了两年了，毕业带不走，原价2500，现1000出，有需要的快来联系！', 0, 999999, 3, NULL, '其它', 1);
INSERT INTO `product_info` VALUES (1683080329597, '布娃娃', 10, '布娃娃，挺新的。', 0, 111111, 3, NULL, '生活用品', 0);

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
INSERT INTO `user_info` VALUES (120, 111111, '$2a$10$6QLZh1OKOGWdpvndVSYk0.Vb/eUrsA2xcKKxXe51h5gxn7bEgO0IK', '9898989@qq.com', 2);
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
INSERT INTO `wantbuy_info` VALUES (23, '足球', '收一个足球', '1213@123.com', 1, 17662585890);
INSERT INTO `wantbuy_info` VALUES (24, '雨伞', '收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！收一个雨伞，想要个大的！！！', '123982349@qq.com', 0, 17662585890);
INSERT INTO `wantbuy_info` VALUES (25, '鼠标', '想收个鼠标，能用就行，越便宜越好，哈哈哈', '0932148932@123.com', 0, 111111);
INSERT INTO `wantbuy_info` VALUES (26, '1212', '1212', '2121212', 1, 111111);

SET FOREIGN_KEY_CHECKS = 1;
