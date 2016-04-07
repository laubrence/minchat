/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : minchatdb

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2016-04-07 21:13:33
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
INSERT INTO `ct_customer_guest` VALUES ('30000000000034', 'fd1d82fbb97e45d4927ee7ee00f6068d', '6614f8b3c03f4383a65b0177a9e72fbf', null, null, '2016-04-07 16:13:20');
INSERT INTO `ct_customer_guest` VALUES ('30000000000036', 'fd1d82fbb97e45d4927ee7ee00f6068d', '2c373623ad214846a75b3560c24f31dd', null, null, '2016-04-07 16:13:24');
INSERT INTO `ct_customer_guest` VALUES ('30000000000038', 'fd1d82fbb97e45d4927ee7ee00f6068d', 'dafff1cf1ce340f982239e71777f0aed', null, null, '2016-04-07 16:13:28');

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
INSERT INTO `ct_online_customer` VALUES ('30000000000023', 'fd1d82fbb97e45d4927ee7ee00f6068d', '1', null, null, '2016-04-07 16:11:28');

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
INSERT INTO `ct_online_guest` VALUES ('30000000000017', '41bc4d4873d14ce297e9c8b13da646f8', null, '??1', null, null, '2016-04-07 16:09:10');
INSERT INTO `ct_online_guest` VALUES ('30000000000020', '382337626ef9445ea0e6923306c28b11', null, '??2', null, null, '2016-04-07 16:10:03');
INSERT INTO `ct_online_guest` VALUES ('30000000000024', '73549f69e8194fed80d4cac5e3c2cfc8', null, '??3', null, null, '2016-04-07 16:11:39');
INSERT INTO `ct_online_guest` VALUES ('30000000000033', '6614f8b3c03f4383a65b0177a9e72fbf', null, '??4', null, null, '2016-04-07 16:13:20');
INSERT INTO `ct_online_guest` VALUES ('30000000000035', '2c373623ad214846a75b3560c24f31dd', null, '??5', null, null, '2016-04-07 16:13:24');
INSERT INTO `ct_online_guest` VALUES ('30000000000037', 'dafff1cf1ce340f982239e71777f0aed', null, '??6', null, null, '2016-04-07 16:13:28');

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
INSERT INTO `ct_user_msg` VALUES ('30000000000019', '4', '??1', '1', '22', '2016-04-07 16:09:14');
INSERT INTO `ct_user_msg` VALUES ('30000000000026', '4', '??3', '1', '22', '2016-04-07 16:11:42');
INSERT INTO `ct_user_msg` VALUES ('30000000000027', '4', '??3', '1', '333', '2016-04-07 16:11:50');
INSERT INTO `ct_user_msg` VALUES ('30000000000028', '4', '??3', '1', '444', '2016-04-07 16:12:20');
INSERT INTO `ct_user_msg` VALUES ('30000000000029', '2', '1', '??3', '<img src=\'http://192.168.26.87:8008/images/chat/img/emo_50.gif\'/>', '2016-04-07 16:12:25');
INSERT INTO `ct_user_msg` VALUES ('30000000000030', '4', '??3', '1', '444', '2016-04-07 16:12:43');
INSERT INTO `ct_user_msg` VALUES ('30000000000031', '4', '??3', '1', '55', '2016-04-07 16:12:50');
INSERT INTO `ct_user_msg` VALUES ('30000000000032', '2', '1', '??3', '44', '2016-04-07 16:12:53');
INSERT INTO `ct_user_msg` VALUES ('30000000000039', '4', '??4', '1', '11', '2016-04-07 16:13:37');
INSERT INTO `ct_user_msg` VALUES ('30000000000040', '4', '??5', '1', '33', '2016-04-07 16:13:42');
INSERT INTO `ct_user_msg` VALUES ('30000000000041', '4', '??5', '1', '44', '2016-04-07 16:13:53');
INSERT INTO `ct_user_msg` VALUES ('30000000000042', '4', '??6', '1', '555', '2016-04-07 16:13:58');

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
INSERT INTO `sys_db_id` VALUES ('3', '10000', '10000');

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
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', '0', '0', '2016-04-07 15:19:58', '0', null, null, null, null, null, 'administrator');
