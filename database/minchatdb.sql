/*
Navicat MySQL Data Transfer

Source Server         : test01.mysql.db.thejoyrun.com_3310
Source Server Version : 50627
Source Host           : test01.mysql.db.thejoyrun.com:3310
Source Database       : minchatdb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-02-27 10:04:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ct_customer_guest
-- ----------------------------
DROP TABLE IF EXISTS `ct_customer_guest`;
CREATE TABLE `ct_customer_guest` (
  `CUSTOMER_GUEST_ID` bigint(20) NOT NULL COMMENT 'id',
  `C_INBOUND_ID` varchar(100) DEFAULT NULL COMMENT '客服线程编号',
  `G_INBOUND_ID` varchar(100) DEFAULT NULL COMMENT '访客线程编号',
  `CUSTOMER_ID` bigint(20) DEFAULT NULL COMMENT '客服用户id',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '访客用户id',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`CUSTOMER_GUEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ct_customer_guest
-- ----------------------------
INSERT INTO `ct_customer_guest` VALUES ('30000000010003', 'b28dc4d7ae7644989526d6c54becbc7b', '3f985a8b43a24912b1a48faf9254e3b2', null, null, '2018-02-26 18:42:12');
INSERT INTO `ct_customer_guest` VALUES ('30000000010008', 'b28dc4d7ae7644989526d6c54becbc7b', '388de78feadd4b668de40b9feb3b9235', null, null, '2018-02-26 18:43:35');
INSERT INTO `ct_customer_guest` VALUES ('30000000020006', '5015ad4843ab415faa24f11938335b06', '876fa3ea15404871850f57c75d528799', null, null, '2018-02-27 09:46:27');
INSERT INTO `ct_customer_guest` VALUES ('30000000020021', '7100391a07bd40989b97ad819eaa218b', '5cd8deb6bae24e4489394002cd62b503', null, null, '2018-02-27 09:58:37');
INSERT INTO `ct_customer_guest` VALUES ('30000000030007', '23c717ed50c74df4a81920b4d12bca0b', 'e61cc5e9ac914fdebbd6c3ca568b892d', null, null, '2018-02-27 10:03:16');

-- ----------------------------
-- Table structure for ct_online_customer
-- ----------------------------
DROP TABLE IF EXISTS `ct_online_customer`;
CREATE TABLE `ct_online_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL COMMENT '客服id',
  `INBOUND_ID` varchar(100) DEFAULT NULL COMMENT '客服线程编号',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '客服用户id',
  `SESSION_ID` varchar(100) DEFAULT NULL COMMENT '客服浏览器session',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ct_online_customer
-- ----------------------------
INSERT INTO `ct_online_customer` VALUES ('30000000010001', 'b28dc4d7ae7644989526d6c54becbc7b', '1', null, null, '2018-02-26 18:42:03');
INSERT INTO `ct_online_customer` VALUES ('30000000020015', '7100391a07bd40989b97ad819eaa218b', '1', null, null, '2018-02-27 09:58:30');
INSERT INTO `ct_online_customer` VALUES ('30000000030005', '23c717ed50c74df4a81920b4d12bca0b', '1', null, null, '2018-02-27 10:03:11');

-- ----------------------------
-- Table structure for ct_online_guest
-- ----------------------------
DROP TABLE IF EXISTS `ct_online_guest`;
CREATE TABLE `ct_online_guest` (
  `GUEST_ID` bigint(20) NOT NULL COMMENT '访客id',
  `INBOUND_ID` varchar(100) DEFAULT NULL COMMENT '线程编号',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '访客用户id',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `SESSION_ID` varchar(100) DEFAULT NULL COMMENT '访客浏览器session',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`GUEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ct_online_guest
-- ----------------------------
INSERT INTO `ct_online_guest` VALUES ('30000000010002', '3f985a8b43a24912b1a48faf9254e3b2', null, '访客1', null, null, '2018-02-26 18:42:12');
INSERT INTO `ct_online_guest` VALUES ('30000000010007', '388de78feadd4b668de40b9feb3b9235', null, '访客2', null, null, '2018-02-26 18:43:35');
INSERT INTO `ct_online_guest` VALUES ('30000000020001', '635ec05401a54cb2bb0ee9e85c8ec656', null, '访客1', null, null, '2018-02-27 09:45:51');
INSERT INTO `ct_online_guest` VALUES ('30000000020005', '876fa3ea15404871850f57c75d528799', null, '访客2', null, null, '2018-02-27 09:46:27');
INSERT INTO `ct_online_guest` VALUES ('30000000020009', '6c9b71e49c954732b41124b0e954799b', null, '访客3', null, null, '2018-02-27 09:49:04');
INSERT INTO `ct_online_guest` VALUES ('30000000020011', '7dc4a2cc836d444da529b69e6fcfb074', null, '访客4', null, null, '2018-02-27 09:58:26');
INSERT INTO `ct_online_guest` VALUES ('30000000020013', '0a698fa54f7048ecac9871ca1abbb613', null, '访客5', null, null, '2018-02-27 09:58:27');
INSERT INTO `ct_online_guest` VALUES ('30000000020016', '49fc51d9c47e4adca77c69009f2c46c7', null, '访客6', null, null, '2018-02-27 09:58:32');
INSERT INTO `ct_online_guest` VALUES ('30000000020018', 'b4e5060f32bf4181934b2946e70dd9d7', null, '访客7', null, null, '2018-02-27 09:58:35');
INSERT INTO `ct_online_guest` VALUES ('30000000020020', '5cd8deb6bae24e4489394002cd62b503', null, '访客8', null, null, '2018-02-27 09:58:37');
INSERT INTO `ct_online_guest` VALUES ('30000000030001', '8793a6a0d3274148b07e0c068e58c61d', null, '访客1', null, null, '2018-02-27 09:59:25');
INSERT INTO `ct_online_guest` VALUES ('30000000030006', 'e61cc5e9ac914fdebbd6c3ca568b892d', null, '访客2', null, null, '2018-02-27 10:03:16');

-- ----------------------------
-- Table structure for ct_user_msg
-- ----------------------------
DROP TABLE IF EXISTS `ct_user_msg`;
CREATE TABLE `ct_user_msg` (
  `MSG_ID` bigint(20) NOT NULL COMMENT '信息id',
  `SEND_TYPE` int(5) DEFAULT NULL COMMENT '发送类型',
  `SEND_USER` varchar(200) DEFAULT NULL COMMENT '后台客服用户id',
  `RECEIVE_USER` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `CHAT_MSG` text COMMENT '信息',
  `CREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ct_user_msg
-- ----------------------------
INSERT INTO `ct_user_msg` VALUES ('30000000010004', '4', '访客1', '1', '111', '2018-02-26 18:42:19');
INSERT INTO `ct_user_msg` VALUES ('30000000010005', '2', '1', '访客1', '222', '2018-02-26 18:42:24');
INSERT INTO `ct_user_msg` VALUES ('30000000010006', '4', '访客1', '1', 'adfasdf', '2018-02-26 18:43:26');
INSERT INTO `ct_user_msg` VALUES ('30000000010009', '4', '访客2', '1', '333', '2018-02-26 18:43:37');
INSERT INTO `ct_user_msg` VALUES ('30000000010010', '4', '访客1', '1', '222', '2018-02-27 09:40:41');
INSERT INTO `ct_user_msg` VALUES ('30000000020003', '4', '访客1', null, '111', '2018-02-27 09:46:01');
INSERT INTO `ct_user_msg` VALUES ('30000000020007', '4', '访客2', '1', '333', '2018-02-27 09:46:32');
INSERT INTO `ct_user_msg` VALUES ('30000000020008', '4', '访客2', '1', '333', '2018-02-27 09:47:32');
INSERT INTO `ct_user_msg` VALUES ('30000000030003', '4', '访客1', '1', '1112', '2018-02-27 09:59:36');
INSERT INTO `ct_user_msg` VALUES ('30000000030004', '2', '1', '访客1', '333', '2018-02-27 09:59:47');
INSERT INTO `ct_user_msg` VALUES ('30000000030008', '4', '访客2', '1', '3', '2018-02-27 10:03:20');
INSERT INTO `ct_user_msg` VALUES ('30000000030009', '2', '1', '访客2', '6', '2018-02-27 10:03:30');
INSERT INTO `ct_user_msg` VALUES ('30000000030010', '2', '1', '访客2', '<img src=\'http://localhost:8080/images/chat/img/emo_50.gif\'/>', '2018-02-27 10:03:39');

-- ----------------------------
-- Table structure for sys_db_id
-- ----------------------------
DROP TABLE IF EXISTS `sys_db_id`;
CREATE TABLE `sys_db_id` (
  `ID` smallint(6) NOT NULL,
  `INCREMENTAL` bigint(20) DEFAULT NULL,
  `BOUND` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统ID记录表';

-- ----------------------------
-- Records of sys_db_id
-- ----------------------------
INSERT INTO `sys_db_id` VALUES ('3', '10000', '40000');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USERID` bigint(20) NOT NULL,
  `FULLNAME` varchar(127) DEFAULT NULL,
  `ACCOUNT` varchar(20) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `ISEXPIRED` smallint(6) DEFAULT NULL,
  `ISLOCK` smallint(6) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `MOBILE` varchar(32) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `SEX` varchar(2) DEFAULT NULL,
  `PICTURE` varchar(300) DEFAULT NULL,
  `NICKNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', '0', '0', '2016-04-07 15:19:58', '0', null, null, null, null, 'https://news.baidu.com/z/resource/r/image/2018-02-27/96a5300894e528435a2456e3fc37a951.jpg', '客服小二');
