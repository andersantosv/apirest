/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : apirest

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-08-24 14:20:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(10) NOT NULL,
  `birthday` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'Carlos', 'Alvarado', '30', '1989-05-23', '1', '2019-08-24 12:36:08', '2019-08-24 12:36:08');
INSERT INTO `customers` VALUES ('2', 'Carlos1', 'Alvarado2', '27', '1992-07-23', '1', '2019-08-24 12:51:47', '2019-08-24 12:51:47');
INSERT INTO `customers` VALUES ('3', 'Carlos3', 'Alvarado3', '19', '2000-07-26', '1', '2019-08-24 13:05:38', '2019-08-24 13:05:38');
INSERT INTO `customers` VALUES ('4', 'Carlos4', 'Alvarado4', '65', '1954-05-23', '1', '2019-08-24 14:05:57', '2019-08-25 14:05:57');

-- ----------------------------
-- Table structure for expectancy_life
-- ----------------------------
DROP TABLE IF EXISTS `expectancy_life`;
CREATE TABLE `expectancy_life` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `expectancy` decimal(19,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expectancy_life
-- ----------------------------
INSERT INTO `expectancy_life` VALUES ('1', '0', '80.902');
INSERT INTO `expectancy_life` VALUES ('2', '1', '80.111');
INSERT INTO `expectancy_life` VALUES ('3', '2', '79.126');
INSERT INTO `expectancy_life` VALUES ('4', '3', '78.135');
INSERT INTO `expectancy_life` VALUES ('5', '4', '77.143');
INSERT INTO `expectancy_life` VALUES ('6', '5', '76.149');
INSERT INTO `expectancy_life` VALUES ('7', '6', '75.156');
INSERT INTO `expectancy_life` VALUES ('8', '7', '74.160');
INSERT INTO `expectancy_life` VALUES ('9', '8', '73.166');
INSERT INTO `expectancy_life` VALUES ('10', '9', '72.171');
INSERT INTO `expectancy_life` VALUES ('11', '10', '71.176');
INSERT INTO `expectancy_life` VALUES ('12', '11', '70.180');
INSERT INTO `expectancy_life` VALUES ('13', '12', '69.184');
INSERT INTO `expectancy_life` VALUES ('14', '13', '68.190');
INSERT INTO `expectancy_life` VALUES ('15', '14', '67.195');
INSERT INTO `expectancy_life` VALUES ('16', '15', '66.201');
INSERT INTO `expectancy_life` VALUES ('17', '16', '65.208');
INSERT INTO `expectancy_life` VALUES ('18', '17', '64.217');
INSERT INTO `expectancy_life` VALUES ('19', '18', '63.228');
INSERT INTO `expectancy_life` VALUES ('20', '19', '62.241');
INSERT INTO `expectancy_life` VALUES ('21', '20', '61.254');
INSERT INTO `expectancy_life` VALUES ('22', '21', '60.268');
INSERT INTO `expectancy_life` VALUES ('23', '22', '59.282');
INSERT INTO `expectancy_life` VALUES ('24', '23', '58.297');
INSERT INTO `expectancy_life` VALUES ('25', '24', '57.312');
INSERT INTO `expectancy_life` VALUES ('26', '25', '56.329');
INSERT INTO `expectancy_life` VALUES ('27', '26', '55.345');
INSERT INTO `expectancy_life` VALUES ('28', '27', '54.362');
INSERT INTO `expectancy_life` VALUES ('29', '28', '53.378');
INSERT INTO `expectancy_life` VALUES ('30', '29', '52.395');
INSERT INTO `expectancy_life` VALUES ('31', '30', '51.413');
INSERT INTO `expectancy_life` VALUES ('32', '31', '50.432');
INSERT INTO `expectancy_life` VALUES ('33', '32', '49.451');
INSERT INTO `expectancy_life` VALUES ('34', '33', '48.469');
INSERT INTO `expectancy_life` VALUES ('35', '34', '47.489');
INSERT INTO `expectancy_life` VALUES ('36', '35', '46.510');
INSERT INTO `expectancy_life` VALUES ('37', '36', '45.532');
INSERT INTO `expectancy_life` VALUES ('38', '37', '44.555');
INSERT INTO `expectancy_life` VALUES ('39', '38', '43.578');
INSERT INTO `expectancy_life` VALUES ('40', '39', '42.603');
INSERT INTO `expectancy_life` VALUES ('41', '40', '41.630');
INSERT INTO `expectancy_life` VALUES ('42', '41', '40.661');
INSERT INTO `expectancy_life` VALUES ('43', '42', '39.694');
INSERT INTO `expectancy_life` VALUES ('44', '43', '38.733');
INSERT INTO `expectancy_life` VALUES ('45', '44', '37.776');
INSERT INTO `expectancy_life` VALUES ('46', '45', '36.823');
INSERT INTO `expectancy_life` VALUES ('47', '46', '35.878');
INSERT INTO `expectancy_life` VALUES ('48', '47', '34.938');
INSERT INTO `expectancy_life` VALUES ('49', '48', '34.007');
INSERT INTO `expectancy_life` VALUES ('50', '49', '33.083');
INSERT INTO `expectancy_life` VALUES ('51', '50', '32.165');
INSERT INTO `expectancy_life` VALUES ('52', '51', '31.259');
INSERT INTO `expectancy_life` VALUES ('53', '52', '30.358');
INSERT INTO `expectancy_life` VALUES ('54', '53', '29.467');
INSERT INTO `expectancy_life` VALUES ('55', '54', '28.585');
INSERT INTO `expectancy_life` VALUES ('56', '55', '27.714');
INSERT INTO `expectancy_life` VALUES ('57', '56', '26.845');
INSERT INTO `expectancy_life` VALUES ('58', '57', '25.989');
INSERT INTO `expectancy_life` VALUES ('59', '58', '25.140');
INSERT INTO `expectancy_life` VALUES ('60', '59', '24.305');
INSERT INTO `expectancy_life` VALUES ('61', '60', '23.473');
INSERT INTO `expectancy_life` VALUES ('62', '61', '22.658');
INSERT INTO `expectancy_life` VALUES ('63', '62', '21.846');
INSERT INTO `expectancy_life` VALUES ('64', '63', '21.046');
INSERT INTO `expectancy_life` VALUES ('65', '64', '20.252');
INSERT INTO `expectancy_life` VALUES ('66', '65', '19.466');
INSERT INTO `expectancy_life` VALUES ('67', '66', '18.688');
INSERT INTO `expectancy_life` VALUES ('68', '67', '17.917');
INSERT INTO `expectancy_life` VALUES ('69', '68', '17.158');
INSERT INTO `expectancy_life` VALUES ('70', '69', '16.407');
INSERT INTO `expectancy_life` VALUES ('71', '70', '15.665');
INSERT INTO `expectancy_life` VALUES ('72', '71', '14.929');
INSERT INTO `expectancy_life` VALUES ('73', '72', '14.204');
INSERT INTO `expectancy_life` VALUES ('74', '73', '13.497');
INSERT INTO `expectancy_life` VALUES ('75', '74', '12.799');
INSERT INTO `expectancy_life` VALUES ('76', '75', '12.117');
INSERT INTO `expectancy_life` VALUES ('77', '76', '11.452');
INSERT INTO `expectancy_life` VALUES ('78', '77', '10.802');
INSERT INTO `expectancy_life` VALUES ('79', '78', '10.169');
INSERT INTO `expectancy_life` VALUES ('80', '79', '9.558');
INSERT INTO `expectancy_life` VALUES ('81', '80', '8.966');
INSERT INTO `expectancy_life` VALUES ('82', '81', '8.395');
INSERT INTO `expectancy_life` VALUES ('83', '82', '7.849');
INSERT INTO `expectancy_life` VALUES ('84', '83', '7.334');
INSERT INTO `expectancy_life` VALUES ('85', '84', '6.838');
INSERT INTO `expectancy_life` VALUES ('86', '85', '6.368');
INSERT INTO `expectancy_life` VALUES ('87', '86', '5.925');
INSERT INTO `expectancy_life` VALUES ('88', '87', '5.516');
INSERT INTO `expectancy_life` VALUES ('89', '88', '5.139');
INSERT INTO `expectancy_life` VALUES ('90', '89', '4.796');
INSERT INTO `expectancy_life` VALUES ('91', '90', '4.473');
INSERT INTO `expectancy_life` VALUES ('92', '91', '4.186');
INSERT INTO `expectancy_life` VALUES ('93', '92', '3.922');
INSERT INTO `expectancy_life` VALUES ('94', '93', '3.683');
INSERT INTO `expectancy_life` VALUES ('95', '94', '3.482');
INSERT INTO `expectancy_life` VALUES ('96', '95', '3.268');
INSERT INTO `expectancy_life` VALUES ('97', '96', '3.048');
INSERT INTO `expectancy_life` VALUES ('98', '97', '2.842');
INSERT INTO `expectancy_life` VALUES ('99', '98', '2.620');
INSERT INTO `expectancy_life` VALUES ('100', '99', '2.347');
INSERT INTO `expectancy_life` VALUES ('101', '100', '2.048');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Anderson', 'Santos', 'asantosv.21@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', null, '2019-08-24 19:26:48', '2019-08-24 19:26:48');
