/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : forestoa

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-02-20 13:03:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_attence
-- ----------------------------
DROP TABLE IF EXISTS `tb_attence`;
CREATE TABLE `tb_attence` (
  `ATTENCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NUMBER` bigint(20) DEFAULT NULL COMMENT '警号',
  `ATTENCE_STARTTIME` datetime DEFAULT NULL COMMENT '开始打卡时间',
  `ATTENCE_ENDTIME` datetime DEFAULT NULL COMMENT '结束打卡时间',
  `REMARKS1` varchar(255) DEFAULT NULL,
  `REMARKS2` varchar(255) DEFAULT NULL,
  `REMARKS3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ATTENCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_attence
-- ----------------------------
INSERT INTO `tb_attence` VALUES ('48', '1005', '1970-01-01 00:25:14', '1970-01-01 00:25:22', null, null, null);

-- ----------------------------
-- Table structure for tb_briefing_receive
-- ----------------------------
DROP TABLE IF EXISTS `tb_briefing_receive`;
CREATE TABLE `tb_briefing_receive` (
  `RECEIVE_ID` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '收文id',
  `NUMBER` varchar(64) DEFAULT NULL COMMENT '简报来文号',
  `COMPANY` bigint(255) DEFAULT NULL COMMENT '来文单位',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `POFILE` varchar(255) DEFAULT NULL COMMENT '公文(pageoffice文件)',
  `FILE` varchar(255) DEFAULT NULL COMMENT '附件(pdf,word,压缩包等)',
  `PAGES` int(32) DEFAULT NULL COMMENT '页数',
  `ARCHIVAL_PERIOD` varchar(1) DEFAULT NULL COMMENT '存档期限(0:10年 1:30年 2:永久存储)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '收文日期(创建时间)',
  `RECEIVE_STATUS` varchar(1) DEFAULT '0' COMMENT '状态(0:未归档 1:已归档)--默认0',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`RECEIVE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_briefing_receive
-- ----------------------------
INSERT INTO `tb_briefing_receive` VALUES ('14', '1', '5', '测试-简报-收文管理-测试zyl', '2018-1-26森林公安修改事项.docx,', null, '1', '0', '2018-02-01 10:29:50', '1', '0');
INSERT INTO `tb_briefing_receive` VALUES ('15', '232432', '38', '简报收文WC', '这是一个表格.xlsx,', null, '1', '0', '2018-02-01 15:11:32', '1', '0');
INSERT INTO `tb_briefing_receive` VALUES ('16', '1684981', '38', '简报收文wc', '这是一个表格.xlsx', null, '2', null, '2018-02-03 14:18:26', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('17', '66532343', '37', '简报的收文WC', '这是一个表格.xlsx', null, '2', null, '2018-02-03 14:31:10', '1', '0');
INSERT INTO `tb_briefing_receive` VALUES ('18', '23423424', '38', '简报的收文wc跳', '这是一个表格.xlsx', null, '2', null, '2018-02-03 14:59:54', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('19', '413414', '38', '跳跳WC', '这是一个表格.xlsx', null, '2', null, '2018-02-03 15:40:31', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('20', '324132', '38', '测试多人简报收文wc', '这是一个表格.xlsx', null, '2', null, '2018-02-03 16:12:04', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('21', '131231', '38', '24测试简报的收文WC', '这是一个表格.xlsx', null, '1', null, '2018-02-04 10:10:13', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('27', '1213212', '40', '24简报的收文2', '这是一个表格.xlsx', null, '2', null, '2018-02-04 10:26:46', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('30', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('31', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('32', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('33', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('34', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('35', '1', '37', '测试-简报-收文管理-208-2-4-zyl-z', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:30:35', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('36', '1', '37', '测试-简报-收文管理-2018-2-4-zyl-a', '2018-2-3测试.docx', null, '1', null, '2018-02-04 10:33:47', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('37', '233212', '38', '24测试简报的收文88', '这是一个表格.xlsx', null, '2', null, '2018-02-04 11:19:54', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('38', '111', '37', '111111', '2018-2-3测试.docx', null, '1111', null, '2018-02-04 11:29:04', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('39', '231312', '38', '24简报的收文', '这是一个表格.xlsx', null, '2', null, '2018-02-04 19:27:43', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('40', '31212312', '38', '25测试简报的收文', '这是一个表格.xlsx', null, '2', null, '2018-02-05 08:45:26', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('41', '12', '37', '2018-2-5-测试-简报-收文管理-zyl', '2018-2-5.docx', null, '5', null, '2018-02-05 10:05:52', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('42', '111', '37', '测试   111111', '2018-2-5.docx', null, '111', null, '2018-02-05 10:13:04', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('43', '656815', '38', '25简报的收文2225', '这是一个表格.xlsx', null, '222', null, '2018-02-05 22:28:25', '0', '0');
INSERT INTO `tb_briefing_receive` VALUES ('44', '523542343', '40', '1243532345', '这是一个表格.xlsx', null, '3', null, '2018-02-05 22:42:12', '0', '0');

-- ----------------------------
-- Table structure for tb_briefing_receive_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_briefing_receive_task`;
CREATE TABLE `tb_briefing_receive_task` (
  `TASK_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `RECEIVE_ID` bigint(255) DEFAULT NULL COMMENT '收文ID',
  `START_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '开始人员(关联人员ID)',
  `END_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '结束人员(关联人员ID)',
  `START_NODE_ID` int(11) DEFAULT NULL COMMENT '开始节点(关联节点id)',
  `END_NODE_ID` int(11) DEFAULT NULL COMMENT '结束节点(关联节点id)',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `RTX_MSG` varchar(64) DEFAULT NULL COMMENT 'RTX发送消息状态',
  `REMARKS` text COMMENT '备注(意见)',
  `OPINION` varchar(1) DEFAULT '1' COMMENT '(0:不同意 1:同意)-默认 1',
  `TASK_STATUS` varchar(1) DEFAULT '0' COMMENT '任务状态(0:待办 1:已办)--默认0',
  `isBack` varchar(1) DEFAULT '0' COMMENT '0默认不是，1代表是从别的节点回退回来的任务',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_briefing_receive_task
-- ----------------------------
INSERT INTO `tb_briefing_receive_task` VALUES ('49', '14', '1013', '1013', '1', '1', '2018-02-01 10:31:07', '2018-02-01 10:31:07', null, '请领导批阅', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('50', '14', '1013', '1017', '1', '2', '2018-02-01 10:31:07', '2018-02-01 10:36:34', '正确', '请领导批阅', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('51', '14', '1017', '1004', '2', '3', '2018-02-01 10:36:34', '2018-02-01 10:40:54', '正确', '。。。。', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('52', '14', '1017', '1004', '2', '3', '2018-02-01 10:36:34', null, '正确', '。。。。', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('53', '14', '1004', '1014', '3', '4', '2018-02-01 10:40:54', '2018-02-01 10:42:44', '正确', '3333', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('54', '14', '1014', '1013', '4', '5', '2018-02-01 10:42:44', '2018-02-01 10:46:39', '正确', '11', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('55', '14', '1013', '1018', '5', '6', '2018-02-01 10:46:39', '2018-02-01 10:47:23', '正确', '1111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('56', '15', '1000', '1000', '1', '1', '2018-02-01 15:12:35', '2018-02-01 15:12:35', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('57', '15', '1000', '1017', '1', '2', '2018-02-01 15:12:35', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('58', '15', '1000', '1017', '1', '2', '2018-02-01 15:12:35', '2018-02-01 15:15:05', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('59', '15', '1017', '1002', '2', '6', '2018-02-01 15:15:05', null, '正确', '直接归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('60', '15', '1017', '1018', '2', '6', '2018-02-01 15:15:05', '2018-02-01 15:15:55', '正确', '直接归档', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('61', '16', '1000', '1000', '1', '1', '2018-02-03 14:20:39', '2018-02-03 14:20:39', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('62', '16', '1000', '1017', '1', '2', '2018-02-03 14:20:39', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('63', '17', '1000', '1000', '1', '1', '2018-02-03 14:33:05', '2018-02-03 14:33:05', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('64', '17', '1000', '1017', '1', '2', '2018-02-03 14:33:05', '2018-02-03 14:35:21', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('65', '17', '1017', '1002', '2', '3', '2018-02-03 14:35:21', '2018-02-03 14:38:44', '正确', '下一步，分管领导', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('66', '17', '1002', '1024', '3', '4', '2018-02-03 14:38:44', '2018-02-03 14:40:54', '正确', '下一步，科室负责人', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('67', '17', '1024', '1011', '4', '5', '2018-02-03 14:40:54', '2018-02-03 14:41:53', '正确', '下一步，科员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('68', '17', '1011', '1018', '5', '6', '2018-02-03 14:41:53', '2018-02-03 14:44:06', '正确', '下一步，归档', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('69', '18', '1000', '1000', '1', '1', '2018-02-03 15:01:37', '2018-02-03 15:01:37', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('70', '18', '1000', '1017', '1', '2', '2018-02-03 15:01:37', '2018-02-03 15:03:01', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('71', '18', '1017', '1024', '2', '4', '2018-02-03 15:03:01', '2018-02-03 15:04:33', '正确', '下一步，科室负责人', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('72', '18', '1024', '1018', '4', '6', '2018-02-03 15:04:33', null, '正确', '下一步，归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('73', '19', '1000', '1000', '1', '1', '2018-02-03 15:41:36', '2018-02-03 15:41:36', null, '333333332', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('74', '19', '1000', '1017', '1', '2', '2018-02-03 15:41:36', '2018-02-03 15:43:18', '正确', '333333332', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('75', '19', '1017', '1002', '2', '6', '2018-02-03 15:43:18', null, '正确', '直接归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('76', '19', '1017', '1007', '2', '6', '2018-02-03 15:43:18', null, '正确', '直接归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('77', '19', '1017', '1018', '2', '6', '2018-02-03 15:43:18', null, '正确', '直接归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('78', '19', '1017', '1024', '2', '6', '2018-02-03 15:43:18', null, '正确', '直接归档', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('79', '20', '1000', '1000', '1', '1', '2018-02-03 16:13:13', '2018-02-03 16:13:13', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('80', '20', '1000', '1017', '1', '2', '2018-02-03 16:13:13', '2018-02-03 16:15:00', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('81', '20', '1017', '1006', '2', '5', '2018-02-03 16:15:00', '2018-02-03 16:20:34', '正确', '下一步，两个科员崔健和梁威', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('82', '20', '1017', '1007', '2', '5', '2018-02-03 16:15:00', '2018-02-03 16:17:14', '正确', '下一步，两个科员崔健和梁威', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('83', '20', '1007', '1009', '5', '6', '2018-02-03 16:17:14', null, '正确', '两个归档张明杰和宋瑞军', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('84', '20', '1007', '1018', '5', '6', '2018-02-03 16:17:14', null, '正确', '两个归档张明杰和宋瑞军', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('85', '20', '1006', '1009', '5', '6', '2018-02-03 16:20:34', null, '正确', '我是刘小兵', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('86', '21', '1000', '1000', '1', '1', '2018-02-04 10:11:15', '2018-02-04 10:11:15', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('87', '21', '1000', '1017', '1', '2', '2018-02-04 10:11:15', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('92', '27', '1000', '1000', '1', '1', '2018-02-04 10:27:26', '2018-02-04 10:27:26', null, '121312', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('93', '27', '1000', '1017', '1', '2', '2018-02-04 10:27:26', null, '正确', '121312', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('96', '30', '1000', '1000', '1', '1', '2018-02-04 10:31:26', '2018-02-04 10:31:26', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('97', '31', '1000', '1000', '1', '1', '2018-02-04 10:31:27', '2018-02-04 10:31:27', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('98', '32', '1000', '1000', '1', '1', '2018-02-04 10:31:27', '2018-02-04 10:31:27', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('99', '33', '1000', '1000', '1', '1', '2018-02-04 10:31:28', '2018-02-04 10:31:28', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('100', '34', '1000', '1000', '1', '1', '2018-02-04 10:31:28', '2018-02-04 10:31:28', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('101', '35', '1000', '1000', '1', '1', '2018-02-04 10:31:28', '2018-02-04 10:31:28', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('102', '30', '1000', null, '1', '2', '2018-02-04 10:31:26', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('103', '31', '1000', null, '1', '2', '2018-02-04 10:31:27', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('104', '32', '1000', null, '1', '2', '2018-02-04 10:31:27', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('105', '33', '1000', null, '1', '2', '2018-02-04 10:31:28', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('106', '34', '1000', null, '1', '2', '2018-02-04 10:31:28', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('107', '35', '1000', null, '1', '2', '2018-02-04 10:31:28', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('108', '36', '1000', '1000', '1', '1', '2018-02-04 10:34:32', '2018-02-04 10:34:32', null, '132', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('109', '36', '1000', '1017', '1', '2', '2018-02-04 10:34:32', null, '正确', '132', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('110', '37', '1000', '1000', '1', '1', '2018-02-04 11:20:45', '2018-02-04 11:20:45', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('111', '37', '1000', '1017', '1', '2', '2018-02-04 11:20:45', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('112', '38', '1000', '1000', '1', '1', '2018-02-04 11:35:02', '2018-02-04 11:35:02', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('113', '38', '1000', '1017', '1', '2', '2018-02-04 11:35:02', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('114', '39', '1000', '1000', '1', '1', '2018-02-04 19:28:22', '2018-02-04 19:28:22', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('115', '39', '1000', '1017', '1', '2', '2018-02-04 19:28:22', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('116', '40', '1000', '1000', '1', '1', '2018-02-05 08:46:01', '2018-02-05 08:46:01', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('117', '40', '1000', '1017', '1', '2', '2018-02-05 08:46:01', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('118', '41', '1000', '1000', '1', '1', '2018-02-05 10:07:12', '2018-02-05 10:07:12', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('119', '41', '1000', '1017', '1', '2', '2018-02-05 10:07:12', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('120', '42', '1000', '1000', '1', '1', '2018-02-05 10:13:21', '2018-02-05 10:13:21', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('121', '42', '1000', '1017', '1', '2', '2018-02-05 10:13:22', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('122', '43', '1000', '1000', '1', '1', '2018-02-05 22:29:25', '2018-02-05 22:29:25', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('123', '43', '1000', '1017', '1', '2', '2018-02-05 22:29:25', null, '未知错误', '', '1', '0', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('124', '44', '1000', '1000', '1', '1', '2018-02-05 22:42:40', '2018-02-05 22:42:40', null, '', '1', '1', '0', '0');
INSERT INTO `tb_briefing_receive_task` VALUES ('125', '44', '1000', '1017', '1', '2', '2018-02-05 22:42:40', null, '未知错误', '', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_briefing_send
-- ----------------------------
DROP TABLE IF EXISTS `tb_briefing_send`;
CREATE TABLE `tb_briefing_send` (
  `SEND_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NUMBER` bigint(255) DEFAULT NULL COMMENT '简报发文号',
  `HOST_DEPARTMENT` bigint(255) DEFAULT NULL COMMENT '主办科室',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `ARCHIVAL_PERIOD` varchar(1) DEFAULT NULL COMMENT '存档期限(0:10年 1:30年 2:永久存储)',
  `COPIES` int(32) DEFAULT NULL COMMENT '打印纸质份数',
  `PAGES` int(32) DEFAULT NULL COMMENT '页数',
  `TYPE` varchar(1) DEFAULT NULL COMMENT '发文类型(0:简报 1:信息)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '发文日期',
  `MAIN_COMPANY` bigint(255) DEFAULT NULL COMMENT '主送单位',
  `COPY_COMPANY` varchar(255) DEFAULT NULL COMMENT '抄送单位',
  `PRE_CAST_COLUMN` varchar(64) DEFAULT NULL COMMENT '预投栏目',
  `SEND_STATUS` varchar(1) DEFAULT '0' COMMENT '状态(0:未归档 1:已归档)--默认0',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`SEND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_briefing_send
-- ----------------------------
INSERT INTO `tb_briefing_send` VALUES ('7', '6', '1', '测试-2018-2-3-zyl-简报-发文', null, '1', '1', '0', '2018-02-03 14:33:18', '35', '36', '', '0', '0');
INSERT INTO `tb_briefing_send` VALUES ('8', '7', '5', '简报-发文管理-测试王丹1013', null, '1', '1', '0', '2018-02-03 14:44:04', '35', '36', '', '0', '0');
INSERT INTO `tb_briefing_send` VALUES ('9', '8', '1', 'zyl-测试-简报-发文管理', '2', '1', '1', '0', '2018-02-03 21:08:11', '35', '36', '', '1', '0');
INSERT INTO `tb_briefing_send` VALUES ('10', '9', '1', '测试-简报-发文管理-2018-2-4-zyl-a', '0', '1', '1', '0', '2018-02-04 10:22:33', '35', '36', '0,', '1', '0');
INSERT INTO `tb_briefing_send` VALUES ('11', '4', '1', '2018-2-5-测试-简报-发文管理-zyl', '1', '1', '1', '0', '2018-02-05 09:53:56', '35', '36', '0,', '1', '0');
INSERT INTO `tb_briefing_send` VALUES ('12', '5', '1', '测试-2018-2-5-简报-发文管理功能流转测试-z', null, '1111', '11', '0', '2018-02-05 14:54:38', '35', '36', '', '0', '0');
INSERT INTO `tb_briefing_send` VALUES ('13', '6', '1', '测试-2018-2-5-发文管理-简报-zyl', '0', '22', '111', '0', '2018-02-05 17:32:44', '35', '42', '0,', '1', '0');
INSERT INTO `tb_briefing_send` VALUES ('14', '7', '1', '测试-发文管理-简报-节点跳转', '2', '2', '111', '0', '2018-02-05 17:39:36', '35', '36', '1,2,', '1', '0');
INSERT INTO `tb_briefing_send` VALUES ('15', '2', '1', '12额', '0', '1', '1', '1', '2018-02-05 17:45:14', '39', '36', '0,1,10,', '1', '0');

-- ----------------------------
-- Table structure for tb_briefing_send_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_briefing_send_task`;
CREATE TABLE `tb_briefing_send_task` (
  `TASK_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `SEND_ID` bigint(255) DEFAULT NULL COMMENT '发文任务ID(关联发文表id)',
  `START_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '开始人员(关联人员ID)',
  `END_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '结束人员(关联人员ID)',
  `FILE` varchar(255) DEFAULT NULL COMMENT '附件',
  `POFILE` varchar(255) DEFAULT NULL COMMENT '公文(pageoffice文件)',
  `REMARKS` varchar(64) DEFAULT NULL COMMENT '备注(意见)',
  `START_NODE_ID` int(11) DEFAULT NULL COMMENT '开始节点(关联节点ID)',
  `END_NODE_ID` int(11) DEFAULT NULL COMMENT '结束节点(关联节点id)',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OPINION` varchar(1) DEFAULT '1' COMMENT '(0:不同意 1:同意)-默认 1',
  `RTX_MSG` varchar(64) DEFAULT NULL COMMENT 'RTX发送消息返回标志',
  `TASK_STATUS` varchar(1) DEFAULT '0' COMMENT '任务状态(0:待办 1:已办)--默认0',
  `isBack` varchar(2) DEFAULT '0' COMMENT '0默认不是，1代表是从别的节点回退回来的任务',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_briefing_send_task
-- ----------------------------
INSERT INTO `tb_briefing_send_task` VALUES ('25', '7', '1000', '1000', null, 'z1517639626000_7.doc', '请领导批阅', '7', '7', '2018-02-03 14:34:32', '2018-02-03 14:34:32', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('26', '7', '1000', '1014', null, 'z1517639626000_7.doc', '请领导批阅', '7', '8', '2018-02-03 14:34:32', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('33', '8', '1013', '1013', null, 'z1517640283000_7.doc', '去去去', '7', '7', '2018-02-03 14:45:03', '2018-02-03 14:45:03', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('34', '8', '1013', '1014', null, 'z1517640283000_7.doc', '去去去', '7', '8', '2018-02-03 14:45:03', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('38', '9', '1000', '1000', null, 'z1517663367000_7.doc', '11', '7', '7', '2018-02-03 21:10:01', '2018-02-03 21:10:01', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('39', '9', '1000', '1014', null, 'z1517663367000_7.doc', '11', '7', '8', '2018-02-03 21:10:01', '2018-02-03 21:11:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('40', '9', '1014', '1004', null, 'z101415176634200008.doc', '11', '8', '9', '2018-02-03 21:11:28', '2018-02-03 21:12:11', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('41', '9', '1004', '1001', null, 'z100415176635090009.doc', '11', '9', '10', '2018-02-03 21:12:11', '2018-02-03 21:12:40', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('42', '9', '1001', '1000', null, 'z1001151766354300010.doc', '1111', '10', '11', '2018-02-03 21:12:40', '2018-02-03 21:13:06', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('43', '9', '1000', '1018', null, 'z1000151766357700011.doc', null, '11', '13', '2018-02-03 21:13:06', '2018-02-03 21:13:55', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('44', '10', '1000', '1000', null, 'z1517711024000_7.doc', '111', '7', '7', '2018-02-04 10:24:07', '2018-02-04 10:24:07', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('45', '10', '1000', '1014', null, 'z1517711024000_7.doc', '111', '7', '8', '2018-02-04 10:24:07', '2018-02-04 10:26:17', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('46', '10', '1014', '1001', null, 'z101415177110850008.doc', '1111', '8', '10', '2018-02-04 10:26:17', '2018-02-04 10:27:19', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('47', '10', '1001', '1000', null, 'z1001151771121700010.doc', '123', '10', '11', '2018-02-04 10:27:19', '2018-02-04 10:28:25', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('48', '10', '1000', '1018', null, 'z1000151771129200011.doc', '123', '11', '13', '2018-02-04 10:28:25', '2018-02-04 10:29:17', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('49', '11', '1000', '1000', null, 'z1517795676000_7.doc', '111', '7', '7', '2018-02-05 09:55:05', '2018-02-05 09:55:05', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('50', '11', '1000', '1008', null, 'z1517795676000_7.doc', '111', '7', '8', '2018-02-05 09:55:05', '2018-02-05 09:59:43', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('51', '11', '1008', '1003', null, 'z100815177957430008.doc', '1', '8', '9', '2018-02-05 09:59:43', '2018-02-05 10:01:37', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('52', '11', '1003', '1001', null, 'z100315177960360009.doc', '123', '9', '10', '2018-02-05 10:01:37', '2018-02-05 10:02:30', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('53', '11', '1001', '1000', null, 'z1001151779612900010.doc', '123', '10', '11', '2018-02-05 10:02:30', '2018-02-05 10:04:16', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('54', '11', '1000', '1018', null, 'z1000151779623200011.doc', '123', '11', '13', '2018-02-05 10:04:17', '2018-02-05 10:04:58', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('55', '12', '1000', '1000', null, 'z10001517813863000_7.doc', '81632', '7', '7', '2018-02-05 14:58:16', '2018-02-05 14:58:16', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('56', '12', '1000', '1005', null, 'z10051517813896153_8.doc', '', '7', '8', '2018-02-05 14:58:16', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('57', '13', '1000', '1000', null, 'z10001517823202000_7.doc', '111', '7', '7', '2018-02-05 17:34:06', '2018-02-05 17:34:06', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('58', '13', '1000', '1005', null, 'z10051517823246029_8.doc', '111', '7', '8', '2018-02-05 17:34:06', '2018-02-05 17:35:22', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('59', '13', '1005', '1004', null, 'z10051517823264000_9.doc', '1111', '8', '9', '2018-02-05 17:35:22', '2018-02-05 17:36:34', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('60', '13', '1004', '1001', null, 'z10041517823330000_10.doc', '11111', '9', '10', '2018-02-05 17:36:34', '2018-02-05 17:38:11', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('61', '13', '1001', '1000', null, 'z10011517823405000_11.doc', '1111', '10', '11', '2018-02-05 17:38:11', '2018-02-05 17:38:51', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('62', '13', '1000', '1018', null, 'z10001517823502000_12.doc', null, '11', '13', '2018-02-05 17:38:51', '2018-02-05 17:39:23', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('63', '14', '1000', '1000', null, 'z10001517823612000_7.doc', '凄凄切切', '7', '7', '2018-02-05 17:40:35', '2018-02-05 17:40:35', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('64', '14', '1000', '1004', null, 'z10041517823635348_8.doc', '1111', '7', '9', '2018-02-05 17:40:35', '2018-02-05 17:42:47', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('65', '14', '1004', '1001', null, 'z10041517823645000_10.doc', '1231563', '9', '10', '2018-02-05 17:42:47', '2018-02-05 17:43:33', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('66', '14', '1001', '1000', null, 'z10011517823783000_11.doc', '1111', '10', '11', '2018-02-05 17:43:33', '2018-02-05 17:44:06', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('67', '14', '1000', '1018', null, 'z10001517823824000_12.doc', null, '11', '13', '2018-02-05 17:44:06', '2018-02-05 17:44:25', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('68', '15', '1000', '1000', null, 'z10001517823928000_7.doc', '8520', '7', '7', '2018-02-05 17:46:08', '2018-02-05 17:46:08', '1', null, '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('69', '15', '1000', '1014', null, 'z10141517823968118_8.doc', '879415', '7', '8', '2018-02-05 17:46:08', '2018-02-05 17:46:57', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('70', '15', '1014', '1001', null, 'z10141517823981000_9.doc', '89441', '8', '10', '2018-02-05 17:46:57', '2018-02-05 17:47:16', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('71', '15', '1001', '1000', null, 'z10011517824026000_11.doc', '852', '10', '11', '2018-02-05 17:47:16', '2018-02-05 17:47:35', '1', '正确', '1', '0', '0');
INSERT INTO `tb_briefing_send_task` VALUES ('72', '15', '1000', '1018', null, 'z10001517824047000_12.doc', null, '11', '13', '2018-02-05 17:47:35', '2018-02-05 17:47:55', '1', '正确', '1', '0', '0');

-- ----------------------------
-- Table structure for tb_document_receive
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_receive`;
CREATE TABLE `tb_document_receive` (
  `RECEIVE_ID` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '收文id',
  `NUMBER` varchar(255) DEFAULT NULL COMMENT '来文文号',
  `COMPANY` bigint(255) DEFAULT NULL COMMENT '来文单位',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `POFILE` varchar(255) DEFAULT NULL COMMENT '公文(pageoffice文件)',
  `FILE` varchar(255) DEFAULT NULL COMMENT '附件(pdf,word,压缩包等)',
  `PAGES` int(32) DEFAULT NULL COMMENT '页数',
  `ARCHIVAL_PERIOD` varchar(1) DEFAULT NULL COMMENT '存档期限(0:10年 1:30年 2:永久存储)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '收文日期(创建时间)',
  `RECEIVE_STATUS` varchar(1) DEFAULT '0' COMMENT '状态(0:未归档 1:已归档)--默认0',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`RECEIVE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document_receive
-- ----------------------------
INSERT INTO `tb_document_receive` VALUES ('20', '20181', '5', '测试-公文-收文管理-测试zyl', '2018-1-26森林公安修改事项.docx,', null, '1', '2', '2018-02-01 10:20:29', '1', '0');
INSERT INTO `tb_document_receive` VALUES ('21', '21342', '1', '公文的收文wc', '这是一个表格.xlsx,', null, '1', '0', '2018-02-01 14:54:56', '1', '0');
INSERT INTO `tb_document_receive` VALUES ('22', '1112332', '1', '公文发文2WC', '这是一个表格.xlsx,', null, '1', '0', '2018-02-01 15:05:04', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('23', '', '40', '1', '这是一个表格.xlsx,', null, '1', null, '2018-02-01 15:09:34', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('24', '1', '37', '测试zyl-公文-收文管理', '2018-1-26森林公安修改事项.docx,', null, '1', '1', '2018-02-01 15:54:56', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('25', '684816516', '38', '公文收文wc', '这是一个表格.xlsx', null, '1', null, '2018-02-03 14:00:38', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('26', '9156498', '38', '公文的收文wc跳', '这是一个表格.xlsx', null, '3', null, '2018-02-03 14:47:10', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('27', '1', '38', '测试去1111', '2018-1-26森林公安修改事项.docx', null, '1', null, '2018-02-03 15:32:41', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('28', '423424', '40', '跳跳WC', '这是一个表格.xlsx', null, '2', null, '2018-02-03 15:38:35', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('29', '61168', '38', '测试多人收文WC', '这是一个表格.xlsx', null, '2', null, '2018-02-03 16:24:15', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('30', '148714', '43', '测试晚上收文', '这是一个表格.xlsx', null, '3', null, '2018-02-03 19:23:51', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('31', '1', '37', '测试zyl', '2018-1-26森林公安修改事项.docx', null, '1', null, '2018-02-03 19:28:39', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('34', '245454', '38', '24公文的收文wc', '这是一个表格.xlsx', null, '2', null, '2018-02-04 09:54:58', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('35', '245454', '38', '24公文的收文wc', '这是一个表格.xlsx', null, '2', null, '2018-02-04 09:54:58', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('36', '245454', '38', '24公文的收文wc', '这是一个表格.xlsx', null, '2', null, '2018-02-04 09:54:58', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('38', '111', '37', '测试-公文-收文管理-2018-2-4-zyl', '2018-2-3测试.docx', null, '11', null, '2018-02-04 09:59:22', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('39', '11', '37', '测试-公文-收文管理-2018-2-4-zyl-a', '2018-2-3测试.docx', null, '11', null, '2018-02-04 10:03:11', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('40', '231321', '40', '24测试公文的收文', '这是一个表格.xlsx', null, '2', null, '2018-02-04 10:04:02', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('41', '111', '37', '测试-公文-收文管理-2018-2-4-zyl-b', '2018-2-3测试.docx', null, '111', null, '2018-02-04 10:06:17', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('51', '21312', '38', '24测试公文的收文2', '这是一个表格.xlsx', null, '2', null, '2018-02-04 10:25:01', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('52', '13123', '40', '24测试收文11', '这是一个表格.xlsx', null, '2', null, '2018-02-04 10:35:23', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('57', '201901', '43', '公文收文TITLE', 'icon.png', null, '5', null, '2018-02-04 10:37:42', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('58', '121232', '38', '24测试公文的收文88', '这是一个表格.xlsx', null, '1', null, '2018-02-04 11:17:28', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('59', '1', '37', '2018-2-4-公文-收文管理-测试-zyl1125', '2018-2-3测试.docx', null, '1', null, '2018-02-04 11:25:31', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('60', '1', '37', '222', '2018-2-3测试.docx', null, '123', null, '2018-02-04 11:39:18', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('61', '1', '37', '2018-2-4-公文办理-公文-收文管理-测试zyl', '2018-2-4测试.docx', null, '1', null, '2018-02-04 14:13:57', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('62', '11', '37', '我只是来测试的，我就看看，我啥也不碰', '2018-2-4测试.docx', null, '1111', null, '2018-02-04 14:22:14', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('63', '3223', '38', '24测试公文的收文', '这是一个表格.xlsx', null, '2', null, '2018-02-04 19:24:10', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('64', '12312', '43', '25测试公文的收文', '这是一个表格.xlsx', null, '1', null, '2018-02-05 08:43:32', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('65', '1', '37', '2018-2-5-测试-公文-收文管理-zyl', '2018-2-5.docx', null, '1', null, '2018-02-05 09:32:04', '0', '0');
INSERT INTO `tb_document_receive` VALUES ('66', '2131123', '37', '25测试公文的收文25', '这是一个表格.xlsx', null, '2', null, '2018-02-05 15:02:42', '0', '0');

-- ----------------------------
-- Table structure for tb_document_receive_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_receive_task`;
CREATE TABLE `tb_document_receive_task` (
  `TASK_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `RECEIVE_ID` bigint(255) DEFAULT NULL COMMENT '收文ID',
  `START_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '开始人员(关联人员ID)',
  `END_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '结束人员(关联人员ID)',
  `START_NODE_ID` int(11) DEFAULT NULL COMMENT '开始节点(关联节点id)',
  `END_NODE_ID` int(11) DEFAULT NULL COMMENT '结束节点(关联节点id)',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `RTX_MSG` varchar(64) DEFAULT NULL COMMENT 'RTX发送消息状态',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注(意见)',
  `OPINION` varchar(1) DEFAULT '1' COMMENT '(0:不同意 1:同意)-默认 1',
  `TASK_STATUS` varchar(1) DEFAULT '0' COMMENT '任务状态(0:待办 1:已办)--默认0',
  `isBack` varchar(1) DEFAULT '0' COMMENT '0默认不是，1代表是从别的节点回退回来的任务',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document_receive_task
-- ----------------------------
INSERT INTO `tb_document_receive_task` VALUES ('60', '20', '1013', '1013', '1', '1', '2018-02-01 10:21:14', '2018-02-01 10:21:14', null, '请领导批阅。。。', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('61', '20', '1013', '1017', '1', '2', '2018-02-01 10:21:14', '2018-02-01 10:22:32', '正确', '请领导批阅。。。', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('62', '20', '1017', '1004', '2', '3', '2018-02-01 10:22:32', '2018-02-01 10:23:28', '正确', '请批阅', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('63', '20', '1004', '1014', '3', '4', '2018-02-01 10:23:28', '2018-02-01 10:24:11', '正确', '已阅', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('64', '20', '1014', '1013', '4', '5', '2018-02-01 10:24:11', '2018-02-01 10:28:51', '正确', '。。', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('65', '20', '1013', '1018', '5', '6', '2018-02-01 10:28:51', '2018-02-01 10:29:15', '正确', '组织', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('66', '21', '1000', '1000', '1', '1', '2018-02-01 14:55:47', '2018-02-01 14:55:47', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('67', '21', '1000', '1017', '1', '2', '2018-02-01 14:55:47', '2018-02-01 14:57:02', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('68', '21', '1017', '1004', '2', '3', '2018-02-01 14:57:02', '2018-02-01 14:58:26', '正确', '下一步，分管领导', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('69', '21', '1004', '1014', '3', '4', '2018-02-01 14:58:26', '2018-02-01 14:59:32', '正确', '下一步，科室负责人', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('70', '21', '1014', '1006', '4', '5', '2018-02-01 14:59:32', '2018-02-01 15:03:14', '正确', '下一步，科员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('71', '21', '1006', '1009', '5', '6', '2018-02-01 15:03:14', '2018-02-01 15:04:38', '正确', '下一步，归档', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('72', '22', '1000', '1000', '1', '1', '2018-02-01 15:06:27', '2018-02-01 15:06:27', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('73', '22', '1000', '1017', '1', '2', '2018-02-01 15:06:27', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('74', '23', '1000', '1000', '1', '1', '2018-02-01 15:10:02', '2018-02-01 15:10:02', null, '1', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('75', '23', '1000', '1017', '1', '2', '2018-02-01 15:10:02', null, '正确', '1', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('76', '24', '1000', '1000', '1', '1', '2018-02-01 15:56:16', '2018-02-01 15:56:16', null, '1111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('77', '24', '1000', '1017', '1', '2', '2018-02-01 15:56:16', '2018-02-01 15:57:11', '正确', '1111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('78', '24', '1017', '1004', '2', '3', '2018-02-01 15:57:11', '2018-02-01 15:58:16', '正确', '111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('79', '24', '1017', '1004', '2', '3', '2018-02-01 15:57:11', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('80', '24', '1004', '5', '3', '4', '2018-02-01 15:58:15', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('81', '24', '1004', '4', '3', '4', '2018-02-01 15:58:16', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('82', '25', '1000', '1000', '1', '1', '2018-02-03 14:09:21', '2018-02-03 14:09:21', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('83', '25', '1000', '1017', '1', '2', '2018-02-03 14:09:21', '2018-02-03 14:10:41', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('84', '25', '1017', '1004', '2', '3', '2018-02-03 14:10:41', '2018-02-03 14:12:04', '正确', '下一步，分管领导', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('85', '25', '1004', '1014', '3', '4', '2018-02-03 14:12:04', '2018-02-03 14:14:33', '正确', '下一步，科室负责人', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('86', '25', '1014', '1006', '4', '5', '2018-02-03 14:14:33', null, '正确', '下一步，科员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('87', '26', '1000', '1000', '1', '1', '2018-02-03 14:49:47', '2018-02-03 14:49:47', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('88', '26', '1000', '1017', '1', '2', '2018-02-03 14:49:47', '2018-02-03 14:51:04', '正确', '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('89', '26', '1017', '1024', '2', '4', '2018-02-03 14:51:04', '2018-02-03 14:55:02', '正确', '下一步，科室负责人', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('90', '26', '1024', '1011', '4', '5', '2018-02-03 14:55:02', null, '正确', '下一步，科员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('91', '27', '1000', '1000', '1', '1', '2018-02-03 15:34:01', '2018-02-03 15:34:01', null, '11', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('92', '27', '1000', '1017', '1', '2', '2018-02-03 15:34:01', '2018-02-03 15:36:51', '正确', '11', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('93', '27', '1017', '1004', '2', '3', '2018-02-03 15:36:51', '2018-02-03 15:37:41', '正确', '123', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('94', '27', '1004', '1013', '3', '5', '2018-02-03 15:37:41', null, '正确', '11', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('95', '28', '1000', '1000', '1', '1', '2018-02-03 15:39:25', '2018-02-03 15:39:25', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('96', '28', '1000', '1017', '1', '2', '2018-02-03 15:39:25', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('97', '29', '1000', '1000', '1', '1', '2018-02-03 16:25:09', '2018-02-03 16:25:09', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('98', '29', '1000', '1017', '1', '2', '2018-02-03 16:25:09', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('99', '30', '1000', '1000', '1', '1', '2018-02-03 19:25:37', '2018-02-03 19:25:37', null, '11111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('100', '30', '1000', '1017', '1', '2', '2018-02-03 19:25:37', null, '正确', '11111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('101', '31', '1000', '1000', '1', '1', '2018-02-03 19:29:07', '2018-02-03 19:29:07', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('102', '31', '1000', '1017', '1', '2', '2018-02-03 19:29:07', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('105', '34', '1000', '1000', '1', '1', '2018-02-04 09:56:07', '2018-02-04 09:56:07', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('106', '35', '1000', '1000', '1', '1', '2018-02-04 09:56:12', '2018-02-04 09:56:12', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('107', '36', '1000', '1000', '1', '1', '2018-02-04 09:56:13', '2018-02-04 09:56:13', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('108', '34', '1000', '1017', '1', '2', '2018-02-04 09:56:07', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('109', '35', '1000', '1017', '1', '2', '2018-02-04 09:56:12', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('110', '36', '1000', '1017', '1', '2', '2018-02-04 09:56:13', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('112', '38', '1000', '1000', '1', '1', '2018-02-04 10:00:45', '2018-02-04 10:00:45', null, '111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('113', '38', '1000', null, '1', '2', '2018-02-04 10:00:45', null, '正确', '111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('114', '39', '1000', '1000', '1', '1', '2018-02-04 10:03:41', '2018-02-04 10:03:41', null, '11', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('115', '39', '1000', null, '1', '2', '2018-02-04 10:03:42', null, '正确', '11', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('116', '40', '1000', '1000', '1', '1', '2018-02-04 10:05:15', '2018-02-04 10:05:15', null, '下一步，分发人员', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('117', '40', '1000', '1017', '1', '2', '2018-02-04 10:05:15', null, '正确', '下一步，分发人员', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('118', '41', '1000', '1000', '1', '1', '2018-02-04 10:06:52', '2018-02-04 10:06:52', null, '1111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('119', '41', '1000', '1017', '1', '2', '2018-02-04 10:06:52', null, '正确', '1111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('125', '51', '1000', '1000', '1', '1', '2018-02-04 10:25:50', '2018-02-04 10:25:50', null, '1212', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('126', '51', '1000', '1017', '1', '2', '2018-02-04 10:25:50', null, '正确', '1212', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('127', '52', '1000', '1000', '1', '1', '2018-02-04 10:35:49', '2018-02-04 10:35:49', null, '234243', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('128', '52', '1000', '1017', '1', '2', '2018-02-04 10:35:49', null, '正确', '234243', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('133', '57', '1013', '1013', '1', '1', '2018-02-04 10:41:04', '2018-02-04 10:41:04', null, '收文人员拟稿', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('134', '57', '1013', '1017', '1', '2', '2018-02-04 10:41:04', null, '正确', '收文人员拟稿', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('135', '58', '1000', '1000', '1', '1', '2018-02-04 11:18:32', '2018-02-04 11:18:32', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('136', '58', '1000', '1017', '1', '2', '2018-02-04 11:18:32', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('137', '59', '1000', '1000', '1', '1', '2018-02-04 11:26:22', '2018-02-04 11:26:22', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('138', '59', '1000', null, '1', '2', '2018-02-04 11:26:22', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('139', '60', '1000', '1000', '1', '1', '2018-02-04 11:39:44', '2018-02-04 11:39:44', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('140', '60', '1000', '1017', '1', '2', '2018-02-04 11:39:44', '2018-02-04 11:42:50', '正确', '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('141', '60', '1017', '1004', '2', '3', '2018-02-04 11:42:50', '2018-02-04 11:45:43', '正确', '12315646', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('142', '60', '1004', '1005', '3', '4', '2018-02-04 11:45:43', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('143', '61', '1000', '1000', '1', '1', '2018-02-04 14:16:24', '2018-02-04 14:16:24', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('144', '61', '1000', '1017', '1', '2', '2018-02-04 14:16:24', '2018-02-04 14:19:21', '正确', '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('145', '61', '1017', '1002', '2', '3', '2018-02-04 14:18:39', null, '正确', '1111', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('146', '61', '1017', '1003', '2', '3', '2018-02-04 14:19:00', '2018-02-04 14:27:32', '正确', '1111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('147', '61', '1017', '1004', '2', '3', '2018-02-04 14:19:21', '2018-02-04 14:35:32', '正确', '1111', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('148', '62', '1000', '1000', '1', '1', '2018-02-04 14:22:53', '2018-02-04 14:22:53', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('149', '62', '1000', '1017', '1', '2', '2018-02-04 14:22:53', '2018-02-04 14:24:18', '正确', '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('150', '62', '1017', '1004', '2', '3', '2018-02-04 14:24:18', '2018-02-04 14:33:12', '正确', '123', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('151', '61', '1003', '1005', '3', '4', '2018-02-04 14:27:11', '2018-02-04 14:30:47', '正确', '123', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('152', '61', '1003', '5', '3', '4', '2018-02-04 14:27:32', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('153', '61', '1005', '1013', '4', '5', '2018-02-04 14:29:24', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('154', '61', '1005', '1015', '4', '5', '2018-02-04 14:29:45', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('155', '61', '1005', '1016', '4', '5', '2018-02-04 14:30:06', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('156', '61', '1005', '1019', '4', '5', '2018-02-04 14:30:27', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('157', '61', '1005', '1020', '4', '5', '2018-02-04 14:30:48', null, '正确', '123', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('158', '61', '1005', '1013', '4', '5', '2018-02-04 14:31:09', null, '正确', '852', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('159', '62', '1004', '1008', '3', '4', '2018-02-04 14:32:51', null, '正确', '9885', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('160', '62', '1004', '1014', '3', '4', '2018-02-04 14:33:12', '2018-02-04 14:38:05', '正确', '9885', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('161', '61', '1004', '1013', '3', '5', '2018-02-04 14:34:08', null, '正确', '8888845321321', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('162', '61', '1004', '1015', '3', '5', '2018-02-04 14:34:29', null, '正确', '8888845321321', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('163', '61', '1004', '1016', '3', '5', '2018-02-04 14:34:50', null, '正确', '8888845321321', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('164', '61', '1004', '1019', '3', '5', '2018-02-04 14:35:11', null, '正确', '8888845321321', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('165', '61', '1004', '1020', '3', '5', '2018-02-04 14:35:32', null, '正确', '8888845321321', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('166', '62', '1014', '1013', '4', '5', '2018-02-04 14:36:41', null, '正确', '865132', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('167', '62', '1014', '1015', '4', '5', '2018-02-04 14:37:02', null, '正确', '865132', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('168', '62', '1014', '1016', '4', '5', '2018-02-04 14:37:23', null, '正确', '865132', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('169', '62', '1014', '1019', '4', '5', '2018-02-04 14:37:44', null, '正确', '865132', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('170', '62', '1014', '1020', '4', '5', '2018-02-04 14:38:05', null, '正确', '865132', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('171', '63', '1000', '1000', '1', '1', '2018-02-04 19:24:52', '2018-02-04 19:24:52', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('172', '63', '1000', '1017', '1', '2', '2018-02-04 19:24:52', '2018-02-04 19:26:14', '正确', '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('173', '63', '1017', '1024', '2', '4', '2018-02-04 19:26:14', null, '正确', '下一步，科室负责人', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('174', '64', '1000', '1000', '1', '1', '2018-02-05 08:44:14', '2018-02-05 08:44:14', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('175', '64', '1000', '1017', '1', '2', '2018-02-05 08:44:14', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('176', '65', '1000', '1000', '1', '1', '2018-02-05 09:32:49', '2018-02-05 09:32:49', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('177', '65', '1000', '1017', '1', '2', '2018-02-05 09:32:49', '2018-02-05 09:35:54', '正确', '123456', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('178', '65', '1017', '1002', '2', '3', '2018-02-05 09:35:12', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('179', '65', '1017', '1003', '2', '3', '2018-02-05 09:35:33', '2018-02-05 09:38:57', '正确', '23132', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('180', '65', '1017', '1004', '2', '3', '2018-02-05 09:35:54', '2018-02-05 09:37:42', '正确', '78965', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('181', '65', '1004', '1005', '3', '4', '2018-02-05 09:37:21', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('182', '65', '1004', '1014', '3', '4', '2018-02-05 09:37:42', '2018-02-05 09:41:43', '正确', '78962', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('183', '65', '1003', '1008', '3', '4', '2018-02-05 09:38:57', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('184', '65', '1014', '1013', '4', '5', '2018-02-05 09:40:18', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('185', '65', '1014', '1015', '4', '5', '2018-02-05 09:40:39', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('186', '65', '1014', '1016', '4', '5', '2018-02-05 09:41:00', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('187', '65', '1014', '1019', '4', '5', '2018-02-05 09:41:21', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('188', '65', '1014', '1020', '4', '5', '2018-02-05 09:41:43', null, '正确', '', '1', '0', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('189', '66', '1000', '1000', '1', '1', '2018-02-05 15:04:45', '2018-02-05 15:04:45', null, '', '1', '1', '0', '0');
INSERT INTO `tb_document_receive_task` VALUES ('190', '66', '1000', '1017', '1', '2', '2018-02-05 15:04:45', null, '正确', '', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_document_send
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_send`;
CREATE TABLE `tb_document_send` (
  `SEND_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `NUMBER` bigint(255) DEFAULT NULL COMMENT '发文文号',
  `HOST_DEPARTMENT` bigint(255) DEFAULT NULL COMMENT '主办科室',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `ARCHIVAL_PERIOD` varchar(1) DEFAULT NULL COMMENT '存档期限(0:10年 1:30年 2:永久存储)',
  `COPIES` int(32) DEFAULT NULL COMMENT '份数',
  `PAGES` int(32) DEFAULT NULL COMMENT '页数',
  `TYPE` varchar(1) DEFAULT NULL COMMENT '发文类型(0:赤森公发 1:赤森公函发 2:党务 3其他)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '发文日期',
  `MAIN_COMPANY` bigint(255) DEFAULT NULL COMMENT '主送单位',
  `COPY_COMPANY` varchar(255) DEFAULT NULL COMMENT '抄送单位',
  `SEND_STATUS` varchar(1) DEFAULT '0' COMMENT '状态(0:未归档 1:已归档--默认0',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`SEND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document_send
-- ----------------------------
INSERT INTO `tb_document_send` VALUES ('28', '1', '5', '这是发文标题', null, '10', null, '0', '2018-01-31 18:47:46', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('29', '2', '4', '这是一个带附件的发文标题', null, '19', '9', '0', '2018-01-31 21:15:24', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('30', '3', '5', '测试-公文-发文管理-测试zyl', null, '1', '1', '0', '2018-02-01 10:58:25', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('31', '4', '5', '测试-公文-z', null, '1', '1', '0', '2018-02-01 11:17:05', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('32', '5', '5', '测试zyl-公文-发文管理-测试1', '0', '1', '1', '0', '2018-02-01 15:28:37', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('33', '6', '1', '测试-2018-2-2-公文-发文管理', null, '1', '1', '0', '2018-02-02 20:51:42', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('34', '4', '1', '测试-2018-2-3-公文-发文', null, '1', '1', '0', '2018-02-03 10:18:51', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('35', '5', '1', '测试-公文-发文管理-2018-2-3-zyl', null, '1', '1', '0', '2018-02-03 10:29:20', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('36', '4', '5', '公发关于春节福利的发放', '0', '10', '1', '2', '2018-02-03 14:29:39', '35', '45', '1', '0');
INSERT INTO `tb_document_send` VALUES ('37', '3', '5', '关于春节福利院活动通知', null, '100', '1', '1', '2018-02-03 14:35:47', '35', '45', '0', '0');
INSERT INTO `tb_document_send` VALUES ('38', '7', '6', '关于春节假期期间我司值班的安排', null, '68', '1', '0', '2018-02-03 16:12:56', '41', '45', '0', '0');
INSERT INTO `tb_document_send` VALUES ('39', '8', '6', '关于节后人事安排', null, '68', '2', '0', '2018-02-03 16:18:35', '41', '45', '0', '0');
INSERT INTO `tb_document_send` VALUES ('40', '9', '6', '关于五一劳动节假日安排', null, '58', '1', '0', '2018-02-03 16:23:22', '41', '45', '0', '0');
INSERT INTO `tb_document_send` VALUES ('41', '10', '6', '关于清明节的假日通告', null, '58', '1', '0', '2018-02-03 16:26:31', '41', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('42', '12', '6', '关于全国法制办的通告', null, '59', '2', '0', '2018-02-03 16:42:29', '35', '45', '0', '0');
INSERT INTO `tb_document_send` VALUES ('43', '13', '6', '关于春节通告', null, '12', '1', '0', '2018-02-03 16:46:37', '41', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('44', '14', '1', '测试-公文发文管理-2018-2-4-zyl', null, '1', '1', '0', '2018-02-04 09:19:45', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('45', '14', '1', '测试-公文发文管理-2018-2-4-zyl', '1', '1', '1', '0', '2018-02-04 09:19:45', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('46', '1', '1', '2018-2-4-测试-公文办理-公文发文管理-zyl', '2', '1', '1', '1', '2018-02-04 13:45:32', '35', '42', '1', '0');
INSERT INTO `tb_document_send` VALUES ('55', '14', '1', '通告', null, '12', '1', '0', '2018-02-04 16:13:26', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('56', '15', '1', '告示', null, '12', '1', '0', '2018-02-04 17:08:12', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('57', '16', '1', '发布通知', null, '12', '1', '0', '2018-02-04 17:17:11', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('58', '17', '1', '标题测试', null, '12', '1', '0', '2018-02-04 17:20:09', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('59', '18', '1', '哈哈哈', null, '12', '1', '0', '2018-02-04 17:30:24', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('60', '19', '1', '啦啦啦啦', '2', '12', '1', '0', '2018-02-04 17:38:02', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('61', '20', '1', '测试公文-发文管理-修复bug', null, '1', '1', '0', '2018-02-04 18:00:26', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('62', '21', '1', '测试，测试一下-zyl', '2', '1', '1', '0', '2018-02-04 18:04:00', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('63', '2', '1', '教育', null, '1', '1', '1', '2018-02-04 18:17:53', '39', '42', '0', '0');
INSERT INTO `tb_document_send` VALUES ('64', '22', '1', '有bug？我来测测', null, '2', '2', '0', '2018-02-04 19:18:30', '35', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('65', '23', '5', 'bug？不存在的，', '0', '1', '1', '0', '2018-02-04 19:24:39', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('66', '24', '1', '测试-公文-发文管理-2018-2-5-zyl', '1', '1', '2', '0', '2018-02-05 08:26:03', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('67', '4', '1', '测试-2018-2-5-公文-发文管理-节点跳转测试', '1', '1', '1', '1', '2018-02-05 08:39:49', '39', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('68', '8', '1', '2018-2-5-测试-公文-发文管理', '1', '1', '1', '2', '2018-02-05 09:13:13', '35', '42', '1', '0');
INSERT INTO `tb_document_send` VALUES ('69', '6', '1', '2018-2-5-测试-公文-发文回退-zyl', null, '1', '1', '1', '2018-02-05 13:36:35', '39', '36', '0', '0');
INSERT INTO `tb_document_send` VALUES ('70', '7', '1', '3456', '2', '2', '2', '1', '2018-02-05 13:39:38', '35', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('71', '9', '1', '2018-2-5-测试附件保存不一致问题', '0', '5', '5', '0', '2018-02-05 14:34:23', '41', '36', '1', '0');
INSERT INTO `tb_document_send` VALUES ('72', '10', '1', '2018-2-5-公文-发文管理-节点跳转', '1', '11', '1', '2', '2018-02-05 14:47:50', '39', '42', '1', '0');

-- ----------------------------
-- Table structure for tb_document_send_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_document_send_task`;
CREATE TABLE `tb_document_send_task` (
  `TASK_ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `SEND_ID` bigint(255) DEFAULT NULL COMMENT '发文任务ID(关联发文表id)',
  `START_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '开始人员(关联人员ID)',
  `END_PERSON_ID` bigint(255) DEFAULT NULL COMMENT '结束人员(关联人员ID)',
  `POFILE` varchar(255) DEFAULT NULL COMMENT '公文(pageoffice文件)',
  `FILE` varchar(255) DEFAULT NULL COMMENT '附件',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注(意见)',
  `START_NODE_ID` int(11) DEFAULT NULL COMMENT '开始节点(关联节点ID)',
  `END_NODE_ID` int(11) DEFAULT NULL COMMENT '结束节点(关联节点id)',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OPINION` varchar(1) DEFAULT '1' COMMENT '(0:不同意 1:同意)-默认 1',
  `RTX_MSG` varchar(64) DEFAULT NULL COMMENT 'RTX发送消息返回标志',
  `TASK_STATUS` varchar(1) DEFAULT '0' COMMENT '任务状态(0:待办 1:已办)--默认0',
  `isBack` varchar(1) DEFAULT '0' COMMENT '0默认不是，1代表是从别的节点回退回来的任务',
  `DEL_FLAG` varchar(1) DEFAULT '0' COMMENT '删除标识(0-未删除 1-已删除)--默认0',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_document_send_task
-- ----------------------------
INSERT INTO `tb_document_send_task` VALUES ('132', '28', '1000', '1000', null, null, '拟稿完成。下一步核稿', '7', '7', '2018-01-31 18:48:44', '2018-01-31 18:48:44', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('133', '28', '1000', '1005', null, ',', '拟稿完成。下一步核稿', '7', '8', '2018-01-31 18:48:44', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('134', '29', '1000', '1000', null, null, '提交', '7', '7', '2018-01-31 21:16:45', '2018-01-31 21:16:45', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('135', '29', '1000', '1005', null, 'icon.png,', '提交', '7', '8', '2018-01-31 21:16:45', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('136', '30', '1000', '1000', '1000_1517453991000_0_7.doc', null, '11', '7', '7', '2018-02-01 11:01:47', '2018-02-01 11:01:47', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('137', '30', '1000', '1014', '1000_1517453991000_0_7.doc', '2018-1-26森林公安修改事项.docx,', '11', '7', '8', '2018-02-01 11:01:47', '2018-02-01 11:02:29', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('138', '30', '1014', '1000', '1517454125022.doc', '', '123', '8', '8', '2018-02-01 11:02:29', null, '0', '正确', '0', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('139', '31', '1000', '1000', '1000_1517455144000_0_7.doc', null, '11111', '7', '7', '2018-02-01 11:19:39', '2018-02-01 11:19:39', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('140', '31', '1000', '1014', '1000_1517455144000_0_7.doc', '2018-1-26森林公安修改事项.docx,', '11111', '7', '8', '2018-02-01 11:19:39', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('141', '32', '1000', '1000', '1000_1517470183000_0_7.doc', null, '111', '7', '7', '2018-02-01 15:30:26', '2018-02-01 15:30:26', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('142', '32', '1000', '1014', '1000_1517470183000_0_7.doc', '2018-1-26森林公安修改事项.docx,', '111', '7', '8', '2018-02-01 15:30:27', '2018-02-01 15:31:21', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('143', '32', '1014', '1004', '1517470245022.doc', '', '已阅', '8', '9', '2018-02-01 15:31:21', '2018-02-01 15:32:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('144', '32', '1004', '1001', '1517470299013.doc', '', '已阅', '9', '10', '2018-02-01 15:32:28', '2018-02-01 15:35:31', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('145', '32', '1001', '1000', '1517470361011.doc', '', '已阅安顺', '10', '11', '2018-02-01 15:35:31', '2018-02-01 15:37:52', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('146', '32', '1000', '1014', '1517470635011.doc', '', '已阅', '11', '12', '2018-02-01 15:37:52', '2018-02-01 15:39:27', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('147', '32', '1014', '1000', '1517470696026.doc', '', '123', '12', '13', '2018-02-01 15:39:27', '2018-02-01 15:49:12', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('148', '32', '1000', '1018', '1517470869013.doc', '', '1', '13', '14', '2018-02-01 15:49:12', '2018-02-01 15:49:55', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('149', '33', '1000', '1000', 'z1517575938000_7.doc', null, '1', '7', '7', '2018-02-02 20:52:36', '2018-02-02 20:52:36', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('150', '33', '1000', '1014', 'z1517575938000_7.doc', '12号与客户谈话总结.docx', '1', '7', '8', '2018-02-02 20:52:36', null, '1', null, '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('152', '34', '1000', '1000', 'z1517624379000_7.doc', null, '111', '7', '7', '2018-02-03 10:23:15', '2018-02-03 10:23:15', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('153', '34', '1000', '1014', 'z1517624379000_7.doc', '2018-1-26森林公安修改事项.docx', '111', '7', '8', '2018-02-03 10:23:15', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('154', '35', '1000', '1000', 'z1517624986000_7.doc', null, '111', '7', '7', '2018-02-03 10:30:03', '2018-02-03 10:30:03', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('155', '35', '1000', '1014', 'z1517624986000_7.doc', '2018-1-26森林公安修改事项.docx', '111', '7', '8', '2018-02-03 10:30:03', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('160', '36', '1014', '1014', 'z1517639448000_7.doc', null, '拟稿。', '7', '7', '2018-02-03 14:32:45', '2018-02-03 14:32:45', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('161', '36', '1014', '1005', 'z1517639448000_7.doc', 'icon.png,我是一个表.xlsx', '拟稿。', '7', '8', '2018-02-03 14:32:45', '2018-02-03 14:44:01', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('162', '37', '1014', '1014', 'z1517639790000_7.doc', null, '活动拟稿', '7', '7', '2018-02-03 14:37:39', '2018-02-03 14:37:39', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('163', '37', '1014', '1005', 'z1517639790000_7.doc', 'icon.png', '活动拟稿', '7', '8', '2018-02-03 14:37:39', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('164', '36', '1005', '1003', 'z1517640126000_8.doc', 'a4.png', '拟稿完成', '8', '9', '2018-02-03 14:44:01', '2018-02-03 16:06:41', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('166', '36', '1003', '1001', 'z1517645106000_9.doc', '', '李春晓复制审核完成', '9', '10', '2018-02-03 16:06:41', '2018-02-03 16:07:31', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('167', '36', '1001', '1014', 'z1517645210000_10.doc', '', '洪海负责签批完成。', '10', '11', '2018-02-03 16:07:31', '2018-02-03 16:08:11', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('168', '36', '1014', '1014', 'z1517645272000_11.doc', '', '校核完成。，', '11', '12', '2018-02-03 16:08:11', '2018-02-03 16:09:16', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('169', '36', '1014', '1018', 'z1517645321000_12.doc', '', '盖章发文归档。完成', '12', '13', '2018-02-03 16:09:16', '2018-02-03 16:12:06', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('170', '38', '1023', '1023', 'z1517645633000_7.doc', null, '拟稿完成', '7', '7', '2018-02-03 16:16:48', '2018-02-03 16:16:48', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('171', '38', '1023', '1002', 'z1517645633000_7.doc', '', '拟稿完成', '7', '9', '2018-02-03 16:16:48', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('172', '39', '1023', '1023', 'z1517645946000_7.doc', null, '拟稿完成', '7', '7', '2018-02-03 16:21:28', '2018-02-03 16:21:28', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('173', '39', '1023', '1001', 'z1517645946000_7.doc', '', '拟稿完成', '7', '10', '2018-02-03 16:21:28', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('174', '40', '1023', '1023', 'z1517646241000_7.doc', null, '李琦拟稿提交', '7', '7', '2018-02-03 16:24:54', '2018-02-03 16:24:54', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('175', '40', '1023', '1002', 'z1517646241000_7.doc', 'icon.png', '李琦拟稿提交', '7', '9', '2018-02-03 16:24:54', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('176', '41', '1023', '1023', 'z1517646423000_7.doc', null, '李琦拟稿提交', '7', '7', '2018-02-03 16:29:50', '2018-02-03 16:29:50', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('177', '41', '1023', '1001', 'z1517646423000_7.doc', '', '李琦拟稿提交', '7', '10', '2018-02-03 16:29:50', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('178', '42', '1023', '1023', 'z1517647445000_7.doc', null, '李琦拟稿提交', '7', '7', '2018-02-03 16:45:33', '2018-02-03 16:45:33', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('179', '42', '1023', '1002', 'z1517647445000_7.doc', '', '李琦拟稿提交', '7', '9', '2018-02-03 16:45:33', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('180', '43', '1023', '1023', 'z1517647629000_7.doc', null, '李琦拟稿提交', '7', '7', '2018-02-03 16:48:13', '2018-02-03 16:48:13', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('181', '43', '1023', '1004', 'z1517647629000_7.doc', '', '李琦拟稿提交', '7', '9', '2018-02-03 16:48:13', '2018-02-03 17:03:26', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('182', '43', '1004', '1001', 'z1517648563000_9.doc', '', '洪海签批完成', '9', '10', '2018-02-03 17:03:26', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('183', '44', '1000', '1000', 'z1517707223000_7.doc', '2018-2-3测试.docx', null, '7', '7', '2018-02-04 09:21:06', '2018-02-04 09:23:04', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('184', '45', '1000', '1000', 'z1517707223000_7.doc', '2018-2-3测试.docx', null, '7', '7', '2018-02-04 09:21:28', '2018-02-04 09:23:58', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('185', '44', '1000', '1014', 'z1517707303000_7.doc', '2018-2-3测试.docx', '1111', '7', '8', '2018-02-04 09:23:04', '2018-02-04 09:35:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('186', '45', '1000', '1014', 'z1517707420000_7.doc', '2018-2-3测试.docx', '1111', '7', '8', '2018-02-04 09:23:59', '2018-02-04 09:31:14', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('187', '45', '1014', '1004', 'z1517707494000_8.doc', '2018-2-3测试.docx', '123', '8', '9', '2018-02-04 09:31:17', '2018-02-04 09:38:48', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('188', '44', '1014', '1004', 'z1517708063000_8.doc', '', '123123', '8', '9', '2018-02-04 09:35:31', '2018-02-04 09:40:41', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('189', '45', '1004', '1001', 'z1517708236000_9.doc', '2018-2-3测试.docx', '1', '9', '10', '2018-02-04 09:38:51', '2018-02-04 09:41:56', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('190', '44', '1004', '1014', 'z1517708400000_9.doc', '', null, '9', '8', '2018-02-04 09:40:41', '2018-02-04 09:53:18', '0', '正确', '1', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('191', '45', '1001', '1004', 'z1517708482000_10.doc', '2018-2-3测试.docx', '123', '10', '9', '2018-02-04 09:41:56', '2018-02-04 09:42:46', '0', '正确', '1', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('192', '45', '1004', '1001', 'z1517708550000_9.doc', '2018-2-3测试.docx', '123', '9', '10', '2018-02-04 09:42:46', '2018-02-04 09:45:25', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('193', '45', '1001', '1000', 'z1517708688000_10.doc', '', '123', '10', '11', '2018-02-04 09:45:26', '2018-02-04 09:48:00', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('194', '45', '1000', '1014', 'z1517708872000_11.doc', '', '123', '11', '12', '2018-02-04 09:48:00', '2018-02-04 09:51:55', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('195', '45', '1014', '1018', 'z1517709021000_12.doc', '', '123', '12', '13', '2018-02-04 09:51:55', '2018-02-04 09:55:05', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('196', '44', '1014', '1003', 'z1517709179000_8.doc', '', '123', '8', '9', '2018-02-04 09:53:18', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('199', '46', '1000', '1000', 'z1517723177000_7.doc', '2018-2-3测试.docx', null, '7', '7', '2018-02-04 13:46:38', '2018-02-04 13:53:21', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('200', '46', '1000', '1014', 'z1517723561000_7.doc', '', '啊啊啊', '7', '8', '2018-02-04 13:53:21', '2018-02-04 13:57:33', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('201', '46', '1014', '1001', 'z1517723719000_8.doc', '2018-2-3测试.docx', '11111', '8', '10', '2018-02-04 13:57:33', '2018-02-04 13:59:18', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('202', '46', '1001', '1000', 'z1517723891000_10.doc', '', '超出', '10', '11', '2018-02-04 13:59:18', '2018-02-04 14:00:13', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('203', '46', '1000', '1014', 'z1517723995000_11.doc', '', '123', '11', '12', '2018-02-04 14:00:13', '2018-02-04 14:06:32', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('204', '46', '1014', '1018', 'z1517724114000_12.doc', '', '已盖章', '12', '13', '2018-02-04 14:06:32', '2018-02-04 14:07:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('205', '55', '1000', '1000', 'z10001517732027000_7.doc', null, '测试', '7', '7', '2018-02-04 16:14:28', '2018-02-04 16:14:29', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('206', '55', '1000', '1008', 'z10001517732027000_7.doc', '', '', '7', '8', '2018-02-04 16:14:30', '2018-02-04 16:33:12', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('208', '55', '1008', '1002', 'z1517733103000_8.doc', '', '王志强提交', '8', '9', '2018-02-04 16:33:13', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('209', '56', '1000', '1000', 'z10001517735322000_7.doc', null, '测试', '7', '7', '2018-02-04 17:09:19', '2018-02-04 17:09:19', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('210', '56', '1000', '1021', 'z10001517735322000_7.doc', '', '测试', '7', '8', '2018-02-04 17:09:20', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('211', '57', '1000', '1000', 'z10001517735854000_7.doc', null, '我是管理员', '7', '7', '2018-02-04 17:17:57', '2018-02-04 17:17:57', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('212', '57', '1000', '1008', 'D:\\forestoa\\docSendFiles\\57\\z10081517735876930_8.doc', '', 'z10081517735877236_8.doc', '7', '8', '2018-02-04 17:17:57', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('213', '58', '1000', '1000', 'z10001517736042000_7.doc', null, '我是管理员', '7', '7', '2018-02-04 17:21:01', '2018-02-04 17:21:01', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('214', '58', '1000', '1008', 'z10081517736061302_8.doc', '', '', '7', '8', '2018-02-04 17:21:01', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('215', '59', '1000', '1000', 'z10001517736648000_7.doc', null, '我是管理员', '7', '7', '2018-02-04 17:31:24', '2018-02-04 17:31:24', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('216', '59', '1000', '1008', 'z10081517736684121_8.doc', '', '我是王志强', '7', '8', '2018-02-04 17:31:24', '2018-02-04 17:32:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('217', '59', '1008', '1002', 'z1517736709000_8.doc', '', '我是洪海', '8', '9', '2018-02-04 17:32:28', '2018-02-04 18:08:03', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('218', '60', '1000', '1000', 'z10001517737106000_7.doc', null, '我是超级管理员', '7', '7', '2018-02-04 17:38:53', '2018-02-04 17:38:53', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('219', '60', '1000', '1021', 'z10211517737133012_8.doc', '', '我是关耀民', '7', '8', '2018-02-04 17:38:53', '2018-02-04 17:39:53', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('220', '60', '1021', '1002', 'z10211517737155000_9.doc', '', '我是闫文忠', '8', '9', '2018-02-04 17:39:53', '2018-02-04 17:45:20', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('221', '60', '1002', '1001', 'z10021517737473000_10.doc', '', '洪海呵呵呵呵', '9', '10', '2018-02-04 17:45:20', '2018-02-04 17:46:47', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('222', '60', '1001', '1000', 'z10011517737575000_11.doc', '', '校核完成', '10', '11', '2018-02-04 17:46:48', '2018-02-04 17:56:56', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('223', '60', '1000', '1014', 'z10001517738180000_12.doc', '', '完成盖章', '11', '12', '2018-02-04 17:56:56', '2018-02-04 17:57:27', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('224', '60', '1014', '1018', 'z10141517738232000_13.doc', '', null, '12', '13', '2018-02-04 17:57:27', '2018-02-04 19:34:48', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('225', '61', '1000', '1000', 'z10001517738476000_7.doc', '2018-2-4测试.docx', null, '7', '7', '2018-02-04 18:01:42', '2018-02-04 18:01:42', '1', null, '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('227', '62', '1000', '1000', 'z10001517738679000_7.doc', null, '凄凄切切', '7', '7', '2018-02-04 18:05:06', '2018-02-04 18:05:06', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('228', '62', '1000', '1014', 'z10141517738706372_8.doc', '2018-2-4测试.docx', '圈圈圈圈', '7', '8', '2018-02-04 18:05:06', '2018-02-04 18:06:49', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('229', '62', '1014', '1004', 'z10141517738739000_8.doc', '2018-2-4测试.docx', '123', '8', '9', '2018-02-04 18:06:49', '2018-02-04 18:08:18', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('230', '59', '1002', '1001', 'z10021517738861000_10.doc', '', '我是洪海', '9', '10', '2018-02-04 18:08:03', '2018-02-04 18:08:34', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('231', '59', '1001', '1000', 'z10011517738902000_11.doc', '', '校核完成', '10', '11', '2018-02-04 18:08:34', '2018-02-04 18:09:06', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('232', '62', '1004', '1001', 'z10041517738842000_9.doc', '2018-2-4测试.docx', '123', '9', '10', '2018-02-04 18:08:19', '2018-02-04 18:10:08', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('233', '59', '1000', '1014', 'z10001517738930000_12.doc', '', '', '11', '12', '2018-02-04 18:09:06', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('234', '62', '1001', '1000', 'z10011517738932000_10.doc', '2018-2-3测试.docx', '12312312', '10', '11', '2018-02-04 18:10:08', '2018-02-04 18:14:21', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('235', '62', '1000', '1014', 'z10001517739046000_11.doc', '', '12345645', '11', '12', '2018-02-04 18:14:21', '2018-02-04 18:20:58', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('236', '63', '1000', '1000', 'z10001517739492000_7.doc', '', '{}', '7', '7', '2018-02-04 18:19:18', '2018-02-04 18:19:19', '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('237', '62', '1014', '1018', 'z10141517739611000_12.doc', '', null, '12', '13', '2018-02-04 18:20:59', '2018-02-04 19:34:24', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('239', '64', '1000', '1000', 'z10001517743142000_7.doc', null, '23', '7', '7', '2018-02-04 19:19:42', '2018-02-04 19:19:42', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('240', '64', '1000', '1014', 'z10141517743181696_8.doc', '2018-2-4测试.docx', '1111', '7', '8', '2018-02-04 19:19:42', '2018-02-04 19:21:05', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('241', '64', '1014', '1001', 'z10141517743217000_9.doc', '2018-2-4测试.docx', null, '8', '10', '2018-02-04 19:21:05', '2018-02-04 19:22:20', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('242', '64', '1001', null, 'z10011517743316000_11.doc', '', null, '10', '9', '2018-02-04 19:22:20', null, '0', '正确', '0', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('243', '65', '1014', '1014', 'z10141517743513000_7.doc', null, '132', '7', '7', '2018-02-04 19:25:48', '2018-02-04 19:25:48', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('244', '65', '1014', '1004', 'z10041517743547867_8.doc', '2018-2-4测试.docx', '123', '7', '9', '2018-02-04 19:25:48', '2018-02-04 19:26:53', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('245', '65', '1004', '1001', 'z10041517743582000_10.doc', '2018-2-4测试.docx', null, '9', '10', '2018-02-04 19:26:53', '2018-02-04 19:27:52', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('246', '65', '1001', '1014', 'z10011517743648000_11.doc', '', '123', '10', '11', '2018-02-04 19:27:52', '2018-02-04 19:29:02', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('247', '65', '1014', '1014', 'z10141517743705000_12.doc', '', '以盖章', '11', '12', '2018-02-04 19:29:02', '2018-02-04 19:30:08', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('248', '65', '1014', '1018', 'z10141517743767000_13.doc', '', null, '12', '13', '2018-02-04 19:30:08', '2018-02-04 19:31:25', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('251', '66', '1000', '1000', 'z10001517790402000_7.doc', null, '123', '7', '7', '2018-02-05 08:27:22', '2018-02-05 08:27:22', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('252', '66', '1000', '1005', 'z10051517790442060_8.doc', '2018-2-4测试.docx', '123', '7', '8', '2018-02-05 08:27:22', '2018-02-05 08:29:33', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('253', '66', '1005', '1003', 'z10051517790500000_9.doc', '2018-2-3测试.docx', '123', '8', '9', '2018-02-05 08:29:33', '2018-02-05 08:32:54', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('254', '66', '1003', '1001', 'z10031517790627000_10.doc', '2018-2-3测试.docx', '75265', '9', '10', '2018-02-05 08:32:55', '2018-02-05 08:34:00', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('255', '66', '1001', '1000', 'z10011517790808000_11.doc', '2018-2-4测试.docx', '12345', '10', '11', '2018-02-05 08:34:00', '2018-02-05 08:35:30', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('256', '66', '1000', '1014', 'z10001517790898000_12.doc', '', '123', '11', '12', '2018-02-05 08:35:30', '2018-02-05 08:37:08', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('257', '66', '1014', '1018', 'z10141517790970000_13.doc', '', null, '12', '13', '2018-02-05 08:37:08', '2018-02-05 08:38:16', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('258', '67', '1000', '1000', 'z10001517791316000_7.doc', null, '123', '7', '7', '2018-02-05 08:45:19', '2018-02-05 08:45:19', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('259', '67', '1000', '1004', 'z10041517791519473_8.doc', '2018-2-4测试.docx', '已阅', '7', '9', '2018-02-05 08:45:20', '2018-02-05 08:47:55', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('260', '67', '1004', '1001', 'z10041517791581000_10.doc', '2018-2-5.docx', '已签批', '9', '10', '2018-02-05 08:47:55', '2018-02-05 08:50:29', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('261', '67', '1001', '1000', 'z10011517791716000_11.doc', '2018-2-5.docx', '123', '10', '11', '2018-02-05 08:50:30', '2018-02-05 08:52:21', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('262', '67', '1000', '1014', 'z10001517791869000_12.doc', '', '以签章', '11', '12', '2018-02-05 08:52:21', '2018-02-05 08:55:23', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('263', '67', '1014', '1018', 'z10141517792032000_13.doc', '', null, '12', '13', '2018-02-05 08:55:23', '2018-02-05 08:56:37', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('264', '68', '1000', '1000', 'z10001517793237000_7.doc', '2018-2-5.docx', '123请领导批阅', '7', '7', '2018-02-05 09:14:26', '2018-02-05 09:16:08', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('265', '68', '1000', '1014', 'z10001517793293000_8.doc', '2018-2-5.docx', '请批阅', '7', '8', '2018-02-05 09:16:08', '2018-02-05 09:17:58', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('266', '68', '1014', '1004', 'z10141517793418000_9.doc', '2018-2-5.docx', '已阅', '8', '9', '2018-02-05 09:17:58', '2018-02-05 09:19:42', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('267', '68', '1004', '1001', 'z10041517793526000_10.doc', '2018-2-5.docx', '123', '9', '10', '2018-02-05 09:19:42', '2018-02-05 09:22:00', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('268', '68', '1001', '1000', 'z10011517793638000_11.doc', '2018-2-4测试.docx', '已阅', '10', '11', '2018-02-05 09:22:00', '2018-02-05 09:23:10', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('269', '68', '1000', '1014', 'z10001517793754000_12.doc', '', '已签批', '11', '12', '2018-02-05 09:23:10', '2018-02-05 09:25:22', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('270', '68', '1014', '1018', 'z10141517793835000_13.doc', '', null, '12', '13', '2018-02-05 09:25:22', '2018-02-05 09:26:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('271', '69', '1000', '1000', 'z10001517809061000_7.doc', null, '111', '7', '7', '2018-02-05 13:38:00', '2018-02-05 13:38:00', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('272', '69', '1000', '1005', 'z10051517809080192_8.doc', '2018-2-5.docx', '', '7', '8', '2018-02-05 13:38:00', null, '1', '正确', '0', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('273', '70', '1000', '1000', 'z10001517809195000_7.doc', null, '111', '7', '7', '2018-02-05 13:40:18', '2018-02-05 13:40:18', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('274', '70', '1000', '1014', 'z10141517809218401_8.doc', '2018-2-4测试.docx', '1111', '7', '8', '2018-02-05 13:40:18', '2018-02-05 13:42:20', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('275', '70', '1014', '1004', 'z10141517809233000_9.doc', '', null, '8', '9', '2018-02-05 13:42:20', '2018-02-05 13:45:38', '0', '正确', '1', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('276', '70', '1004', '1000', 'z10041517809408000_10.doc', '2018-2-5.docx,2018-2-4测试.docx', '1111', '9', '7', '2018-02-05 13:45:38', '2018-02-05 13:47:45', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('277', '70', '1000', '1014', 'z10001517809551000_8.doc', '2018-2-5.docx', '111111111', '7', '8', '2018-02-05 13:47:45', '2018-02-05 13:48:45', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('278', '70', '1014', '1003', 'z10141517809678000_9.doc', '2018-2-3测试.docx', '45613', '8', '9', '2018-02-05 13:48:45', '2018-02-05 13:50:05', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('279', '70', '1003', '1001', 'z10031517809737000_10.doc', '森林公安测试问题总结2018-2-4.xlsx', '123', '9', '10', '2018-02-05 13:50:05', '2018-02-05 13:51:22', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('280', '70', '1001', '1000', 'z10011517809817000_11.doc', '', '1111', '10', '11', '2018-02-05 13:51:22', '2018-02-05 13:52:09', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('281', '70', '1000', '1022', 'z10001517809900000_12.doc', '', '111', '11', '12', '2018-02-05 13:52:10', '2018-02-05 13:56:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('282', '70', '1022', '1018', 'z10221517810116000_13.doc', '', null, '12', '13', '2018-02-05 13:56:28', '2018-02-05 13:57:00', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('283', '71', '1000', '1000', 'z10001517812491000_7.doc', '2018-2-3测试.docx', '11111', '7', '7', '2018-02-05 14:35:34', '2018-02-05 14:36:51', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('284', '71', '1000', '1005', 'z10001517812539000_8.doc', '2018-2-4测试.docx', '11111111', '7', '8', '2018-02-05 14:36:51', '2018-02-05 14:37:51', '0', '正确', '1', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('285', '71', '1005', '1000', 'z10051517812626000_9.doc', '2018-2-3测试.docx', '已阅', '8', '7', '2018-02-05 14:39:15', '2018-02-05 14:39:53', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('286', '71', '1000', '1005', 'z10001517812757000_8.doc', '2018-2-5.docx', '11111', '7', '8', '2018-02-05 14:39:53', '2018-02-05 14:41:28', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('287', '71', '1005', '1004', 'z10051517812803000_9.doc', '2018-2-5.docx', '1111', '8', '9', '2018-02-05 14:41:28', '2018-02-05 14:42:23', '0', '正确', '1', '1', '0');
INSERT INTO `tb_document_send_task` VALUES ('288', '71', '1004', '1005', 'z10041517812901000_10.doc', '', '123', '9', '8', '2018-02-05 14:42:23', '2018-02-05 14:43:23', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('289', '71', '1005', '1004', 'z10051517812983000_9.doc', '2018-2-4测试.docx', '1111', '8', '9', '2018-02-05 14:43:23', '2018-02-05 14:43:58', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('290', '71', '1004', '1001', 'z10041517813010000_10.doc', '森林公安测试问题总结张彦雷2018-2-5.xlsx', '8520', '9', '10', '2018-02-05 14:43:58', '2018-02-05 14:44:46', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('291', '71', '1001', '1000', 'z10011517813047000_11.doc', '', '111', '10', '11', '2018-02-05 14:44:46', '2018-02-05 14:45:37', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('292', '71', '1000', '1022', 'z10001517813096000_12.doc', '', '以盖章', '11', '12', '2018-02-05 14:45:37', '2018-02-05 14:46:22', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('293', '71', '1022', '1018', 'z10221517813147000_13.doc', '', null, '12', '13', '2018-02-05 14:46:22', '2018-02-05 14:46:48', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('294', '72', '1000', '1000', 'z10001517813321000_7.doc', '2018-2-3测试.docx', '请批阅', '7', '7', '2018-02-05 14:49:06', '2018-02-05 14:49:06', '1', null, '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('295', '72', '1000', '1004', 'z10041517813346294_8.doc', '2018-2-5.docx', '879400', '7', '9', '2018-02-05 14:49:06', '2018-02-05 14:49:57', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('296', '72', '1004', '1001', 'z10041517813355000_10.doc', '2018-2-5.docx', '111', '9', '10', '2018-02-05 14:49:57', '2018-02-05 14:51:19', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('297', '72', '1001', '1000', 'z10011517813413000_11.doc', '', '11111', '10', '11', '2018-02-05 14:51:19', '2018-02-05 14:52:07', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('298', '72', '1000', '1022', 'z10001517813500000_12.doc', '', '1111', '11', '12', '2018-02-05 14:52:07', '2018-02-05 14:53:13', '1', '正确', '1', '0', '0');
INSERT INTO `tb_document_send_task` VALUES ('299', '72', '1022', '1018', 'z10221517813535000_13.doc', '', null, '12', '13', '2018-02-05 14:53:14', '2018-02-05 14:53:45', '1', '正确', '1', '0', '0');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `M_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `M_NAME` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `M_URL` varchar(64) DEFAULT NULL COMMENT '超链接',
  `M_TYPE` varchar(2) DEFAULT '0' COMMENT '菜单类型，0-菜单，1-按钮，默认是0',
  `M_LEAVE` int(11) DEFAULT '1' COMMENT '菜单级别',
  `SORT` int(11) DEFAULT '0' COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENTE_ID` bigint(20) DEFAULT '0' COMMENT '上级菜单名称 0表示最高级菜单',
  `DEL_FLAG` varchar(2) DEFAULT '0' COMMENT '删除标识 0未删除，1已删除',
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '公文办理', null, '0', '1', '1', '2018-01-15 12:27:42', '0', '0');
INSERT INTO `tb_menu` VALUES ('2', '系统管理', null, '0', '1', '2', '2018-01-18 18:07:50', '0', '0');
INSERT INTO `tb_menu` VALUES ('3', '统计查询', null, '0', '1', '3', '2018-01-15 12:27:26', '0', '0');
INSERT INTO `tb_menu` VALUES ('4', '考勤管理', null, '0', '1', '4', '2018-01-15 12:26:58', '0', '0');
INSERT INTO `tb_menu` VALUES ('5', '工作计划', null, '0', '1', '5', '2018-01-15 12:27:08', '0', '0');
INSERT INTO `tb_menu` VALUES ('6', '档案管理', null, '0', '1', '6', '2018-01-18 18:09:03', '0', '0');
INSERT INTO `tb_menu` VALUES ('7', '通知通告', null, '0', '1', '7', '2018-01-18 18:09:41', '0', '0');
INSERT INTO `tb_menu` VALUES ('8', '工作日志', null, '0', '1', '8', '2018-01-18 18:09:55', '0', '0');
INSERT INTO `tb_menu` VALUES ('9', '办公用品', null, '0', '1', '9', '2018-01-18 18:10:02', '0', '0');
INSERT INTO `tb_menu` VALUES ('10', '通讯录', null, '0', '1', '10', '2018-01-22 18:37:23', '0', '0');
INSERT INTO `tb_menu` VALUES ('11', '设备管理', null, '0', '1', '11', '2018-01-22 18:37:26', '0', '0');
INSERT INTO `tb_menu` VALUES ('12', '车辆管理', null, '0', '1', '12', '2018-01-22 18:37:29', '0', '0');
INSERT INTO `tb_menu` VALUES ('13', '我的任务', null, '0', '1', '13', '2018-01-15 12:26:15', '1', '0');
INSERT INTO `tb_menu` VALUES ('14', '公文管理', null, '0', '2', '14', '2018-01-15 12:28:03', '1', '0');
INSERT INTO `tb_menu` VALUES ('15', '我的公文', null, '0', '2', '103', '2018-01-15 12:27:54', '1', '0');
INSERT INTO `tb_menu` VALUES ('16', '公文-收文管理', null, '0', '2', '104', '2018-01-23 21:25:53', '1', '0');
INSERT INTO `tb_menu` VALUES ('17', '公文-发文管理', null, '0', '2', '105', '2018-01-23 21:26:12', '1', '0');
INSERT INTO `tb_menu` VALUES ('18', '简报-收文管理', null, '0', '2', '106', '2018-01-23 21:26:47', '1', '0');
INSERT INTO `tb_menu` VALUES ('19', '简报-发文管理', null, '0', '2', '107', '2018-01-23 21:27:00', '1', '0');
INSERT INTO `tb_menu` VALUES ('20', '权限管理', null, '0', '2', '108', '2018-01-15 12:29:11', '2', '0');
INSERT INTO `tb_menu` VALUES ('21', '组织管理', null, '0', '2', '109', '2018-01-15 12:28:52', '2', '0');
INSERT INTO `tb_menu` VALUES ('22', '人员管理', null, '0', '2', '110', '2018-01-15 12:29:22', '2', '0');
INSERT INTO `tb_menu` VALUES ('23', '收发单位管理', null, '0', '2', '111', '2018-01-22 18:37:32', '2', '0');
INSERT INTO `tb_menu` VALUES ('24', '公文查询', null, '0', '2', '112', '2018-01-28 10:37:35', '3', '0');
INSERT INTO `tb_menu` VALUES ('25', '回退查询', null, '0', '2', '113', '2018-01-28 10:37:51', '3', '0');
INSERT INTO `tb_menu` VALUES ('26', '公文文号管理', null, '0', '2', '114', '2018-02-04 16:09:03', '2', '0');

-- ----------------------------
-- Table structure for tb_node
-- ----------------------------
DROP TABLE IF EXISTS `tb_node`;
CREATE TABLE `tb_node` (
  `NODE_ID` int(11) NOT NULL,
  `NODE` int(11) DEFAULT NULL COMMENT '节点序号',
  `NODE_NAME` varchar(32) DEFAULT NULL COMMENT '节点名称',
  `INDEX` int(1) DEFAULT NULL COMMENT '流程标识',
  `INDEX_NAME` varchar(32) DEFAULT NULL COMMENT '流程名称',
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_node
-- ----------------------------
INSERT INTO `tb_node` VALUES ('1', '1', '收文人员', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('2', '2', '分发人员', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('3', '3', '分管领导', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('4', '4', '科室负责人', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('5', '5', '科员', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('6', '6', '归档', '1', '(公文|简报)收文');
INSERT INTO `tb_node` VALUES ('7', '1', '拟稿', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('8', '2', '核稿', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('9', '3', '审核', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('10', '4', '签批', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('11', '5', '校核', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('12', '6', '盖章', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('13', '7', '发文', '2', '(公文|简报)发文');
INSERT INTO `tb_node` VALUES ('14', '8', '归档', '2', '(公文|简报)发文');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `NOTICE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTICE_TITLE` varchar(255) DEFAULT NULL COMMENT '通知通告的标题',
  `NOTICE_CONTENT` varchar(255) DEFAULT NULL COMMENT '通知通告的内容',
  `NOTICE_TYPE` varchar(255) DEFAULT NULL COMMENT '通知通告的内容',
  `NOTICE_CREATETIME` datetime DEFAULT NULL COMMENT '通知通告的创建时间',
  `NOTICE_CREATER` bigint(20) DEFAULT NULL COMMENT '通知通告的创建人',
  `NOTICE_RECEIVER` varchar(255) DEFAULT NULL COMMENT '通知通告的接收人',
  `FORUSERTYPE` int(11) DEFAULT NULL COMMENT '这个字段目前没用',
  `FORONLINEUSERS` int(11) DEFAULT NULL COMMENT '这个字段目前没用',
  `NEEDREADED` int(11) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT '0',
  `REMARKS2` varchar(255) DEFAULT NULL,
  `REMARKS3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NOTICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('79', '开会', '明天开会', '会议', '2018-01-31 20:12:47', null, '局领导,洪海,闫文忠,李春晓,刘磊', null, null, null, '0', '1001,1002,1003,1004,', '正确');
INSERT INTO `tb_notice` VALUES ('80', '放假', '明天放假', '集体活动', '2018-01-31 21:14:33', null, '局领导,洪海,闫文忠,李春晓,刘磊,刑侦队,王志强,宋瑞军,张政飞,范荣,海龙,王丹,综合科,王丹,刘小兵,春山,冯磊,王飞,张明杰,于远航,孙晓涛', null, null, null, '0', '1001,1002,1003,1004,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,', '正确');
INSERT INTO `tb_notice` VALUES ('82', '关于2018年年假放假通知', '将定于2018-2-15号放假', '集体活动', '2018-02-01 09:40:48', null, '蔡文龙', null, null, null, '0', '1028,', '未知错误');
INSERT INTO `tb_notice` VALUES ('83', '测试_通知通告_z', '此条记录是用来测试的，请忽略。。。', '集体活动', '2018-02-01 09:47:53', null, '张明杰', null, null, null, '0', '1018,', '正确');
INSERT INTO `tb_notice` VALUES ('84', '1111111111111', '11111111111111', '会议', '2018-02-01 20:37:14', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '正确');
INSERT INTO `tb_notice` VALUES ('85', '222222222222', '222222222222', '会议', '2018-02-01 20:45:09', null, null, null, null, null, '0', '1000,1001,1002,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '正确');
INSERT INTO `tb_notice` VALUES ('86', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:07:49', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('87', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:07:55', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('88', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:06', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('89', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:06', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('90', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:07', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('91', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:07', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('92', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:09', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('93', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:09', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('94', '测试_tongzhi', '1', '集体活动', '2018-02-02 21:08:09', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('95', 'ceshi ceshi', '11111', '集体活动', '2018-02-02 21:08:25', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('96', '测试-2018-2-3', '我只是来测试，我就看看，', '集体活动', '2018-02-03 15:15:20', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '正确');
INSERT INTO `tb_notice` VALUES ('98', '1111', '22222', '会议', '2018-02-05 10:09:58', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('99', '22', '22', '会议', '2018-02-05 10:13:53', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('100', '222', '111', '会议', '2018-02-05 10:18:25', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('101', '333', '333', '会议', '2018-02-05 10:21:29', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('102', '22', '22', '会议', '2018-02-05 10:23:31', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('103', '55', '55', '会议', '2018-02-05 10:30:19', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('107', '8888', '88888', '会议', '2018-02-05 11:08:55', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '正确');
INSERT INTO `tb_notice` VALUES ('108', '8888', '88888', '会议', '2018-02-05 11:17:34', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');
INSERT INTO `tb_notice` VALUES ('109', '9999', '99999', '会议', '2018-02-05 11:30:56', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '正确');
INSERT INTO `tb_notice` VALUES ('111', '5656565656', '56565656', '会议', '2018-02-05 22:40:10', null, null, null, null, null, '0', '1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,', '未知错误');

-- ----------------------------
-- Table structure for tb_org
-- ----------------------------
DROP TABLE IF EXISTS `tb_org`;
CREATE TABLE `tb_org` (
  `O_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `O_NAME` varchar(255) DEFAULT NULL COMMENT '组织名称',
  `CREAT_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PARENTE_ID` bigint(20) DEFAULT '0' COMMENT '上级组织ID',
  `DEL_FLAG` varchar(2) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`O_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_org
-- ----------------------------
INSERT INTO `tb_org` VALUES ('1', '内蒙古自治区森林公安', '2018-01-31 15:46:13', '0', '0');
INSERT INTO `tb_org` VALUES ('2', '局领导', '2018-01-31 15:46:54', '1', '0');
INSERT INTO `tb_org` VALUES ('3', '政治部', '2018-01-31 15:47:31', '1', '0');
INSERT INTO `tb_org` VALUES ('4', '刑侦队', '2018-01-31 15:47:40', '1', '0');
INSERT INTO `tb_org` VALUES ('5', '综合科', '2018-01-31 15:47:48', '1', '0');
INSERT INTO `tb_org` VALUES ('6', '法制科', '2018-01-31 15:47:58', '1', '0');
INSERT INTO `tb_org` VALUES ('7', '纪检督察科', '2018-01-31 15:48:07', '1', '0');
INSERT INTO `tb_org` VALUES ('8', '装备科', '2018-01-31 15:48:16', '1', '0');
INSERT INTO `tb_org` VALUES ('9', '信息通信科', '2018-01-31 15:48:25', '1', '0');
INSERT INTO `tb_org` VALUES ('10', '林科院警务区', '2018-01-31 15:48:33', '1', '0');
INSERT INTO `tb_org` VALUES ('11', '测试', '2018-02-03 14:53:25', '5', '1');
INSERT INTO `tb_org` VALUES ('12', '2', '2018-02-03 14:53:40', '11', '0');
INSERT INTO `tb_org` VALUES ('13', '3', '2018-02-03 14:53:55', '12', '0');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `R_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `R_NAME` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEL_FLAG` varchar(2) DEFAULT '0' COMMENT '删除标识0未删除，1已删除',
  `REMARKS` text COMMENT '备注',
  PRIMARY KEY (`R_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '主管领导', '2018-01-25 18:44:45', '0', null);
INSERT INTO `tb_role` VALUES ('3', '分管领导', '2018-01-25 18:49:17', '0', null);
INSERT INTO `tb_role` VALUES ('9', '科室负责人', '2018-01-25 18:45:07', '0', null);
INSERT INTO `tb_role` VALUES ('17', '收文人员', '2018-01-25 18:43:38', '0', null);
INSERT INTO `tb_role` VALUES ('18', '分发人员', '2018-01-25 18:43:52', '0', null);
INSERT INTO `tb_role` VALUES ('19', '盖章人员', '2018-01-25 18:50:31', '0', null);
INSERT INTO `tb_role` VALUES ('20', '科员', '2018-01-21 08:45:42', '0', null);
INSERT INTO `tb_role` VALUES ('21', '归档人员(发文人员)', '2018-01-31 21:11:53', '0', null);

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `RM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `R_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `M_ID` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`RM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('6', '20', '3');
INSERT INTO `tb_role_menu` VALUES ('16', '9', '3');
INSERT INTO `tb_role_menu` VALUES ('17', '9', '4');
INSERT INTO `tb_role_menu` VALUES ('18', '9', '5');
INSERT INTO `tb_role_menu` VALUES ('19', '9', '7');
INSERT INTO `tb_role_menu` VALUES ('20', '9', '8');
INSERT INTO `tb_role_menu` VALUES ('21', '9', '9');
INSERT INTO `tb_role_menu` VALUES ('22', '9', '10');
INSERT INTO `tb_role_menu` VALUES ('23', '1', '2');
INSERT INTO `tb_role_menu` VALUES ('24', '1', '22');
INSERT INTO `tb_role_menu` VALUES ('25', '1', '23');
INSERT INTO `tb_role_menu` VALUES ('26', '1', '3');
INSERT INTO `tb_role_menu` VALUES ('27', '1', '4');
INSERT INTO `tb_role_menu` VALUES ('28', '1', '5');
INSERT INTO `tb_role_menu` VALUES ('29', '1', '7');
INSERT INTO `tb_role_menu` VALUES ('30', '1', '8');
INSERT INTO `tb_role_menu` VALUES ('31', '1', '10');
INSERT INTO `tb_role_menu` VALUES ('32', '3', '1');
INSERT INTO `tb_role_menu` VALUES ('33', '3', '13');
INSERT INTO `tb_role_menu` VALUES ('35', '3', '15');
INSERT INTO `tb_role_menu` VALUES ('36', '3', '2');
INSERT INTO `tb_role_menu` VALUES ('37', '3', '22');
INSERT INTO `tb_role_menu` VALUES ('38', '3', '3');
INSERT INTO `tb_role_menu` VALUES ('39', '3', '4');
INSERT INTO `tb_role_menu` VALUES ('40', '3', '5');
INSERT INTO `tb_role_menu` VALUES ('41', '3', '7');
INSERT INTO `tb_role_menu` VALUES ('42', '3', '8');
INSERT INTO `tb_role_menu` VALUES ('43', '3', '10');
INSERT INTO `tb_role_menu` VALUES ('44', '17', '1');
INSERT INTO `tb_role_menu` VALUES ('45', '17', '13');
INSERT INTO `tb_role_menu` VALUES ('46', '17', '15');
INSERT INTO `tb_role_menu` VALUES ('47', '17', '16');
INSERT INTO `tb_role_menu` VALUES ('48', '17', '18');
INSERT INTO `tb_role_menu` VALUES ('49', '17', '3');
INSERT INTO `tb_role_menu` VALUES ('51', '17', '5');
INSERT INTO `tb_role_menu` VALUES ('52', '17', '7');
INSERT INTO `tb_role_menu` VALUES ('53', '17', '8');
INSERT INTO `tb_role_menu` VALUES ('54', '17', '10');
INSERT INTO `tb_role_menu` VALUES ('55', '1', '1');
INSERT INTO `tb_role_menu` VALUES ('56', '1', '13');
INSERT INTO `tb_role_menu` VALUES ('57', '1', '14');
INSERT INTO `tb_role_menu` VALUES ('58', '1', '15');
INSERT INTO `tb_role_menu` VALUES ('59', '18', '1');
INSERT INTO `tb_role_menu` VALUES ('60', '18', '13');
INSERT INTO `tb_role_menu` VALUES ('61', '18', '15');
INSERT INTO `tb_role_menu` VALUES ('62', '18', '17');
INSERT INTO `tb_role_menu` VALUES ('63', '18', '19');
INSERT INTO `tb_role_menu` VALUES ('64', '18', '3');
INSERT INTO `tb_role_menu` VALUES ('65', '18', '5');
INSERT INTO `tb_role_menu` VALUES ('66', '18', '7');
INSERT INTO `tb_role_menu` VALUES ('67', '18', '8');
INSERT INTO `tb_role_menu` VALUES ('68', '18', '10');
INSERT INTO `tb_role_menu` VALUES ('69', '9', '1');
INSERT INTO `tb_role_menu` VALUES ('70', '9', '13');
INSERT INTO `tb_role_menu` VALUES ('71', '9', '15');
INSERT INTO `tb_role_menu` VALUES ('79', '1', '24');
INSERT INTO `tb_role_menu` VALUES ('80', '1', '25');
INSERT INTO `tb_role_menu` VALUES ('81', '3', '24');
INSERT INTO `tb_role_menu` VALUES ('82', '3', '25');
INSERT INTO `tb_role_menu` VALUES ('83', '9', '24');
INSERT INTO `tb_role_menu` VALUES ('84', '9', '25');
INSERT INTO `tb_role_menu` VALUES ('85', '17', '24');
INSERT INTO `tb_role_menu` VALUES ('86', '17', '25');
INSERT INTO `tb_role_menu` VALUES ('87', '18', '24');
INSERT INTO `tb_role_menu` VALUES ('88', '18', '25');
INSERT INTO `tb_role_menu` VALUES ('89', '20', '1');
INSERT INTO `tb_role_menu` VALUES ('90', '20', '13');
INSERT INTO `tb_role_menu` VALUES ('91', '20', '15');
INSERT INTO `tb_role_menu` VALUES ('92', '20', '24');
INSERT INTO `tb_role_menu` VALUES ('93', '20', '25');
INSERT INTO `tb_role_menu` VALUES ('94', '20', '5');
INSERT INTO `tb_role_menu` VALUES ('95', '20', '7');
INSERT INTO `tb_role_menu` VALUES ('96', '20', '8');
INSERT INTO `tb_role_menu` VALUES ('97', '20', '10');
INSERT INTO `tb_role_menu` VALUES ('110', '25', '1');
INSERT INTO `tb_role_menu` VALUES ('111', '25', '17');
INSERT INTO `tb_role_menu` VALUES ('112', '25', '19');
INSERT INTO `tb_role_menu` VALUES ('113', '25', '5');
INSERT INTO `tb_role_menu` VALUES ('114', '25', '7');
INSERT INTO `tb_role_menu` VALUES ('115', '25', '13');
INSERT INTO `tb_role_menu` VALUES ('116', '25', '14');
INSERT INTO `tb_role_menu` VALUES ('117', '25', '15');
INSERT INTO `tb_role_menu` VALUES ('118', '26', '1');
INSERT INTO `tb_role_menu` VALUES ('119', '26', '13');
INSERT INTO `tb_role_menu` VALUES ('120', '26', '14');
INSERT INTO `tb_role_menu` VALUES ('121', '26', '15');
INSERT INTO `tb_role_menu` VALUES ('122', '26', '16');
INSERT INTO `tb_role_menu` VALUES ('123', '26', '17');
INSERT INTO `tb_role_menu` VALUES ('124', '26', '18');
INSERT INTO `tb_role_menu` VALUES ('125', '26', '19');
INSERT INTO `tb_role_menu` VALUES ('126', '26', '5');
INSERT INTO `tb_role_menu` VALUES ('127', '26', '7');
INSERT INTO `tb_role_menu` VALUES ('128', '19', '1');
INSERT INTO `tb_role_menu` VALUES ('129', '19', '13');
INSERT INTO `tb_role_menu` VALUES ('130', '19', '14');
INSERT INTO `tb_role_menu` VALUES ('131', '19', '15');
INSERT INTO `tb_role_menu` VALUES ('132', '19', '16');
INSERT INTO `tb_role_menu` VALUES ('133', '19', '17');
INSERT INTO `tb_role_menu` VALUES ('134', '19', '18');
INSERT INTO `tb_role_menu` VALUES ('135', '19', '19');
INSERT INTO `tb_role_menu` VALUES ('136', '19', '5');
INSERT INTO `tb_role_menu` VALUES ('137', '19', '7');
INSERT INTO `tb_role_menu` VALUES ('138', '20', '17');
INSERT INTO `tb_role_menu` VALUES ('139', '20', '19');
INSERT INTO `tb_role_menu` VALUES ('148', '27', '2');
INSERT INTO `tb_role_menu` VALUES ('149', '27', '20');
INSERT INTO `tb_role_menu` VALUES ('150', '27', '21');
INSERT INTO `tb_role_menu` VALUES ('151', '27', '22');
INSERT INTO `tb_role_menu` VALUES ('152', '27', '23');
INSERT INTO `tb_role_menu` VALUES ('156', '21', '1');
INSERT INTO `tb_role_menu` VALUES ('157', '21', '13');
INSERT INTO `tb_role_menu` VALUES ('158', '21', '15');
INSERT INTO `tb_role_menu` VALUES ('159', '21', '5');
INSERT INTO `tb_role_menu` VALUES ('160', '21', '7');
INSERT INTO `tb_role_menu` VALUES ('161', '21', '8');
INSERT INTO `tb_role_menu` VALUES ('162', '21', '10');

-- ----------------------------
-- Table structure for tb_send_number
-- ----------------------------
DROP TABLE IF EXISTS `tb_send_number`;
CREATE TABLE `tb_send_number` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `YEAR` varchar(64) DEFAULT NULL COMMENT '年份',
  `TYPE` varchar(2) DEFAULT NULL COMMENT '发文类型(0:赤森公发 1:赤森公函发 2:党务 3.其他 4简报 5信息)',
  `NODE` bigint(255) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_send_number
-- ----------------------------
INSERT INTO `tb_send_number` VALUES ('51', '2018', '1', '7');
INSERT INTO `tb_send_number` VALUES ('52', '2018', '', '4');
INSERT INTO `tb_send_number` VALUES ('53', '2018', '0', '26');
INSERT INTO `tb_send_number` VALUES ('54', '2018', '2', '10');
INSERT INTO `tb_send_number` VALUES ('55', '2018', '3', '1');
INSERT INTO `tb_send_number` VALUES ('56', '2018', '4', '7');
INSERT INTO `tb_send_number` VALUES ('57', '2018', '5', '2');

-- ----------------------------
-- Table structure for tb_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '收发单位的ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '收发单位的名称',
  `MANAGER` varchar(100) DEFAULT NULL COMMENT '单位负责人',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '收发单位的电话',
  `STATUS` varchar(15) DEFAULT NULL COMMENT '收发单位的状态“0”收单位“1”发单位',
  `DEL_FLAG` varchar(15) DEFAULT '0' COMMENT '删除标志位“0”未删除“1”已删除',
  `REMARKS1` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `REMARKS2` varchar(255) DEFAULT NULL COMMENT '备用字段',
  `REMARKS3` varchar(255) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_unit
-- ----------------------------
INSERT INTO `tb_unit` VALUES ('35', '赤峰市财政局', '李涛', '689523', '主送单位', '0', '赤峰市财政局', null, null);
INSERT INTO `tb_unit` VALUES ('36', '赤峰市土地局', '张良', '565189', '抄送单位', '0', '赤峰市土地局', null, null);
INSERT INTO `tb_unit` VALUES ('37', '赤峰市某县环保局', '宋江', '965235', '来文单位', '0', '赤峰市某县环保局', null, null);
INSERT INTO `tb_unit` VALUES ('38', '赤峰市环卫科', '晁盖', '563256', '来文单位', '0', '赤峰市环卫科', null, null);
INSERT INTO `tb_unit` VALUES ('39', '赤峰市某县环保局三科', '曹操', '236542', '主送单位', '0', '赤峰市某县环保局三科', null, null);
INSERT INTO `tb_unit` VALUES ('40', '赤峰市松山区环保处', '张飞', '368952', '来文单位', '0', '赤峰市松山区环保处', null, null);
INSERT INTO `tb_unit` VALUES ('41', '赤峰市政府', '刘备', '232231', '主送单位', '0', '赤峰市政府', null, null);
INSERT INTO `tb_unit` VALUES ('42', '赤峰是环境管理委员会', '赵子龙', '368953', '抄送单位', '0', '赤峰是环境管理委员会', null, null);
INSERT INTO `tb_unit` VALUES ('43', '赤峰市城建局', '关羽', '236595', '来文单位', '0', '赤峰市城建局', null, null);
INSERT INTO `tb_unit` VALUES ('44', '赤峰市基建处', '诸葛亮', '236895', '主送单位', '0', '赤峰市基建处', null, null);
INSERT INTO `tb_unit` VALUES ('45', '赤峰市公安局', '鲁智深', '523648', '抄送单位', '0', '赤峰市公安局', null, null);
INSERT INTO `tb_unit` VALUES ('46', '赤森公安-测试222', '测试人员1', '11111111', '来文单位', '1', '西拉木伦大街', null, null);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USER_NUMBER` varchar(64) DEFAULT NULL COMMENT '工号',
  `USER_NAME` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `SEX` varchar(2) DEFAULT NULL COMMENT '性别',
  `PHONE` varchar(15) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `LOGIN_NAME` varchar(255) DEFAULT NULL COMMENT '登录名称',
  `LOGIN_PASSWORD` varchar(64) DEFAULT '888888' COMMENT '登录密码',
  `CREAT_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `USER_STATUS` varchar(2) DEFAULT '0' COMMENT '在职状态 0在职，1离职',
  `DEL_FLAG` varchar(2) DEFAULT '0' COMMENT '删除标识0未删除',
  `REMARKS` text COMMENT '备注',
  `ORG_ID` bigint(20) DEFAULT NULL COMMENT '所属组织ID',
  `ORG_STATUS` varchar(255) DEFAULT NULL,
  `USER_TYPE` varchar(20) DEFAULT '0' COMMENT '用户类型',
  `ORG_ID1` bigint(20) DEFAULT NULL,
  `ROLE_ID1` bigint(20) DEFAULT NULL,
  `ORG_ID2` bigint(20) DEFAULT NULL,
  `ROLE_ID2` bigint(20) DEFAULT NULL,
  `ORG_ID3` bigint(20) DEFAULT NULL,
  `ROLE_ID3` bigint(20) DEFAULT NULL,
  `ORG_ID4` bigint(20) DEFAULT NULL,
  `ROLE_ID4` bigint(20) DEFAULT NULL,
  `ORG_ID5` bigint(20) DEFAULT NULL,
  `ROLE_ID5` bigint(20) DEFAULT NULL,
  `orgs` varchar(255) DEFAULT NULL COMMENT '所管理的部门id集合，字符串用'',''分割',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1000', 'admin', '超级管理员', '男', '19998669686', '10086@126.com', null, '123456', null, '0', '0', null, null, null, '1', '1', '1', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1001', '1001', '洪海', '男', '11111111111', 'af@xc.com', null, '888888', '2018-01-31 15:52:20', '0', '0', null, null, null, '0', '2', '1', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1002', '1002', '闫文忠', '男', '11111111111', 'gfg@qq.com', null, '888888', '2018-01-31 15:53:33', '0', '0', null, null, null, '0', '2', '3', null, null, null, null, null, null, null, null, '1,3,6,');
INSERT INTO `tb_users` VALUES ('1003', '1003', '李春晓', '女', '11111111111', 'dsf@dfc.com', null, '888888', '2018-01-31 15:54:54', '0', '0', null, null, null, '0', '2', '3', null, null, null, null, null, null, null, null, '1,6,9,');
INSERT INTO `tb_users` VALUES ('1004', '1004', '刘磊', '男', '11111111111', 'dsf@d.com', null, '888888', '2018-01-31 15:55:39', '0', '0', null, null, null, '0', '2', '3', null, null, null, null, null, null, null, null, '1,8,9,');
INSERT INTO `tb_users` VALUES ('1005', '1005', '李莉', '女', '11111111111', 'sdf@cf.com', null, '888888', '2018-01-31 15:56:16', '0', '0', null, null, null, '0', '3', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1006', '1006', '崔健', '男', '11111111111', 'sde@xc.com', null, '888888', '2018-01-31 15:57:06', '0', '0', null, null, null, '0', '3', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1007', '1007', '梁威', '男', '11111111111', 'sdfw@a.com', null, '888888', '2018-01-31 15:57:30', '0', '0', null, null, null, '0', '3', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1008', '1008', '王志强', '男', '11111111111', 'dsaf@qc.com', null, '888888', '2018-01-31 15:58:08', '0', '0', null, null, null, '0', '4', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1009', '1009', '宋瑞军', '男', '11111111111', 'sadd@q.com', null, '888888', '2018-01-31 15:58:34', '0', '0', null, null, null, '0', '4', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1010', '1010', '张政飞', '男', '11111111111', 'sd@c.com', null, '888888', '2018-01-31 15:58:58', '0', '0', null, null, null, '0', '4', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1011', '1011', '范荣', '女', '11111111111', 'sdw@a.com', null, '888888', '2018-01-31 16:00:14', '0', '0', null, null, null, '0', '4', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1012', '1012', '海龙', '男', '11111111111', 'dfe@qc.com', null, '888888', '2018-01-31 16:00:40', '0', '0', null, null, null, '0', '4', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1013', '1013', '王丹', '女', '11111111111', 'dsf@qc.com', null, '888888', '2018-01-31 16:01:08', '0', '0', null, null, null, '0', '5', '17', '9', '20', null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1014', '1014', '刘小兵', '男', '11111111111', 'df@qc.com', null, '888888', '2018-01-31 16:01:45', '0', '0', null, null, null, '0', '5', '9', '5', '20', null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1015', '1015', '春山', '男', '11111111111', 'erf@qc.com', null, '888888', '2018-01-31 16:03:48', '0', '0', null, null, null, '0', '5', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1016', '1016', '冯磊', '男', '11111111111', 'df@qc.com', null, '888888', '2018-01-31 16:21:57', '0', '0', null, null, null, '0', '5', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1017', '1017', '王飞', '男', '11111111111', 'sdfdf@qc.com', null, '888888', '2018-01-31 16:22:27', '0', '0', null, null, null, '0', '5', '18', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1018', '1018', '张明杰', '男', '11111111111', 'sd3@c.com', null, '888888', '2018-01-31 16:22:54', '0', '0', null, null, null, '0', '5', '21', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1019', '1019', '于远航', '男', '11111111111', 'wer@qc.com', null, '888888', '2018-01-31 16:23:21', '0', '0', null, null, null, '0', '5', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1020', '1020', '孙晓涛', '男', '11111111111', 'dsf@qc.com', null, '888888', '2018-01-31 16:23:45', '0', '0', null, null, null, '0', '5', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1021', '1021', '关耀民', '男', '11111111111', 'dsfe@qc.com', null, '888888', '2018-01-31 16:24:28', '0', '0', null, null, null, '0', '6', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1022', '1022', '朱丹', '女', '11111111111', 'df@qc.com', null, '888888', '2018-01-31 16:24:59', '0', '0', null, null, null, '0', '6', '19', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1023', '1023', '李琪', '女', '11111111111', 'dsfd@qc.com', null, '888888', '2018-01-31 16:25:26', '0', '0', null, null, null, '0', '6', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1024', '1024', '李蔚', '女', '11111111111', 'dfd@qc.com', null, '888888', '2018-01-31 16:25:54', '0', '0', null, null, null, '0', '7', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1025', '1025', '弓树军', '男', '11111111111', 'df@qc.com', null, '888888', '2018-01-31 16:26:16', '0', '0', null, null, null, '0', '7', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1026', '1026', '陈延奎', '男', '11111111111', 'df@qc.com', null, '888888', '2018-01-31 16:26:38', '0', '0', null, null, null, '0', '8', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1027', '1027', '曹冀殊', '女', '11111111111', 'dfe@qc.com', null, '888888', '2018-01-31 16:27:10', '0', '0', null, null, null, '0', '8', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1028', '1028', '蔡文龙', '男', '11111111111', 'er@cc.com', null, '888888', '2018-01-31 16:27:37', '0', '0', null, null, null, '0', '9', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1029', '1029', '刘化东', '男', '11111111111', 'dre@qc.com', null, '888888', '2018-01-31 16:28:00', '0', '0', null, null, null, '0', '9', '20', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1030', '1030', '陈晓光', '男', '11111111111', 'wqw@qc.com', null, '888888', '2018-01-31 16:28:31', '0', '0', null, null, null, '0', '10', '9', null, null, null, null, null, null, null, null, '');
INSERT INTO `tb_users` VALUES ('1031', '1031', '张少化', '男', '11111111111', 'we@qc.com', null, '888888', '2018-01-31 16:28:51', '0', '0', null, null, null, '0', '10', '20', null, null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for tb_user_dispatched
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_dispatched`;
CREATE TABLE `tb_user_dispatched` (
  `UD_ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '人员分派（一个人只能分派给另外一个人）',
  `ASSIGNED_UID` bigint(20) DEFAULT NULL COMMENT '委派人ID',
  `ACCEPT_UID` bigint(20) DEFAULT NULL COMMENT '接纳人ID',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '截止时间',
  `VALID` int(2) DEFAULT '0' COMMENT '是否有效 默认0无效',
  PRIMARY KEY (`UD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_dispatched
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_notice`;
CREATE TABLE `tb_user_notice` (
  `USERNOTICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户id',
  `NOTICE_ID` bigint(20) DEFAULT NULL COMMENT '通知通告的id',
  `STATUS` bigint(20) DEFAULT '0' COMMENT '通知通告的状态（个人）',
  `DEL_FLAG` varchar(255) DEFAULT '0' COMMENT '删除标志位',
  `REMARKS1` varchar(255) DEFAULT NULL,
  `REMARKS2` varchar(255) DEFAULT NULL,
  `REMARKS3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USERNOTICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_notice
-- ----------------------------
INSERT INTO `tb_user_notice` VALUES ('233', '1001', '79', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('234', '1002', '79', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('235', '1003', '79', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('236', '1004', '79', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('237', '1001', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('238', '1002', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('239', '1003', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('240', '1004', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('241', '1008', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('242', '1009', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('243', '1010', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('244', '1011', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('245', '1012', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('246', '1013', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('247', '1014', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('248', '1015', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('249', '1016', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('250', '1017', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('251', '1018', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('252', '1019', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('253', '1020', '80', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('255', '1001', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('256', '1002', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('257', '1003', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('258', '1004', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('259', '1005', '81', '1', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('260', '1006', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('261', '1007', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('262', '1008', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('263', '1009', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('264', '1010', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('265', '1011', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('266', '1012', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('267', '1013', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('268', '1014', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('269', '1015', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('270', '1016', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('271', '1017', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('272', '1018', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('273', '1019', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('274', '1020', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('275', '1021', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('276', '1022', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('277', '1023', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('278', '1024', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('279', '1025', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('280', '1026', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('281', '1027', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('282', '1028', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('283', '1029', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('284', '1030', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('285', '1031', '81', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('286', '1028', '82', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('287', '1018', '83', '1', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('288', '1001', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('289', '1002', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('290', '1003', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('291', '1004', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('292', '1005', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('293', '1006', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('294', '1007', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('295', '1008', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('296', '1009', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('297', '1010', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('298', '1011', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('299', '1012', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('300', '1013', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('301', '1014', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('302', '1015', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('303', '1016', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('304', '1017', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('305', '1018', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('306', '1019', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('307', '1020', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('308', '1021', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('309', '1022', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('310', '1023', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('311', '1024', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('312', '1025', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('313', '1026', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('314', '1027', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('315', '1028', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('316', '1029', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('317', '1030', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('318', '1031', '84', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('319', '1000', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('320', '1001', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('321', '1002', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('322', '1004', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('323', '1005', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('324', '1006', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('325', '1007', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('326', '1008', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('327', '1009', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('328', '1010', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('329', '1011', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('330', '1012', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('331', '1013', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('332', '1014', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('333', '1015', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('334', '1016', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('335', '1017', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('336', '1018', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('337', '1019', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('338', '1020', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('339', '1021', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('340', '1022', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('341', '1023', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('342', '1024', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('343', '1025', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('344', '1026', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('345', '1027', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('346', '1028', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('347', '1029', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('348', '1030', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('349', '1031', '85', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('350', '1001', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('351', '1002', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('352', '1003', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('353', '1004', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('354', '1005', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('355', '1006', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('356', '1007', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('357', '1008', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('358', '1009', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('359', '1010', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('360', '1011', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('361', '1012', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('362', '1013', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('363', '1014', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('364', '1015', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('365', '1016', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('366', '1017', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('367', '1018', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('368', '1019', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('369', '1020', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('370', '1021', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('371', '1022', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('372', '1023', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('373', '1024', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('374', '1025', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('375', '1026', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('376', '1027', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('377', '1028', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('378', '1029', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('379', '1030', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('380', '1031', '86', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('381', '1001', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('382', '1002', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('383', '1003', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('384', '1004', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('385', '1005', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('386', '1006', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('387', '1007', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('388', '1008', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('389', '1009', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('390', '1010', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('391', '1011', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('392', '1012', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('393', '1013', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('394', '1014', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('395', '1015', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('396', '1016', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('397', '1017', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('398', '1018', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('399', '1019', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('400', '1020', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('401', '1021', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('402', '1022', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('403', '1023', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('404', '1024', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('405', '1025', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('406', '1026', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('407', '1027', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('408', '1028', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('409', '1029', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('410', '1030', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('411', '1031', '87', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('412', '1001', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('413', '1002', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('414', '1003', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('415', '1004', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('416', '1005', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('417', '1006', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('418', '1007', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('419', '1008', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('420', '1009', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('421', '1010', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('422', '1011', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('423', '1012', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('424', '1013', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('425', '1014', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('426', '1015', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('427', '1016', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('428', '1017', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('429', '1018', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('430', '1019', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('431', '1020', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('432', '1021', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('433', '1022', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('434', '1023', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('435', '1024', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('436', '1025', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('437', '1026', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('438', '1027', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('439', '1028', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('440', '1029', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('441', '1030', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('442', '1031', '88', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('443', '1001', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('444', '1002', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('445', '1003', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('446', '1004', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('447', '1005', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('448', '1006', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('449', '1007', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('450', '1008', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('451', '1009', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('452', '1010', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('453', '1011', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('454', '1012', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('455', '1013', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('456', '1014', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('457', '1015', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('458', '1016', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('459', '1017', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('460', '1018', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('461', '1019', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('462', '1020', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('463', '1021', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('464', '1022', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('465', '1023', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('466', '1024', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('467', '1025', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('468', '1026', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('469', '1027', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('470', '1028', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('471', '1029', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('472', '1030', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('473', '1031', '89', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('474', '1001', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('475', '1002', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('476', '1003', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('477', '1004', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('478', '1005', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('479', '1006', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('480', '1007', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('481', '1008', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('482', '1009', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('483', '1010', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('484', '1011', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('485', '1012', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('486', '1013', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('487', '1014', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('488', '1015', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('489', '1016', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('490', '1017', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('491', '1018', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('492', '1019', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('493', '1020', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('494', '1021', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('495', '1022', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('496', '1023', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('497', '1024', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('498', '1025', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('499', '1026', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('500', '1027', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('501', '1028', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('502', '1029', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('503', '1030', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('504', '1031', '90', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('505', '1001', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('506', '1002', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('507', '1003', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('508', '1004', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('509', '1005', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('510', '1006', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('511', '1007', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('512', '1008', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('513', '1009', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('514', '1010', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('515', '1011', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('516', '1012', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('517', '1013', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('518', '1014', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('519', '1015', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('520', '1016', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('521', '1017', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('522', '1018', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('523', '1019', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('524', '1020', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('525', '1021', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('526', '1022', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('527', '1023', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('528', '1024', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('529', '1025', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('530', '1026', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('531', '1027', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('532', '1028', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('533', '1029', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('534', '1030', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('535', '1031', '91', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('536', '1001', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('537', '1002', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('538', '1003', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('539', '1004', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('540', '1005', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('541', '1006', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('542', '1007', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('543', '1008', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('544', '1009', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('545', '1010', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('546', '1011', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('547', '1012', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('548', '1013', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('549', '1014', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('550', '1015', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('551', '1016', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('552', '1017', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('553', '1018', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('554', '1019', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('555', '1020', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('556', '1021', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('557', '1022', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('558', '1023', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('559', '1024', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('560', '1025', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('561', '1026', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('562', '1027', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('563', '1028', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('564', '1029', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('565', '1030', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('566', '1031', '94', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('567', '1001', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('568', '1002', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('569', '1003', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('570', '1004', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('571', '1005', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('572', '1006', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('573', '1007', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('574', '1008', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('575', '1009', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('576', '1010', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('577', '1011', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('578', '1012', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('579', '1013', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('580', '1014', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('581', '1015', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('582', '1016', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('583', '1017', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('584', '1018', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('585', '1019', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('586', '1020', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('587', '1021', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('588', '1022', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('589', '1023', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('590', '1024', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('591', '1025', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('592', '1026', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('593', '1027', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('594', '1028', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('595', '1029', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('596', '1030', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('597', '1031', '92', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('598', '1001', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('599', '1002', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('600', '1003', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('601', '1004', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('602', '1005', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('603', '1006', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('604', '1007', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('605', '1008', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('606', '1009', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('607', '1010', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('608', '1011', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('609', '1012', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('610', '1013', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('611', '1014', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('612', '1015', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('613', '1016', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('614', '1017', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('615', '1018', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('616', '1019', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('617', '1020', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('618', '1021', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('619', '1022', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('620', '1023', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('621', '1024', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('622', '1025', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('623', '1026', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('624', '1027', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('625', '1028', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('626', '1029', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('627', '1030', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('628', '1031', '93', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('629', '1001', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('630', '1002', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('631', '1003', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('632', '1004', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('633', '1005', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('634', '1006', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('635', '1007', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('636', '1008', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('637', '1009', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('638', '1010', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('639', '1011', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('640', '1012', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('641', '1013', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('642', '1014', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('643', '1015', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('644', '1016', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('645', '1017', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('646', '1018', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('647', '1019', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('648', '1020', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('649', '1021', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('650', '1022', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('651', '1023', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('652', '1024', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('653', '1025', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('654', '1026', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('655', '1027', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('656', '1028', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('657', '1029', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('658', '1030', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('659', '1031', '95', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('660', '1001', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('661', '1002', '96', '1', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('662', '1003', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('663', '1004', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('664', '1005', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('665', '1006', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('666', '1007', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('667', '1008', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('668', '1009', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('669', '1010', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('670', '1011', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('671', '1012', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('672', '1013', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('673', '1014', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('674', '1015', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('675', '1016', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('676', '1017', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('677', '1018', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('678', '1019', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('679', '1020', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('680', '1021', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('681', '1022', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('682', '1023', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('683', '1024', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('684', '1025', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('685', '1026', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('686', '1027', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('687', '1028', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('688', '1029', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('689', '1030', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('690', '1031', '96', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('691', '1001', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('692', '1002', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('693', '1003', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('694', '1004', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('695', '1005', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('696', '1006', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('697', '1007', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('698', '1008', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('699', '1009', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('700', '1010', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('701', '1011', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('702', '1012', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('703', '1013', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('704', '1014', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('705', '1015', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('706', '1016', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('707', '1017', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('708', '1018', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('709', '1019', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('710', '1020', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('711', '1021', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('712', '1022', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('713', '1023', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('714', '1024', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('715', '1025', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('716', '1026', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('717', '1027', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('718', '1028', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('719', '1029', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('720', '1030', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('721', '1031', '98', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('722', '1001', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('723', '1002', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('724', '1003', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('725', '1004', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('726', '1005', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('727', '1006', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('728', '1007', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('729', '1008', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('730', '1009', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('731', '1010', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('732', '1011', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('733', '1012', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('734', '1013', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('735', '1014', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('736', '1015', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('737', '1016', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('738', '1017', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('739', '1018', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('740', '1019', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('741', '1020', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('742', '1021', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('743', '1022', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('744', '1023', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('745', '1024', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('746', '1025', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('747', '1026', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('748', '1027', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('749', '1028', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('750', '1029', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('751', '1030', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('752', '1031', '99', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('753', '1001', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('754', '1002', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('755', '1003', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('756', '1004', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('757', '1005', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('758', '1006', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('759', '1007', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('760', '1008', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('761', '1009', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('762', '1010', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('763', '1011', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('764', '1012', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('765', '1013', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('766', '1014', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('767', '1015', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('768', '1016', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('769', '1017', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('770', '1018', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('771', '1019', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('772', '1020', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('773', '1021', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('774', '1022', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('775', '1023', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('776', '1024', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('777', '1025', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('778', '1026', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('779', '1027', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('780', '1028', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('781', '1029', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('782', '1030', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('783', '1031', '100', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('784', '1001', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('785', '1002', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('786', '1003', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('787', '1004', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('788', '1005', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('789', '1006', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('790', '1007', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('791', '1008', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('792', '1009', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('793', '1010', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('794', '1011', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('795', '1012', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('796', '1013', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('797', '1014', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('798', '1015', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('799', '1016', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('800', '1017', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('801', '1018', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('802', '1019', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('803', '1020', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('804', '1021', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('805', '1022', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('806', '1023', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('807', '1024', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('808', '1025', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('809', '1026', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('810', '1027', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('811', '1028', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('812', '1029', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('813', '1030', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('814', '1031', '101', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('815', '1001', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('816', '1002', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('817', '1003', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('818', '1004', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('819', '1005', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('820', '1006', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('821', '1007', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('822', '1008', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('823', '1009', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('824', '1010', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('825', '1011', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('826', '1012', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('827', '1013', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('828', '1014', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('829', '1015', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('830', '1016', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('831', '1017', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('832', '1018', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('833', '1019', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('834', '1020', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('835', '1021', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('836', '1022', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('837', '1023', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('838', '1024', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('839', '1025', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('840', '1026', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('841', '1027', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('842', '1028', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('843', '1029', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('844', '1030', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('845', '1031', '102', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('846', '1001', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('847', '1002', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('848', '1003', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('849', '1004', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('850', '1005', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('851', '1006', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('852', '1007', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('853', '1008', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('854', '1009', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('855', '1010', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('856', '1011', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('857', '1012', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('858', '1013', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('859', '1014', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('860', '1015', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('861', '1016', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('862', '1017', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('863', '1018', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('864', '1019', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('865', '1020', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('866', '1021', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('867', '1022', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('868', '1023', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('869', '1024', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('870', '1025', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('871', '1026', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('872', '1027', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('873', '1028', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('874', '1029', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('875', '1030', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('876', '1031', '103', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('877', '1001', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('878', '1002', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('879', '1003', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('880', '1004', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('881', '1005', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('882', '1006', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('883', '1007', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('884', '1008', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('885', '1009', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('886', '1010', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('887', '1011', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('888', '1012', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('889', '1013', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('890', '1014', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('891', '1015', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('892', '1016', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('893', '1017', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('894', '1018', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('895', '1019', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('896', '1020', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('897', '1021', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('898', '1022', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('899', '1023', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('900', '1024', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('901', '1025', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('902', '1026', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('903', '1027', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('904', '1028', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('905', '1029', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('906', '1030', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('907', '1031', '107', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('908', '1001', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('909', '1002', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('910', '1003', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('911', '1004', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('912', '1005', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('913', '1006', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('914', '1007', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('915', '1008', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('916', '1009', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('917', '1010', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('918', '1011', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('919', '1012', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('920', '1013', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('921', '1014', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('922', '1015', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('923', '1016', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('924', '1017', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('925', '1018', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('926', '1019', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('927', '1020', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('928', '1021', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('929', '1022', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('930', '1023', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('931', '1024', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('932', '1025', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('933', '1026', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('934', '1027', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('935', '1028', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('936', '1029', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('937', '1030', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('938', '1031', '108', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('939', '1001', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('940', '1002', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('941', '1003', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('942', '1004', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('943', '1005', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('944', '1006', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('945', '1007', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('946', '1008', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('947', '1009', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('948', '1010', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('949', '1011', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('950', '1012', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('951', '1013', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('952', '1014', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('953', '1015', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('954', '1016', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('955', '1017', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('956', '1018', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('957', '1019', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('958', '1020', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('959', '1021', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('960', '1022', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('961', '1023', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('962', '1024', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('963', '1025', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('964', '1026', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('965', '1027', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('966', '1028', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('967', '1029', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('968', '1030', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('969', '1031', '109', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('970', '1001', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('971', '1002', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('972', '1003', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('973', '1004', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('974', '1005', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('975', '1006', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('976', '1007', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('977', '1008', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('978', '1009', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('979', '1010', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('980', '1011', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('981', '1012', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('982', '1013', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('983', '1014', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('984', '1015', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('985', '1016', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('986', '1017', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('987', '1018', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('988', '1019', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('989', '1020', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('990', '1021', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('991', '1022', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('992', '1023', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('993', '1024', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('994', '1025', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('995', '1026', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('996', '1027', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('997', '1028', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('998', '1029', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('999', '1030', '111', '0', '0', null, null, null);
INSERT INTO `tb_user_notice` VALUES ('1000', '1031', '111', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for tb_workplan
-- ----------------------------
DROP TABLE IF EXISTS `tb_workplan`;
CREATE TABLE `tb_workplan` (
  `WORKPLAN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `WORKPLAN_TITLE` varchar(255) DEFAULT NULL COMMENT '工作计划标题',
  `WORKPLAN_CONTENT` varchar(255) DEFAULT NULL COMMENT '工作计划内容',
  `WORKPLAN_OWNER` bigint(20) DEFAULT NULL COMMENT '工作计划的拥有者',
  `WORKPLAN_STARTTIME` datetime DEFAULT NULL COMMENT '工作计划的开始时间',
  `WORKPLAN_ENDTIME` datetime DEFAULT NULL COMMENT '工作计划的结束时间',
  `WORKPLAN_NOTICETIME` datetime DEFAULT NULL,
  `DEL_FLAG` varchar(10) DEFAULT '0' COMMENT '工作计划的删除标志位',
  `STATUS` varchar(10) DEFAULT NULL COMMENT '工作计划的状态',
  `REMARKS1` varchar(255) DEFAULT NULL,
  `REMARKS2` varchar(255) DEFAULT NULL,
  `REMARKS3` varchar(255) DEFAULT NULL,
  `REMARKS4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WORKPLAN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_workplan
-- ----------------------------
INSERT INTO `tb_workplan` VALUES ('32', '开会', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1000', '2018-02-01 00:00:00', '2018-02-01 00:00:00', null, '0', '已结束', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('33', '聚餐', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1004', '2018-02-02 00:00:00', '2018-02-03 00:00:00', null, '0', '未开始', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('34', '开会', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1005', '2018-01-31 00:00:00', '2018-02-01 00:00:00', null, '0', '进行中', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('35', '旅游', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1005', '2018-02-02 00:00:00', '2018-02-03 00:00:00', null, '0', '未开始', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('36', '加班', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1006', '2018-02-01 00:00:00', '2018-02-02 00:00:00', null, '0', '未开始', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('37', '提交报告', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1006', '2018-02-08 00:00:00', '2018-02-10 00:00:00', null, '0', '未开始', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('38', '修改文件', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1000', '2018-02-01 00:00:00', '2018-02-02 00:00:00', null, '0', '未开始', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('39', '关于2018年的工作安排_测试', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1000', '2018-02-01 00:00:00', '2018-02-15 00:00:00', null, '0', '进行中', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('40', '2018-2-3-测试-我是来测试的，请忽略', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1000', '2018-02-03 00:00:00', '2018-02-04 00:00:00', null, '0', '进行中', null, null, null, null);
INSERT INTO `tb_workplan` VALUES ('41', '1', '的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的的的的的饿的饿的的的的', '1002', '2018-02-06 00:00:00', '2018-02-06 00:00:00', null, '0', '未开始', '未知错误', null, null, null);

-- ----------------------------
-- View structure for doc_fb_view
-- ----------------------------
DROP VIEW IF EXISTS `doc_fb_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `doc_fb_view` AS select `tds`.`SEND_ID` AS `ID`,`tds`.`NUMBER` AS `NUMBER`,`tds`.`TITLE` AS `TITLE`,`tds`.`CREATE_TIME` AS `CREATE_TIME`,`tds`.`ARCHIVAL_PERIOD` AS `ARCHIVAL_PERIOD`,`tds`.`PAGES` AS `PAGES`,`tds`.`SEND_STATUS` AS `isEnd`,`tdst`.`POFILE` AS `POFILE`,`tor`.`O_ID` AS `O_ID`,`tor`.`O_NAME` AS `O_NAME`,`tdst`.`TASK_ID` AS `TASK_ID`,`tdst`.`START_NODE_ID` AS `START_NODE_ID`,`tdst`.`END_NODE_ID` AS `END_NODE_ID`,`tdst`.`START_PERSON_ID` AS `START_PERSON_ID`,`tdst`.`END_PERSON_ID` AS `END_PERSON_ID`,`tdst`.`TASK_STATUS` AS `TASK_STATUS`,`tdst`.`OPINION` AS `OPINION`,`tdst`.`isBack` AS `isBack`,`tds`.`DEL_FLAG` AS `DEL_FLAG`,1 AS `mark` from ((`tb_document_send_task` `tdst` left join `tb_document_send` `tds` on((`tdst`.`SEND_ID` = `tds`.`SEND_ID`))) left join `tb_org` `tor` on((`tds`.`HOST_DEPARTMENT` = `tor`.`O_ID`))) union all select `tdr`.`RECEIVE_ID` AS `ID`,`tdr`.`NUMBER` AS `NUMBER`,`tdr`.`TITLE` AS `TITLE`,`tdr`.`CREATE_TIME` AS `CREATE_TIME`,`tdr`.`ARCHIVAL_PERIOD` AS `ARCHIVAL_PERIOD`,`tdr`.`PAGES` AS `PAGES`,`tdr`.`RECEIVE_STATUS` AS `isEnd`,`tdr`.`POFILE` AS `POFILE`,`tor`.`O_ID` AS `O_ID`,`tor`.`O_NAME` AS `O_NAME`,`tdrt`.`TASK_ID` AS `TASK_ID`,`tdrt`.`START_NODE_ID` AS `START_NODE_ID`,`tdrt`.`END_NODE_ID` AS `END_NODE_ID`,`tdrt`.`START_PERSON_ID` AS `START_PERSON_ID`,`tdrt`.`END_PERSON_ID` AS `END_PERSON_ID`,`tdrt`.`TASK_STATUS` AS `TASK_STATUS`,`tdrt`.`OPINION` AS `OPINION`,`tdrt`.`isBack` AS `isBack`,`tdr`.`DEL_FLAG` AS `DEL_FLAG`,2 AS `mark` from ((`tb_document_receive_task` `tdrt` left join `tb_document_receive` `tdr` on((`tdr`.`RECEIVE_ID` = `tdrt`.`RECEIVE_ID`))) left join `tb_org` `tor` on((`tdr`.`COMPANY` = `tor`.`O_ID`))) union all select `tbs`.`SEND_ID` AS `ID`,`tbs`.`NUMBER` AS `NUMBER`,`tbs`.`TITLE` AS `TITLE`,`tbs`.`CREATE_TIME` AS `CREATE_TIME`,`tbs`.`ARCHIVAL_PERIOD` AS `ARCHIVAL_PERIOD`,`tbs`.`PAGES` AS `PAGES`,`tbs`.`SEND_STATUS` AS `isEnd`,`tbst`.`OPINION` AS `OPINION`,`tor`.`O_ID` AS `O_ID`,`tor`.`O_NAME` AS `O_NAME`,`tbst`.`TASK_ID` AS `TASK_ID`,`tbst`.`START_NODE_ID` AS `START_NODE_ID`,`tbst`.`END_NODE_ID` AS `END_NODE_ID`,`tbst`.`START_PERSON_ID` AS `START_PERSON_ID`,`tbst`.`END_PERSON_ID` AS `END_PERSON_ID`,`tbst`.`TASK_STATUS` AS `TASK_STATUS`,`tbst`.`OPINION` AS `OPINION`,`tbst`.`isBack` AS `isBack`,`tbs`.`DEL_FLAG` AS `DEL_FLAG`,3 AS `mark` from ((`tb_briefing_send_task` `tbst` left join `tb_briefing_send` `tbs` on((`tbst`.`SEND_ID` = `tbs`.`SEND_ID`))) left join `tb_org` `tor` on((`tbs`.`HOST_DEPARTMENT` = `tor`.`O_ID`))) union all select `tbr`.`RECEIVE_ID` AS `ID`,`tbr`.`NUMBER` AS `NUMBER`,`tbr`.`TITLE` AS `TITLE`,`tbr`.`CREATE_TIME` AS `CREATE_TIME`,`tbr`.`ARCHIVAL_PERIOD` AS `ARCHIVAL_PERIOD`,`tbr`.`PAGES` AS `PAGES`,`tbr`.`RECEIVE_STATUS` AS `isEnd`,`tbr`.`POFILE` AS `POFILE`,`tor`.`O_ID` AS `O_ID`,`tor`.`O_NAME` AS `O_NAME`,`tbrt`.`TASK_ID` AS `TASK_ID`,`tbrt`.`START_NODE_ID` AS `START_NODE_ID`,`tbrt`.`END_NODE_ID` AS `END_NODE_ID`,`tbrt`.`START_PERSON_ID` AS `START_PERSON_ID`,`tbrt`.`END_PERSON_ID` AS `END_PERSON_ID`,`tbrt`.`TASK_STATUS` AS `TASK_STATUS`,`tbrt`.`OPINION` AS `OPINION`,`tbrt`.`isBack` AS `isBack`,`tbr`.`DEL_FLAG` AS `DEL_FLAG`,4 AS `mark` from ((`tb_briefing_receive_task` `tbrt` left join `tb_briefing_receive` `tbr` on((`tbr`.`RECEIVE_ID` = `tbrt`.`RECEIVE_ID`))) left join `tb_org` `tor` on((`tbr`.`COMPANY` = `tor`.`O_ID`))) ;

-- ----------------------------
-- Function structure for getMenuTree
-- ----------------------------
DROP FUNCTION IF EXISTS `getMenuTree`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getMenuTree`(menuId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN 
DECLARE ptemp varchar(1000);
DECLARE ctemp varchar(1000);
       SET ptemp = '#';
       SET ctemp =cast(menuId as CHAR);
       WHILE ctemp is not null DO
             SET ptemp = concat(ptemp,',',ctemp);
            SELECT group_concat(M_ID) INTO ctemp FROM tb_menu
            WHERE FIND_IN_SET(PARENTE_ID,ctemp)>0; 
       END WHILE;  
       RETURN ptemp;  
     END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for getOrgTree
-- ----------------------------
DROP FUNCTION IF EXISTS `getOrgTree`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getOrgTree`(orgId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN 
DECLARE ptemp varchar(1000);
DECLARE ctemp varchar(1000);
       SET ptemp = '#';
       SET ctemp =cast(orgId as CHAR);
       WHILE ctemp is not null DO
             SET ptemp = concat(ptemp,',',ctemp);
            SELECT group_concat(O_ID) INTO ctemp FROM tb_org   
            WHERE FIND_IN_SET(PARENTE_ID,ctemp)>0 AND DEL_FLAG='0'; 
       END WHILE;  
       RETURN ptemp;  
     END
;;
DELIMITER ;
