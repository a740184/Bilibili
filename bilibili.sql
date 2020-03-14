/*
Navicat MySQL Data Transfer

Source Server         : bilibili
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : bilibili

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-03-12 14:43:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '12345', 'admin.jpg');

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES ('1', '【其实，脱下防护服我也是个女孩】我是名护士，也是个普通的女孩。和你一样，我老嚷着要减肥，有时也会邋里邋遢。只是，疫情暴发，穿上这身防护服，我就要勇敢地与病毒厮杀！我相信，千千万万的女性医护人员，也都像我这样想…戳↓一起祝愿最美的她#，早日凯旋！​', 'bili.jpg', '1', '2020-03-11 20:25:51');

-- ----------------------------
-- Table structure for dy_comment
-- ----------------------------
DROP TABLE IF EXISTS `dy_comment`;
CREATE TABLE `dy_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `public_id` int(11) DEFAULT NULL,
  `dy_id` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dy_comment
-- ----------------------------
INSERT INTO `dy_comment` VALUES ('1', '很对太对了 ！我支持你！鸡你太美了~', '2', '1', '2020-03-12 09:48:49');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `userid` int(11) DEFAULT NULL,
  `follow_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('2', '1');
INSERT INTO `follow` VALUES ('3', '1');
INSERT INTO `follow` VALUES ('4', '1');
INSERT INTO `follow` VALUES ('5', '1');
INSERT INTO `follow` VALUES ('1', '18');
INSERT INTO `follow` VALUES ('1', '3');
INSERT INTO `follow` VALUES ('18', '2');
INSERT INTO `follow` VALUES ('18', '3');
INSERT INTO `follow` VALUES ('21', '1');
INSERT INTO `follow` VALUES ('21', '2');
INSERT INTO `follow` VALUES ('21', '18');
INSERT INTO `follow` VALUES ('1', '21');
INSERT INTO `follow` VALUES ('18', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `comment` text,
  `send_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '1', '炎之呼吸 · 不知火', '2019-09-29 11:04:41');
INSERT INTO `message` VALUES ('4', '1', '2', '\r\n猛兽凯皇AMV超燃【青春永痕在 舍命亦弑神！！！】 ', '2019-09-29 11:07:30');
INSERT INTO `message` VALUES ('7', '18', '1', '长发的碳治郎帅炸', '2019-10-11 10:27:14');
INSERT INTO `message` VALUES ('8', '1', '10', '我想吃掉你的胰脏', '2019-10-17 11:42:30');
INSERT INTO `message` VALUES ('9', '1', '19', '鸡你太美', '2019-10-17 16:51:03');
INSERT INTO `message` VALUES ('10', '1', '8', '111', '2020-03-04 09:56:22');
INSERT INTO `message` VALUES ('11', '18', '3', '事实上', '2020-03-09 14:56:32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `head_img` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `coin` int(11) DEFAULT '0',
  `exp` int(11) DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Guan', '123', 'Mikasa.jpg', '404 NOT FOUND！', '6', '96', '29060');
INSERT INTO `user` VALUES ('2', 'Eason', '456', 'tv_black.png', 'Lonely Christmas', '0', '0', '0');
INSERT INTO `user` VALUES ('3', 'Gavin', 'sss', 'guimie.jpg', 'My name is Gavin Thomas.', '0', '0', '0');
INSERT INTO `user` VALUES ('4', 'James', 'jame', '德邦总管 - 赵信 是如何Gank的 第二部 _(3」∠)_ lol英雄联盟.jpg', 'LeBron Jame', '0', '0', '0');
INSERT INTO `user` VALUES ('5', 'kobe', 'kobe', 'bili.jpg', 'kobe bryant', '0', '0', '0');
INSERT INTO `user` VALUES ('18', 'Sou', 'sou', '金木研.jpg', 'Sou', '0', '0', '100');
INSERT INTO `user` VALUES ('19', 'Godv', 'godv', 'Mikasa.jpg', ' ', '0', '0', '0');
INSERT INTO `user` VALUES ('21', '某幻', 'mouhuan', 'tujue.jpg', 'yo', '0', '0', '40');
INSERT INTO `user` VALUES ('22', 'Souz', 'souz', 'tzl.jpg', '666', '0', '0', '0');
INSERT INTO `user` VALUES ('24', 'gao', '123456', 'background.png', '嗯哼哼', '0', '0', '0');

-- ----------------------------
-- Table structure for user_collect_video
-- ----------------------------
DROP TABLE IF EXISTS `user_collect_video`;
CREATE TABLE `user_collect_video` (
  `userid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_collect_video
-- ----------------------------
INSERT INTO `user_collect_video` VALUES ('1', '1');
INSERT INTO `user_collect_video` VALUES ('1', '2');
INSERT INTO `user_collect_video` VALUES ('18', '1');
INSERT INTO `user_collect_video` VALUES ('1', '3');
INSERT INTO `user_collect_video` VALUES ('21', '7');
INSERT INTO `user_collect_video` VALUES ('1', '7');
INSERT INTO `user_collect_video` VALUES ('1', '10');
INSERT INTO `user_collect_video` VALUES ('1', '19');

-- ----------------------------
-- Table structure for user_praise_icon
-- ----------------------------
DROP TABLE IF EXISTS `user_praise_icon`;
CREATE TABLE `user_praise_icon` (
  `state_praise` int(11) DEFAULT '0',
  `state_icon` int(11) DEFAULT '0',
  `userid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_praise_icon
-- ----------------------------
INSERT INTO `user_praise_icon` VALUES ('1', '0', '1', '1');
INSERT INTO `user_praise_icon` VALUES ('1', '1', '1', '2');
INSERT INTO `user_praise_icon` VALUES ('1', '0', '1', '3');
INSERT INTO `user_praise_icon` VALUES ('1', '1', '18', '1');
INSERT INTO `user_praise_icon` VALUES ('0', '1', '18', '2');
INSERT INTO `user_praise_icon` VALUES ('1', '0', '21', '7');
INSERT INTO `user_praise_icon` VALUES ('1', '0', '21', '8');
INSERT INTO `user_praise_icon` VALUES ('1', '0', '21', '3');
INSERT INTO `user_praise_icon` VALUES ('1', '1', '1', '7');
INSERT INTO `user_praise_icon` VALUES ('1', '1', '1', '10');
INSERT INTO `user_praise_icon` VALUES ('1', '1', '1', '19');
INSERT INTO `user_praise_icon` VALUES ('0', '1', '1', '8');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vname` varchar(255) DEFAULT NULL,
  `vsrc` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `praise` int(11) DEFAULT '0',
  `get_icon` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT NULL,
  `v_image` varchar(255) DEFAULT NULL,
  `vtime` datetime DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '【鬼灭之刃高燃混剪踩点1080P】前方高能！以水之型，铸火之刃', '【鬼灭之刃高燃混剪踩点1080P】前方高能！以水之型，铸火之刃.mp4', '1', '2', '1', '1', '鬼灭之刃.jpg', '2019-09-26 11:53:21');
INSERT INTO `video` VALUES ('2', '猛兽凯皇AMV超燃【青春永痕在 舍命亦弑神！！！】 ', '猛兽凯皇AMV超燃【青春永痕在 舍命亦弑神！！！】 .mp4', '1', '2', '3', '1', '猛兽凯皇.jpg', '2019-09-25 11:53:24');
INSERT INTO `video` VALUES ('3', '前方高能！让世界感受这场视觉盛宴吧！', '前方高能！让世界感受这场视觉盛宴吧！.mp4', '1', '3', '0', '1', '让世界感受这场视觉盛宴.jpg', '2019-09-23 11:53:28');
INSERT INTO `video` VALUES ('7', '【裸眼3D】金木VS壁虎', '【裸眼3D】金木VS壁虎，更近距离的视觉体验 - 1.金木3d(Av60513683,P1).mp4', '18', '1', '1', '1', '【裸眼3D】金木VS壁虎，更近距离的视觉体验.jpg', '2019-10-12 02:43:52');
INSERT INTO `video` VALUES ('8', '【秃爵】', '【某幻老番茄】最强脱发王 - 1.BALDLORD_x264(Av67439251,P1).mp4', '21', '1', '1', '7', 'tujue.jpg', '2019-10-12 03:25:45');
INSERT INTO `video` VALUES ('9', '【Python魔法】另一个困扰了b站多年的问题', '【Python魔法】另一个困扰了b站多年的问题.mp4', '18', '0', '0', '5', '【Python魔法】另一个困扰了b站多年的问题（基于BFS自动寻路贪吃蛇）.jpg', '2019-10-12 03:28:27');
INSERT INTO `video` VALUES ('10', '【预告】我想吃掉你的胰脏', '【剧场版】我想吃掉你的胰脏 预告PV【1080P】 - 1.1(Av13051931,P1).mp4', '2', '1', '1', '9', '【剧场版】我想吃掉你的胰脏 预告PV【1080P】.jpg', '2019-10-12 03:36:43');
INSERT INTO `video` VALUES ('11', '德邦总管是如何Gank的', '德邦总管 - 赵信 是如何Gank的 第二部 _(3」∠)_ lol英雄联盟 - 1.02(Av6249248,P1).mp4', '18', '0', '0', '8', '德邦总管 - 赵信 是如何Gank的 第二部 _(3」∠)_ lol英雄联盟.jpg', '2019-10-12 03:39:12');
INSERT INTO `video` VALUES ('12', '德邦总管是如何Gank的 -2', '德邦总管 - 赵信 是如何Gank的 第二部 _(3」∠)_ lol英雄联盟 - 2.01(Av6249248,P2).mp4', '18', '0', '0', '8', '德邦总管 - 赵信 是如何Gank的 后续篇 _(3」∠)_   lol英雄联盟.jpg', '2019-10-12 03:39:57');
INSERT INTO `video` VALUES ('14', '某幻RAP', '【某幻君rap】当B站知名UP主遇到中国新说唱... - 1.我哭了(Av27801961,P1).mp4', '21', '0', '0', '6', '【某幻君rap】.jpg', '2019-10-17 04:12:53');
INSERT INTO `video` VALUES ('15', '17张牌你能秒我？？', '17张牌你能秒我？？你能秒杀我？？17张牌你今天能把我卢本伟秒了，我当场就把这个电脑屏幕吃掉！！！ - 1.P1(Av12611527,P1).mp4', '3', '0', '0', '8', '17张牌你能秒我？.jpg', '2019-10-17 04:17:12');
INSERT INTO `video` VALUES ('16', '杀死忍者  C-BLOCK', '【超爽】中国有嘻哈diss日本 - 杀死忍者-C BLOCK - 饶舌_长沙说唱 - 1.SUP MUSIC presents_ C-BLOCK - 杀死忍者 - C(Av14566154,P1).mp4', '4', '0', '0', '7', '杀死忍者-C BLOCK.jpg', '2019-10-17 04:20:19');
INSERT INTO `video` VALUES ('17', '东京喰种混剪', '【东京喰种四季混剪unravel×Katharsis】Unravel the world - 1.Unravel the world(Av42266661,P1).mp4', '5', '0', '0', '2', 'Unravel the world.jpg', '2019-10-17 04:22:51');
INSERT INTO `video` VALUES ('18', '盾之勇者OP 《RISE》', '盾之勇者成名录OP《RISE》 - 1.盾之勇者成名录OP《RISE》(Av42038874,P1).mp4', '22', '0', '0', '2', '盾之勇者成名录OP《RISE》.jpg', '2019-10-17 04:24:28');
INSERT INTO `video` VALUES ('19', '蔡徐坤-芒种', '【蔡徐坤】芒种 - 1.【蔡徐坤】芒种(Av65790846,P1).mp4', '1', '1', '1', '4', '【蔡徐坤】芒种.jpg', '2019-10-17 04:26:01');
INSERT INTO `video` VALUES ('20', '【音阙诗听/赵方倩】芒种', '【音阙诗听赵方婧】芒种，一想到你我就…… - 1.芒种横版(Av64186665,P1).mp4', '1', '0', '0', '4', '【音阙诗听赵方婧】芒种.jpg', '2019-10-17 04:26:55');
INSERT INTO `video` VALUES ('21', '【多罗罗】火炎', '【多罗罗】主题曲《火炎》1080p 高音质收纳  OP ED 插曲 - 1.序列 01(Av51075457,P1).mp4', '1', '0', '0', '2', '【多罗罗】主题曲《火炎》1080p 高音质收纳  OP ED 插曲.jpg', '2019-10-17 04:28:01');
INSERT INTO `video` VALUES ('22', '卢本伟牛逼', '【电音单曲】卢本伟牛逼！！！ - 1.1(Av17449594,P1).mp4', '1', '0', '0', '4', '【电音单曲】卢本伟牛逼！！！.jpg', '2019-10-17 04:28:29');
INSERT INTO `video` VALUES ('24', '化身修罗只为守护你！此刻世界将为之颤抖', '化身修罗只为守护你！此刻世界将为之颤抖！ - 1.in the end(Av47014688,P1).mp4', '1', '0', '0', '2', '化身修罗只为守护你！此刻世界将为之颤抖！.jpg', '2019-10-17 04:31:51');
INSERT INTO `video` VALUES ('25', '信誓蛋蛋RAP', '【信誓蛋蛋】法国网红小哥的中文rap居然这么6？？？ - 1.信誓蛋蛋发(Av44992440,P1).mp4', '1', '0', '0', '4', '【信誓蛋蛋】RAP.jpg', '2019-10-17 04:33:42');
INSERT INTO `video` VALUES ('26', '错的不是我，是这个世界', '【全程高燃综漫燃向】见过黑暗的人 才明白什么是光明 - 1.见过黑暗的人 才明白什么是光明(Av45828968,P1).mp4', '1', '0', '0', '1', '【全程高燃综漫燃向】见过黑暗的人 才明白什么是光明.jpg', '2019-10-17 04:35:59');
INSERT INTO `video` VALUES ('27', '【鬼灭全程踩点燃】这一击赌上现在的我，献出我的一切！', '【鬼灭全程踩点燃】这一击赌上现在的我，献出我的一切！ - 1.鬼灭踩点(Av65423285,P1).mp4', '1', '0', '0', '2', '【鬼灭全程踩点燃】这一击赌上现在的我，献出我的一切！.jpg', '2019-10-17 04:37:41');
INSERT INTO `video` VALUES ('31', '测试', '98d16012655d70fa92639806e7f9465f.mp4', '18', '0', '0', '8', '中国风年货盛宴促销活动公众号推图@凡科快图.png', '2020-03-08 17:06:37');

-- ----------------------------
-- Table structure for video_type
-- ----------------------------
DROP TABLE IF EXISTS `video_type`;
CREATE TABLE `video_type` (
  `type_id` int(11) NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video_type
-- ----------------------------
INSERT INTO `video_type` VALUES ('1', '动画');
INSERT INTO `video_type` VALUES ('2', '番剧');
INSERT INTO `video_type` VALUES ('3', '游戏');
INSERT INTO `video_type` VALUES ('4', '生活');
INSERT INTO `video_type` VALUES ('5', '科技');
INSERT INTO `video_type` VALUES ('6', '鬼畜');
INSERT INTO `video_type` VALUES ('7', '音乐');
INSERT INTO `video_type` VALUES ('8', '搞笑');
INSERT INTO `video_type` VALUES ('9', '电影');
INSERT INTO `video_type` VALUES ('10', '动态');
