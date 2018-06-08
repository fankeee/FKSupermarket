/*
Navicat MySQL Data Transfer

Source Server         : ltm
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : csams

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-05-12 12:22:17
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_actggoods`
-- ----------------------------
DROP TABLE IF EXISTS `t_actggoods`;
CREATE TABLE `t_actggoods` (
  `G_id` int(11) DEFAULT NULL,
  `AC_id` int(11) DEFAULT NULL,
  `AL_num` int(11) NOT NULL,
  KEY `FK_Relationship_5` (`G_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`G_id`) REFERENCES `t_goods` (`G_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_actggoods
-- ----------------------------
INSERT INTO `t_actggoods` VALUES ('1', '1', '20');
INSERT INTO `t_actggoods` VALUES ('2', '1', '4');
INSERT INTO `t_actggoods` VALUES ('9', '1', '4');
INSERT INTO `t_actggoods` VALUES ('8', '2', '3');
INSERT INTO `t_actggoods` VALUES ('4', '2', '2');
INSERT INTO `t_actggoods` VALUES ('5', '2', '2');
INSERT INTO `t_actggoods` VALUES ('1', '3', '30');
INSERT INTO `t_actggoods` VALUES ('2', '3', '6');
INSERT INTO `t_actggoods` VALUES ('3', '3', '2');
INSERT INTO `t_actggoods` VALUES ('4', '3', '2');
INSERT INTO `t_actggoods` VALUES ('5', '3', '4');
INSERT INTO `t_actggoods` VALUES ('6', '3', '1');
INSERT INTO `t_actggoods` VALUES ('8', '3', '3');
INSERT INTO `t_actggoods` VALUES ('9', '3', '6');
INSERT INTO `t_actggoods` VALUES ('1', '5', '10');
INSERT INTO `t_actggoods` VALUES ('2', '5', '3');
INSERT INTO `t_actggoods` VALUES ('8', '5', '1');
INSERT INTO `t_actggoods` VALUES ('1', '6', '8');
INSERT INTO `t_actggoods` VALUES ('2', '6', '4');
INSERT INTO `t_actggoods` VALUES ('9', '6', '4');
INSERT INTO `t_actggoods` VALUES ('3', '6', '1');
INSERT INTO `t_actggoods` VALUES ('5', '6', '3');
INSERT INTO `t_actggoods` VALUES ('1', '7', '2');
INSERT INTO `t_actggoods` VALUES ('2', '7', '10');
INSERT INTO `t_actggoods` VALUES ('7', '7', '1');
INSERT INTO `t_actggoods` VALUES ('1', '8', '8');
INSERT INTO `t_actggoods` VALUES ('2', '8', '2');
INSERT INTO `t_actggoods` VALUES ('9', '8', '2');
INSERT INTO `t_actggoods` VALUES ('5', '8', '2');
INSERT INTO `t_actggoods` VALUES ('4', '8', '2');

-- ----------------------------
-- Table structure for `t_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `AC_id` int(11) NOT NULL AUTO_INCREMENT,
  `AC_theme` varchar(30) NOT NULL,
  `AC_organize` varchar(30) NOT NULL,
  `AC_undertaker` varchar(30) NOT NULL,
  `AC_people` varchar(30) NOT NULL,
  `AC_tel` varchar(11) NOT NULL,
  `AC_time` varchar(30) NOT NULL,
  `AC_location` varchar(10) NOT NULL,
  `AC_money` float NOT NULL,
  `AC_remark` varchar(50) DEFAULT NULL,
  `AC_state` int(11) NOT NULL,
  PRIMARY KEY (`AC_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('1', 'LOL大赛', '桂林理工大学', '理学院', '陈薇', '17044345676', '2017-5-6', '02524', '125', null, '1');
INSERT INTO `t_activity` VALUES ('2', '理学院K歌大赛', '理学院', '团委学生会', '陈薇', '15656754654', '2017-6-6', '体育训练馆', '320', '经费过高', '0');
INSERT INTO `t_activity` VALUES ('3', '毕业晚会', '桂林理工大学', '测绘学院', '王五', '18567384493', '2018-5-6', '体育训练馆', '540', null, '0');
INSERT INTO `t_activity` VALUES ('4', '理学院暑期“三下乡”社会实践', '桂林理工大学', '理学院', '张三', '18877384493', '2016-7-6', '校外', '675', null, '1');
INSERT INTO `t_activity` VALUES ('5', '义务维修', '理学院', '理学院物理协会', '李丽', '18745657653', '2017-11-6', '一号食堂', '54', null, '1');
INSERT INTO `t_activity` VALUES ('6', '辩论赛', '桂林理工大学', '信息学院', '罗莎', '18877384773', '2018-4-20', '06102', '98', '主题不明确', '0');
INSERT INTO `t_activity` VALUES ('7', '桂工杯篮球联赛', '桂林理工大学', '环境学院', '黄龙', '18345778654', '2015-5-6', '二号篮球场', '456', null, '1');
INSERT INTO `t_activity` VALUES ('8', '英文朗诵比赛', '桂林理工大学', '英语协会', '梁红', '15571384493', '2018-5-21', '05102', '143', null, '0');
INSERT INTO `t_activity` VALUES ('9', '桂工杯足球联赛', '桂林理工大学', '理学院', '张三', '18877384493', '2018-5-23', '足球场', '100', null, '1');

-- ----------------------------
-- Table structure for `t_community`
-- ----------------------------
DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `C_id` int(11) NOT NULL AUTO_INCREMENT,
  `R_id` int(11) DEFAULT NULL,
  `C_name` varchar(30) NOT NULL,
  `C_people` varchar(30) NOT NULL,
  `C_num` varchar(10) NOT NULL,
  `C_sex` char(2) DEFAULT NULL,
  `C_class` varchar(20) NOT NULL,
  `C_pwd` varchar(30) NOT NULL,
  `C_tel` varchar(11) NOT NULL,
  `C_qq` varchar(20) NOT NULL,
  `C_introduce` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`C_id`),
  KEY `FK_Relationship_2` (`R_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`R_id`) REFERENCES `t_role` (`R_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_community
-- ----------------------------
INSERT INTO `t_community` VALUES ('1', '2', '理学院团委学生会', '张三', '3141369987', '男', '信科14-2班', '123456', '18877384493', '878765789', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('3', '2', '测绘团委学生会', '王五', '3141387987', '男', '地信14-2班', '23r34fr', '18567384493', '234321457', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('4', '2', '地科学院团委学生会', '冯磊', '3141363427', '男', '宝石14-2班', 'f3f34r34', '18127384493', '4643567554', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('5', '2', '信息学院团委学生会', '罗莎', '3142369987', '女', '物联网14-2班', 'ff34f34f', '18877384773', '453267876', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('7', '2', '理学院团委学生会', '陈薇', '3134369987', '女', '信科14-2班', 'f3f34fr34f', '18777384493', '345432423', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('8', '2', '外国语学院团委学生会', '姜蓉', '3141269987', '女', '英语14-2班', 'f3f34f34', '15077384493', '789878987', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('9', '2', '旅游学院团委学生会', '李明伟', '3145669987', '男', '风景园林14-2班', 'f3rf34r', '15577384493', '565345434', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('10', '2', '环境学院团委学生会', '王世超', '3431369987', '男', '给排水14-2班', 'vrerf', '18277384493', '5656545654', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('11', '2', '人文学院团委学生会', '罗丹', '3187369987', '女', '历史14-2班', 'f34f34fg', '15577384493', '345654565', '学院学生会是在学院党委领导、学院团委指导下开展学生工作的学生组织，本会的宗旨围绕学院党政方针，全心全意为同学的成长，成才服务。');
INSERT INTO `t_community` VALUES ('12', '2', '英语协会', '梁红', '3117369987', '女', '英语14-2班', 'nyujnrthrt', '15571384493', '456545654', '英语协会以提高同学们的英语学习兴趣和学习水平为己任，营造良好的英语学习氛围，寓学于乐，有效的提高会员以及英语爱好者的英语交际能力，营造浓厚的英语学习氛围，树立良好的校风，提高广大会员及英语爱好者的英语能力和素质是英协的宗旨。');
INSERT INTO `t_community` VALUES ('13', '2', '书法协会', '承德', '3117334287', '女', '英语14-2班', 'nyujnrthrt', '15571384493', '456545654', '书法协会是我校成立较早的社团之一，校书法协会成立于1981年。二十几年来本着求实创新的精神，以提高社员书法水平为目的，加强基本功训练为宗旨，营造校园书法气氛为本职，在师大校园里树立了良好的社团形象。书法协会通过举办一系列的书法展和全校性的书法大赛，邀请校内外的指导老师指点讲评，开展讲座等活动，以及社员间的互相观摩交流等常规活动，提高社员书法理论及实践水平，培养了一大批书法爱好者，有不少社员在国内外各级书法大赛中获奖，或在书法杂志上发表文章，在师大校园有着广泛的影响。');
INSERT INTO `t_community` VALUES ('14', '2', '自行车协会', '神威', '3132169987', '女', '英语14-2班', 'nyujnrthrt', '15571384493', '456545654', '协会宗旨:本协会以机械、公益、创新、低碳环保、科技为本、科技育人为宗旨。协会纲要:协会以机械服务社会，从环保与公益两方面展开。协会把关爱社会作为发展的指导精神。协会通过租借自行车平台将所得资金捐献给贫困地区儿童或灾区，给社会一个微薄的力量支持。协会有固定帮助对象，让他们与协会共同成长。另一方面协会促进人们对自行车发展和认识，增强同学们对机械结构的了解和锻炼同学们的自身素质。');
INSERT INTO `t_community` VALUES ('15', '2', '剪纸协会', '维度', '3187659987', '女', '英语14-2班', 'nyujnrthrt', '15571384493', '456545654', '剪纸艺术协会秉承\"发扬民间传统艺术，弘扬并保护民间非物文化遗产\"的宗旨，致力于培养学生在保护并推动民族民间传统文化方面的兴趣和能力，以\"弘扬民族文化，展示民族风采\"为活动目的，争取在国家非物质文化遗产的宣传和保护上尽协会的绵薄之力。');
INSERT INTO `t_community` VALUES ('16', '2', '轮滑协会', '苏少', '3117349987', '女', '英语14-2班', 'nyujnrthrt', '15571384493', '456545654', '轮滑协会，是一个可以为众多的同学提供平台，提升语言表达能力、社会交往能力的组织。在丰富同学们校园生活之余，还能够认识结交很多的朋友。');
INSERT INTO `t_community` VALUES ('32', '2', '动漫协会', '张达', '3141349987', '男', '信科16-1班', '123456', '14456545566', '232323456', '111111111111111111111');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `G_id` int(11) NOT NULL AUTO_INCREMENT,
  `G_name` varchar(30) NOT NULL,
  `G_num` int(11) NOT NULL,
  PRIMARY KEY (`G_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '椅子', '43');
INSERT INTO `t_goods` VALUES ('2', '折叠桌', '39');
INSERT INTO `t_goods` VALUES ('3', '展板', '20');
INSERT INTO `t_goods` VALUES ('4', '音箱', '12');
INSERT INTO `t_goods` VALUES ('5', '话筒', '6');
INSERT INTO `t_goods` VALUES ('6', '地毯', '4');
INSERT INTO `t_goods` VALUES ('7', '太阳伞', '11');
INSERT INTO `t_goods` VALUES ('8', '插座', '12');
INSERT INTO `t_goods` VALUES ('9', '桌布', '10');
INSERT INTO `t_goods` VALUES ('10', '折叠桌', '39');
INSERT INTO `t_goods` VALUES ('11', '展板', '20');
INSERT INTO `t_goods` VALUES ('12', '音箱', '12');
INSERT INTO `t_goods` VALUES ('13', '话筒', '6');
INSERT INTO `t_goods` VALUES ('14', '地毯', '4');
INSERT INTO `t_goods` VALUES ('15', '太阳伞', '11');
INSERT INTO `t_goods` VALUES ('16', '插座', '12');
INSERT INTO `t_goods` VALUES ('17', '桌布', '10');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `MA_id` int(11) NOT NULL AUTO_INCREMENT,
  `R_id` int(11) DEFAULT NULL,
  `C_id` int(11) DEFAULT NULL,
  `MA_num` varchar(30) NOT NULL,
  `MA_pwd` varchar(20) NOT NULL,
  `MA_name` varchar(30) NOT NULL,
  `MA_sex` char(2) DEFAULT NULL,
  `MA_class` varchar(30) NOT NULL,
  `MA_position` varchar(30) NOT NULL,
  `MA_tel` varchar(11) NOT NULL,
  PRIMARY KEY (`MA_id`),
  KEY `FK_Relationship_9` (`C_id`),
  KEY `FK_Relationship_6` (`R_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`R_id`) REFERENCES `t_role` (`R_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`C_id`) REFERENCES `t_community` (`C_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', '3', '1', '3141269987', '123456', '张三', '男', '信科14-1班', '学生会会长', '18877384493');
INSERT INTO `t_manager` VALUES ('2', '3', '5', '3142369987', 'ff34f34f', '罗莎', '女', '土木14-2班', '学生会副会长', '15677384493');
INSERT INTO `t_manager` VALUES ('5', '3', '9', '3143246676', '123456', '梁丹', '女', '信科14-1班', '学生会副会长', '18877876653');

-- ----------------------------
-- Table structure for `t_merber`
-- ----------------------------
DROP TABLE IF EXISTS `t_merber`;
CREATE TABLE `t_merber` (
  `M_id` int(11) NOT NULL AUTO_INCREMENT,
  `C_id` int(11) DEFAULT NULL,
  `R_id` int(11) DEFAULT NULL,
  `M_num` varchar(20) NOT NULL,
  `M_pwd` varchar(20) NOT NULL,
  `M_name` varchar(30) NOT NULL,
  `M_sex` char(2) DEFAULT NULL,
  `M_class` varchar(30) DEFAULT NULL,
  `M_tel` varchar(11) DEFAULT NULL,
  `M_qq` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`M_id`),
  KEY `FK_Relationship_7` (`C_id`),
  KEY `FK_Relationship_1` (`R_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`R_id`) REFERENCES `t_role` (`R_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`C_id`) REFERENCES `t_community` (`C_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_merber
-- ----------------------------
INSERT INTO `t_merber` VALUES ('1', '12', '1', '1726736672', '123456', '龚倩', '女', '历史14-2班', '15457384493', '123456789');
INSERT INTO `t_merber` VALUES ('2', '12', '1', '5545545545', '123456', '龙华', '男', '历史14-2班', '18975421003', '123456789');
INSERT INTO `t_merber` VALUES ('4', '15', '1', '3141234456', 'cewfewf', '蒋明明', '男', '历史14-2班', '18756920654', '123456789');
INSERT INTO `t_merber` VALUES ('6', '16', '1', '1232123345', 'fwefwerfwre', '季金鸥', '男', '历史14-2班', '17878565663', '123456789');
INSERT INTO `t_merber` VALUES ('7', '15', '1', '3141342234', 'scdsacwe', '苟富贵', '女', '网络14-1班', '19895956563', '123456789');
INSERT INTO `t_merber` VALUES ('8', '14', '1', '2343454454', 'wer32rewf', '胡仨', '男', '宝石14-2班', '18796565666', '123456789');
INSERT INTO `t_merber` VALUES ('9', '16', '1', '2223234545', 'fferv34', '王鹏鹏', '男', '信科14-2班', '15876384493', '123456789');
INSERT INTO `t_merber` VALUES ('12', '13', '1', '6564454356', 'f34f35t54', '梁萌', '女', '设计14-2班', '1547384493', '123456789');
INSERT INTO `t_merber` VALUES ('14', '12', '1', '4345645677', 'g35t43tg', '庞唯', '女', '地信14-2班', '15956384493', '123456789');
INSERT INTO `t_merber` VALUES ('15', '13', '1', '4535655544', 'g45gr5', '凤珍', '女', '应物14-2班', '15959984493', '123456789');
INSERT INTO `t_merber` VALUES ('16', '16', '1', '2323432454', 'gewg45t', '杨雪', '女', '信科14-2班', '18857384473', '123456789');
INSERT INTO `t_merber` VALUES ('19', '14', '1', '3434321345', 'g54tergw', '苏亮亮', '男', '历史14-2班', '15457386693', '123456789');
INSERT INTO `t_merber` VALUES ('20', '16', '1', '5454345566', 'g4g34tfgerg', '王晓武', '男', '给排水14-2班', '15457383393', '123456789');
INSERT INTO `t_merber` VALUES ('21', '13', '1', '3456543345', 'g45t34terg', '黄雪梅', '女', '历史14-2班', '15457382293', '123456789');
INSERT INTO `t_merber` VALUES ('22', '12', '1', '5545454544', 'g3tgferg', '梁溪区', '男', '测绘14-2班', '15457384393', '123456789');
INSERT INTO `t_merber` VALUES ('27', '32', '1', '3267867675', 'gf34gt34gf', '兰陵', '女', '宝石18-2班', '1877876656', '989876765');
INSERT INTO `t_merber` VALUES ('28', '3', '1', '2387546765', 'g34t34s', '阳阳', '女', '应物15-3', '18877764463', '');
INSERT INTO `t_merber` VALUES ('30', '32', '1', '4642127865', 'fwer23r44', '伟峰', '男', '物联网14-3班', '18877364637', '878787678');
INSERT INTO `t_merber` VALUES ('31', '16', '1', '1145778667', 'g56y45r34', '伟峰', '男', '宝石18-2班', '18877364637', '989876765');

-- ----------------------------
-- Table structure for `t_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `Pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pri_name` varchar(30) NOT NULL,
  PRIMARY KEY (`Pri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES ('1', '会员权限');
INSERT INTO `t_privilege` VALUES ('2', '社团管理员权限');
INSERT INTO `t_privilege` VALUES ('3', '系统管理员权限');
INSERT INTO `t_privilege` VALUES ('8', '普通用户');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pri_id` int(11) DEFAULT NULL,
  `R_name` varchar(30) NOT NULL,
  PRIMARY KEY (`R_id`),
  KEY `FK_Relationship_3` (`Pri_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`Pri_id`) REFERENCES `t_privilege` (`Pri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '1', 'member');
INSERT INTO `t_role` VALUES ('2', '2', 'community');
INSERT INTO `t_role` VALUES ('3', '3', 'manager');
