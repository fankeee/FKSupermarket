/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : supermarket

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-06-13 14:18:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `C_ID` int(11) NOT NULL AUTO_INCREMENT,
  `C_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '进口零食');
INSERT INTO `t_category` VALUES ('2', '进口酒饮');
INSERT INTO `t_category` VALUES ('3', '奶制品');
INSERT INTO `t_category` VALUES ('4', '休闲零食');
INSERT INTO `t_category` VALUES ('5', '饼干糖巧');
INSERT INTO `t_category` VALUES ('6', '酒水饮料');
INSERT INTO `t_category` VALUES ('7', '冲饮保健');
INSERT INTO `t_category` VALUES ('8', '米面杂粮');
INSERT INTO `t_category` VALUES ('9', '油品调味');
INSERT INTO `t_category` VALUES ('10', '美容护肤');
INSERT INTO `t_category` VALUES ('11', '个人护理');
INSERT INTO `t_category` VALUES ('12', '纸制品');
INSERT INTO `t_category` VALUES ('13', '家庭清洁');
INSERT INTO `t_category` VALUES ('14', '厨房用品');
INSERT INTO `t_category` VALUES ('15', '家居用品');
INSERT INTO `t_category` VALUES ('16', '家用纺织');
INSERT INTO `t_category` VALUES ('17', '生活电器');
INSERT INTO `t_category` VALUES ('18', '办公用品');
INSERT INTO `t_category` VALUES ('19', '母婴用品');
INSERT INTO `t_category` VALUES ('20', '个人清洁');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `G_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_id` int(11) DEFAULT NULL,
  `C_ID` int(11) DEFAULT NULL,
  `G_name` varchar(50) DEFAULT NULL,
  `G_purchasePrice` float DEFAULT NULL,
  `G_sellingPrice` float DEFAULT NULL,
  `G_unit` varchar(10) DEFAULT NULL,
  `G_productionDate` date DEFAULT NULL,
  `G_shelfLife` varchar(10) DEFAULT NULL,
  `G_inventory` int(11) DEFAULT NULL,
  `G_productionAddress` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`G_id`),
  KEY `FK_Relationship_1` (`Pro_id`),
  KEY `FK_Relationship_2` (`C_ID`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`Pro_id`) REFERENCES `t_provider` (`Pro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`C_ID`) REFERENCES `t_category` (`C_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('11', '6', '11', '强生OB内置式普通型16支卫生棉条', '10', '20.5', '', '2017-07-12', '两年', '382', '广东广州');
INSERT INTO `t_goods` VALUES ('13', '7', '12', '维达蓝色经典系列卫生纸巾3层140g27卷有芯卷纸', '20', '48.9', '', '2016-08-12', '一年', '898', '广西南宁');
INSERT INTO `t_goods` VALUES ('14', '7', '12', '舒洁湿厕纸家庭装40片*10包 ', '50', '81.9', '', '2017-08-20', '一年', '499', '广西南宁');
INSERT INTO `t_goods` VALUES ('15', '7', '12', '洁柔抽纸Face系列餐巾纸卫生纸3层120抽整箱20包', '20', '48.9', '个', '2016-08-12', '一年', '900', '广西南宁');
INSERT INTO `t_goods` VALUES ('16', '7', '12', '理文本色手帕纸4层10张10包可湿水纸巾', '4', '8.9', '个', '2015-08-12', '三年', '300', '广西南宁');
INSERT INTO `t_goods` VALUES ('17', '7', '12', '清风原木金装3层140抽*24包', '30', '59.9', '个', '2017-07-12', '一年', '500', '广西南宁');
INSERT INTO `t_goods` VALUES ('18', '8', '13', '蓝月亮洗衣液薰衣草亮白增艳洁净衣物护理3kg', '15', '39.9', '瓶', '2017-05-12', '一年', '500', '湖南长沙');
INSERT INTO `t_goods` VALUES ('19', '8', '13', '立白柠檬去油洗洁精1.5kg', '5', '9.9', '瓶', '2017-05-12', '一年', '450', '湖南长沙');
INSERT INTO `t_goods` VALUES ('20', '8', '13', '威猛先生 厨房重油污净', '15', '20.9', '瓶', '2017-04-02', '一年', '300', '湖南长沙');
INSERT INTO `t_goods` VALUES ('21', '8', '13', '超能洗衣液植翠低泡鲜艳亮丽2kg', '15', '18.9', '瓶', '2017-05-12', '一年', '299', '湖南长沙');
INSERT INTO `t_goods` VALUES ('22', '8', '13', '金纺衣物护理剂', '10', '39.9', '', '2017-05-12', '一年', '449', '湖南长沙');
INSERT INTO `t_goods` VALUES ('23', '9', '14', '妙洁 一次性保鲜膜', '5', '10.5', '个', '2017-05-12', '一年', '300', '深圳市');
INSERT INTO `t_goods` VALUES ('24', '9', '14', '哈尔斯家用保温壶304不锈钢水壶', '60', '99', '', '2017-05-12', '三年', '196', '深圳市');
INSERT INTO `t_goods` VALUES ('25', '9', '14', '青苹果玻璃水壶水杯套装1壶4杯', '10', '29', '个', '2016-10-17', '一年', '100', '深圳市');
INSERT INTO `t_goods` VALUES ('26', '9', '14', '爱仕达炒锅不粘锅电磁炉锅', '150', '229', '个', '2017-05-12', '三年', '100', '深圳市');
INSERT INTO `t_goods` VALUES ('27', '9', '14', '紫丁香不锈钢网耐热玻璃泡茶壶 ', '7', '12', '个', '2017-05-12', '一年', '150', '深圳市');
INSERT INTO `t_goods` VALUES ('28', '10', '15', '3M思高 厨房海绵百洁擦 百洁布', '4', '9', '个', '2017-06-15', '一年', '350', '广东广州');
INSERT INTO `t_goods` VALUES ('29', '10', '15', 'EDO10只凹槽防滑晾衣架挂衣架裤架挂晒晾衣架 ', '4', '9', '个', '2017-06-15', '一年', '350', '广东广州');
INSERT INTO `t_goods` VALUES ('30', '10', '15', '垃圾桶防绣铁丝网办公室家用铁网纸篓', '4', '9', '个', '2017-08-15', '一年', '250', '广东广州');
INSERT INTO `t_goods` VALUES ('31', '10', '15', '3M思高 合宜金属钢丝球', '4', '9', '个', '2017-06-15', '一年', '350', '广东广州');
INSERT INTO `t_goods` VALUES ('32', '10', '15', '3M思高 厨房海绵百洁擦 百洁布', '4', '9', '个', '2016-12-15', '一年', '200', '广东广州');
INSERT INTO `t_goods` VALUES ('33', '10', '15', '天堂伞黑胶防晒防紫外线商务1-3人', '15', '30', '个', '2017-06-15', '两年', '150', '广东广州');
INSERT INTO `t_goods` VALUES ('34', '6', '16', '黄古林凉席 天然海绵草席1.5m床加厚', '150', '399', '个', '2016-04-15', '两年', '100', '浙江宁波');
INSERT INTO `t_goods` VALUES ('35', '6', '16', '花花公子内裤女低腰蕾丝内裤纯棉性感', '20', '49', '个', '2016-04-15', '两年', '200', '浙江宁波');
INSERT INTO `t_goods` VALUES ('36', '6', '16', '洁丽雅面巾纯棉淡雅棉柔毛巾', '5', '10', '个', '2017-04-15', '两年', '400', '浙江宁波');
INSERT INTO `t_goods` VALUES ('37', '6', '16', 'MD宽松口袜子棉5双中老年人男女', '40', '89', '个', '2017-07-15', '两年', '200', '浙江宁波');
INSERT INTO `t_goods` VALUES ('38', '6', '16', 'Aisleep睡眠博士慢回弹砭石记忆枕头颈椎保健护颈', '100', '150', '个', '2016-04-15', '两年', '100', '浙江宁波');
INSERT INTO `t_goods` VALUES ('39', '7', '17', '飞科剃须刀智能充电动式全身水洗刮胡须子刀FS372', '40', '89', '个', '2016-04-15', '两年', '100', '四川成都');
INSERT INTO `t_goods` VALUES ('40', '7', '17', 'Joyoung/九阳 JYK-17C15电热水壶', '40', '69', '个', '2017-03-15', '两年', '100', '四川成都');
INSERT INTO `t_goods` VALUES ('41', '7', '17', 'SUPOR/苏泊尔 30YK803Y 电火锅家用多功能鸳鸯锅煮锅', '150', '200', '个', '2016-04-15', '两年', '50', '四川成都');
INSERT INTO `t_goods` VALUES ('42', '7', '17', '飞科充电式毛球修剪器剃毛器', '20', '33', '个', '2016-04-15', '两年', '150', '四川成都');
INSERT INTO `t_goods` VALUES ('43', '7', '17', '公牛插座独立开关接线板插线板插排', '25', '37', '个', '2017-07-15', '两年', '100', '四川成都');
INSERT INTO `t_goods` VALUES ('44', '8', '18', '广博GB2529932K40页大型记事本', '1', '1.8', '个', '2017-06-15', '两年', '300', '安徽合肥');
INSERT INTO `t_goods` VALUES ('45', '8', '18', '益而高EG-086 不锈钢剪刀', '3', '5.5', '个', '2017-06-15', '两年', '149', '安徽合肥');
INSERT INTO `t_goods` VALUES ('46', '8', '18', 'HERO/英雄正品钢笔007特细依金笔3色', '10', '20', '个', '2017-01-15', '两年', '100', '安徽合肥');
INSERT INTO `t_goods` VALUES ('47', '8', '18', '真彩2600-18色酷吖可洗水彩笔', '7', '10', '个', '2017-06-15', '两年', '50', '安徽合肥');
INSERT INTO `t_goods` VALUES ('48', '8', '18', '晨光ABS92616 订书钉订书针', '1', '1.8', '个', '2017-06-15', '一年', '300', '安徽合肥');
INSERT INTO `t_goods` VALUES ('49', '7', '19', '美赞臣安儿宝A+3段1800克幼儿配方奶粉1-3岁新包装', '168', '254', '盒', '2017-06-10', '二年', '80', '湖南长沙');
INSERT INTO `t_goods` VALUES ('50', '4', '19', 'Nutrilon/诺优能 荷兰原装进口 3段 12-36个月 800g', '168', '254', '件', '2017-08-10', '一年', '230', '广西来宾');
INSERT INTO `t_goods` VALUES ('51', '1', '19', '爱尔兰进口惠氏启赋2段奶粉900g新包装升级配方', '198', '386', '箱', '2017-06-18', '二年', '72', '内蒙古');
INSERT INTO `t_goods` VALUES ('52', '2', '19', '帮宝适拉拉裤 超薄干爽尿不湿加大码XL108片男女通用', '92', '169', '包', '2017-01-10', '一年', '105', '广东广州');
INSERT INTO `t_goods` VALUES ('53', '8', '19', '好奇铂金装倍柔亲肤纸尿裤NB84片正常装限量装随机发', '168', '254', '盒', '2016-09-10', '二年', '80', '上海');
INSERT INTO `t_goods` VALUES ('54', '3', '20', 'Dove/多芬致润菁油沐浴乳 660g 滋养美肤沐浴露', '39', '90', '瓶', '2016-09-10', '一年', '80', '云南大理');
INSERT INTO `t_goods` VALUES ('55', '5', '20', 'Dove/欧莱雅男士洗面奶火山岩控油祛痘洁面膏去黑头化妆品', '18', '34.9', '瓶', '2017-08-10', '一年', '90', '贵州');
INSERT INTO `t_goods` VALUES ('56', '6', '20', 'Dove/百雀羚爽肤水水嫩倍现盈透精华水100ml补水保湿控油', '36', '86', '支', '2017-09-13', '一年', '58', '广西北海');
INSERT INTO `t_goods` VALUES ('57', '10', '20', 'Dove/滴露沐浴乳 滋润倍护健康沐浴露 935ml/瓶*2沐浴乳', '13', '39.9', '瓶', '2017-02-10', '两年', '80', '湖北');
INSERT INTO `t_goods` VALUES ('58', '3', '20', 'Dove/黑人牙膏双重薄荷225g清新口气有效防蛀去牙渍去口臭', '6.5', '13.9', '支', '2016-08-10', '两年', '90', '天津');
INSERT INTO `t_goods` VALUES ('59', '3', '8', ' 福临门 秋田小町大米5kg/袋', '16.5', '32.5', '袋', '2017-01-12', 'l两年', '62', 'j吉林梅河口');
INSERT INTO `t_goods` VALUES ('60', '1', '2', '泰国原装进口孟乍隆苏吝府泰国茉莉香米10kg大米20斤', '95', '99.8', '瓶', '2016-06-09', '36个月', '500', '泰国');
INSERT INTO `t_goods` VALUES ('61', '1', '2', '美国进口Heinz/亨氏白醋946ml调味醋沙拉醋 泡酵素', '25', '27.5', '瓶', '2016-05-08', '48个月', '251', '美国');
INSERT INTO `t_goods` VALUES ('62', '1', '2', '德国进口 爱士堡小麦啤酒整箱500ml*24 聚会必备', '115', '119.8', '瓶', '2017-08-08', '36个月', '230', '德国');
INSERT INTO `t_goods` VALUES ('63', '1', '2', '印尼进口 佳乐椰浆 200ml/盒 西米露 烘焙 咖喱', '6.5', '7.4', '瓶', '2017-05-08', '12个月', '500', '印尼');
INSERT INTO `t_goods` VALUES ('64', '1', '2', '瑞典进口ICA麦片50%水果坚果燕麦片750g冲饮美味早餐', '55', '25.8', '瓶', '2016-05-08', '12个月', '101', '瑞典');
INSERT INTO `t_goods` VALUES ('65', '2', '3', '【24盒装】蒙牛纯甄常温酸奶 200g*24盒进口菌种', '91', '92.9', '箱', '2017-06-08', '12个月', '70', '内蒙');
INSERT INTO `t_goods` VALUES ('66', '2', '3', '维他奶 原味豆奶250ml*16盒/箱 低脂肪新旧包装随机', '32.5', '34.8', '箱', '2017-05-08', '12个月', '200', '内蒙');
INSERT INTO `t_goods` VALUES ('67', '2', '3', '光明牌纯牛奶250ml*24 /箱新老包装交替随机发货', '55', '56.8', '箱', '2017-03-08', '12个月', '300', '内蒙');
INSERT INTO `t_goods` VALUES ('68', '2', '3', '伊利纯牛奶 无菌砖250ml*16/箱甄选黄金奶源 新鲜', '35.2', '38.8', '箱', '2016-04-08', '12个月', '200', '内蒙');
INSERT INTO `t_goods` VALUES ('69', '2', '3', '澳大利亚原装进口德运全脂纯牛奶1L*10盒 整箱', '95', '99.5', '箱', '2016-12-08', '12个月', '230', '内蒙');
INSERT INTO `t_goods` VALUES ('70', '2', '4', '百草味芒果干120g 休闲零食芒果片 蜜饯果脯果干', '8.85', '9.9', '袋', '2017-05-08', '12个月', '300', '海南');
INSERT INTO `t_goods` VALUES ('71', '2', '4', '良品铺子甘栗仁80g休闲零食炒货特产栗子制板栗仁', '11.5', '13.8', '袋', '2017-05-08', '12个月', '500', '广西');
INSERT INTO `t_goods` VALUES ('72', '2', '4', '甘源蟹黄味瓜子仁285g坚果炒货休闲零食全独立小包', '5.2', '8.8', '袋', '2017-07-08', '12个月', '520', '广东广州');
INSERT INTO `t_goods` VALUES ('73', '2', '4', '天喔 韩话梅160g/罐休闲蜜饯果脯好吃的零食水果干', '2.4', '9.9', '袋', '2017-06-08', '12个月', '300', '三亚');
INSERT INTO `t_goods` VALUES ('74', '2', '4', '善味阁 鲜卤鸭肫190g 卤味肉类休闲零食 鸭胗鸭肫', '20.1', '23.8', '袋', '2017-07-08', '12个月', '200', '广东广州');
INSERT INTO `t_goods` VALUES ('75', '3', '5', '卜珂蔓越莓曲奇饼干200g/袋饼干糕点制作休闲零食品', '8.5', '15.8', '袋', '2017-01-01', '12个月', '700', '陕西西安');
INSERT INTO `t_goods` VALUES ('76', '3', '5', '雀巢脆脆鲨巧克力味夹心威化24+8条 零食小吃促销装', '3.3', '9.8', '袋', '2017-05-28', '12个月', '100', '南昌');
INSERT INTO `t_goods` VALUES ('77', '3', '5', 'Aji酵母减盐味苏打饼干472.5g早餐配牛奶低糖咸零食z', '6.5', '7.6', '袋', '2017-03-18', '12个月', '200', '天津');
INSERT INTO `t_goods` VALUES ('78', '3', '5', '甜甜乐星球杯1026g*2罐巧克力怀旧礼盒（代可可脂）', '8.8', '15.8', '盒', '2017-05-18', '12个月', '296', '北京');
INSERT INTO `t_goods` VALUES ('79', '3', '6', '贵州茅台53度茅台迎宾酒500mlx6瓶装 整箱酒厂直供', '4055', '8000', '箱', '2015-05-08', '36个月', '64', '贵州');
INSERT INTO `t_goods` VALUES ('80', '3', '6', '郎酒青花郎20年53度500ml*6瓶酱香白酒酒厂直供', '3066', '4065', '箱', '2016-05-08', '48个月', '68', '贵州');
INSERT INTO `t_goods` VALUES ('81', '3', '6', '泸州老窖国窖1573白酒 52度500ml*6瓶整箱装酒厂直供', '5000', '5100', '箱', '2017-05-08', '12个月', '84', '贵州');
INSERT INTO `t_goods` VALUES ('82', '3', '6', '42度牛栏山二锅头陈酿500ml*12支 整箱装 白牛二', '104', '106', '袋', '2017-05-08', '12个月', '98', '广西');
INSERT INTO `t_goods` VALUES ('83', '3', '6', 'Budweiser/百威啤酒 小麦醇正拉罐500ml*18听 整箱', '56', '89', '袋', '2017-05-08', '12个月', '58', '广东');
INSERT INTO `t_goods` VALUES ('84', '4', '7', '冠生园 蜂蜜900g/瓶 蜂蜜 蜂制品 冲饮 蜜蜂制品', '35', '48', '罐', '2016-05-08', '18个月', '69', '山西');
INSERT INTO `t_goods` VALUES ('85', '4', '7', '禾煜 枸杞100g/袋宁夏中宁枸杞正宗特产新货枸杞', '20', '25', '罐', '2016-09-08', '18个月', '320', '宁夏');
INSERT INTO `t_goods` VALUES ('86', '4', '7', 'CONBA/康恩贝 维生素C咀嚼片（香橙味）', '21', '28', '罐', '2017-05-08', '18个月', '68', '美国');
INSERT INTO `t_goods` VALUES ('87', '4', '7', '固本堂传统型500g阿胶糕即食ejiao阿胶固元膏块片', '138', '158', '盒', '2017-04-08', '12个月', '53', '桂林');
INSERT INTO `t_goods` VALUES ('88', '4', '7', '江中猴姑早餐米稀15天装 营养米糊麦片 冲饮袋装原味', '68', '99', '盒', '2017-09-08', '12个月', '66', '江西');
INSERT INTO `t_goods` VALUES ('89', '4', '8', '统一 汤达人日式豚骨拉面 125g*5袋 方便面 豚骨面', '28', '38', '袋', '2017-06-28', '12个月', '51', '西安');
INSERT INTO `t_goods` VALUES ('90', '4', '8', '甘竹牌豆豉海鱼罐头184g下饭菜特产即食鱼干小吃零食', '5.5', '7.9', '袋', '2017-03-08', '12个月', '300', '广州');
INSERT INTO `t_goods` VALUES ('91', '4', '8', '十月稻田黄小米1kg红谷米五谷杂粮粗粮新老包装随机', '13.8', '16.8', '袋', '2016-09-08', '12个月', '60', '东北');
INSERT INTO `t_goods` VALUES ('92', '4', '8', '八荒 东北黑木耳 200克 特产干货 新老包装 随机发货', '13.8', '19.8', '袋', '2017-05-26', '12个月', '77', '东北');
INSERT INTO `t_goods` VALUES ('93', '4', '8', '金龙鱼 盘锦大米 蟹稻共生5kg 东北大米 人气爆款', '25', '29.9', '袋', '2015-05-21', '12个月', '70', '吉林');
INSERT INTO `t_goods` VALUES ('97', '6', '3', '大饼', '11.1', '22.2', '袋', '2017-08-26', '12个月', '200', '南宁');
INSERT INTO `t_goods` VALUES ('1001', '3', '5', '箭牌绿箭无糖薄荷糖', '8.8', '9.8', '盒', '2017-03-18', '12个月', '4', '北京');
INSERT INTO `t_goods` VALUES ('1002', '4', '8', '金龙鱼 纯正 玉米油4L 食用油 非转基因 压榨', '15', '39.9', '瓶', '2017-04-01', '18个月', '39', '广东广州');
INSERT INTO `t_goods` VALUES ('1003', '1', '1', '饼干300g办公室零食大礼包', '13.8', '15.8', '袋', '2017-05-08', '12个月', '85', '越南');
INSERT INTO `t_goods` VALUES ('1004', '1', '1', '印尼进口丽芝士nabati纳宝帝奶酪威化饼干200g零食', '9.4', '10.8', '盒', '2017-08-03', '12个月', '129', '印尼');
INSERT INTO `t_goods` VALUES ('1005', '1', '1', '台湾进口零食77松塔千层酥饼干曲奇蜜兰诺12粒', '13.2', '16.9', '袋', '2017-05-08', '12个月', '233', '台湾');
INSERT INTO `t_goods` VALUES ('1006', '1', '1', '马来西亚进口福多FUDO提拉米苏蛋糕432g/盒糕点', '12.1', '19.8', '盒', '2017-05-08', '12个月', '288', '马来西亚');
INSERT INTO `t_goods` VALUES ('1007', '1', '1', '韩国进口X-5花生牛奶夹心巧克力36g*24（代可可脂）', '80.6', '89.8', '盒', '2017-07-08', '12个月', '57', '韩国');
INSERT INTO `t_goods` VALUES ('1008', '6', '11', '杜蕾斯避孕套激爽四合一32只', '30', '48.9', '个', '2016-08-12', '两年', '496', '广东广州');
INSERT INTO `t_goods` VALUES ('1009', '6', '11', '花王乐而雅零触感 日用卫生巾22.5cm30片', '15', '23.9', '个', '2017-05-12', '两年', '798', '广东广州');
INSERT INTO `t_goods` VALUES ('1010', '6', '11', '成人经济型护理垫老年人尿不湿XL码加大号10片', '10', '15.9', '个', '2017-06-12', '两年', '400', '广东广州');

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `M_id` int(11) NOT NULL AUTO_INCREMENT,
  `M_name` varchar(10) DEFAULT NULL,
  `M_integral` int(11) DEFAULT NULL,
  `M_date` date DEFAULT NULL,
  `M_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`M_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('2', '梦洁', '76', '2014-10-05', '13551346679');
INSERT INTO `t_member` VALUES ('3', '静静', '85', '2009-08-08', '13519634395');
INSERT INTO `t_member` VALUES ('4', '雨馨', '72', '2005-05-25', '13816492463');
INSERT INTO `t_member` VALUES ('5', '振国', '98', '2015-02-20', '13525361498');
INSERT INTO `t_member` VALUES ('6', '周杰', '83', '2016-12-16', '13766513596');
INSERT INTO `t_member` VALUES ('7', '李冰', '63', '2000-08-15', '13553284694');
INSERT INTO `t_member` VALUES ('8', '张静', '58', '2012-02-08', '13865924168');
INSERT INTO `t_member` VALUES ('9', '刘天', '77', '2013-10-01', '13591364894');
INSERT INTO `t_member` VALUES ('10', '赵虎', '40', '2012-01-05', '13553564591');
INSERT INTO `t_member` VALUES ('11', '孙红', '25', '2011-01-15', '13559745564');
INSERT INTO `t_member` VALUES ('12', '于静', '67', '2010-06-25', '13551543445');
INSERT INTO `t_member` VALUES ('13', '季布', '37', '2008-04-03', '13514516774');
INSERT INTO `t_member` VALUES ('14', '郝仁', '88', '2006-10-30', '13816122464');
INSERT INTO `t_member` VALUES ('15', '王华', '91', '2016-11-26', '13521237587');
INSERT INTO `t_member` VALUES ('16', '赵敏', '68', '2002-01-30', '13766128647');
INSERT INTO `t_member` VALUES ('17', '姜明', '82', '2001-01-27', '13553546154');
INSERT INTO `t_member` VALUES ('18', '李鸥', '96', '2015-10-15', '13869875457');
INSERT INTO `t_member` VALUES ('19', '雅馨', '97', '2013-11-13', '13591454527');

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `Pri_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pri_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Pri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES ('1', '管理员权限');
INSERT INTO `t_privilege` VALUES ('2', '库存管理员权限');
INSERT INTO `t_privilege` VALUES ('3', '收银员权限');

-- ----------------------------
-- Table structure for t_provider
-- ----------------------------
DROP TABLE IF EXISTS `t_provider`;
CREATE TABLE `t_provider` (
  `Pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_name` varchar(20) DEFAULT NULL,
  `Pro_address` varchar(30) DEFAULT NULL,
  `Pro_contactPerson` varchar(10) DEFAULT NULL,
  `Pro_tel` varchar(11) DEFAULT NULL,
  `Pro_email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_provider
-- ----------------------------
INSERT INTO `t_provider` VALUES ('1', '北京知时节商贸有限公司', '西城区八步口胡同3号204室', '张辉', '64018774', 'asdsda@163.com');
INSERT INTO `t_provider` VALUES ('2', '北京市朝批商贸有限公司', '北京市朝阳区双龙南里 204楼', '李刚', '87318750', '231231@126.com');
INSERT INTO `t_provider` VALUES ('3', '北京万佳泰商贸有限公司', '北京市海淀区阜成路44路', '王立华', '88122295', '123123123@163.com');
INSERT INTO `t_provider` VALUES ('4', '北京百蝠百益工贸有限公司', '北京市南十里居东北效粮 油仓库院内', '罗炳恒', '64326168', '23132331@11.com');
INSERT INTO `t_provider` VALUES ('5', '北京广亨商贸有限公司', '北京市丰台区连香园小区 B区1号楼', '时雄', '63991322', 'sadsdw@163.com');
INSERT INTO `t_provider` VALUES ('6', '天津市瑞雪工贸有限公司', '天津市西青区中北镇东姜 井村南', '王莉', '27537326', '21132112@183.com');
INSERT INTO `t_provider` VALUES ('7', '北京满天晨工贸有限公司', '北京市海淀区西北旺镇永 丰屯49号', '于水容', '62477286', 'fanke@156.com');
INSERT INTO `t_provider` VALUES ('8', '石家庄市富荣商贸有限公司', '石家庄市华新路宏业花园', '朝宏云', '8805006', 'tyylmh@126.com');
INSERT INTO `t_provider` VALUES ('9', '沧州远东福顺食品商行', '沧州市道东物华批发市场14排4号门市', '刘东生', '3592575', 't6ikaong@qq.com');
INSERT INTO `t_provider` VALUES ('10', '承德市嘉宇商贸有限公司', '承德市潘家沟1号', '丁贺静', '2255567', '138422@163.com');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `R_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pri_id` int(11) DEFAULT NULL,
  `R_name` varchar(50) NOT NULL,
  PRIMARY KEY (`R_id`),
  KEY `FK_Relationship_7` (`Pri_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`Pri_id`) REFERENCES `t_privilege` (`Pri_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '1', 'manager');
INSERT INTO `t_role` VALUES ('2', '2', 'stockman');
INSERT INTO `t_role` VALUES ('3', '3', 'cashier');

-- ----------------------------
-- Table structure for t_saleorder
-- ----------------------------
DROP TABLE IF EXISTS `t_saleorder`;
CREATE TABLE `t_saleorder` (
  `S_id` int(11) NOT NULL AUTO_INCREMENT,
  `U_id` int(11) DEFAULT NULL,
  `S_totalAmount` float DEFAULT NULL,
  `S_saleDate` date DEFAULT NULL,
  PRIMARY KEY (`S_id`),
  KEY `FK_Relationship_3` (`U_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`U_id`) REFERENCES `t_user` (`U_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saleorder
-- ----------------------------
INSERT INTO `t_saleorder` VALUES ('1', '1006', '1069.6', '2018-11-29');
INSERT INTO `t_saleorder` VALUES ('2', '1008', '1436', '2018-12-12');
INSERT INTO `t_saleorder` VALUES ('3', '1007', '1270.8', '2018-05-09');
INSERT INTO `t_saleorder` VALUES ('4', '1009', '526.1', '2009-12-15');
INSERT INTO `t_saleorder` VALUES ('5', '1010', '6650', '2008-08-18');
INSERT INTO `t_saleorder` VALUES ('6', '1009', '315', '2005-05-15');
INSERT INTO `t_saleorder` VALUES ('7', '1008', '12587', '2017-01-11');
INSERT INTO `t_saleorder` VALUES ('8', '1007', '1353', '2014-12-10');
INSERT INTO `t_saleorder` VALUES ('9', '1009', '747.5', '2016-10-16');
INSERT INTO `t_saleorder` VALUES ('10', '1010', '6896', '2015-05-06');
INSERT INTO `t_saleorder` VALUES ('11', '1006', '50000', '2017-08-26');
INSERT INTO `t_saleorder` VALUES ('12', '1001', '89.4', '2017-04-11');
INSERT INTO `t_saleorder` VALUES ('13', '1007', '89.4', '2017-04-23');
INSERT INTO `t_saleorder` VALUES ('14', '1001', '112', '2017-04-10');
INSERT INTO `t_saleorder` VALUES ('15', '1001', '22', '2017-07-04');
INSERT INTO `t_saleorder` VALUES ('16', '1001', '37.6', '2017-07-10');
INSERT INTO `t_saleorder` VALUES ('17', '1001', '38.8', '2017-07-17');
INSERT INTO `t_saleorder` VALUES ('18', '1001', '89.4', '2017-04-21');
INSERT INTO `t_saleorder` VALUES ('19', '1001', '28.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('20', '1001', '22.6', '2017-02-24');
INSERT INTO `t_saleorder` VALUES ('29', '1001', '8.8', '2017-03-14');
INSERT INTO `t_saleorder` VALUES ('30', '1001', '8.8', '2017-06-18');
INSERT INTO `t_saleorder` VALUES ('31', '1001', '104.4', '2017-06-01');
INSERT INTO `t_saleorder` VALUES ('32', '1001', '23.8', '2017-02-24');
INSERT INTO `t_saleorder` VALUES ('33', '1001', '8.8', '2017-03-10');
INSERT INTO `t_saleorder` VALUES ('34', '1001', '17.6', '2017-03-30');
INSERT INTO `t_saleorder` VALUES ('35', '1001', '15', '2017-03-30');
INSERT INTO `t_saleorder` VALUES ('36', '1001', '30', '2017-03-30');
INSERT INTO `t_saleorder` VALUES ('37', '1001', '13.2', '2017-03-14');
INSERT INTO `t_saleorder` VALUES ('38', '1001', '25.3', '2017-03-14');
INSERT INTO `t_saleorder` VALUES ('39', '1001', '13.2', '2017-03-28');
INSERT INTO `t_saleorder` VALUES ('40', '1001', '43.2', '2017-03-07');
INSERT INTO `t_saleorder` VALUES ('41', '1001', '80.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('42', '1001', '90', '2017-01-26');
INSERT INTO `t_saleorder` VALUES ('43', '1001', '90', '2017-01-19');
INSERT INTO `t_saleorder` VALUES ('44', '1001', '8.8', '2017-07-27');
INSERT INTO `t_saleorder` VALUES ('45', '1001', '8.8', '2017-07-10');
INSERT INTO `t_saleorder` VALUES ('46', '1001', '8.8', '2017-07-27');
INSERT INTO `t_saleorder` VALUES ('47', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('48', '1001', '8.8', '2017-09-06');
INSERT INTO `t_saleorder` VALUES ('49', '1001', '17.6', '2017-09-21');
INSERT INTO `t_saleorder` VALUES ('50', '1001', '26.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('51', '1001', '8.8', '2017-09-13');
INSERT INTO `t_saleorder` VALUES ('52', '1001', '17.6', '2017-09-14');
INSERT INTO `t_saleorder` VALUES ('53', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('54', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('55', '1001', '22', '2017-09-21');
INSERT INTO `t_saleorder` VALUES ('56', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('57', '1001', '22', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('58', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('59', '1001', '9.4', '2017-09-20');
INSERT INTO `t_saleorder` VALUES ('60', '1001', '90', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('61', '1001', '103.2', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('62', '1001', '60', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('63', '1001', '22', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('64', '1001', '90', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('65', '1001', '18.2', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('66', '1001', '21.5', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('67', '1001', '176.2', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('68', '1001', '33.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('69', '1001', '92.7', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('70', '1001', '98.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('71', '1001', '89.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('72', '1001', '22', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('73', '1001', '109.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('74', '1001', '22.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('75', '1001', '94.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('76', '1001', '30.3', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('77', '1001', '22.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('78', '1001', '33.2', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('79', '1001', '33.2', '2017-09-30');
INSERT INTO `t_saleorder` VALUES ('80', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('81', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('82', '1001', '8.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('83', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('84', '1001', '51.5', '2017-11-18');
INSERT INTO `t_saleorder` VALUES ('85', '1001', '35.8', '2017-11-22');
INSERT INTO `t_saleorder` VALUES ('86', '1001', '185.6', '2017-12-25');
INSERT INTO `t_saleorder` VALUES ('87', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('88', '1001', '34.7', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('89', '1001', '37.6', '2017-10-30');
INSERT INTO `t_saleorder` VALUES ('90', '1001', '34.7', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('91', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('92', '1001', '34.7', '2017-05-26');
INSERT INTO `t_saleorder` VALUES ('93', '1001', '50.2', '2017-11-24');
INSERT INTO `t_saleorder` VALUES ('94', '1001', '32.6', '2017-10-21');
INSERT INTO `t_saleorder` VALUES ('95', '1001', '32', '2017-10-22');
INSERT INTO `t_saleorder` VALUES ('96', '1001', '32.6', '2017-09-02');
INSERT INTO `t_saleorder` VALUES ('97', '1001', '53.5', '2017-09-30');
INSERT INTO `t_saleorder` VALUES ('98', '1001', '32.6', '2017-06-11');
INSERT INTO `t_saleorder` VALUES ('99', '1001', '37', '2017-07-30');
INSERT INTO `t_saleorder` VALUES ('100', '1001', '41.4', '2017-06-30');
INSERT INTO `t_saleorder` VALUES ('101', '1001', '30.9', '2017-05-20');
INSERT INTO `t_saleorder` VALUES ('102', '1001', '50.2', '2017-03-30');
INSERT INTO `t_saleorder` VALUES ('103', '1001', '23.8', '2017-04-30');
INSERT INTO `t_saleorder` VALUES ('104', '1001', '93.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('105', '1001', '23.8', '2017-05-30');
INSERT INTO `t_saleorder` VALUES ('106', '1001', '21.5', '2017-02-11');
INSERT INTO `t_saleorder` VALUES ('107', '1001', '95.6', '2017-02-14');
INSERT INTO `t_saleorder` VALUES ('108', '1001', '23.8', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('109', '1001', '46.4', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('110', '1001', '136.8', '2017-01-30');
INSERT INTO `t_saleorder` VALUES ('111', '1001', '37.6', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('112', '1001', '58.2', '2017-01-30');
INSERT INTO `t_saleorder` VALUES ('113', '1001', '125.3', '2017-08-30');
INSERT INTO `t_saleorder` VALUES ('114', '1001', '10', '2018-05-07');
INSERT INTO `t_saleorder` VALUES ('115', '1001', '15', '2018-05-07');
INSERT INTO `t_saleorder` VALUES ('116', '1001', '60', '2018-05-07');
INSERT INTO `t_saleorder` VALUES ('117', '1001', '10', '2018-05-07');
INSERT INTO `t_saleorder` VALUES ('118', '1001', '6.5', '2018-05-07');
INSERT INTO `t_saleorder` VALUES ('119', '1001', '10', '2018-05-11');
INSERT INTO `t_saleorder` VALUES ('120', '1001', '120', '2018-06-02');
INSERT INTO `t_saleorder` VALUES ('121', '1001', '20', '2018-06-02');
INSERT INTO `t_saleorder` VALUES ('122', '1001', '27', '2018-06-02');
INSERT INTO `t_saleorder` VALUES ('123', '1001', '10', '2018-06-02');

-- ----------------------------
-- Table structure for t_saleorderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_saleorderdetail`;
CREATE TABLE `t_saleorderdetail` (
  `Sod_id` int(11) NOT NULL AUTO_INCREMENT,
  `G_id` int(11) DEFAULT NULL,
  `S_id` int(11) DEFAULT NULL,
  `Sod_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sod_id`),
  KEY `FK_Relationship_4` (`G_id`),
  KEY `FK_Relationship_5` (`S_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`G_id`) REFERENCES `t_goods` (`G_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`S_id`) REFERENCES `t_saleorder` (`S_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saleorderdetail
-- ----------------------------
INSERT INTO `t_saleorderdetail` VALUES ('1', '1003', '1', '5');
INSERT INTO `t_saleorderdetail` VALUES ('2', '1004', '1', '2');
INSERT INTO `t_saleorderdetail` VALUES ('3', '1005', '1', '6');
INSERT INTO `t_saleorderdetail` VALUES ('4', '1006', '1', '3');
INSERT INTO `t_saleorderdetail` VALUES ('5', '1007', '1', '9');
INSERT INTO `t_saleorderdetail` VALUES ('6', '1008', '2', '6');
INSERT INTO `t_saleorderdetail` VALUES ('7', '1009', '2', '11');
INSERT INTO `t_saleorderdetail` VALUES ('8', '1010', '2', '15');
INSERT INTO `t_saleorderdetail` VALUES ('9', '11', '2', '20');
INSERT INTO `t_saleorderdetail` VALUES ('11', '13', '3', '5');
INSERT INTO `t_saleorderdetail` VALUES ('12', '14', '3', '8');
INSERT INTO `t_saleorderdetail` VALUES ('13', '15', '3', '6');
INSERT INTO `t_saleorderdetail` VALUES ('14', '16', '3', '2');
INSERT INTO `t_saleorderdetail` VALUES ('15', '17', '3', '1');
INSERT INTO `t_saleorderdetail` VALUES ('16', '18', '4', '3');
INSERT INTO `t_saleorderdetail` VALUES ('17', '19', '4', '1');
INSERT INTO `t_saleorderdetail` VALUES ('18', '20', '4', '4');
INSERT INTO `t_saleorderdetail` VALUES ('19', '21', '4', '6');
INSERT INTO `t_saleorderdetail` VALUES ('20', '22', '4', '5');
INSERT INTO `t_saleorderdetail` VALUES ('21', '23', '5', '10');
INSERT INTO `t_saleorderdetail` VALUES ('22', '24', '5', '20');
INSERT INTO `t_saleorderdetail` VALUES ('23', '25', '5', '34');
INSERT INTO `t_saleorderdetail` VALUES ('24', '26', '5', '15');
INSERT INTO `t_saleorderdetail` VALUES ('25', '27', '5', '12');
INSERT INTO `t_saleorderdetail` VALUES ('26', '28', '6', '6');
INSERT INTO `t_saleorderdetail` VALUES ('27', '29', '6', '2');
INSERT INTO `t_saleorderdetail` VALUES ('28', '30', '6', '7');
INSERT INTO `t_saleorderdetail` VALUES ('29', '31', '6', '9');
INSERT INTO `t_saleorderdetail` VALUES ('30', '32', '6', '1');
INSERT INTO `t_saleorderdetail` VALUES ('31', '33', '6', '3');
INSERT INTO `t_saleorderdetail` VALUES ('32', '34', '7', '15');
INSERT INTO `t_saleorderdetail` VALUES ('33', '35', '7', '20');
INSERT INTO `t_saleorderdetail` VALUES ('34', '36', '7', '13');
INSERT INTO `t_saleorderdetail` VALUES ('35', '37', '7', '28');
INSERT INTO `t_saleorderdetail` VALUES ('36', '38', '7', '20');
INSERT INTO `t_saleorderdetail` VALUES ('37', '39', '8', '5');
INSERT INTO `t_saleorderdetail` VALUES ('38', '40', '8', '3');
INSERT INTO `t_saleorderdetail` VALUES ('39', '41', '8', '2');
INSERT INTO `t_saleorderdetail` VALUES ('40', '42', '8', '8');
INSERT INTO `t_saleorderdetail` VALUES ('41', '43', '8', '1');
INSERT INTO `t_saleorderdetail` VALUES ('42', '44', '9', '15');
INSERT INTO `t_saleorderdetail` VALUES ('43', '45', '9', '25');
INSERT INTO `t_saleorderdetail` VALUES ('44', '46', '9', '12');
INSERT INTO `t_saleorderdetail` VALUES ('45', '47', '9', '28');
INSERT INTO `t_saleorderdetail` VALUES ('46', '48', '9', '35');
INSERT INTO `t_saleorderdetail` VALUES ('47', '49', '10', '3');
INSERT INTO `t_saleorderdetail` VALUES ('48', '50', '10', '7');
INSERT INTO `t_saleorderdetail` VALUES ('49', '51', '10', '8');
INSERT INTO `t_saleorderdetail` VALUES ('50', '52', '10', '6');
INSERT INTO `t_saleorderdetail` VALUES ('51', '53', '10', '1');
INSERT INTO `t_saleorderdetail` VALUES ('53', '1001', '1', '1001');
INSERT INTO `t_saleorderdetail` VALUES ('54', '1001', '31', '1001');
INSERT INTO `t_saleorderdetail` VALUES ('55', '1002', '31', '1002');
INSERT INTO `t_saleorderdetail` VALUES ('56', '1007', '31', '1007');
INSERT INTO `t_saleorderdetail` VALUES ('57', '1002', '32', '1002');
INSERT INTO `t_saleorderdetail` VALUES ('58', '1001', '32', '1001');
INSERT INTO `t_saleorderdetail` VALUES ('59', '1001', '33', '1001');
INSERT INTO `t_saleorderdetail` VALUES ('60', '1001', '34', '1');
INSERT INTO `t_saleorderdetail` VALUES ('61', '1002', '35', '1');
INSERT INTO `t_saleorderdetail` VALUES ('62', '1002', '36', '5');
INSERT INTO `t_saleorderdetail` VALUES ('63', '1005', '37', '1');
INSERT INTO `t_saleorderdetail` VALUES ('64', '1006', '38', '1');
INSERT INTO `t_saleorderdetail` VALUES ('65', '1005', '39', '1');
INSERT INTO `t_saleorderdetail` VALUES ('66', '1008', '40', '1');
INSERT INTO `t_saleorderdetail` VALUES ('67', '1007', '41', '1');
INSERT INTO `t_saleorderdetail` VALUES ('68', '1004', '42', '1');
INSERT INTO `t_saleorderdetail` VALUES ('69', '1004', '43', '1');
INSERT INTO `t_saleorderdetail` VALUES ('70', '1007', '43', '1');
INSERT INTO `t_saleorderdetail` VALUES ('71', '1001', '51', '1');
INSERT INTO `t_saleorderdetail` VALUES ('72', '1001', '52', '1');
INSERT INTO `t_saleorderdetail` VALUES ('73', '1001', '53', '1');
INSERT INTO `t_saleorderdetail` VALUES ('74', '1001', '54', '1');
INSERT INTO `t_saleorderdetail` VALUES ('75', '1005', '55', '1');
INSERT INTO `t_saleorderdetail` VALUES ('76', '1001', '56', '1');
INSERT INTO `t_saleorderdetail` VALUES ('77', '1005', '57', '1');
INSERT INTO `t_saleorderdetail` VALUES ('78', '1001', '58', '1');
INSERT INTO `t_saleorderdetail` VALUES ('79', '1004', '59', '1');
INSERT INTO `t_saleorderdetail` VALUES ('80', '1007', '60', '1');
INSERT INTO `t_saleorderdetail` VALUES ('81', '1005', '61', '1');
INSERT INTO `t_saleorderdetail` VALUES ('82', '1008', '62', '2');
INSERT INTO `t_saleorderdetail` VALUES ('83', '1001', '63', '1');
INSERT INTO `t_saleorderdetail` VALUES ('84', '1005', '63', '1');
INSERT INTO `t_saleorderdetail` VALUES ('85', '1007', '64', '1');
INSERT INTO `t_saleorderdetail` VALUES ('86', '1004', '64', '1');
INSERT INTO `t_saleorderdetail` VALUES ('87', '1004', '65', '1');
INSERT INTO `t_saleorderdetail` VALUES ('88', '1001', '65', '1');
INSERT INTO `t_saleorderdetail` VALUES ('89', '1004', '66', '1');
INSERT INTO `t_saleorderdetail` VALUES ('90', '1006', '66', '1');
INSERT INTO `t_saleorderdetail` VALUES ('91', '1004', '67', '2');
INSERT INTO `t_saleorderdetail` VALUES ('92', '1006', '67', '1');
INSERT INTO `t_saleorderdetail` VALUES ('93', '1004', '68', '2');
INSERT INTO `t_saleorderdetail` VALUES ('94', '1009', '68', '1');
INSERT INTO `t_saleorderdetail` VALUES ('95', '1006', '69', '1');
INSERT INTO `t_saleorderdetail` VALUES ('96', '1007', '69', '1');
INSERT INTO `t_saleorderdetail` VALUES ('97', '1006', '70', '5');
INSERT INTO `t_saleorderdetail` VALUES ('98', '1007', '70', '1');
INSERT INTO `t_saleorderdetail` VALUES ('99', '1001', '70', '1');
INSERT INTO `t_saleorderdetail` VALUES ('100', '1004', '70', '1');
INSERT INTO `t_saleorderdetail` VALUES ('101', '1001', '72', '1');
INSERT INTO `t_saleorderdetail` VALUES ('102', '1005', '72', '1');
INSERT INTO `t_saleorderdetail` VALUES ('103', '1001', '73', '1');
INSERT INTO `t_saleorderdetail` VALUES ('104', '1005', '73', '1');
INSERT INTO `t_saleorderdetail` VALUES ('105', '1007', '73', '1');
INSERT INTO `t_saleorderdetail` VALUES ('106', '1004', '74', '1');
INSERT INTO `t_saleorderdetail` VALUES ('107', '1005', '74', '1');
INSERT INTO `t_saleorderdetail` VALUES ('108', '1004', '75', '1');
INSERT INTO `t_saleorderdetail` VALUES ('109', '1005', '75', '1');
INSERT INTO `t_saleorderdetail` VALUES ('110', '1001', '76', '1');
INSERT INTO `t_saleorderdetail` VALUES ('111', '1004', '76', '1');
INSERT INTO `t_saleorderdetail` VALUES ('112', '1006', '76', '1');
INSERT INTO `t_saleorderdetail` VALUES ('113', '1001', '77', '1');
INSERT INTO `t_saleorderdetail` VALUES ('114', '1003', '77', '1');
INSERT INTO `t_saleorderdetail` VALUES ('115', '1001', '78', '2');
INSERT INTO `t_saleorderdetail` VALUES ('116', '1003', '78', '1');
INSERT INTO `t_saleorderdetail` VALUES ('117', '1004', '78', '1');
INSERT INTO `t_saleorderdetail` VALUES ('118', '1009', '78', '1');
INSERT INTO `t_saleorderdetail` VALUES ('119', '1001', '79', '1');
INSERT INTO `t_saleorderdetail` VALUES ('120', '1002', '79', '1');
INSERT INTO `t_saleorderdetail` VALUES ('121', '1004', '79', '1');
INSERT INTO `t_saleorderdetail` VALUES ('122', '1001', '80', '1');
INSERT INTO `t_saleorderdetail` VALUES ('123', '1002', '80', '1');
INSERT INTO `t_saleorderdetail` VALUES ('124', '1003', '80', '1');
INSERT INTO `t_saleorderdetail` VALUES ('125', '1001', '81', '1');
INSERT INTO `t_saleorderdetail` VALUES ('126', '1002', '81', '1');
INSERT INTO `t_saleorderdetail` VALUES ('127', '1003', '81', '1');
INSERT INTO `t_saleorderdetail` VALUES ('128', '1001', '82', '1');
INSERT INTO `t_saleorderdetail` VALUES ('129', '1001', '83', '1');
INSERT INTO `t_saleorderdetail` VALUES ('130', '1002', '83', '1');
INSERT INTO `t_saleorderdetail` VALUES ('131', '1003', '83', '1');
INSERT INTO `t_saleorderdetail` VALUES ('132', '1008', '84', '1');
INSERT INTO `t_saleorderdetail` VALUES ('133', '1004', '84', '1');
INSERT INTO `t_saleorderdetail` VALUES ('134', '1006', '84', '1');
INSERT INTO `t_saleorderdetail` VALUES ('135', '1001', '85', '1');
INSERT INTO `t_saleorderdetail` VALUES ('136', '1003', '85', '1');
INSERT INTO `t_saleorderdetail` VALUES ('137', '1005', '85', '1');
INSERT INTO `t_saleorderdetail` VALUES ('138', '1001', '86', '2');
INSERT INTO `t_saleorderdetail` VALUES ('139', '1003', '86', '1');
INSERT INTO `t_saleorderdetail` VALUES ('140', '1005', '86', '1');
INSERT INTO `t_saleorderdetail` VALUES ('141', '1001', '87', '1');
INSERT INTO `t_saleorderdetail` VALUES ('142', '1002', '87', '1');
INSERT INTO `t_saleorderdetail` VALUES ('143', '1003', '87', '1');
INSERT INTO `t_saleorderdetail` VALUES ('144', '1001', '88', '1');
INSERT INTO `t_saleorderdetail` VALUES ('145', '1002', '88', '1');
INSERT INTO `t_saleorderdetail` VALUES ('146', '1003', '88', '1');
INSERT INTO `t_saleorderdetail` VALUES ('147', '1001', '89', '1');
INSERT INTO `t_saleorderdetail` VALUES ('148', '1002', '89', '1');
INSERT INTO `t_saleorderdetail` VALUES ('149', '1003', '89', '1');
INSERT INTO `t_saleorderdetail` VALUES ('150', '1001', '90', '1');
INSERT INTO `t_saleorderdetail` VALUES ('151', '1002', '90', '1');
INSERT INTO `t_saleorderdetail` VALUES ('152', '1003', '90', '1');
INSERT INTO `t_saleorderdetail` VALUES ('153', '1001', '91', '1');
INSERT INTO `t_saleorderdetail` VALUES ('154', '1002', '91', '1');
INSERT INTO `t_saleorderdetail` VALUES ('155', '1003', '91', '1');
INSERT INTO `t_saleorderdetail` VALUES ('156', '1001', '92', '1');
INSERT INTO `t_saleorderdetail` VALUES ('157', '1002', '92', '1');
INSERT INTO `t_saleorderdetail` VALUES ('158', '1003', '92', '1');
INSERT INTO `t_saleorderdetail` VALUES ('159', '1001', '93', '4');
INSERT INTO `t_saleorderdetail` VALUES ('160', '1002', '93', '1');
INSERT INTO `t_saleorderdetail` VALUES ('161', '1001', '94', '2');
INSERT INTO `t_saleorderdetail` VALUES ('162', '1002', '94', '1');
INSERT INTO `t_saleorderdetail` VALUES ('163', '1001', '95', '2');
INSERT INTO `t_saleorderdetail` VALUES ('164', '1002', '95', '1');
INSERT INTO `t_saleorderdetail` VALUES ('165', '1001', '96', '2');
INSERT INTO `t_saleorderdetail` VALUES ('166', '1002', '96', '1');
INSERT INTO `t_saleorderdetail` VALUES ('167', '1001', '97', '3');
INSERT INTO `t_saleorderdetail` VALUES ('168', '1002', '97', '1');
INSERT INTO `t_saleorderdetail` VALUES ('169', '1004', '97', '1');
INSERT INTO `t_saleorderdetail` VALUES ('170', '1001', '98', '2');
INSERT INTO `t_saleorderdetail` VALUES ('171', '1002', '98', '1');
INSERT INTO `t_saleorderdetail` VALUES ('172', '1001', '99', '2');
INSERT INTO `t_saleorderdetail` VALUES ('173', '1002', '99', '1');
INSERT INTO `t_saleorderdetail` VALUES ('174', '1001', '100', '3');
INSERT INTO `t_saleorderdetail` VALUES ('175', '1002', '100', '1');
INSERT INTO `t_saleorderdetail` VALUES ('176', '1001', '101', '2');
INSERT INTO `t_saleorderdetail` VALUES ('177', '1002', '101', '1');
INSERT INTO `t_saleorderdetail` VALUES ('178', '1001', '102', '4');
INSERT INTO `t_saleorderdetail` VALUES ('179', '1002', '102', '1');
INSERT INTO `t_saleorderdetail` VALUES ('180', '1001', '103', '1');
INSERT INTO `t_saleorderdetail` VALUES ('181', '1002', '103', '1');
INSERT INTO `t_saleorderdetail` VALUES ('182', '1001', '104', '1');
INSERT INTO `t_saleorderdetail` VALUES ('183', '1002', '104', '1');
INSERT INTO `t_saleorderdetail` VALUES ('184', '1001', '105', '1');
INSERT INTO `t_saleorderdetail` VALUES ('185', '1002', '105', '1');
INSERT INTO `t_saleorderdetail` VALUES ('186', '1001', '106', '1');
INSERT INTO `t_saleorderdetail` VALUES ('187', '1002', '106', '1');
INSERT INTO `t_saleorderdetail` VALUES ('188', '1001', '107', '1');
INSERT INTO `t_saleorderdetail` VALUES ('189', '1002', '107', '1');
INSERT INTO `t_saleorderdetail` VALUES ('190', '1001', '108', '1');
INSERT INTO `t_saleorderdetail` VALUES ('191', '1002', '108', '1');
INSERT INTO `t_saleorderdetail` VALUES ('192', '1004', '109', '1');
INSERT INTO `t_saleorderdetail` VALUES ('193', '1005', '109', '1');
INSERT INTO `t_saleorderdetail` VALUES ('194', '1005', '110', '4');
INSERT INTO `t_saleorderdetail` VALUES ('195', '1002', '110', '1');
INSERT INTO `t_saleorderdetail` VALUES ('196', '1001', '110', '1');
INSERT INTO `t_saleorderdetail` VALUES ('197', '1003', '110', '1');
INSERT INTO `t_saleorderdetail` VALUES ('198', '1001', '111', '1');
INSERT INTO `t_saleorderdetail` VALUES ('199', '1002', '111', '1');
INSERT INTO `t_saleorderdetail` VALUES ('200', '1003', '111', '1');
INSERT INTO `t_saleorderdetail` VALUES ('201', '1001', '112', '3');
INSERT INTO `t_saleorderdetail` VALUES ('202', '1002', '112', '1');
INSERT INTO `t_saleorderdetail` VALUES ('203', '1004', '113', '2');
INSERT INTO `t_saleorderdetail` VALUES ('204', '1003', '113', '1');
INSERT INTO `t_saleorderdetail` VALUES ('205', '1007', '113', '1');
INSERT INTO `t_saleorderdetail` VALUES ('206', '1006', '113', '1');
INSERT INTO `t_saleorderdetail` VALUES ('207', '11', '114', '1');
INSERT INTO `t_saleorderdetail` VALUES ('208', '21', '115', '1');
INSERT INTO `t_saleorderdetail` VALUES ('209', '24', '116', '1');
INSERT INTO `t_saleorderdetail` VALUES ('210', '24', '117', '1');
INSERT INTO `t_saleorderdetail` VALUES ('211', '24', '118', '1');
INSERT INTO `t_saleorderdetail` VALUES ('212', '11', '119', '1');
INSERT INTO `t_saleorderdetail` VALUES ('213', '11', '120', '1');
INSERT INTO `t_saleorderdetail` VALUES ('214', '14', '120', '1');
INSERT INTO `t_saleorderdetail` VALUES ('215', '24', '120', '1');
INSERT INTO `t_saleorderdetail` VALUES ('216', '11', '121', '1');
INSERT INTO `t_saleorderdetail` VALUES ('217', '22', '121', '1');
INSERT INTO `t_saleorderdetail` VALUES ('218', '11', '122', '1');
INSERT INTO `t_saleorderdetail` VALUES ('219', '13', '122', '1');
INSERT INTO `t_saleorderdetail` VALUES ('220', '11', '123', '1');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `U_id` int(11) NOT NULL AUTO_INCREMENT,
  `R_id` int(11) DEFAULT NULL,
  `U_pwd` varchar(30) DEFAULT NULL,
  `U_name` varchar(30) DEFAULT NULL,
  `U_age` int(11) DEFAULT NULL,
  `U_sex` char(2) DEFAULT NULL,
  `U_tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`U_id`),
  KEY `FK_Relationship_6` (`R_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`R_id`) REFERENCES `t_role` (`R_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1000', '1', '666', 'fanke', '42', '男', '18778390782');
INSERT INTO `t_user` VALUES ('1001', '1', '666', '覃璠科', '18', '男', '13557730506');
INSERT INTO `t_user` VALUES ('1002', '3', '666', 'fankeee', '28', '男', '17896451237');
INSERT INTO `t_user` VALUES ('1004', '2', '888', '989789', '54', '女', '16877991236');
INSERT INTO `t_user` VALUES ('1005', '2', '666666', '龙华', '27', '男', '18975421003');
INSERT INTO `t_user` VALUES ('1006', '3', '111222', '于海滨', '22', '女', '19087653421');
INSERT INTO `t_user` VALUES ('1007', '3', '222333', '蒋明明', '20', '女', '18756920654');
INSERT INTO `t_user` VALUES ('1008', '3', '333444', '李静', '22', '女', '15689798985');
INSERT INTO `t_user` VALUES ('1009', '3', '444555', '季金鸥', '24', '女', '17878565663');
INSERT INTO `t_user` VALUES ('1010', '3', '555666', '苟富贵', '26', '女', '19895956563');
INSERT INTO `t_user` VALUES ('1011', '3', '666777', '胡仨', '26', '女', '18796565666');
INSERT INTO `t_user` VALUES ('1014', '1', '123', '张小明', '25', '男', '7878889');
INSERT INTO `t_user` VALUES ('1015', '1', '123', '王鹏鹏', '28', '男', '700000');
INSERT INTO `t_user` VALUES ('1024', '3', '666777', 'fankee', '22', '男', '13557730506');
