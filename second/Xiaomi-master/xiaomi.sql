/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : xiaomi

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 24/12/2022 15:00:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int(0) NOT NULL AUTO_INCREMENT,
  `img_path` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `describes` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'http://47.115.85.237:3000/public/imgs/cms_1.jpg', NULL);
INSERT INTO `carousel` VALUES (2, 'http://47.115.85.237:3000/public/imgs/cms_2.jpg', NULL);
INSERT INTO `carousel` VALUES (3, 'http://47.115.85.237:3000/public/imgs/cms_3.jpg', NULL);
INSERT INTO `carousel` VALUES (4, 'http://47.115.85.237:3000/public/imgs/cms_4.jpg', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '手机');
INSERT INTO `category` VALUES (2, '电视机');
INSERT INTO `category` VALUES (3, '空调');
INSERT INTO `category` VALUES (4, '洗衣机');
INSERT INTO `category` VALUES (5, '保护套');
INSERT INTO `category` VALUES (6, '保护膜');
INSERT INTO `category` VALUES (7, '充电器');
INSERT INTO `category` VALUES (8, '充电宝');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  `collect_time` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (5, 5, 3, 1588781316596);
INSERT INTO `collect` VALUES (6, 7, 32, 1588915938813);
INSERT INTO `collect` VALUES (7, 9, 2, 1589119650819);
INSERT INTO `collect` VALUES (8, 11, 3, 1589530747758);
INSERT INTO `collect` VALUES (9, 12, 3, 1589613693008);
INSERT INTO `collect` VALUES (10, 15, 26, 1590674262137);
INSERT INTO `collect` VALUES (11, 19, 5, 1591543772605);
INSERT INTO `collect` VALUES (12, 20, 2, 1670310612925);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  `product_num` int(0) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (11, '1253562115243917312', 1, 3, 1, 2599, 1587707472989);
INSERT INTO `order` VALUES (12, '1253562575002550272', 1, 3, 1, 2599, 1587707582604);
INSERT INTO `order` VALUES (13, '1599655196500283392', 20, 12, 1, 1299, 1670222493659);
INSERT INTO `order` VALUES (15, '1606223162197000192', 20, 36, 1, 1, 1671788418708);
INSERT INTO `order` VALUES (16, '1606312305614684160', 20, 41, 1, 200, 1671809672156);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(0) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(0) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(0) NOT NULL,
  `product_sales` int(0) UNSIGNED NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  `need_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Redmi K30', 1, '120Hz流速屏，全速热爱', '120Hz高帧率流速屏/ 索尼6400万前后六摄 / 6.67\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', 'public/imgs/phone/Redmi-k30.png', 2000, 1599, 10, 0, 0, '');
INSERT INTO `product` VALUES (2, 'Redmi K30 5G', 1, '双模5G,120Hz流速屏', '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', 'public/imgs/phone/Redmi-k30-5G.png', 2599, 2599, 10, 0, 0, '');
INSERT INTO `product` VALUES (3, '小米CC9 Pro', 1, '1亿像素,五摄四闪', '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器', 'public/imgs/phone/Mi-CC9.png', 2799, 2599, 18, 2, 0, '');
INSERT INTO `product` VALUES (4, 'Redmi 8', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB', 'public/imgs/phone/Redmi-8.png', 799, 699, 20, 0, 0, '');
INSERT INTO `product` VALUES (5, 'Redmi 8A', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB / 1200万AI后置相机', 'public/imgs/phone/Redmi-8A.png', 599, 699, 20, 0, 0, '');
INSERT INTO `product` VALUES (6, 'Redmi Note8 Pro', 1, '6400万全场景四摄', '6400万四摄小金刚拍照新旗舰超强解析力，超震撼', 'public/imgs/phone/Redmi-Note8-pro.png', 1399, 1199, 20, 0, 0, '');
INSERT INTO `product` VALUES (7, 'Redmi Note8', 1, '千元4800万四摄', '千元4800万四摄 | 高通骁龙665 | 小金刚品质保证', 'public/imgs/phone/Redmi-Note8.png', 999, 999, 20, 0, 0, '');
INSERT INTO `product` VALUES (8, 'Redmi 7A', 1, '小巧大电量 持久流畅', '小巧大电量，持久又流畅骁龙8核高性能处理器 | 4000mAh超长续航 | AI人脸解锁 | 整机防泼溅', 'public/imgs/phone/Redmi-7A.png', 599, 539, 20, 0, 0, '');
INSERT INTO `product` VALUES (9, '小米电视4A 32英寸', 2, '人工智能系统，高清液晶屏', '小米电视4A 32英寸 | 64位四核处理器 | 1GB+4GB大内存 | 人工智能系统', 'public/imgs/appliance/MiTv-4A-32.png', 799, 799, 10, 0, 0, '');
INSERT INTO `product` VALUES (10, '小米全面屏电视E55A', 2, '全面屏设计，人工智能语音', '全面屏设计 | 内置小爱同学 | 4K + HDR | 杜比DTS | PatchWall | 海量内容 | 2GB + 8GB大存储 | 64位四核处理器', 'public/imgs/appliance/MiTv-E55A.png', 2099, 1899, 10, 0, 0, '');
INSERT INTO `product` VALUES (11, '小米全面屏电视E65A', 2, '全面屏设计，人工智能语音', '人工智能语音系统 | 海量影视内容 | 4K 超高清屏 | 杜比音效 | 64位四核处理器 | 2GB + 8GB大存储', 'public/imgs/appliance/MiTv-E65A.png', 3999, 2799, 10, 0, 0, '');
INSERT INTO `product` VALUES (12, '小米电视4X 43英寸', 2, 'FHD全高清屏，人工智能语音', '人工智能语音系统 | FHD全高清屏 | 64位四核处理器 | 海量片源 | 1GB+8GB大内存 | 钢琴烤漆', 'public/imgs/appliance/MiTv-4X-43.png', 1499, 1299, 9, 1, 0, '');
INSERT INTO `product` VALUES (13, '小米电视4C 55英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4C-55.png', 1999, 1799, 8, 2, 0, '');
INSERT INTO `product` VALUES (14, '小米电视4A 65英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4A-65.png', 2999, 2799, 10, 0, 0, '');
INSERT INTO `product` VALUES (15, '小米壁画电视 65英寸', 2, '壁画外观，全面屏，远场语音', '纯平背板 | 通体13.9mm | 远场语音 | 4K+HDR | 杜比+DTS | 画框模式 | 内置小爱同学 | PatchWall | SoundBar+低音炮 | 四核处理器+大存储', 'public/imgs/appliance/MiTv-ArtTv-65.png', 6999, 6999, 10, 0, 0, '');
INSERT INTO `product` VALUES (16, '米家互联网空调C1（一级能效）', 3, '变频节能省电，自清洁', '一级能效 | 1.5匹 | 全直流变频 | 高效制冷/热 | 静音设计 | 自清洁 | 全屋互联', 'public/imgs/appliance/AirCondition-V1C1.png', 2699, 2599, 20, 10, 0, '');
INSERT INTO `product` VALUES (17, '米家空调', 3, '出众静音，快速制冷热', '大1匹 | 三级能效 | 静音 | 快速制冷热 | 广角送风 | 除湿功能 | 高密度过滤网 | 典雅外观', 'public/imgs/appliance/AirCondition-F3W1.png', 1799, 1699, 20, 8, 0, '');
INSERT INTO `product` VALUES (18, '米家互联网洗烘一体机 Pro 10kg', 4, '智能洗烘，省心省力', '国标双A+级洗烘能力 / 22种洗烘模式 / 智能投放洗涤剂 / 支持小爱同学语音遥控 / 支持OTA在线智能升级 / 智能空气洗 / 除菌率达99.9%+', 'public/imgs/appliance/Washer-Pro-10.png', 2999, 2999, 20, 7, 0, '');
INSERT INTO `product` VALUES (19, 'Redmi K20/ K20 Pro 怪力魔王保护壳', 5, '怪力魔王专属定制', '优选PC材料，强韧张力，经久耐用 / 精选开孔，全面贴合机身 / 手感轻薄细腻，舒适无负担 / 三款颜色可选，彰显个性，与众不同', 'public/imgs/accessory/protectingShell-RedMi-K20&pro.png', 39, 39, 20, 10, 0, '');
INSERT INTO `product` VALUES (20, '小米9 ARE U OK保护壳', 5, '一个与众不同的保护壳', '彰显独特个性 / 轻薄无负担 / 优选PC材料 / 贴合机身 / 潮流五色', 'public/imgs/accessory/protectingShell-Mi-9.png', 49, 39, 19, 11, 0, '');
INSERT INTO `product` VALUES (21, '小米CC9&小米CC9美图定制版 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9.png', 19, 19, 20, 9, 0, '');
INSERT INTO `product` VALUES (22, '小米CC9e 标准高透贴膜', 6, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9e.png', 19, 19, 20, 9, 0, '');
INSERT INTO `product` VALUES (23, '小米USB充电器30W快充版（1A1C）', 7, '多一种接口，多一种选择', '双口输出 / 30W 输出 / 可折叠插脚 / 小巧便携', 'public/imgs/accessory/charger-30w.png', 59, 59, 20, 8, 0, '');
INSERT INTO `product` VALUES (24, '小米USB充电器快充版（18W）', 7, '安卓、苹果设备均可使用', '支持QC3.0设备充电 / 支持iOS设备充电/ 美观耐用', 'public/imgs/accessory/charger-18w.png', 29, 29, 20, 8, 0, '');
INSERT INTO `product` VALUES (25, '小米USB充电器60W快充版（6口）', 7, '6口输出，USB-C输出接口', '6口输出 / USB-C输出接口 / 支持QC3.0快充协议 / 总输出功率60W', 'public/imgs/accessory/charger-60w.png', 129, 129, 20, 0, 0, '');
INSERT INTO `product` VALUES (26, '小米USB充电器36W快充版（2口）', 7, '6多重安全保护，小巧便携', '双USB输出接口 / 支持QC3.0快充协议 / 多重安全保护 / 小巧便携', 'public/imgs/accessory/charger-36w.png', 59, 59, 20, 0, 0, '');
INSERT INTO `product` VALUES (27, '小米车载充电器快充版', 7, '让爱车成为移动充电站', 'QC3.0 双口输出 / 智能温度控制 / 5重安全保护 / 兼容iOS&Android设备', 'public/imgs/accessory/charger-car.png', 69, 69, 20, 0, 0, '');
INSERT INTO `product` VALUES (28, '小米车载充电器快充版(37W)', 7, '双口快充，车载充电更安全', '单口27W 快充 / 双口输出 / 多重安全保护', 'public/imgs/accessory/charger-car-37w.png', 49, 49, 20, 0, 0, '');
INSERT INTO `product` VALUES (29, '小米二合一移动电源（充电器）', 7, '一个设备多种用途', '5000mAh充沛电量 / 多协议快充 / USB 口输出', 'public/imgs/accessory/charger-tio.png', 99, 99, 20, 0, 0, '');
INSERT INTO `product` VALUES (30, '小米无线充电宝青春版10000mAh', 8, '能量满满，无线有线都能充', '10000mAh大容量 / 支持边充边放 / 有线无线都能充 / 双向快充', 'public/imgs/accessory/charger-10000mAh.png', 129, 129, 20, 8, 0, '');
INSERT INTO `product` VALUES (31, '小米CC9 Pro/尊享版 撞色飘带保护壳', 5, '全面贴合，无感更舒适', '优选环保PC材质，强韧张力，全面贴合，无感更舒适', 'public/imgs/accessory/protectingShell-Mi-CC9Pro.png', 69, 69, 20, 0, 0, '');
INSERT INTO `product` VALUES (32, 'Redmi K20系列 幻境之心保护壳', 5, '柔软坚韧,全面贴合', '优质环保材质，柔软坚韧 / 全面贴合，有效抵抗灰尘 / 鲜亮三种颜色可选，为爱机随时换装', 'public/imgs/accessory/protectingShell-RedMi-K20.png', 39, 39, 20, 0, 0, '');
INSERT INTO `product` VALUES (33, '小米9 SE 街头风保护壳黑色', 5, '个性时尚,细节出众', '个性时尚 / 细节出众 / 纤薄轻巧 / 多彩时尚', 'public/imgs/accessory/protectingShell-Mi-9SE.png', 49, 49, 20, 0, 0, '');
INSERT INTO `product` VALUES (34, '小米9 街头风保护壳 红色', 5, '个性时尚,细节出众', '时尚多彩 / 细节出众 / 纤薄轻巧 / 是腕带也是支架', 'public/imgs/accessory/protectingShell-Mi-9-red.png', 49, 49, 20, 0, 20, '2222');
INSERT INTO `product` VALUES (35, '小米MIX 3 极简保护壳蓝色', 5, '时尚简约设计，手感细腻顺滑', '时尚简约设计，手感细腻顺滑 / 优质环保PC原材料，强韧张力，经久耐用 / 超薄 0.8MM厚度', 'public/imgs/accessory/protectingShell-Mix-3.png', 49, 12.9, 20, 0, 20, '1111111');
INSERT INTO `product` VALUES (36, '1', 1, '1', '1', 'http://localhost:3000/profile/upload/2022/12/23/2222_20221223173202A002.jpg', 1, 1, 0, 1, 20, '1606221083743207424');
INSERT INTO `product` VALUES (37, '1', 1, '1', '1', 'http://localhost:3000/profile/upload/2022/12/23/2222_20221223173710A003.jpg', 1, 1, 1, 0, 20, '1606222375823720448');
INSERT INTO `product` VALUES (38, '2', 1, '2', '2', 'http://localhost:3000/profile/upload/2022/12/23/4444_20221223174452A001.png', 2, 2, 2, 0, 20, '1606224316184223744');
INSERT INTO `product` VALUES (41, '测试', 1, '测试', '测试', 'http://localhost:3000/profile/upload/2022/12/23/2222_20221223233344A001.jpg', 200, 200, 0, 1, 20, '1606312140635930624');
INSERT INTO `product` VALUES (42, '测试', 1, '测试', '测试', 'http://localhost:3000/profile/upload/2022/12/23/2222_20221223233344A001.jpg', 200, 200, 0, 1, 20, '55555');
INSERT INTO `product` VALUES (43, '1', 1, '1', '1', 'http://localhost:3000/profile/upload/2022/12/24/4444_20221224143908A001.png', 1, 1, 1, 0, 20, '1606539962415579136');

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `product_id` int(0) NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/phone/picture/Redmi-k30-1.png', NULL);
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/phone/picture/Redmi-k30-2.png', NULL);
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/phone/picture/Redmi-k30-3.png', NULL);
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/phone/picture/Redmi-k30-4.png', NULL);
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/phone/picture/Redmi-k30-5.png', NULL);
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/phone/picture/Redmi K30 5G-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/phone/picture/Redmi K30 5G-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/phone/picture/Redmi K30 5G-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/phone/picture/Redmi K30 5G-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (10, 2, 'public/imgs/phone/picture/Redmi K30 5G-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/phone/picture/MI CC9 Pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/phone/picture/MI CC9 Pro-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/phone/picture/MI CC9 Pro-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (14, 3, 'public/imgs/phone/picture/MI CC9 Pro-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (15, 3, 'public/imgs/phone/picture/MI CC9 Pro-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (16, 3, 'public/imgs/phone/picture/MI CC9 Pro-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/phone/picture/Redmi 8-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (18, 4, 'public/imgs/phone/picture/Redmi 8-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (19, 4, 'public/imgs/phone/picture/Redmi 8-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (20, 4, 'public/imgs/phone/picture/Redmi 8-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (21, 4, 'public/imgs/phone/picture/Redmi 8-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (22, 5, 'public/imgs/phone/picture/Redmi 8A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-1.png', NULL);
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-2.png', NULL);
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-3.png', NULL);
INSERT INTO `product_picture` VALUES (26, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-4.png', NULL);
INSERT INTO `product_picture` VALUES (27, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-5.png', NULL);
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/phone/picture/Redmi Note8-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (29, 7, 'public/imgs/phone/picture/Redmi Note8-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (30, 7, 'public/imgs/phone/picture/Redmi Note8-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (31, 7, 'public/imgs/phone/picture/Redmi Note8-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (32, 7, 'public/imgs/phone/picture/Redmi Note8-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (33, 8, 'public/imgs/phone/picture/Redmi 7A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (34, 8, 'public/imgs/phone/picture/Redmi 7A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (35, 8, 'public/imgs/phone/picture/Redmi 7A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (36, 8, 'public/imgs/phone/picture/Redmi 7A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (37, 8, 'public/imgs/phone/picture/Redmi 7A-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (38, 9, 'public/imgs/phone/picture/MiTv-4A-32-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (39, 9, 'public/imgs/phone/picture/MiTv-4A-32-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (40, 9, 'public/imgs/phone/picture/MiTv-4A-32-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (41, 9, 'public/imgs/phone/picture/MiTv-4A-32-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (42, 10, 'public/imgs/phone/picture/MiTv-E55A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (43, 10, 'public/imgs/phone/picture/MiTv-E55A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (44, 10, 'public/imgs/phone/picture/MiTv-E55A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (45, 10, 'public/imgs/phone/picture/MiTv-E55A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (46, 11, 'public/imgs/phone/picture/MiTv-E65A-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (47, 11, 'public/imgs/phone/picture/MiTv-E65A-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (48, 11, 'public/imgs/phone/picture/MiTv-E65A-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (49, 11, 'public/imgs/phone/picture/MiTv-E65A-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (50, 12, 'public/imgs/phone/picture/MiTv-4X 43-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (51, 12, 'public/imgs/phone/picture/MiTv-4X 43-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (52, 12, 'public/imgs/phone/picture/MiTv-4X 43-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (53, 13, 'public/imgs/phone/picture/MiTv-4C 55-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (54, 13, 'public/imgs/phone/picture/MiTv-4C 55-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (55, 13, 'public/imgs/phone/picture/MiTv-4C 55-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (56, 14, 'public/imgs/phone/picture/MiTv-4A 65-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (57, 15, 'public/imgs/phone/picture/MiTv-ArtTv-65-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (58, 16, 'public/imgs/phone/picture/AirCondition-V1C1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (59, 17, 'public/imgs/phone/picture/AirCondition-F3W1-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (60, 18, 'public/imgs/phone/picture/Washer-Pro-10-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (61, 18, 'public/imgs/phone/picture/Washer-Pro-10-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (62, 18, 'public/imgs/phone/picture/Washer-Pro-10-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (63, 18, 'public/imgs/phone/picture/Washer-Pro-10-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (64, 19, 'public/imgs/phone/picture/protectingShell-RedMi-K20&pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (65, 20, 'public/imgs/phone/picture/protectingShell-Mi-9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (66, 20, 'public/imgs/phone/picture/protectingShell-Mi-9-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (67, 21, 'public/imgs/phone/picture/protectingMen-Mi-CC9-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (68, 22, 'public/imgs/phone/picture/protectingMen-Mi-CC9e-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (69, 23, 'public/imgs/phone/picture/charger-30w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (70, 23, 'public/imgs/phone/picture/charger-30w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (71, 23, 'public/imgs/phone/picture/charger-30w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (72, 23, 'public/imgs/phone/picture/charger-30w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (73, 24, 'public/imgs/phone/picture/charger-18w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (74, 24, 'public/imgs/phone/picture/charger-18w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (75, 24, 'public/imgs/phone/picture/charger-18w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (76, 25, 'public/imgs/phone/picture/charger-60w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (77, 25, 'public/imgs/phone/picture/charger-60w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (78, 25, 'public/imgs/phone/picture/charger-60w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (79, 25, 'public/imgs/phone/picture/charger-60w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (80, 26, 'public/imgs/phone/picture/charger-36w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (81, 26, 'public/imgs/phone/picture/charger-36w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (82, 26, 'public/imgs/phone/picture/charger-36w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (83, 26, 'public/imgs/phone/picture/charger-36w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (84, 26, 'public/imgs/phone/picture/charger-36w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (85, 27, 'public/imgs/phone/picture/charger-car-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (86, 27, 'public/imgs/phone/picture/charger-car-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (87, 27, 'public/imgs/phone/picture/charger-car-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (88, 27, 'public/imgs/phone/picture/charger-car-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (89, 27, 'public/imgs/phone/picture/charger-car-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (90, 27, 'public/imgs/phone/picture/charger-car-6.jpg', NULL);
INSERT INTO `product_picture` VALUES (91, 28, 'public/imgs/phone/picture/charger-car-37w-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (92, 28, 'public/imgs/phone/picture/charger-car-37w-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (93, 28, 'public/imgs/phone/picture/charger-car-37w-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (94, 28, 'public/imgs/phone/picture/charger-car-37w-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (95, 28, 'public/imgs/phone/picture/charger-car-37w-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (96, 29, 'public/imgs/phone/picture/charger-tio-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (97, 29, 'public/imgs/phone/picture/charger-tio-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (98, 29, 'public/imgs/phone/picture/charger-tio-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (99, 29, 'public/imgs/phone/picture/charger-tio-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (100, 29, 'public/imgs/phone/picture/charger-tio-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (101, 30, 'public/imgs/phone/picture/charger-10000mAh-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (102, 30, 'public/imgs/phone/picture/charger-10000mAh-2.jpg', NULL);
INSERT INTO `product_picture` VALUES (103, 30, 'public/imgs/phone/picture/charger-10000mAh-3.jpg', NULL);
INSERT INTO `product_picture` VALUES (104, 30, 'public/imgs/phone/picture/charger-10000mAh-4.jpg', NULL);
INSERT INTO `product_picture` VALUES (105, 30, 'public/imgs/phone/picture/charger-10000mAh-5.jpg', NULL);
INSERT INTO `product_picture` VALUES (106, 31, 'public/imgs/phone/picture/protectingShell-Mi-CC9Pro-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (107, 32, 'public/imgs/phone/picture/protectingShell-RedMi-K20-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (108, 33, 'public/imgs/phone/picture/protectingShell-Mi-9SE-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (109, 34, 'public/imgs/phone/picture/protectingShell-Mi-9-red-1.jpg', NULL);
INSERT INTO `product_picture` VALUES (110, 35, 'public/imgs/phone/picture/protectingShell-Mix-3-1.jpg', NULL);

-- ----------------------------
-- Table structure for seckill_product
-- ----------------------------
DROP TABLE IF EXISTS `seckill_product`;
CREATE TABLE `seckill_product`  (
  `seckill_id` int(0) NOT NULL AUTO_INCREMENT,
  `product_id` int(0) NOT NULL,
  `seckill_price` double NULL DEFAULT NULL,
  `seckill_stock` int(0) NULL DEFAULT NULL,
  `time_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`seckill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9667 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seckill_product
-- ----------------------------
INSERT INTO `seckill_product` VALUES (9487, 33, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9488, 2, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9489, 3, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9490, 7, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9491, 8, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9492, 9, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9493, 14, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9494, 16, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9495, 18, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9496, 20, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9497, 22, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9498, 23, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9499, 24, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9500, 28, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9501, 29, 1000, 100, 730);
INSERT INTO `seckill_product` VALUES (9502, 32, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9503, 2, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9504, 34, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9505, 3, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9506, 35, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9507, 8, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9508, 10, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9509, 12, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9510, 13, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9511, 15, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9512, 19, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9513, 21, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9514, 25, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9515, 28, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9516, 30, 1000, 100, 731);
INSERT INTO `seckill_product` VALUES (9517, 35, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9518, 3, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9519, 5, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9520, 6, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9521, 8, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9522, 9, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9523, 11, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9524, 12, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9525, 13, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9526, 14, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9527, 19, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9528, 20, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9529, 22, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9530, 29, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9531, 30, 1000, 100, 732);
INSERT INTO `seckill_product` VALUES (9532, 34, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9533, 35, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9534, 3, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9535, 5, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9536, 10, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9537, 12, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9538, 13, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9539, 14, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9540, 17, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9541, 18, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9542, 19, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9543, 21, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9544, 29, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9545, 30, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9546, 31, 1000, 100, 733);
INSERT INTO `seckill_product` VALUES (9547, 1, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9548, 4, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9549, 7, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9550, 8, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9551, 11, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9552, 12, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9553, 13, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9554, 16, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9555, 18, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9556, 19, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9557, 21, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9558, 24, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9559, 27, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9560, 29, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9561, 31, 1000, 100, 734);
INSERT INTO `seckill_product` VALUES (9562, 2, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9563, 35, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9564, 3, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9565, 7, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9566, 11, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9567, 12, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9568, 13, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9569, 15, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9570, 17, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9571, 18, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9572, 20, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9573, 25, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9574, 26, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9575, 28, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9576, 31, 1000, 100, 735);
INSERT INTO `seckill_product` VALUES (9577, 33, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9578, 35, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9579, 4, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9580, 9, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9581, 11, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9582, 12, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9583, 15, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9584, 16, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9585, 17, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9586, 18, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9587, 19, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9588, 23, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9589, 24, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9590, 25, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9591, 26, 1000, 100, 736);
INSERT INTO `seckill_product` VALUES (9592, 32, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9593, 1, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9594, 34, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9595, 2, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9596, 6, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9597, 8, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9598, 9, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9599, 13, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9600, 16, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9601, 21, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9602, 25, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9603, 26, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9604, 27, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9605, 29, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9606, 31, 1000, 100, 737);
INSERT INTO `seckill_product` VALUES (9607, 4, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9608, 6, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9609, 9, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9610, 10, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9611, 12, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9612, 13, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9613, 15, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9614, 16, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9615, 17, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9616, 20, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9617, 21, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9618, 23, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9619, 24, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9620, 27, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9621, 29, 1000, 100, 738);
INSERT INTO `seckill_product` VALUES (9622, 32, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9623, 2, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9624, 4, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9625, 6, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9626, 8, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9627, 10, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9628, 11, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9629, 12, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9630, 14, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9631, 16, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9632, 18, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9633, 19, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9634, 20, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9635, 27, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9636, 30, 1000, 100, 739);
INSERT INTO `seckill_product` VALUES (9637, 32, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9638, 33, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9639, 4, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9640, 6, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9641, 7, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9642, 10, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9643, 11, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9644, 12, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9645, 13, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9646, 20, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9647, 21, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9648, 22, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9649, 25, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9650, 28, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9651, 30, 1000, 100, 740);
INSERT INTO `seckill_product` VALUES (9652, 32, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9653, 2, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9654, 4, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9655, 8, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9656, 9, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9657, 10, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9658, 11, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9659, 12, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9660, 15, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9661, 18, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9662, 20, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9663, 21, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9664, 26, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9665, 28, 1000, 100, 741);
INSERT INTO `seckill_product` VALUES (9666, 29, 1000, 100, 741);

-- ----------------------------
-- Table structure for seckill_time
-- ----------------------------
DROP TABLE IF EXISTS `seckill_time`;
CREATE TABLE `seckill_time`  (
  `time_id` int(0) NOT NULL AUTO_INCREMENT,
  `start_time` bigint(0) NULL DEFAULT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`time_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 742 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seckill_time
-- ----------------------------
INSERT INTO `seckill_time` VALUES (730, 1670572800000, 1670576400000);
INSERT INTO `seckill_time` VALUES (731, 1670580000000, 1670583600000);
INSERT INTO `seckill_time` VALUES (732, 1670587200000, 1670590800000);
INSERT INTO `seckill_time` VALUES (733, 1670594400000, 1670598000000);
INSERT INTO `seckill_time` VALUES (734, 1670601600000, 1670605200000);
INSERT INTO `seckill_time` VALUES (735, 1670608800000, 1670612400000);
INSERT INTO `seckill_time` VALUES (736, 1670616000000, 1670619600000);
INSERT INTO `seckill_time` VALUES (737, 1670623200000, 1670626800000);
INSERT INTO `seckill_time` VALUES (738, 1670630400000, 1670634000000);
INSERT INTO `seckill_time` VALUES (739, 1670637600000, 1670641200000);
INSERT INTO `seckill_time` VALUES (740, 1670644800000, 1670648400000);
INSERT INTO `seckill_time` VALUES (741, 1670652000000, 1670655600000);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  `num` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (18, 1, 2, 4);
INSERT INTO `shopping_cart` VALUES (19, 3, 30, 2);
INSERT INTO `shopping_cart` VALUES (20, 3, 3, 2);
INSERT INTO `shopping_cart` VALUES (21, 3, 4, 3);
INSERT INTO `shopping_cart` VALUES (22, 4, 3, 1);
INSERT INTO `shopping_cart` VALUES (23, 5, 3, 1);
INSERT INTO `shopping_cart` VALUES (24, 6, 2, 1);
INSERT INTO `shopping_cart` VALUES (25, 9, 2, 3);
INSERT INTO `shopping_cart` VALUES (26, 11, 3, 1);
INSERT INTO `shopping_cart` VALUES (27, 12, 3, 5);
INSERT INTO `shopping_cart` VALUES (28, 6, 6, 2);
INSERT INTO `shopping_cart` VALUES (29, 14, 2, 1);
INSERT INTO `shopping_cart` VALUES (30, 16, 1, 1);
INSERT INTO `shopping_cart` VALUES (31, 18, 3, 1);
INSERT INTO `shopping_cart` VALUES (32, 19, 5, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `username` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone_number` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zerowdd', 'c51f9b1ec11855186a670e089d55a712', NULL);
INSERT INTO `user` VALUES (2, 'testtest', '05a671c66aefea124cc08b76ea6d30bb', NULL);
INSERT INTO `user` VALUES (3, 'a123456', 'dc483e80a7a0bd9ef71d8cf973673924', NULL);
INSERT INTO `user` VALUES (4, 'ddwddw', '78c8b92f09f93f438b4146d345784724', NULL);
INSERT INTO `user` VALUES (5, 'bababa', 'dc483e80a7a0bd9ef71d8cf973673924', NULL);
INSERT INTO `user` VALUES (6, 'admin', 'dc483e80a7a0bd9ef71d8cf973673924', NULL);
INSERT INTO `user` VALUES (7, 'xiaohehaokeai', '7248b7ace448685ea3e24160bf9cc85e', NULL);
INSERT INTO `user` VALUES (8, 'abcde', 'e80b5017098950fc58aad83c8c14978e', NULL);
INSERT INTO `user` VALUES (9, 'abcdef', 'e80b5017098950fc58aad83c8c14978e', NULL);
INSERT INTO `user` VALUES (10, 'duanjiangtao', 'b61dc55947a309e0530314cee03d31bd', NULL);
INSERT INTO `user` VALUES (11, 'zq789456', 'a32f8a465202f8a14ca514fbffdb4a14', NULL);
INSERT INTO `user` VALUES (12, 'CCY_CCy', '5d93ceb70e2bf5daa84ec3d0cd2c731a', NULL);
INSERT INTO `user` VALUES (13, 'l123456', 'c57562653c783faeb8b6cd917ef258c1', NULL);
INSERT INTO `user` VALUES (14, 'yzw0323', '03918c2b726cb53556608c9da759d45b', NULL);
INSERT INTO `user` VALUES (15, 'yanguo', '03918c2b726cb53556608c9da759d45b', NULL);
INSERT INTO `user` VALUES (16, 'testtt', 'f55e23f49445a3cf708c19577f218a5b', NULL);
INSERT INTO `user` VALUES (17, 'jayjethava1', '7762dc5d78cb8366208b0c05b6fb14ea', NULL);
INSERT INTO `user` VALUES (18, 'lh235762524001', '6cfa955a82ad67f24f8daaf0e6f6e09e', NULL);
INSERT INTO `user` VALUES (19, 'liyiming', '31e09a2697bff307006cfd52cc202270', NULL);
INSERT INTO `user` VALUES (20, 'z123456', 'dcc62e31c8030d9488969c5da73d2f16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
