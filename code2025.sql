/*
 Navicat Premium Data Transfer

 Source Server         : code2025
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : code2025

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 22/04/2025 11:58:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE COMMENT '账号'
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', '13877886677', 'admin@code.com', 'ADMIN', 'http://localhost:9999/files/download/1740387803302_柴犬.jpeg');
INSERT INTO `admin` VALUES (4, 'admin1', 'admin1', '管理员1', '13877886699', 'admin1@code.com', 'ADMIN', NULL);
INSERT INTO `admin` VALUES (6, 'admin2', 'admin2', '管理员12', '13877886699', 'admin1@code.com', 'ADMIN', NULL);
INSERT INTO `admin` VALUES (7, 'admin3', 'admin3', '管理员3', '13877886699', 'admin1@code.com', 'ADMIN', NULL);
INSERT INTO `admin` VALUES (17, 'admin33', 'admin', '管理员33', '13877886655', 'admin33@code.com', 'ADMIN', NULL);
INSERT INTO `admin` VALUES (22, 'admin66', 'admin', '管理员66', '13877886699', 'admin66@code.com', 'ADMIN', NULL);
INSERT INTO `admin` VALUES (23, 'admin88', 'admin', '管理员88', '13877886699', 'admin88@code.com', 'ADMIN', 'http://localhost:9999/files/download/1740377255812_12.png');
INSERT INTO `admin` VALUES (25, 'admin110', 'admin', '管理员110', '13877665566', 'admin110@code.com', 'ADMIN', 'http://localhost:9999/files/download/1740377274548_15.png');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请假标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请假说明',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提交时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '请假信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (2, 7, '回老家相亲', '请三天假，回老家相亲。', '2025-03-04 11:17:55', '审核拒绝', '最近项目有点紧，详情可以迟点');
INSERT INTO `apply` VALUES (3, 1, '回家写代码', '我要回趟老家，有很重要的事。', '2025-03-04 11:25:02', '审核通过', NULL);
INSERT INTO `apply` VALUES (4, 10, '回家有点事', '回老家有嗲事情，希望批准', '2025-03-04 11:40:24', '待审核', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '攻略分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '入户门');
INSERT INTO `category` VALUES (2, '室内门');
INSERT INTO `category` VALUES (3, '铸铝门');
INSERT INTO `category` VALUES (4, '木门');

-- ----------------------------
-- Table structure for introduction
-- ----------------------------
DROP TABLE IF EXISTS `introduction`;
CREATE TABLE `introduction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面图',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '攻略标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '攻略内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '旅游攻略表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of introduction
-- ----------------------------
INSERT INTO `introduction` VALUES (1, 'http://localhost:9999/files/download/1740539951577_柴犬.jpeg', '入户大门', '这个可以的们额么么么么么么么么么么么门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门', '2025-03-01 11:19:22', 2, 1);
INSERT INTO `introduction` VALUES (2, 'http://localhost:9999/files/download/1740540157218_柯基.jpeg', '室内门', '这个可以的们额么么么么么么么么么么么门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门', '2025-02-26 11:22:47', 1, 1);
INSERT INTO `introduction` VALUES (3, 'http://localhost:9999/files/download/1740564425231_拉布拉多.jpeg', '仓库门', '这个可以的们额么么么么么么么么么么么门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门', '2025-02-26 18:07:32', 4, 7);
INSERT INTO `introduction` VALUES (4, 'http://localhost:9999/files/download/1741159079959_金毛.jpeg', '玻璃门', '这个可以的们额么么么么么么么么么么么门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门', '2025-03-05 15:18:18', 2, 7);
INSERT INTO `introduction` VALUES (5, 'http://localhost:9999/files/download/1741159111549_布偶猫.jpg', '铸铝门', '这个可以的们额么么么么么么么么么么么门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门门', '2025-03-05 15:18:52', 1, 7);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '系统开发进展', '今天已经开始开发系统功能了', '2025-02-25 09:59:43');
INSERT INTO `notice` VALUES (4, '系统上线测试', '系统已经进入上线阶段，可以测试了。', '2025-02-25 10:00:52');
INSERT INTO `notice` VALUES (5, '系统正式投入使用', '测试完毕可以正式投入使用了！欢迎大家提提意见。', '2025-02-25 10:01:15');
INSERT INTO `notice` VALUES (6, '系统反馈', '有任何问题欢迎向我们反馈', '2025-02-25 10:11:32');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书封面',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书名字',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书价格',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书作者',
  `num` int(11) NULL DEFAULT NULL COMMENT '剩余数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'http://localhost:9999/files/download/1741146824344_拉布拉多.jpeg', '入户门', '66', '光头强', 18);
INSERT INTO `product` VALUES (2, 'http://localhost:9999/files/download/1741146920709_柯基.jpeg', '室内门', '66', '光头强', 200);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '图书ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '借阅时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '借阅记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (2, 1, 2, '2025-03-05 12:14:19', '审核拒绝', '暂时不外借');
INSERT INTO `record` VALUES (3, 1, 1, '2025-03-05 12:19:37', '审核通过', NULL);
INSERT INTO `record` VALUES (4, 7, 1, '2025-03-05 12:31:25', '审核通过', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_index`(`username`) USING BTREE COMMENT '账号'
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaa', '123', '张三', '13877886677', 'aaa@code.com', 'USER', 'http://localhost:9999/files/download/1740377065869_9.png');
INSERT INTO `user` VALUES (2, 'acc', '123', '李四', '13877889988', 'acc@code.com', 'USER', 'http://localhost:9999/files/download/1740377061493_9.jpg');
INSERT INTO `user` VALUES (7, 'bbb', '123', '赵武', '19877886655', 'bbb@code.com', 'USER', 'http://localhost:9999/files/download/1740388047783_柯基.jpeg');
INSERT INTO `user` VALUES (8, 'ncc', '123', '小六', '13988776655', 'ncc@code.com', 'USER', 'http://localhost:9999/files/download/1740376555074_4.png');
INSERT INTO `user` VALUES (9, 'mmm', '123', '鹅哥', NULL, NULL, 'USER', NULL);
INSERT INTO `user` VALUES (10, 'ddd', '123', '小李子', '18877776666', 'ddd@xm.com', 'USER', NULL);

SET FOREIGN_KEY_CHECKS = 1;
