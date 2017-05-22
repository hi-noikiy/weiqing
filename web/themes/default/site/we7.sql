-- MySQL dump 10.13  Distrib 5.6.30, for Linux (x86_64)
--
-- Host: localhost    Database: we7
-- ------------------------------------------------------
-- Server version	5.6.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ims_account`
--

DROP TABLE IF EXISTS `ims_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account`
--

LOCK TABLES `ims_account` WRITE;
/*!40000 ALTER TABLE `ims_account` DISABLE KEYS */;
INSERT INTO `ims_account` VALUES (1,1,'uRr8qvQV',1,0,0),(2,2,'Q8vwVMJp',1,1,0);
/*!40000 ALTER TABLE `ims_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_account_wechats`
--

DROP TABLE IF EXISTS `ims_account_wechats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_account_wechats`
--

LOCK TABLES `ims_account_wechats` WRITE;
/*!40000 ALTER TABLE `ims_account_wechats` DISABLE KEYS */;
INSERT INTO `ims_account_wechats` VALUES (1,1,'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP','','',1,'we7team','','','','','','','','',0,'','',1,'',''),(2,2,'C7Vc5OViBVzB2g5g5b4vD55MnbhIJXO9','','XR3sRBxkYsJrGm1rbZRtpTJryppBZRKrrXkS3M471hl',1,'梦迪是小仙女','loegye1125','gh_768138bf99a0','','','','','','',0,'wx0ea3242aba06fdd9','e6f2034057c89b14be63ca34c8d95d65',0,'','');
/*!40000 ALTER TABLE `ims_account_wechats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_clerk_menu`
--

DROP TABLE IF EXISTS `ims_activity_clerk_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_clerk_menu`
--

LOCK TABLES `ims_activity_clerk_menu` WRITE;
/*!40000 ALTER TABLE `ims_activity_clerk_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_clerk_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_clerks`
--

DROP TABLE IF EXISTS `ims_activity_clerks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_clerks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联users表uid',
  `storeid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `password` (`password`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分兑换店员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_clerks`
--

LOCK TABLES `ims_activity_clerks` WRITE;
/*!40000 ALTER TABLE `ims_activity_clerks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_clerks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_exchange`
--

DROP TABLE IF EXISTS `ims_activity_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '物品名称',
  `description` text NOT NULL COMMENT '描述信息',
  `thumb` varchar(500) NOT NULL COMMENT '缩略图',
  `type` tinyint(1) unsigned NOT NULL COMMENT '物品类型，1系统卡券，2微信呢卡券，3实物，4虚拟物品(未启用)，5营销模块操作次数',
  `extra` varchar(3000) NOT NULL DEFAULT '' COMMENT '兑换产品属性 卡券自增id',
  `credit` int(10) unsigned NOT NULL COMMENT '兑换积分数量',
  `credittype` varchar(10) NOT NULL COMMENT '兑换积分类型',
  `pretotal` int(11) NOT NULL COMMENT '每个人最大兑换次数',
  `num` int(11) NOT NULL COMMENT '已兑换礼品数量',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总量',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extra` (`extra`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='真实物品兑换表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_exchange`
--

LOCK TABLES `ims_activity_exchange` WRITE;
/*!40000 ALTER TABLE `ims_activity_exchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_exchange_trades`
--

DROP TABLE IF EXISTS `ims_activity_exchange_trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_exchange_trades` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '统一公号',
  `uid` int(10) unsigned NOT NULL COMMENT '用户(粉丝)id',
  `exid` int(10) unsigned NOT NULL COMMENT '兑换产品 exchangeid',
  `type` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交换记录创建时间',
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`,`uid`,`exid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='真实物品兑换记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_exchange_trades`
--

LOCK TABLES `ims_activity_exchange_trades` WRITE;
/*!40000 ALTER TABLE `ims_activity_exchange_trades` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_exchange_trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_exchange_trades_shipping`
--

DROP TABLE IF EXISTS `ims_activity_exchange_trades_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_exchange_trades_shipping` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `exid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态，0为正常，-1为关闭，1为已发货，2为已完成',
  `createtime` int(10) unsigned NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '收件人',
  PRIMARY KEY (`tid`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='真实物品兑换发货表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_exchange_trades_shipping`
--

LOCK TABLES `ims_activity_exchange_trades_shipping` WRITE;
/*!40000 ALTER TABLE `ims_activity_exchange_trades_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_exchange_trades_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_activity_stores`
--

DROP TABLE IF EXISTS `ims_activity_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_activity_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '1 审核通过 2 审核中 3审核未通过',
  `source` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1为系统门店，2为微信门店',
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_activity_stores`
--

LOCK TABLES `ims_activity_stores` WRITE;
/*!40000 ALTER TABLE `ims_activity_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_activity_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_category`
--

DROP TABLE IF EXISTS `ims_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_category`
--

LOCK TABLES `ims_article_category` WRITE;
/*!40000 ALTER TABLE `ims_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_news`
--

DROP TABLE IF EXISTS `ims_article_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_news`
--

LOCK TABLES `ims_article_news` WRITE;
/*!40000 ALTER TABLE `ims_article_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_notice`
--

DROP TABLE IF EXISTS `ims_article_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_notice`
--

LOCK TABLES `ims_article_notice` WRITE;
/*!40000 ALTER TABLE `ims_article_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_article_unread_notice`
--

DROP TABLE IF EXISTS `ims_article_unread_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_article_unread_notice`
--

LOCK TABLES `ims_article_unread_notice` WRITE;
/*!40000 ALTER TABLE `ims_article_unread_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_unread_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_basic_reply`
--

DROP TABLE IF EXISTS `ims_basic_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_basic_reply`
--

LOCK TABLES `ims_basic_reply` WRITE;
/*!40000 ALTER TABLE `ims_basic_reply` DISABLE KEYS */;
INSERT INTO `ims_basic_reply` VALUES (1,10,'撒大声地撒大所大所多撒大所大所大所大所多撒大所大所多[U+1F639]');
/*!40000 ALTER TABLE `ims_basic_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_business`
--

DROP TABLE IF EXISTS `ims_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_business`
--

LOCK TABLES `ims_business` WRITE;
/*!40000 ALTER TABLE `ims_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_attachment`
--

DROP TABLE IF EXISTS `ims_core_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_attachment`
--

LOCK TABLES `ims_core_attachment` WRITE;
/*!40000 ALTER TABLE `ims_core_attachment` DISABLE KEYS */;
INSERT INTO `ims_core_attachment` VALUES (1,1,1,'1.png','images/1/2017/05/F8F8IgHqFY47O85oPqFhTbifpuzYff.png',1,1494555146),(2,1,1,'矩形-2.png','images/1/2017/05/Zu500PbYSybm0l04yU7501G0S4sb75.png',1,1494555239),(3,1,1,'1.png','images/1/2017/05/L7WjLLKc8f7qWFNk7EnjUigeEBiLZG.png',1,1494564809),(4,1,1,'Koala.jpg','images/1/2017/05/OmMh446lol0o3agG6z82673GGbL6go.jpg',1,1494825743),(5,1,1,'Koala.jpg','images/1/2017/05/B0s0jUEy1iue10HyIBJh0QlH1Bh1bM.jpg',1,1495010361),(6,2,1,'QQ图片20170515161029.png','images/2/2017/05/i1582PXqKFPyQh123q6SHqQhFsy02f.png',1,1495160809);
/*!40000 ALTER TABLE `ims_core_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cache`
--

DROP TABLE IF EXISTS `ims_core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cache`
--

LOCK TABLES `ims_core_cache` WRITE;
/*!40000 ALTER TABLE `ims_core_cache` DISABLE KEYS */;
INSERT INTO `ims_core_cache` VALUES ('setting','a:9:{s:9:\"copyright\";a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:4:\"site\";a:5:{s:3:\"key\";s:5:\"56471\";s:5:\"token\";s:32:\"b3d4868be1dedbb2f9ba2234681782c5\";s:3:\"url\";s:19:\"http://gds.yljfx.cn\";s:7:\"version\";s:3:\"0.8\";s:15:\"profile_perfect\";b:1;}s:7:\"cloudip\";a:2:{s:2:\"ip\";s:13:\"121.29.54.100\";s:6:\"expire\";i:1495114550;}s:8:\"sms.info\";a:3:{s:3:\"key\";s:5:\"56471\";s:8:\"sms_sign\";a:0:{}s:9:\"sms_count\";i:0;}s:8:\"platform\";a:5:{s:5:\"token\";s:32:\"K88fI98ifcFr9U9P6cr8C92ji91i6FVv\";s:14:\"encodingaeskey\";s:43:\"dMLkG7Kifas97a8sKgMaP0FkF37PK73I94K8WMOisPW\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}s:18:\"module_receive_ban\";a:1:{s:16:\"feng_fightgroups\";s:16:\"feng_fightgroups\";}}'),('uniaccount:1','a:28:{s:4:\"acid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:5:\"token\";s:32:\"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP\";s:12:\"access_token\";s:0:\"\";s:14:\"encodingaeskey\";s:0:\"\";s:5:\"level\";s:1:\"1\";s:4:\"name\";s:7:\"we7team\";s:7:\"account\";s:0:\"\";s:8:\"original\";s:0:\"\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:7:\"styleid\";s:1:\"1\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:12:\"default_acid\";s:1:\"1\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:9:\"starttime\";s:10:\"1494573260\";s:7:\"endtime\";s:1:\"0\";s:6:\"groups\";a:1:{i:1;a:5:{s:7:\"groupid\";s:1:\"1\";s:7:\"uniacid\";s:1:\"1\";s:5:\"title\";s:15:\"默认会员组\";s:6:\"credit\";s:1:\"0\";s:9:\"isdefault\";s:1:\"1\";}}s:10:\"grouplevel\";s:1:\"0\";}'),('uniaccount:2','a:28:{s:4:\"acid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"2\";s:5:\"token\";s:32:\"C7Vc5OViBVzB2g5g5b4vD55MnbhIJXO9\";s:12:\"access_token\";s:0:\"\";s:14:\"encodingaeskey\";s:43:\"XR3sRBxkYsJrGm1rbZRtpTJryppBZRKrrXkS3M471hl\";s:5:\"level\";s:1:\"1\";s:4:\"name\";s:18:\"梦迪是小仙女\";s:7:\"account\";s:10:\"loegye1125\";s:8:\"original\";s:15:\"gh_768138bf99a0\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:18:\"wx0ea3242aba06fdd9\";s:6:\"secret\";s:32:\"e6f2034057c89b14be63ca34c8d95d65\";s:7:\"styleid\";s:1:\"0\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:12:\"default_acid\";s:1:\"2\";s:4:\"type\";s:1:\"1\";s:3:\"uid\";s:1:\"2\";s:9:\"starttime\";s:10:\"1494573260\";s:7:\"endtime\";s:1:\"0\";s:6:\"groups\";a:1:{i:2;a:5:{s:7:\"groupid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"2\";s:5:\"title\";s:15:\"默认会员组\";s:6:\"credit\";s:1:\"0\";s:9:\"isdefault\";s:1:\"1\";}}s:10:\"grouplevel\";s:1:\"0\";}'),('unimodules:2:','a:18:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:6:\"config\";a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:10:\"we7_coupon\";a:19:{s:3:\"mid\";s:2:\"15\";s:4:\"name\";s:10:\"we7_coupon\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"系统卡券\";s:7:\"version\";s:3:\"3.5\";s:7:\"ability\";s:12:\"微擎卡券\";s:6:\"author\";s:12:\"微擎团队\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"2\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:12:\"mon_weishare\";a:19:{s:3:\"mid\";s:2:\"14\";s:4:\"name\";s:12:\"mon_weishare\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:9:\"微助力\";s:7:\"version\";s:5:\"2.9.1\";s:7:\"ability\";s:21:\"分享活动赢好礼\";s:6:\"author\";s:23:\"codeMonkey qq:631872807\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"mon_xkwkj\";a:19:{s:3:\"mid\";s:2:\"16\";s:4:\"name\";s:9:\"mon_xkwkj\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:15:\"炫酷微砍价\";s:7:\"version\";s:7:\"1.2.2.1\";s:7:\"ability\";s:39:\"炫酷微砍价，砍砍！！！！！\";s:6:\"author\";s:24:\"codeMonkey qq:2463619823\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"jy_reads\";a:19:{s:3:\"mid\";s:2:\"17\";s:4:\"name\";s:8:\"jy_reads\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:16:\"九烨-集阅读\";s:7:\"version\";s:3:\"2.7\";s:7:\"ability\";s:9:\"集阅读\";s:6:\"author\";s:5:\"Toddy\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:16:\"feng_fightgroups\";a:19:{s:3:\"mid\";s:2:\"18\";s:4:\"name\";s:16:\"feng_fightgroups\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:6:\"拼团\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"ability\";s:6:\"拼团\";s:6:\"author\";s:12:\"微连科技\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:1:{i:0;s:4:\"text\";}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('system_frame','a:5:{s:8:\"platform\";a:3:{i:0;a:2:{s:5:\"title\";s:12:\"基本功能\";s:5:\"items\";a:9:{i:0;a:5:{s:2:\"id\";s:1:\"3\";s:5:\"title\";s:12:\"文字回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=basic\";s:15:\"permission_name\";s:20:\"platform_reply_basic\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=basic\";}}i:1;a:5:{s:2:\"id\";s:1:\"4\";s:5:\"title\";s:12:\"图文回复\";s:3:\"url\";s:37:\"./index.php?c=platform&a=reply&m=news\";s:15:\"permission_name\";s:19:\"platform_reply_news\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:45:\"./index.php?c=platform&a=reply&do=post&m=news\";}}i:2;a:5:{s:2:\"id\";s:1:\"5\";s:5:\"title\";s:12:\"音乐回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=music\";s:15:\"permission_name\";s:20:\"platform_reply_music\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=music\";}}i:3;a:5:{s:2:\"id\";s:1:\"6\";s:5:\"title\";s:12:\"图片回复\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=images\";s:15:\"permission_name\";s:21:\"platform_reply_images\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:47:\"./index.php?c=platform&a=reply&do=post&m=images\";}}i:4;a:5:{s:2:\"id\";s:1:\"7\";s:5:\"title\";s:12:\"语音回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=voice\";s:15:\"permission_name\";s:20:\"platform_reply_voice\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=voice\";}}i:5;a:5:{s:2:\"id\";s:1:\"8\";s:5:\"title\";s:12:\"视频回复\";s:3:\"url\";s:38:\"./index.php?c=platform&a=reply&m=video\";s:15:\"permission_name\";s:20:\"platform_reply_video\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:46:\"./index.php?c=platform&a=reply&do=post&m=video\";}}i:6;a:5:{s:2:\"id\";s:1:\"9\";s:5:\"title\";s:18:\"微信卡券回复\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=wxcard\";s:15:\"permission_name\";s:21:\"platform_reply_wxcard\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:47:\"./index.php?c=platform&a=reply&do=post&m=wxcard\";}}i:7;a:5:{s:2:\"id\";s:2:\"10\";s:5:\"title\";s:21:\"自定义接口回复\";s:3:\"url\";s:40:\"./index.php?c=platform&a=reply&m=userapi\";s:15:\"permission_name\";s:22:\"platform_reply_userapi\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:48:\"./index.php?c=platform&a=reply&do=post&m=userapi\";}}i:8;a:4:{s:2:\"id\";s:2:\"11\";s:5:\"title\";s:12:\"系统回复\";s:3:\"url\";s:44:\"./index.php?c=platform&a=special&do=display&\";s:15:\"permission_name\";s:21:\"platform_reply_system\";}}}i:1;a:2:{s:5:\"title\";s:12:\"高级功能\";s:5:\"items\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"13\";s:5:\"title\";s:18:\"常用服务接入\";s:3:\"url\";s:43:\"./index.php?c=platform&a=service&do=switch&\";s:15:\"permission_name\";s:16:\"platform_service\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:30:\"./index.php?c=platform&a=menu&\";s:15:\"permission_name\";s:13:\"platform_menu\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:5:\"title\";s:18:\"特殊消息回复\";s:3:\"url\";s:44:\"./index.php?c=platform&a=special&do=message&\";s:15:\"permission_name\";s:16:\"platform_special\";}i:3;a:4:{s:2:\"id\";s:2:\"16\";s:5:\"title\";s:15:\"二维码管理\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";}i:4;a:4:{s:2:\"id\";s:2:\"17\";s:5:\"title\";s:15:\"多客服接入\";s:3:\"url\";s:39:\"./index.php?c=platform&a=reply&m=custom\";s:15:\"permission_name\";s:21:\"platform_reply_custom\";}i:5;a:4:{s:2:\"id\";s:2:\"18\";s:5:\"title\";s:18:\"长链接二维码\";s:3:\"url\";s:32:\"./index.php?c=platform&a=url2qr&\";s:15:\"permission_name\";s:15:\"platform_url2qr\";}}}i:2;a:2:{s:5:\"title\";s:12:\"数据统计\";s:5:\"items\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:5:\"title\";s:12:\"聊天记录\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=history&\";s:15:\"permission_name\";s:21:\"platform_stat_history\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:5:\"title\";s:24:\"回复规则使用情况\";s:3:\"url\";s:38:\"./index.php?c=platform&a=stat&do=rule&\";s:15:\"permission_name\";s:18:\"platform_stat_rule\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:5:\"title\";s:21:\"关键字命中情况\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=keyword&\";s:15:\"permission_name\";s:21:\"platform_stat_keyword\";}i:3;a:4:{s:2:\"id\";s:2:\"23\";s:5:\"title\";s:6:\"参数\";s:3:\"url\";s:41:\"./index.php?c=platform&a=stat&do=setting&\";s:15:\"permission_name\";s:21:\"platform_stat_setting\";}}}}s:4:\"site\";a:3:{i:0;a:2:{s:5:\"title\";s:12:\"微站管理\";s:5:\"items\";a:3:{i:0;a:5:{s:2:\"id\";s:2:\"26\";s:5:\"title\";s:12:\"站点管理\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:18:\"site_multi_display\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:35:\"./index.php?c=site&a=multi&do=post&\";}}i:1;a:4:{s:2:\"id\";s:2:\"29\";s:5:\"title\";s:12:\"模板管理\";s:3:\"url\";s:39:\"./index.php?c=site&a=style&do=template&\";s:15:\"permission_name\";s:19:\"site_style_template\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:5:\"title\";s:18:\"模块模板扩展\";s:3:\"url\";s:37:\"./index.php?c=site&a=style&do=module&\";s:15:\"permission_name\";s:17:\"site_style_module\";}}}i:1;a:2:{s:5:\"title\";s:18:\"特殊页面管理\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:5:\"title\";s:12:\"会员中心\";s:3:\"url\";s:34:\"./index.php?c=site&a=editor&do=uc&\";s:15:\"permission_name\";s:14:\"site_editor_uc\";}i:1;a:5:{s:2:\"id\";s:2:\"33\";s:5:\"title\";s:12:\"专题页面\";s:3:\"url\";s:36:\"./index.php?c=site&a=editor&do=page&\";s:15:\"permission_name\";s:16:\"site_editor_page\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:38:\"./index.php?c=site&a=editor&do=design&\";}}}}i:2;a:2:{s:5:\"title\";s:12:\"功能组件\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:2:\"35\";s:5:\"title\";s:12:\"分类设置\";s:3:\"url\";s:30:\"./index.php?c=site&a=category&\";s:15:\"permission_name\";s:13:\"site_category\";}i:1;a:4:{s:2:\"id\";s:2:\"36\";s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=site&a=article&\";s:15:\"permission_name\";s:12:\"site_article\";}}}}s:2:\"mc\";a:4:{i:0;a:2:{s:5:\"title\";s:12:\"粉丝管理\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:2:\"39\";s:5:\"title\";s:12:\"粉丝分组\";s:3:\"url\";s:28:\"./index.php?c=mc&a=fangroup&\";s:15:\"permission_name\";s:11:\"mc_fangroup\";}i:1;a:4:{s:2:\"id\";s:2:\"40\";s:5:\"title\";s:6:\"粉丝\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";}}}i:1;a:2:{s:5:\"title\";s:12:\"会员中心\";s:5:\"items\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"42\";s:5:\"title\";s:21:\"会员中心关键字\";s:3:\"url\";s:37:\"./index.php?c=platform&a=cover&do=mc&\";s:15:\"permission_name\";s:17:\"platform_cover_mc\";}i:1;a:5:{s:2:\"id\";s:2:\"43\";s:5:\"title\";s:6:\"会员\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:6:\"append\";a:2:{s:5:\"title\";s:26:\"<i class=\"fa fa-plus\"></i>\";s:3:\"url\";s:33:\"./index.php?c=mc&a=member&do=add&\";}}i:2;a:4:{s:2:\"id\";s:2:\"44\";s:5:\"title\";s:9:\"会员组\";s:3:\"url\";s:25:\"./index.php?c=mc&a=group&\";s:15:\"permission_name\";s:8:\"mc_group\";}}}i:2;a:2:{s:5:\"title\";s:19:\"微信素材&群发\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:2:\"46\";s:5:\"title\";s:13:\"素材&群发\";s:3:\"url\";s:33:\"./index.php?c=material&a=display&\";s:15:\"permission_name\";s:16:\"material_display\";}i:1;a:4:{s:2:\"id\";s:2:\"47\";s:5:\"title\";s:12:\"定时群发\";s:3:\"url\";s:30:\"./index.php?c=material&a=mass&\";s:15:\"permission_name\";s:13:\"material_mass\";}}}i:3;a:2:{s:5:\"title\";s:12:\"统计中心\";s:5:\"items\";a:2:{i:0;a:4:{s:2:\"id\";s:2:\"49\";s:5:\"title\";s:18:\"会员积分统计\";s:3:\"url\";s:29:\"./index.php?c=stat&a=credit1&\";s:15:\"permission_name\";s:12:\"stat_credit1\";}i:1;a:4:{s:2:\"id\";s:2:\"50\";s:5:\"title\";s:18:\"会员余额统计\";s:3:\"url\";s:29:\"./index.php?c=stat&a=credit2&\";s:15:\"permission_name\";s:12:\"stat_credit2\";}}}}s:7:\"setting\";a:3:{i:0;a:2:{s:5:\"title\";s:15:\"公众号选项\";s:5:\"items\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"53\";s:5:\"title\";s:12:\"支付参数\";s:3:\"url\";s:32:\"./index.php?c=profile&a=payment&\";s:15:\"permission_name\";s:15:\"profile_payment\";}i:1;a:4:{s:2:\"id\";s:2:\"54\";s:5:\"title\";s:19:\"借用 oAuth 权限\";s:3:\"url\";s:37:\"./index.php?c=mc&a=passport&do=oauth&\";s:15:\"permission_name\";s:17:\"mc_passport_oauth\";}i:2;a:4:{s:2:\"id\";s:2:\"55\";s:5:\"title\";s:22:\"借用 JS 分享权限\";s:3:\"url\";s:31:\"./index.php?c=profile&a=jsauth&\";s:15:\"permission_name\";s:14:\"profile_jsauth\";}i:3;a:4:{s:2:\"id\";s:2:\"56\";s:5:\"title\";s:18:\"会员字段管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=fields&\";s:15:\"permission_name\";s:9:\"mc_fields\";}i:4;a:4:{s:2:\"id\";s:2:\"57\";s:5:\"title\";s:18:\"微信通知设置\";s:3:\"url\";s:29:\"./index.php?c=mc&a=tplnotice&\";s:15:\"permission_name\";s:12:\"mc_tplnotice\";}}}i:1;a:2:{s:5:\"title\";s:21:\"会员及粉丝选项\";s:5:\"items\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"59\";s:5:\"title\";s:12:\"积分设置\";s:3:\"url\";s:26:\"./index.php?c=mc&a=credit&\";s:15:\"permission_name\";s:9:\"mc_credit\";}i:1;a:4:{s:2:\"id\";s:2:\"60\";s:5:\"title\";s:12:\"注册设置\";s:3:\"url\";s:40:\"./index.php?c=mc&a=passport&do=passport&\";s:15:\"permission_name\";s:20:\"mc_passport_passport\";}i:2;a:4:{s:2:\"id\";s:2:\"61\";s:5:\"title\";s:18:\"粉丝同步设置\";s:3:\"url\";s:36:\"./index.php?c=mc&a=passport&do=sync&\";s:15:\"permission_name\";s:16:\"mc_passport_sync\";}i:3;a:4:{s:2:\"id\";s:2:\"62\";s:5:\"title\";s:14:\"UC站点整合\";s:3:\"url\";s:22:\"./index.php?c=mc&a=uc&\";s:15:\"permission_name\";s:5:\"mc_uc\";}i:4;a:4:{s:2:\"id\";s:2:\"67\";s:5:\"title\";s:18:\"邮件通知参数\";s:3:\"url\";s:31:\"./index.php?c=profile&a=notify&\";s:15:\"permission_name\";s:14:\"profile_notify\";}}}i:2;a:1:{s:5:\"title\";s:18:\"其他功能选项\";}}s:3:\"ext\";a:1:{i:0;a:2:{s:5:\"title\";s:6:\"管理\";s:5:\"items\";a:1:{i:0;a:4:{s:2:\"id\";s:2:\"66\";s:5:\"title\";s:18:\"扩展功能管理\";s:3:\"url\";s:31:\"./index.php?c=profile&a=module&\";s:15:\"permission_name\";s:14:\"profile_module\";}}}}}'),('unisetting:2','a:23:{s:7:\"uniacid\";s:1:\"2\";s:8:\"passport\";s:0:\"\";s:5:\"oauth\";s:0:\"\";s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";s:0:\"\";s:6:\"notify\";s:0:\"\";s:11:\"creditnames\";a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:9:\"shortcuts\";s:0:\"\";s:7:\"payment\";s:0:\"\";s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"2\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";}'),('stat:todaylock:2','a:1:{s:6:\"expire\";i:1495164593;}'),('unimodules::','a:18:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:10:\"we7_coupon\";a:19:{s:3:\"mid\";s:2:\"15\";s:4:\"name\";s:10:\"we7_coupon\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"系统卡券\";s:7:\"version\";s:3:\"3.5\";s:7:\"ability\";s:12:\"微擎卡券\";s:6:\"author\";s:12:\"微擎团队\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"2\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:12:\"mon_weishare\";a:19:{s:3:\"mid\";s:2:\"14\";s:4:\"name\";s:12:\"mon_weishare\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:9:\"微助力\";s:7:\"version\";s:5:\"2.9.1\";s:7:\"ability\";s:21:\"分享活动赢好礼\";s:6:\"author\";s:23:\"codeMonkey qq:631872807\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"mon_xkwkj\";a:19:{s:3:\"mid\";s:2:\"16\";s:4:\"name\";s:9:\"mon_xkwkj\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:15:\"炫酷微砍价\";s:7:\"version\";s:7:\"1.2.2.1\";s:7:\"ability\";s:39:\"炫酷微砍价，砍砍！！！！！\";s:6:\"author\";s:24:\"codeMonkey qq:2463619823\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"jy_reads\";a:19:{s:3:\"mid\";s:2:\"17\";s:4:\"name\";s:8:\"jy_reads\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:16:\"九烨-集阅读\";s:7:\"version\";s:3:\"2.7\";s:7:\"ability\";s:9:\"集阅读\";s:6:\"author\";s:5:\"Toddy\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:16:\"feng_fightgroups\";a:19:{s:3:\"mid\";s:2:\"18\";s:4:\"name\";s:16:\"feng_fightgroups\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:6:\"拼团\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"ability\";s:6:\"拼团\";s:6:\"author\";s:12:\"微连科技\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:1:{i:0;s:4:\"text\";}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('defaultgroupid:2','s:1:\"2\";'),('userbasefields','a:44:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";}'),('usersfields','a:45:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";}'),('module_receive_enable','a:0:{}'),('unicount:2','s:1:\"1\";'),('upgrade','a:2:{s:7:\"upgrade\";b:1;s:10:\"lastupdate\";i:1495162495;}'),('uniaccount:6','a:6:{s:4:\"type\";b:0;s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:0:{}s:10:\"grouplevel\";b:0;}'),('checkupgrade:system','a:4:{s:7:\"version\";s:3:\"0.8\";s:7:\"release\";s:12:\"201704080000\";s:7:\"upgrade\";i:1;s:10:\"lastupdate\";i:1495162495;}'),('unisetting:6','b:0;'),('unimodules:6:1','a:18:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:10:\"we7_coupon\";a:19:{s:3:\"mid\";s:2:\"15\";s:4:\"name\";s:10:\"we7_coupon\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"系统卡券\";s:7:\"version\";s:3:\"3.5\";s:7:\"ability\";s:12:\"微擎卡券\";s:6:\"author\";s:12:\"微擎团队\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"2\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:12:\"mon_weishare\";a:19:{s:3:\"mid\";s:2:\"14\";s:4:\"name\";s:12:\"mon_weishare\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:9:\"微助力\";s:7:\"version\";s:5:\"2.9.1\";s:7:\"ability\";s:21:\"分享活动赢好礼\";s:6:\"author\";s:23:\"codeMonkey qq:631872807\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"mon_xkwkj\";a:19:{s:3:\"mid\";s:2:\"16\";s:4:\"name\";s:9:\"mon_xkwkj\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:15:\"炫酷微砍价\";s:7:\"version\";s:7:\"1.2.2.1\";s:7:\"ability\";s:39:\"炫酷微砍价，砍砍！！！！！\";s:6:\"author\";s:24:\"codeMonkey qq:2463619823\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"jy_reads\";a:19:{s:3:\"mid\";s:2:\"17\";s:4:\"name\";s:8:\"jy_reads\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:16:\"九烨-集阅读\";s:7:\"version\";s:3:\"2.7\";s:7:\"ability\";s:9:\"集阅读\";s:6:\"author\";s:5:\"Toddy\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:16:\"feng_fightgroups\";a:19:{s:3:\"mid\";s:2:\"18\";s:4:\"name\";s:16:\"feng_fightgroups\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:6:\"拼团\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"ability\";s:6:\"拼团\";s:6:\"author\";s:12:\"微连科技\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:1:{i:0;s:4:\"text\";}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('accesstoken:2','a:2:{s:5:\"token\";s:138:\"dkVQp2Q08QydLyxBoG9o84sDusobrE4bcMNceIhnHHqpAn3Qwn7SQaxESR_uhWI_rEyB_KagJlQ-_5HZOi3KV_6c8ODgYifaik9rIyrWJZfaOis7ZNtpMrYw_5AcoNdgXZIeAIAFHQ\";s:6:\"expire\";i:1495165906;}'),('unimodules:2:1','a:18:{s:5:\"basic\";a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"news\";a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"music\";a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:7:\"userapi\";a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:6:\"config\";a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:1;}s:8:\"recharge\";a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"custom\";a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"images\";a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"video\";a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"voice\";a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:5:\"chats\";a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:6:\"wxcard\";a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"paycenter\";a:19:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:9:\"paycenter\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:9:\"收银台\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:9:\"收银台\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:10:\"we7_coupon\";a:19:{s:3:\"mid\";s:2:\"15\";s:4:\"name\";s:10:\"we7_coupon\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:12:\"系统卡券\";s:7:\"version\";s:3:\"3.5\";s:7:\"ability\";s:12:\"微擎卡券\";s:6:\"author\";s:12:\"微擎团队\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"2\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:0:{}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:12:\"mon_weishare\";a:19:{s:3:\"mid\";s:2:\"14\";s:4:\"name\";s:12:\"mon_weishare\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:9:\"微助力\";s:7:\"version\";s:5:\"2.9.1\";s:7:\"ability\";s:21:\"分享活动赢好礼\";s:6:\"author\";s:23:\"codeMonkey qq:631872807\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:9:\"mon_xkwkj\";a:19:{s:3:\"mid\";s:2:\"16\";s:4:\"name\";s:9:\"mon_xkwkj\";s:4:\"type\";s:8:\"activity\";s:5:\"title\";s:15:\"炫酷微砍价\";s:7:\"version\";s:7:\"1.2.2.1\";s:7:\"ability\";s:39:\"炫酷微砍价，砍砍！！！！！\";s:6:\"author\";s:24:\"codeMonkey qq:2463619823\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:8:\"jy_reads\";a:19:{s:3:\"mid\";s:2:\"17\";s:4:\"name\";s:8:\"jy_reads\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:16:\"九烨-集阅读\";s:7:\"version\";s:3:\"2.7\";s:7:\"ability\";s:9:\"集阅读\";s:6:\"author\";s:5:\"Toddy\";s:3:\"url\";s:0:\"\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:16:\"feng_fightgroups\";a:19:{s:3:\"mid\";s:2:\"18\";s:4:\"name\";s:16:\"feng_fightgroups\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:6:\"拼团\";s:7:\"version\";s:5:\"5.4.1\";s:7:\"ability\";s:6:\"拼团\";s:6:\"author\";s:12:\"微连科技\";s:3:\"url\";s:18:\"http://bbs.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:1:{i:0;s:4:\"text\";}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:6:\"a:0:{}\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('jsticket:2','a:2:{s:6:\"ticket\";s:86:\"kgt8ON7yVITDhtdwci0qecceYz-rFqieavcJq0ZC8nb7w_XXAjdoYNIWspczzNqQrtA7tBChGjGU0ZjbkzBMeA\";s:6:\"expire\";i:1495167853;}');
/*!40000 ALTER TABLE `ims_core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cron`
--

DROP TABLE IF EXISTS `ims_core_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cron`
--

LOCK TABLES `ims_core_cron` WRITE;
/*!40000 ALTER TABLE `ims_core_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_cron_record`
--

DROP TABLE IF EXISTS `ims_core_cron_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_cron_record`
--

LOCK TABLES `ims_core_cron_record` WRITE;
/*!40000 ALTER TABLE `ims_core_cron_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_menu`
--

DROP TABLE IF EXISTS `ims_core_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_menu`
--

LOCK TABLES `ims_core_menu` WRITE;
/*!40000 ALTER TABLE `ims_core_menu` DISABLE KEYS */;
INSERT INTO `ims_core_menu` VALUES (1,0,'基础设置','platform','','fa fa-cog','',0,'url',1,1,''),(2,1,'基本功能','platform','','','',0,'url',1,1,'platform_basic_function'),(3,2,'文字回复','platform','./index.php?c=platform&a=reply&m=basic','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=basic',0,'url',1,1,'platform_reply_basic'),(4,2,'图文回复','platform','./index.php?c=platform&a=reply&m=news','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=news',0,'url',1,1,'platform_reply_news'),(5,2,'音乐回复','platform','./index.php?c=platform&a=reply&m=music','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=music',0,'url',1,1,'platform_reply_music'),(6,2,'图片回复','platform','./index.php?c=platform&a=reply&m=images','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=images',0,'url',1,1,'platform_reply_images'),(7,2,'语音回复','platform','./index.php?c=platform&a=reply&m=voice','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=voice',0,'url',1,1,'platform_reply_voice'),(8,2,'视频回复','platform','./index.php?c=platform&a=reply&m=video','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=video',0,'url',1,1,'platform_reply_video'),(9,2,'微信卡券回复','platform','./index.php?c=platform&a=reply&m=wxcard','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=wxcard',0,'url',1,1,'platform_reply_wxcard'),(10,2,'自定义接口回复','platform','./index.php?c=platform&a=reply&m=userapi','fa fa-plus','./index.php?c=platform&a=reply&do=post&m=userapi',0,'url',1,1,'platform_reply_userapi'),(11,2,'系统回复','platform','./index.php?c=platform&a=special&do=display&','','',0,'url',1,1,'platform_reply_system'),(12,1,'高级功能','platform','','','',0,'url',1,1,'platform_high_function'),(13,12,'常用服务接入','platform','./index.php?c=platform&a=service&do=switch&','','',0,'url',1,1,'platform_service'),(14,12,'自定义菜单','platform','./index.php?c=platform&a=menu&','','',0,'url',1,1,'platform_menu'),(15,12,'特殊消息回复','platform','./index.php?c=platform&a=special&do=message&','','',0,'url',1,1,'platform_special'),(16,12,'二维码管理','platform','./index.php?c=platform&a=qr&','','',0,'url',1,1,'platform_qr'),(17,12,'多客服接入','platform','./index.php?c=platform&a=reply&m=custom','','',0,'url',1,1,'platform_reply_custom'),(18,12,'长链接二维码','platform','./index.php?c=platform&a=url2qr&','','',0,'url',1,1,'platform_url2qr'),(19,1,'数据统计','platform','','','',0,'url',1,1,'platform_stat'),(20,19,'聊天记录','platform','./index.php?c=platform&a=stat&do=history&','','',0,'url',1,1,'platform_stat_history'),(21,19,'回复规则使用情况','platform','./index.php?c=platform&a=stat&do=rule&','','',0,'url',1,1,'platform_stat_rule'),(22,19,'关键字命中情况','platform','./index.php?c=platform&a=stat&do=keyword&','','',0,'url',1,1,'platform_stat_keyword'),(23,19,'参数','platform','./index.php?c=platform&a=stat&do=setting&','','',0,'url',1,1,'platform_stat_setting'),(24,0,'微站功能','site','','fa fa-life-bouy','',0,'url',1,1,''),(25,24,'微站管理','site','','','',0,'url',1,1,'site_manage'),(26,25,'站点管理','site','./index.php?c=site&a=multi&do=display&','fa fa-plus','./index.php?c=site&a=multi&do=post&',0,'url',1,1,'site_multi_display'),(27,25,'站点添加/编辑','site','','','',0,'permission',0,1,'site_multi_post'),(28,25,'站点删除','site','','','',0,'permission',0,1,'site_multi_del'),(29,25,'模板管理','site','./index.php?c=site&a=style&do=template&','','',0,'url',1,1,'site_style_template'),(30,25,'模块模板扩展','site','./index.php?c=site&a=style&do=module&','','',0,'url',1,1,'site_style_module'),(31,24,'特殊页面管理','site','','','',0,'url',1,1,'site_special_page'),(32,31,'会员中心','site','./index.php?c=site&a=editor&do=uc&','','',0,'url',1,1,'site_editor_uc'),(33,31,'专题页面','site','./index.php?c=site&a=editor&do=page&','fa fa-plus','./index.php?c=site&a=editor&do=design&',0,'url',1,1,'site_editor_page'),(34,24,'功能组件','site','','','',0,'url',1,1,'site_widget'),(35,34,'分类设置','site','./index.php?c=site&a=category&','','',0,'url',1,1,'site_category'),(36,34,'文章管理','site','./index.php?c=site&a=article&','','',0,'url',1,1,'site_article'),(37,0,'粉丝营销','mc','','fa fa-gift','',0,'url',1,1,''),(38,37,'粉丝管理','mc','','','',0,'url',1,1,'mc_fans_manage'),(39,38,'粉丝分组','mc','./index.php?c=mc&a=fangroup&','','',0,'url',1,1,'mc_fangroup'),(40,38,'粉丝','mc','./index.php?c=mc&a=fans&','','',0,'url',1,1,'mc_fans'),(41,37,'会员中心','mc','','','',0,'url',1,1,'mc_members_manage'),(42,41,'会员中心关键字','mc','./index.php?c=platform&a=cover&do=mc&','','',0,'url',1,1,'platform_cover_mc'),(43,41,'会员','mc','./index.php?c=mc&a=member&','fa fa-plus','./index.php?c=mc&a=member&do=add&',0,'url',1,1,'mc_member'),(44,41,'会员组','mc','./index.php?c=mc&a=group&','','',0,'url',1,1,'mc_group'),(45,37,'微信素材&群发','mc','','','',0,'url',1,1,'material_manage'),(46,45,'素材&群发','mc','./index.php?c=material&a=display&','','',0,'url',1,1,'material_display'),(47,45,'定时群发','mc','./index.php?c=material&a=mass&','','',0,'url',1,1,'material_mass'),(48,37,'统计中心','mc','','','',0,'url',1,1,'stat_center'),(49,48,'会员积分统计','mc','./index.php?c=stat&a=credit1&','','',0,'url',1,1,'stat_credit1'),(50,48,'会员余额统计','mc','./index.php?c=stat&a=credit2&','','',0,'url',1,1,'stat_credit2'),(51,0,'功能选项','setting','','fa fa-umbrella','',0,'url',1,1,''),(52,51,'公众号选项','setting','','','',0,'url',1,1,'account_setting'),(53,52,'支付参数','setting','./index.php?c=profile&a=payment&','','',0,'url',1,1,'profile_payment'),(54,52,'借用 oAuth 权限','setting','./index.php?c=mc&a=passport&do=oauth&','','',0,'url',1,1,'mc_passport_oauth'),(55,52,'借用 JS 分享权限','setting','./index.php?c=profile&a=jsauth&','','',0,'url',1,1,'profile_jsauth'),(56,52,'会员字段管理','setting','./index.php?c=mc&a=fields&','','',0,'url',1,1,'mc_fields'),(57,52,'微信通知设置','setting','./index.php?c=mc&a=tplnotice&','','',0,'url',1,1,'mc_tplnotice'),(58,51,'会员及粉丝选项','setting','','','',0,'url',1,1,'mc_setting'),(59,58,'积分设置','setting','./index.php?c=mc&a=credit&','','',0,'url',1,1,'mc_credit'),(60,58,'注册设置','setting','./index.php?c=mc&a=passport&do=passport&','','',0,'url',1,1,'mc_passport_passport'),(61,58,'粉丝同步设置','setting','./index.php?c=mc&a=passport&do=sync&','','',0,'url',1,1,'mc_passport_sync'),(62,58,'UC站点整合','setting','./index.php?c=mc&a=uc&','','',0,'url',1,1,'mc_uc'),(63,51,'其他功能选项','setting','','','',0,'url',1,1,''),(64,0,'扩展功能','ext','','fa fa-cubes','',0,'url',1,1,''),(65,64,'管理','ext','','','',0,'url',1,1,''),(66,65,'扩展功能管理','ext','./index.php?c=profile&a=module&','','',0,'url',1,1,'profile_module'),(67,58,'邮件通知参数','setting','./index.php?c=profile&a=notify&','','',0,'url',1,1,'profile_notify');
/*!40000 ALTER TABLE `ims_core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_paylog`
--

DROP TABLE IF EXISTS `ims_core_paylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_paylog`
--

LOCK TABLES `ims_core_paylog` WRITE;
/*!40000 ALTER TABLE `ims_core_paylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_paylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_performance`
--

DROP TABLE IF EXISTS `ims_core_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_performance`
--

LOCK TABLES `ims_core_performance` WRITE;
/*!40000 ALTER TABLE `ims_core_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_queue`
--

DROP TABLE IF EXISTS `ims_core_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_queue`
--

LOCK TABLES `ims_core_queue` WRITE;
/*!40000 ALTER TABLE `ims_core_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_resource`
--

DROP TABLE IF EXISTS `ims_core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_resource`
--

LOCK TABLES `ims_core_resource` WRITE;
/*!40000 ALTER TABLE `ims_core_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_sendsms_log`
--

DROP TABLE IF EXISTS `ims_core_sendsms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_sendsms_log`
--

LOCK TABLES `ims_core_sendsms_log` WRITE;
/*!40000 ALTER TABLE `ims_core_sendsms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_sendsms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_sessions`
--

DROP TABLE IF EXISTS `ims_core_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_sessions`
--

LOCK TABLES `ims_core_sessions` WRITE;
/*!40000 ALTER TABLE `ims_core_sessions` DISABLE KEYS */;
INSERT INTO `ims_core_sessions` VALUES ('19ef8a86d61fc987a48199c88761bea3',2,'101.226.51.226','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"Vqc9\";i:1495098024;}',1495101624),('7cbfef443d2bf1a49b30cbb212e43752',2,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','openid|s:28:\"oF4XPvumkwSrdNPYR_ReAEs9fOdQ\";',1495165155),('9b3a11854474ca49c63af8c2e6644b7e',2,'101.226.51.230','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"ZS38\";i:1495098360;}',1495101960),('8a51c045c0f8ca8f16b1f607375098d5',2,'101.226.33.223','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"jTml\";i:1495097995;}',1495101595),('ec9b2fdc321a6bc65ee0baa1b08e1d39',2,'oF4XPvkZcxrQYj0UTrGrCrdUP3wE','openid|s:28:\"oF4XPvkZcxrQYj0UTrGrCrdUP3wE\";',1495101228),('uhe09rki4hucid7c76968622g4',2,'222.129.189.17','acid|s:1:\"2\";uniacid|i:2;token|a:6:{s:4:\"iirv\";i:1495101689;s:4:\"Mw9f\";i:1495101704;s:4:\"SfCG\";i:1495101718;s:4:\"TpR3\";i:1495101722;s:4:\"NzkS\";i:1495101725;s:4:\"ED95\";i:1495101932;}',1495105532),('080f5d03cc9a01b7c70bcee47bd8e8a3',1,'222.129.189.17','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"Lpnm\";i:1495075203;s:4:\"ZaEC\";i:1495075203;s:4:\"JFKh\";i:1495075240;s:4:\"kdtt\";i:1495075240;}',1495078840),('9020669f5b41de13bf55d5b034649d42',1,'61.151.228.22','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"vMu6\";i:1495011225;}',1495014825),('7ee0ff0b14ed100024665bf9fc792cbf',1,'180.153.214.197','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"NqIU\";i:1495010595;}',1495014195),('a3c94bd33adf9ee675f8613515c92c2f',1,'112.65.193.14','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"o6JK\";i:1495010470;}',1495014070),('ff763a20c122f4702d3e530afd714201',1,'101.226.125.104','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"A5t4\";i:1495010455;}',1495014055),('09fe556fb096c2b49d2a99602424ab3f',1,'180.153.205.253','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"w0y8\";i:1495010426;}',1495014026),('aba9b703a1cdfeb534ffc505fb6ce1c3',1,'101.226.33.217','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"izEQ\";i:1494996629;}',1495000229),('b8358c61cf538041b959b67044b7611a',1,'180.153.201.28','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"xnZ0\";i:1495010413;}',1495014013),('0f8fcf6c065823b806cc616570131a4e',1,'101.226.33.227','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"G5a5\";i:1494996317;}',1494999917),('d9ce4c917841fb972511737cf5da851c',1,'101.226.125.105','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"UQEH\";i:1494996294;}',1494999894),('ab6ad0f5b3a03cb11f7fc2a9b3f7b5bd',1,'140.207.185.109','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"U55Z\";i:1494996290;}',1494999890),('c815d56fed0783c7532e5e3f03232475',1,'113.58.235.228','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"GX6O\";i:1494995232;}',1494998832),('c0b65f8ea2c38ed1289235b1ce5cb7c3',1,'140.207.185.109','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"J1Ge\";i:1494995217;}',1494998817),('920e3eed20603e6f332b9bcdbc42fbc6',1,'114.253.42.102','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"Vcq6\";i:1495012795;s:4:\"QRTO\";i:1495012796;s:4:\"BzTQ\";i:1495012813;s:4:\"g2Zo\";i:1495012975;s:4:\"N77q\";i:1495012985;s:4:\"RrkD\";i:1495012986;}',1495016586),('080a911cd90c1dbc10e24e23c4b12e86',1,'114.253.42.102','acid|s:1:\"1\";uniacid|i:1;token|a:6:{s:4:\"P4WI\";i:1495010431;s:4:\"aQ59\";i:1495010432;s:4:\"iwh2\";i:1495010445;s:4:\"n1oI\";i:1495010460;s:4:\"FGmZ\";i:1495010476;s:4:\"QVGL\";i:1495010476;}',1495014076),('bac2c6cbb80b676bbb4d844eeb194a9b',1,'180.153.201.15','acid|s:1:\"1\";uniacid|i:1;token|a:2:{s:4:\"nUwr\";i:1494928046;s:4:\"Hf22\";i:1494928051;}',1494931651),('bd0201a3979a11dc62297d211ca34da4',1,'101.226.89.116','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"iY5V\";i:1494927962;}',1494931562),('7v7sio869gneil6p95blb7kj33',1,'221.220.149.17','acid|s:1:\"1\";uniacid|i:1;token|a:4:{s:4:\"H54H\";i:1494927882;s:4:\"Rg7N\";i:1494927905;s:4:\"Zwow\";i:1494927908;s:4:\"o33o\";i:1494927908;}',1494931508),('1807565db9e49598d48f0f52d0d80cbc',1,'221.220.149.17','openid|s:8:\"fromUser\";acid|s:1:\"1\";uniacid|i:1;uid|s:1:\"1\";token|a:6:{s:4:\"lOZ3\";i:1494922498;s:4:\"PLy9\";i:1494922515;s:4:\"Rqs9\";i:1494922542;s:4:\"fD1u\";i:1494922548;s:4:\"O7Ea\";i:1494922583;s:4:\"w7Zs\";i:1494922626;}',1494926226),('67598f7a706dbf7b5a2f8ea045a4c367',1,'101.226.66.193','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"ijHb\";i:1494810839;}',1494814439),('d5d30da6537dc4fc29c413771c835813',6,'221.220.149.17','acid|N;uniacid|i:6;token|a:1:{s:4:\"BN7q\";i:1494912225;}',1494915825),('d871ac09a84f77d06d5f439947c08869',1,'140.207.185.111','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"ZF9u\";i:1494810839;}',1494814439),('c95db5121e7564c78a97842fa15b9acb',1,'117.185.27.113','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"BTvz\";i:1494810762;}',1494814362),('dd5697b3a89f7d4554bec502790c74f3',1,'101.226.66.180','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"VqQ8\";i:1494810773;}',1494814373),('02419a60347c946cd034883ca9765f09',1,'221.220.149.17','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"JFZ2\";i:1494818623;}',1494822223),('8aa90fa150dabdb0af9e8601e90120e6',1,'101.226.66.193','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"eVT1\";i:1494810746;}',1494814346),('80f3cfcb74ba4ff6f8b1dcd214993ce9',1,'101.226.68.197','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"g71l\";i:1494810746;}',1494814346),('f61f1e45d7eedbb296cd246f2c22668e',6,'221.220.149.17','acid|N;uniacid|i:6;token|a:1:{s:4:\"j370\";i:1494834968;}',1494838568),('0c33989cebb2471a05d796f4b9bfc9c5',1,'101.226.65.107','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"M7vc\";i:1494810754;}',1494814354),('4561c2f609a4ec1ae0a883c599ad6e0b',1,'101.226.125.104','acid|s:1:\"1\";uniacid|i:1;token|a:1:{s:4:\"o71K\";i:1494810761;}',1494814361),('9a89ec853913f00c66d235250e6f7014',1,'180.153.214.182','acid|s:1:\"1\";uniacid|i:1;token|a:2:{s:4:\"L29v\";i:1494810761;s:4:\"PmeG\";i:1494810761;}',1494814361),('aab8951ae249123055f1986ba78a66fa',2,'101.226.125.103','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"IO3h\";i:1495098578;}',1495102178),('733272366bd083e7a5b796b8fa237b0f',2,'180.153.201.28','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"kTWN\";i:1495098585;}',1495102185),('4ef1186e8b432e46b7b01bdeedc4240d',2,'101.226.33.216','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"MT1Q\";i:1495099623;}',1495103223),('4ec71d2b8169a4c4f32c7031df3a2cb0',2,'140.207.185.109','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"HM8V\";i:1495099742;}',1495103342),('48de4ca487bba8c94a52a64f5cd18f66',2,'101.226.89.116','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"RF28\";i:1495101570;}',1495105170),('8faebb4690d6e8aa99033998581e4b54',2,'101.226.68.200','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"Mmck\";i:1495101619;}',1495105219),('8fc0ccac72b24b00c5cd7c82f9dbe1de',2,'101.226.61.206','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"UzDr\";i:1495101622;}',1495105222),('9d8dd256151f1413efdce5d4360057ce',2,'101.226.99.195','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"PbX0\";i:1495101942;}',1495105542),('7eb4af974590e7f9aa0152e1dfdc85f8',6,'223.84.48.47','acid|N;uniacid|i:6;token|a:1:{s:4:\"NaR0\";i:1495150453;}',1495154053),('a9b52b0c47b6cdbc8bd1de6ec5e03fad',2,'222.129.189.17','acid|s:1:\"2\";uniacid|i:2;token|a:6:{s:4:\"Dr00\";i:1495161201;s:4:\"FrIZ\";i:1495161251;s:4:\"uA9l\";i:1495161253;s:4:\"n2PU\";i:1495161256;s:4:\"UROl\";i:1495161258;s:4:\"A4NX\";i:1495161394;}',1495164994),('ea492540002c5b470308af01673fbdc2',2,'180.153.214.176','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"Z9Q0\";i:1495157433;}',1495161033),('74b26eca56b8a72f73e2fcb51dd28183',2,'140.207.185.111','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"BD7r\";i:1495161268;}',1495164868),('a30188bb9b4cf011d566d3a3ef6efc43',2,'117.185.27.113','acid|s:1:\"2\";uniacid|i:2;token|a:1:{s:4:\"P64E\";i:1495157454;}',1495161054),('34445d159b05b4013f024d76291f758b',2,'222.129.189.17','acid|s:1:\"2\";uniacid|i:2;token|a:2:{s:4:\"mX8h\";i:1495159930;s:4:\"gNI0\";i:1495159933;}',1495163533),('2e3d2f17b80c495b2e331bc6471a39ff',2,'222.129.189.17','acid|s:1:\"2\";uniacid|i:2;token|a:6:{s:4:\"mFjr\";i:1495161651;s:4:\"Gh9G\";i:1495161651;s:4:\"Gjje\";i:1495161653;s:4:\"S353\";i:1495161653;s:4:\"eNkF\";i:1495161655;s:4:\"CswI\";i:1495161655;}openid|s:28:\"oF4XPvumkwSrdNPYR_ReAEs9fOdQ\";uid|s:1:\"3\";',1495165255);
/*!40000 ALTER TABLE `ims_core_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_core_settings`
--

DROP TABLE IF EXISTS `ims_core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_core_settings`
--

LOCK TABLES `ims_core_settings` WRITE;
/*!40000 ALTER TABLE `ims_core_settings` DISABLE KEYS */;
INSERT INTO `ims_core_settings` VALUES ('copyright','a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}'),('authmode','i:1;'),('close','a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),('register','a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),('site','a:5:{s:3:\"key\";s:5:\"56471\";s:5:\"token\";s:32:\"b3d4868be1dedbb2f9ba2234681782c5\";s:3:\"url\";s:19:\"http://gds.yljfx.cn\";s:7:\"version\";s:3:\"0.8\";s:15:\"profile_perfect\";b:1;}'),('cloudip','a:2:{s:2:\"ip\";s:13:\"121.29.54.100\";s:6:\"expire\";i:1495114550;}'),('sms.info','a:3:{s:3:\"key\";s:5:\"56471\";s:8:\"sms_sign\";a:0:{}s:9:\"sms_count\";i:0;}'),('platform','a:5:{s:5:\"token\";s:32:\"K88fI98ifcFr9U9P6cr8C92ji91i6FVv\";s:14:\"encodingaeskey\";s:43:\"dMLkG7Kifas97a8sKgMaP0FkF37PK73I94K8WMOisPW\";s:9:\"appsecret\";s:0:\"\";s:5:\"appid\";s:0:\"\";s:9:\"authstate\";i:1;}'),('module_receive_ban','a:1:{s:16:\"feng_fightgroups\";s:16:\"feng_fightgroups\";}');
/*!40000 ALTER TABLE `ims_core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon`
--

DROP TABLE IF EXISTS `ims_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `acid` int(10) unsigned NOT NULL DEFAULT '0',
  `card_id` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL COMMENT '卡券类型',
  `logo_url` varchar(150) NOT NULL,
  `code_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'code类型（二维码/条形码/code码）',
  `brand_name` varchar(15) NOT NULL COMMENT '商家名称',
  `title` varchar(15) NOT NULL,
  `sub_title` varchar(20) NOT NULL,
  `color` varchar(15) NOT NULL,
  `notice` varchar(15) NOT NULL COMMENT '使用说明',
  `description` varchar(1000) NOT NULL,
  `date_info` varchar(200) NOT NULL COMMENT '使用期限',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `use_custom_code` tinyint(3) NOT NULL DEFAULT '0',
  `bind_openid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `can_share` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否可分享',
  `can_give_friend` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否可转赠给朋友',
  `get_limit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '每人领取限制',
  `service_phone` varchar(20) NOT NULL,
  `extra` varchar(1000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1:审核中,2:未通过,3:已通过,4:卡券被商户删除,5:未知',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架',
  `is_selfconsume` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启自助核销',
  `promotion_url_name` varchar(10) NOT NULL,
  `promotion_url` varchar(100) NOT NULL,
  `promotion_url_sub_title` varchar(10) NOT NULL,
  `source` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '来源，1是系统，2是微信',
  `dosage` int(10) unsigned DEFAULT '0' COMMENT '已领取数量',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon`
--

LOCK TABLES `ims_coupon` WRITE;
/*!40000 ALTER TABLE `ims_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_activity`
--

DROP TABLE IF EXISTS `ims_coupon_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `msg_id` int(10) NOT NULL DEFAULT '0',
  `status` int(10) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(3) NOT NULL DEFAULT '0' COMMENT '1 发送系统卡券 2发送微信卡券',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `coupons` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '‘’',
  `members` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_activity`
--

LOCK TABLES `ims_coupon_activity` WRITE;
/*!40000 ALTER TABLE `ims_coupon_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_groups`
--

DROP TABLE IF EXISTS `ims_coupon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL DEFAULT '',
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_groups`
--

LOCK TABLES `ims_coupon_groups` WRITE;
/*!40000 ALTER TABLE `ims_coupon_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_location`
--

DROP TABLE IF EXISTS `ims_coupon_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_location`
--

LOCK TABLES `ims_coupon_location` WRITE;
/*!40000 ALTER TABLE `ims_coupon_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_modules`
--

DROP TABLE IF EXISTS `ims_coupon_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`couponid`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_modules`
--

LOCK TABLES `ims_coupon_modules` WRITE;
/*!40000 ALTER TABLE `ims_coupon_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_record`
--

DROP TABLE IF EXISTS `ims_coupon_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `friend_openid` varchar(50) NOT NULL,
  `givebyfriend` tinyint(3) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) NOT NULL,
  `clerk_name` varchar(15) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `couponid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `grantmodule` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `card_id` (`card_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_record`
--

LOCK TABLES `ims_coupon_record` WRITE;
/*!40000 ALTER TABLE `ims_coupon_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_coupon_store`
--

DROP TABLE IF EXISTS `ims_coupon_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_coupon_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `couponid` varchar(255) NOT NULL DEFAULT '',
  `storeid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `couponid` (`couponid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_coupon_store`
--

LOCK TABLES `ims_coupon_store` WRITE;
/*!40000 ALTER TABLE `ims_coupon_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_cover_reply`
--

DROP TABLE IF EXISTS `ims_cover_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_cover_reply`
--

LOCK TABLES `ims_cover_reply` WRITE;
/*!40000 ALTER TABLE `ims_cover_reply` DISABLE KEYS */;
INSERT INTO `ims_cover_reply` VALUES (1,1,0,7,'mc','','进入个人中心','','','./index.php?c=mc&a=home&i=1'),(2,1,1,8,'site','','进入首页','','','./index.php?c=home&i=1&t=1'),(3,2,2,11,'site','','测试首页','测试','images/2/2017/05/i1582PXqKFPyQh123q6SHqQhFsy02f.png','./index.php?c=home&i=2&t=2');
/*!40000 ALTER TABLE `ims_cover_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_custom_reply`
--

DROP TABLE IF EXISTS `ims_custom_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_custom_reply`
--

LOCK TABLES `ims_custom_reply` WRITE;
/*!40000 ALTER TABLE `ims_custom_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_custom_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_images_reply`
--

DROP TABLE IF EXISTS `ims_images_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_images_reply`
--

LOCK TABLES `ims_images_reply` WRITE;
/*!40000 ALTER TABLE `ims_images_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_images_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_bonus`
--

DROP TABLE IF EXISTS `ims_jy_reads_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT '0',
  `bonusname` varchar(50) DEFAULT NULL COMMENT '名称',
  `bonusthumb` varchar(255) DEFAULT NULL COMMENT '图片',
  `bonuscount` int(10) DEFAULT '0' COMMENT '总数量',
  `bonusneed` int(10) DEFAULT '0' COMMENT '需要数量',
  `bonusrest` int(10) DEFAULT '0' COMMENT '剩余数量',
  `bonusvalue` float(10,2) DEFAULT '0.00' COMMENT '价值',
  `islimit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要活动0不需要，1需要',
  `limit` text COMMENT '活动信息',
  `bonusmsg` text COMMENT '红包页信息',
  `location` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要限制地区0不需要，1需要',
  `area` text COMMENT '地理位置信息',
  `wishing` varchar(120) DEFAULT NULL COMMENT '红包祝福语最大长度128',
  `remark` varchar(255) DEFAULT NULL COMMENT '红包备注信息最大长度256',
  `actname` varchar(255) DEFAULT '集阅读' COMMENT '活动名称',
  `sendname` varchar(255) DEFAULT '集阅读' COMMENT '活动名称',
  `isrange` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否金额区间',
  `bonusvaluerange` varchar(255) DEFAULT '' COMMENT '金额区间',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0为已删除1为存在',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为已不显示1为显示',
  `info` text COMMENT '获取的信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_bonus`
--

LOCK TABLES `ims_jy_reads_bonus` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_bonus_log`
--

DROP TABLE IF EXISTS `ims_jy_reads_bonus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_bonus_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0为已失败1为成功',
  `log` text COMMENT '日志',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_bonus_log`
--

LOCK TABLES `ims_jy_reads_bonus_log` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_bonus_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_bonus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_coupon`
--

DROP TABLE IF EXISTS `ims_jy_reads_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT '0',
  `couponname` varchar(50) DEFAULT NULL COMMENT '名称',
  `couponthumb` varchar(255) DEFAULT NULL COMMENT '图片',
  `couponcount` int(10) DEFAULT '0' COMMENT '总数量',
  `couponneed` int(10) DEFAULT '0' COMMENT '需要数量',
  `couponrest` int(10) DEFAULT '0' COMMENT '剩余数量',
  `couponcode` varchar(255) DEFAULT NULL COMMENT '微信上生成的',
  `couponmsg` varchar(255) DEFAULT NULL COMMENT '卡券页面信息',
  `islimit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要活动0不需要，1需要',
  `limit` text COMMENT '活动信息',
  `location` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要限制地区0不需要，1需要',
  `area` text COMMENT '地理位置信息',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0为已删除1为存在',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为已不显示1为显示',
  `info` text COMMENT '获取的信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_coupon`
--

LOCK TABLES `ims_jy_reads_coupon` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_coupon_log`
--

DROP TABLE IF EXISTS `ims_jy_reads_coupon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_coupon_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0为已失败1为成功',
  `log` text COMMENT '日志',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_coupon_log`
--

LOCK TABLES `ims_jy_reads_coupon_log` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_coupon_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_coupon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_log`
--

DROP TABLE IF EXISTS `ims_jy_reads_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `replyid` int(10) unsigned NOT NULL COMMENT '回复ID',
  `popenid` varchar(30) NOT NULL COMMENT '父ID',
  `sopenid` varchar(30) NOT NULL COMMENT '子ID',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_log`
--

LOCK TABLES `ims_jy_reads_log` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_prize`
--

DROP TABLE IF EXISTS `ims_jy_reads_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) DEFAULT '0',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `replyid` int(10) unsigned NOT NULL COMMENT '回复ID',
  `prizename` varchar(50) DEFAULT NULL COMMENT '奖品名称',
  `prizeurl` varchar(50) DEFAULT NULL COMMENT '奖品链接',
  `prizethumb` varchar(255) DEFAULT NULL COMMENT '奖品图片',
  `prizecount` int(10) DEFAULT '0' COMMENT '奖品总数量',
  `prizeneed` int(10) DEFAULT '0' COMMENT '兑奖需要数量',
  `prizerest` int(10) DEFAULT '0' COMMENT '奖品剩余数量',
  `displayorder` int(10) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0为已删除1为存在',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为已不显示1为显示',
  `info` text COMMENT '获取的信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='奖项从属于活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_prize`
--

LOCK TABLES `ims_jy_reads_prize` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_prize` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_prize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_reply`
--

DROP TABLE IF EXISTS `ims_jy_reads_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态0结束，1正常，2暂停',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `name` varchar(255) NOT NULL DEFAULT '集阅读' COMMENT '活动名称',
  `share_title` varchar(255) NOT NULL COMMENT '分享标题',
  `share_thumb` varchar(255) NOT NULL COMMENT '分享图片',
  `share_description` varchar(255) NOT NULL COMMENT '分享描述',
  `link` varchar(255) NOT NULL COMMENT '当前关注链接',
  `loading` varchar(255) NOT NULL COMMENT '加载时图片',
  `arrow` varchar(255) NOT NULL COMMENT '加载时图片下方箭头',
  `top` varchar(255) NOT NULL COMMENT '内容顶部图片',
  `bottom` varchar(255) NOT NULL COMMENT '内容顶部图片',
  `telephone` varchar(50) NOT NULL COMMENT '点击bottom拨打电话',
  `bgcolor` varchar(10) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景颜色',
  `content` text COMMENT '显示内容',
  `rule` text COMMENT '显示兑奖规则或活动地址',
  `tips` varchar(255) NOT NULL COMMENT '备注',
  `ad` varchar(255) NOT NULL COMMENT '核销页广告',
  `ad_url` varchar(255) NOT NULL COMMENT '核销页URL',
  `prizes` longtext NOT NULL COMMENT '当前回复的文章奖项',
  `follow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要强制关注0不需要，1需要',
  `mutual` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁止相互采集0-3',
  `bonus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁止红包0禁止，1开放',
  `location` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要限制地区0不需要，1需要',
  `area` text COMMENT '地理位置信息',
  `area_title` text COMMENT '地理位置信息名称',
  `copyright` varchar(20) NOT NULL,
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `share` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0为已不显示1为显示',
  `alias` varchar(255) NOT NULL DEFAULT '阅读' COMMENT '阅读别名',
  `start` varchar(255) NOT NULL DEFAULT '' COMMENT '底部图片',
  `zdy_url` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义链接',
  `locationtype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 ip定位，1 gps定位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回复信息表，包含所有回复资料以及活动资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_reply`
--

LOCK TABLES `ims_jy_reads_reply` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_user`
--

DROP TABLE IF EXISTS `ims_jy_reads_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `replyid` int(10) unsigned NOT NULL COMMENT '回复ID',
  `uid` int(10) unsigned NOT NULL COMMENT '微擎系统memberID',
  `openid` varchar(30) NOT NULL COMMENT 'openid',
  `userinfo` text COMMENT '用户信息',
  `status` tinyint(1) unsigned NOT NULL COMMENT '用户状态',
  `sn` varchar(20) NOT NULL COMMENT 'SN奖品唯一码、如果为bonus-sn则为获取红包',
  `prizeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖项ID，未兑奖时为0，prize的ID或者Bonus的ID',
  `prize` text COMMENT '序列化信息',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='点开文章的用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_user`
--

LOCK TABLES `ims_jy_reads_user` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_user_property`
--

DROP TABLE IF EXISTS `ims_jy_reads_user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_user_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `propertykey` varchar(255) NOT NULL COMMENT '检索键名',
  `propertyvalue` varchar(255) NOT NULL COMMENT '检索值名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_user_property`
--

LOCK TABLES `ims_jy_reads_user_property` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_user_property` DISABLE KEYS */;
INSERT INTO `ims_jy_reads_user_property` VALUES (1,'name','姓名'),(2,'phone','手机'),(3,'address','地址'),(4,'qq','QQ号');
/*!40000 ALTER TABLE `ims_jy_reads_user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_jy_reads_verifier`
--

DROP TABLE IF EXISTS `ims_jy_reads_verifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_jy_reads_verifier` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL COMMENT '公众号ID',
  `rid` int(10) NOT NULL COMMENT '规则ID',
  `replyid` int(10) NOT NULL COMMENT '回复ID',
  `uid` int(10) NOT NULL COMMENT '微擎用户表memberID',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `prizeid` int(10) NOT NULL COMMENT '奖项ID',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1正常，0禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动核销人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_jy_reads_verifier`
--

LOCK TABLES `ims_jy_reads_verifier` WRITE;
/*!40000 ALTER TABLE `ims_jy_reads_verifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_jy_reads_verifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card`
--

DROP TABLE IF EXISTS `ims_mc_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '会员卡名称',
  `color` varchar(255) NOT NULL DEFAULT '' COMMENT '会员卡字颜色',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景设置',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT 'logo图片',
  `format_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否用手机号作为会员卡号',
  `format` varchar(50) NOT NULL DEFAULT '' COMMENT '会员卡卡号规则',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '会员卡说明',
  `fields` varchar(1000) NOT NULL DEFAULT '' COMMENT '会员卡资料',
  `snpos` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用1:启用0:关闭',
  `business` text NOT NULL,
  `discount_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '折扣类型.1:满减,2:折扣',
  `discount` varchar(3000) NOT NULL DEFAULT '' COMMENT '各个会员组的优惠详情',
  `grant` varchar(3000) NOT NULL COMMENT '领卡赠送:积分,余额,优惠券',
  `grant_rate` varchar(20) NOT NULL DEFAULT '0' COMMENT '消费返积分比率',
  `offset_rate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分抵现比例',
  `offset_max` int(10) NOT NULL DEFAULT '0' COMMENT '每单最多可抵现金数量',
  `nums_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '计次是否开启，0为关闭，1为开启',
  `nums_text` varchar(15) NOT NULL COMMENT '计次名称',
  `nums` varchar(1000) NOT NULL DEFAULT '' COMMENT '计次规则',
  `times_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '计时是否开启，0为关闭，1为开启',
  `times_text` varchar(15) NOT NULL COMMENT '计时名称',
  `times` varchar(1000) NOT NULL DEFAULT '' COMMENT '计时规则',
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sign_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '签到功能是否开启，0为关闭，1为开启',
  `brand_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商户名字,',
  `notice` varchar(48) NOT NULL DEFAULT '' COMMENT '卡券使用提醒',
  `quantity` int(10) NOT NULL DEFAULT '0' COMMENT '会员卡库存',
  `max_increase_bonus` int(10) NOT NULL DEFAULT '0' COMMENT '用户单次可获取的积分上限',
  `least_money_to_use_bonus` int(10) NOT NULL DEFAULT '0' COMMENT '抵扣条件',
  `source` int(1) NOT NULL DEFAULT '1' COMMENT '1.系统会员卡，2微信会员卡',
  `card_id` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card`
--

LOCK TABLES `ims_mc_card` WRITE;
/*!40000 ALTER TABLE `ims_mc_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_credit_set`
--

DROP TABLE IF EXISTS `ims_mc_card_credit_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_credit_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_credit_set`
--

LOCK TABLES `ims_mc_card_credit_set` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_credit_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_credit_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_members`
--

DROP TABLE IF EXISTS `ims_mc_card_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL DEFAULT '0',
  `cardsn` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `nums` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_members`
--

LOCK TABLES `ims_mc_card_members` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_notices`
--

DROP TABLE IF EXISTS `ims_mc_card_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1:公共消息，2:个人消息',
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通知会员组。默认为所有会员',
  `content` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_notices`
--

LOCK TABLES `ims_mc_card_notices` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_notices_unread`
--

DROP TABLE IF EXISTS `ims_mc_card_notices_unread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_notices_unread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `notice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1:公共通知，2：个人通知',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_notices_unread`
--

LOCK TABLES `ims_mc_card_notices_unread` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_notices_unread` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_notices_unread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_record`
--

DROP TABLE IF EXISTS `ims_mc_card_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1：充值，2：消费',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `tag` varchar(10) NOT NULL COMMENT '次数|时长|充值金额',
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL COMMENT '备注，只有管理员可以看',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_record`
--

LOCK TABLES `ims_mc_card_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_card_sign_record`
--

DROP TABLE IF EXISTS `ims_mc_card_sign_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_card_sign_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `is_grant` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_card_sign_record`
--

LOCK TABLES `ims_mc_card_sign_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_card_sign_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_card_sign_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_cash_record`
--

DROP TABLE IF EXISTS `ims_mc_cash_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `trade_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_cash_record`
--

LOCK TABLES `ims_mc_cash_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_cash_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_cash_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_chats_record`
--

DROP TABLE IF EXISTS `ims_mc_chats_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_chats_record`
--

LOCK TABLES `ims_mc_chats_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_chats_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_chats_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_credits_recharge`
--

DROP TABLE IF EXISTS `ims_mc_credits_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_credits_recharge`
--

LOCK TABLES `ims_mc_credits_recharge` WRITE;
/*!40000 ALTER TABLE `ims_mc_credits_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_credits_record`
--

DROP TABLE IF EXISTS `ims_mc_credits_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_credits_record`
--

LOCK TABLES `ims_mc_credits_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_credits_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_fans_groups`
--

DROP TABLE IF EXISTS `ims_mc_fans_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_fans_groups`
--

LOCK TABLES `ims_mc_fans_groups` WRITE;
/*!40000 ALTER TABLE `ims_mc_fans_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_fans_tag_mapping`
--

DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_fans_tag_mapping`
--

LOCK TABLES `ims_mc_fans_tag_mapping` WRITE;
/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_groups`
--

DROP TABLE IF EXISTS `ims_mc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_groups`
--

LOCK TABLES `ims_mc_groups` WRITE;
/*!40000 ALTER TABLE `ims_mc_groups` DISABLE KEYS */;
INSERT INTO `ims_mc_groups` VALUES (1,1,'默认会员组',0,1),(2,2,'默认会员组',0,1);
/*!40000 ALTER TABLE `ims_mc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_handsel`
--

DROP TABLE IF EXISTS `ims_mc_handsel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_handsel`
--

LOCK TABLES `ims_mc_handsel` WRITE;
/*!40000 ALTER TABLE `ims_mc_handsel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_handsel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_mapping_fans`
--

DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `nickname` (`nickname`),
  KEY `updatetime` (`updatetime`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_mapping_fans`
--

LOCK TABLES `ims_mc_mapping_fans` WRITE;
/*!40000 ALTER TABLE `ims_mc_mapping_fans` DISABLE KEYS */;
INSERT INTO `ims_mc_mapping_fans` VALUES (1,1,1,1,'fromUser','','','F6ic3tv7',1,1494472530,0,'',NULL,''),(2,2,2,2,'oF4XPvkZcxrQYj0UTrGrCrdUP3wE','','','nDFwcP7F',1,1495097628,0,'',NULL,''),(3,2,2,3,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','','','g6QEUFyO',1,1495097638,0,'',NULL,'');
/*!40000 ALTER TABLE `ims_mc_mapping_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_mapping_ucenter`
--

DROP TABLE IF EXISTS `ims_mc_mapping_ucenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_mapping_ucenter`
--

LOCK TABLES `ims_mc_mapping_ucenter` WRITE;
/*!40000 ALTER TABLE `ims_mc_mapping_ucenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_mapping_ucenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_mass_record`
--

DROP TABLE IF EXISTS `ims_mc_mass_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_mass_record`
--

LOCK TABLES `ims_mc_mass_record` WRITE;
/*!40000 ALTER TABLE `ims_mc_mass_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_mass_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_address`
--

DROP TABLE IF EXISTS `ims_mc_member_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_address`
--

LOCK TABLES `ims_mc_member_address` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_fields`
--

DROP TABLE IF EXISTS `ims_mc_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_fields`
--

LOCK TABLES `ims_mc_member_fields` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_fields` DISABLE KEYS */;
INSERT INTO `ims_mc_member_fields` VALUES (1,1,1,'真实姓名',1,0),(2,1,2,'昵称',1,1),(3,1,3,'头像',1,1),(4,1,4,'QQ号',1,0),(5,1,5,'手机号码',1,0),(6,1,6,'VIP级别',1,0),(7,1,7,'性别',1,0),(8,1,8,'出生生日',1,0),(9,1,9,'星座',1,0),(10,1,10,'生肖',1,0),(11,1,11,'固定电话',1,0),(12,1,12,'证件号码',1,0),(13,1,13,'学号',1,0),(14,1,14,'班级',1,0),(15,1,15,'邮寄地址',1,0),(16,1,16,'邮编',1,0),(17,1,17,'国籍',1,0),(18,1,18,'居住地址',1,0),(19,1,19,'毕业学校',1,0),(20,1,20,'公司',1,0),(21,1,21,'学历',1,0),(22,1,22,'职业',1,0),(23,1,23,'职位',1,0),(24,1,24,'年收入',1,0),(25,1,25,'情感状态',1,0),(26,1,26,' 交友目的',1,0),(27,1,27,'血型',1,0),(28,1,28,'身高',1,0),(29,1,29,'体重',1,0),(30,1,30,'支付宝帐号',1,0),(31,1,31,'MSN',1,0),(32,1,32,'电子邮箱',1,0),(33,1,33,'阿里旺旺',1,0),(34,1,34,'主页',1,0),(35,1,35,'自我介绍',1,0),(36,1,36,'兴趣爱好',1,0),(37,2,1,'真实姓名',1,0),(38,2,2,'昵称',1,1),(39,2,3,'头像',1,1),(40,2,4,'QQ号',1,0),(41,2,5,'手机号码',1,0),(42,2,6,'VIP级别',1,0),(43,2,7,'性别',1,0),(44,2,8,'出生生日',1,0),(45,2,9,'星座',1,0),(46,2,10,'生肖',1,0),(47,2,11,'固定电话',1,0),(48,2,12,'证件号码',1,0),(49,2,13,'学号',1,0),(50,2,14,'班级',1,0),(51,2,15,'邮寄地址',1,0),(52,2,16,'邮编',1,0),(53,2,17,'国籍',1,0),(54,2,18,'居住地址',1,0),(55,2,19,'毕业学校',1,0),(56,2,20,'公司',1,0),(57,2,21,'学历',1,0),(58,2,22,'职业',1,0),(59,2,23,'职位',1,0),(60,2,24,'年收入',1,0),(61,2,25,'情感状态',1,0),(62,2,26,' 交友目的',1,0),(63,2,27,'血型',1,0),(64,2,28,'身高',1,0),(65,2,29,'体重',1,0),(66,2,30,'支付宝帐号',1,0),(67,2,31,'MSN',1,0),(68,2,32,'电子邮箱',1,0),(69,2,33,'阿里旺旺',1,0),(70,2,34,'主页',1,0),(71,2,35,'自我介绍',1,0),(72,2,36,'兴趣爱好',1,0);
/*!40000 ALTER TABLE `ims_mc_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_member_property`
--

DROP TABLE IF EXISTS `ims_mc_member_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_member_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_member_property`
--

LOCK TABLES `ims_mc_member_property` WRITE;
/*!40000 ALTER TABLE `ims_mc_member_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_members`
--

DROP TABLE IF EXISTS `ims_mc_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_members`
--

LOCK TABLES `ims_mc_members` WRITE;
/*!40000 ALTER TABLE `ims_mc_members` DISABLE KEYS */;
INSERT INTO `ims_mc_members` VALUES (1,1,'','512bd40d345a0fae6694bb97d7cb12c2@we7.cc','108a5d0f75f30b463009363f15a74de6','e0mLM474',1,0.00,0.00,0.00,0.00,0.00,0.00,1494472547,'','','','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(2,2,'','874950d287c4c01ee884a00116e3ff3d@we7.cc','ebe2801fdf40e8d4a00aeb4f7aafa947','yRPmFRM7',2,0.00,0.00,0.00,0.00,0.00,0.00,1495097628,'','','','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(3,2,'','060e6db695fb3a6bbe580adf46004f9f@we7.cc','034fefb11dd7337a2b50098f70e55ce7','cFqJTn64',2,0.00,0.00,0.00,0.00,0.00,0.00,1495097638,'','','','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `ims_mc_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mc_oauth_fans`
--

DROP TABLE IF EXISTS `ims_mc_oauth_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mc_oauth_fans`
--

LOCK TABLES `ims_mc_oauth_fans` WRITE;
/*!40000 ALTER TABLE `ims_mc_oauth_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_oauth_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_menu_event`
--

DROP TABLE IF EXISTS `ims_menu_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_menu_event`
--

LOCK TABLES `ims_menu_event` WRITE;
/*!40000 ALTER TABLE `ims_menu_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_menu_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mobilenumber`
--

DROP TABLE IF EXISTS `ims_mobilenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mobilenumber`
--

LOCK TABLES `ims_mobilenumber` WRITE;
/*!40000 ALTER TABLE `ims_mobilenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mobilenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules`
--

DROP TABLE IF EXISTS `ims_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules`
--

LOCK TABLES `ims_modules` WRITE;
/*!40000 ALTER TABLE `ims_modules` DISABLE KEYS */;
INSERT INTO `ims_modules` VALUES (1,'basic','system','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(2,'news','system','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(3,'music','system','基本音乐回复','1.0','提供语音、音乐等音频类回复','在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(4,'userapi','system','自定义接口回复','1.1','更方便的第三方接口设置','自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(5,'recharge','system','会员中心充值模块','1.0','提供会员充值功能','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,''),(6,'custom','system','多客服转接','1.0.0','用来接入腾讯的多客服系统','','WeEngine Team','http://bbs.we7.cc',0,'a:0:{}','a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}',1,1,0,0,''),(7,'images','system','基本图片回复','1.0','提供图片回复','在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(8,'video','system','基本视频回复','1.0','提供图片回复','在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(9,'voice','system','基本语音回复','1.0','提供语音回复','在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(10,'chats','system','发送客服消息','1.0','公众号可以在粉丝最后发送消息的48小时内无限制发送消息','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,''),(11,'wxcard','system','微信卡券回复','1.0','微信卡券回复','微信卡券回复','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(12,'paycenter','system','收银台','1.0','收银台','收银台','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,''),(18,'feng_fightgroups','business','拼团','5.4.1','拼团','拼团','微连科技','http://bbs.we7.cc/',0,'a:1:{i:0;s:4:\"text\";}','a:1:{i:0;s:4:\"text\";}',0,0,0,0,'a:0:{}'),(14,'mon_weishare','activity','微助力','2.9.1','分享活动赢好礼','分享活动到朋友圈获取朋友的助力，即可获取相应礼品！','codeMonkey qq:631872807','http://bbs.we7.cc/',0,'a:0:{}','a:1:{i:0;s:4:\"text\";}',1,0,0,0,'a:0:{}'),(15,'we7_coupon','business','系统卡券','3.5','微擎卡券','微擎卡券','微擎团队','',2,'a:0:{}','a:0:{}',0,1,0,0,'a:0:{}'),(16,'mon_xkwkj','activity','炫酷微砍价','1.2.2.1','炫酷微砍价，砍砍！！！！！','炫酷微砍价，砍砍！！！！！！','codeMonkey qq:2463619823','',0,'a:0:{}','a:1:{i:0;s:4:\"text\";}',1,0,0,0,'a:0:{}'),(17,'jy_reads','business','九烨-集阅读','2.7','集阅读','集阅读征集活动','Toddy','',1,'a:0:{}','a:2:{i:0;s:8:\"location\";i:1;s:4:\"text\";}',1,0,0,0,'a:0:{}');
/*!40000 ALTER TABLE `ims_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_bindings`
--

DROP TABLE IF EXISTS `ims_modules_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_bindings`
--

LOCK TABLES `ims_modules_bindings` WRITE;
/*!40000 ALTER TABLE `ims_modules_bindings` DISABLE KEYS */;
INSERT INTO `ims_modules_bindings` VALUES (41,'feng_fightgroups','menu','','后台入口','import','',0,'','',0),(40,'feng_fightgroups','cover','','个人中心','person','',0,'','',0),(39,'feng_fightgroups','cover','','我的团','mygroup','',0,'','',0),(38,'feng_fightgroups','cover','','我的订单','myorder','',0,'','',0),(37,'feng_fightgroups','cover','','首页入口','index','',0,'','',0),(6,'mon_weishare','menu','','助力活动管理','share','',0,'','',0),(7,'mon_weishare','menu','','授权接口设置','setting','',0,'','',0),(8,'we7_coupon','cover','','会员卡入口设置','card','',0,'','',0),(9,'we7_coupon','cover','','收银台入口设置','clerk','',0,'','',0),(10,'we7_coupon','menu','','会员卡设置','membercard','',0,'','',0),(11,'we7_coupon','menu','','会员卡管理','cardmanage','',0,'','',0),(12,'we7_coupon','menu','','会员属性','memberproperty','',0,'','',0),(13,'we7_coupon','menu','','优惠券管理','couponmanage','',0,'','',0),(14,'we7_coupon','menu','','优惠券核销','couponconsume','',0,'','',0),(15,'we7_coupon','menu','','优惠券派发','couponmarket','',0,'','',0),(16,'we7_coupon','menu','','兑换优惠券','couponexchange','',0,'','',0),(17,'we7_coupon','menu','','兑换真实物品','goodsexchange','',0,'','',0),(18,'we7_coupon','menu','','门店管理','storelist','',0,'','',0),(19,'we7_coupon','menu','','店员管理','clerklist','',0,'','',0),(20,'we7_coupon','menu','','门店收银台','paycenter','',0,'','',0),(21,'we7_coupon','menu','','工作台菜单设置','clerkdeskmenu','',0,'','',0),(22,'we7_coupon','menu','','签到管理','signmanage','',0,'','',0),(23,'we7_coupon','menu','','通知管理','noticemanage','',0,'','',0),(24,'we7_coupon','menu','','会员积分统计','statcredit1','',0,'','',0),(25,'we7_coupon','menu','','会员余额统计','statcredit2','',0,'','',0),(26,'we7_coupon','menu','','会员现金消费统计','statcash','',0,'','',0),(27,'we7_coupon','menu','','会员卡统计','statcard','',0,'','',0),(28,'we7_coupon','menu','','收银台收款统计','statpaycenter','',0,'','',0),(29,'we7_coupon','menu','','微信卡券回复','wxcardreply','',0,'','',0),(30,'we7_coupon','profile','','会员卡','card','',0,'','',0),(31,'we7_coupon','profile','','兑换商城','activity','',0,'','',0),(32,'mon_xkwkj','menu','','砍价活动管理','xkkjManage','',0,'','',0),(33,'mon_xkwkj','menu','','参数配置','xkkjSetting','',0,'','',0),(34,'jy_reads','menu','','活动管理','Activity','',0,'','',0),(35,'jy_reads','menu','','红包管理','bonus','',0,'','',0),(36,'jy_reads','menu','','卡券管理','coupon','',0,'','',0);
/*!40000 ALTER TABLE `ims_modules_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_modules_recycle`
--

DROP TABLE IF EXISTS `ims_modules_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_modules_recycle`
--

LOCK TABLES `ims_modules_recycle` WRITE;
/*!40000 ALTER TABLE `ims_modules_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mon_xkwkj`
--

DROP TABLE IF EXISTS `ims_mon_xkwkj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mon_xkwkj` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `weid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `starttime` int(10) DEFAULT NULL,
  `endtime` int(10) DEFAULT NULL,
  `kj_intro` text,
  `p_name` varchar(100) DEFAULT NULL,
  `p_kc` int(10) DEFAULT '0',
  `p_y_price` float(10,2) DEFAULT NULL,
  `p_low_price` float(10,2) DEFAULT NULL,
  `yf_price` float(10,2) DEFAULT '0.00',
  `p_pic` varchar(1000) DEFAULT NULL,
  `p_preview_pic` varchar(1000) DEFAULT NULL,
  `follow_url` varchar(1000) DEFAULT NULL,
  `copyright` varchar(100) NOT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `new_icon` varchar(200) DEFAULT NULL,
  `new_content` varchar(200) DEFAULT NULL,
  `share_title` varchar(200) DEFAULT NULL,
  `share_icon` varchar(200) DEFAULT NULL,
  `share_content` varchar(200) DEFAULT NULL,
  `p_url` varchar(1000) DEFAULT NULL,
  `copyright_url` varchar(500) DEFAULT NULL,
  `hot_tel` varchar(50) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `kj_dialog_tip` varchar(1000) DEFAULT NULL,
  `rank_tip` varchar(1000) DEFAULT NULL,
  `u_fist_tip` varchar(1000) DEFAULT NULL,
  `u_already_tip` varchar(1000) DEFAULT NULL,
  `fk_fist_tip` varchar(1000) DEFAULT NULL,
  `fk_already_tip` varchar(1000) DEFAULT NULL,
  `kj_rule` text,
  `pay_type` int(2) DEFAULT NULL,
  `p_model` varchar(1000) DEFAULT NULL,
  `kj_follow_enable` int(1) DEFAULT NULL,
  `join_follow_enable` int(1) DEFAULT NULL,
  `follow_dlg_tip` varchar(500) DEFAULT NULL,
  `follow_btn_name` varchar(20) DEFAULT NULL,
  `share_bg` varchar(300) DEFAULT NULL,
  `rank_num` int(10) DEFAULT NULL,
  `join_rank_num` int(10) DEFAULT NULL,
  `v_user` int(10) DEFAULT NULL,
  `zt_address` varchar(1000) DEFAULT NULL,
  `one_kj_enable` int(1) DEFAULT NULL,
  `day_help_count` int(10) DEFAULT NULL,
  `submit_money_limit` float(10,2) DEFAULT NULL,
  `hx_enabled` int(1) DEFAULT NULL,
  `tmp_enable` int(1) DEFAULT NULL,
  `tmpId` varchar(1000) DEFAULT NULL,
  `fh_tmp_enable` int(1) DEFAULT NULL,
  `fh_tmp_id` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mon_xkwkj`
--

LOCK TABLES `ims_mon_xkwkj` WRITE;
/*!40000 ALTER TABLE `ims_mon_xkwkj` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mon_xkwkj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mon_xkwkj_firend`
--

DROP TABLE IF EXISTS `ims_mon_xkwkj_firend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mon_xkwkj_firend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `kd` int(2) DEFAULT NULL,
  `kname` int(3) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `ac` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `k_price` float(10,2) DEFAULT NULL,
  `kh_price` float(10,2) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mon_xkwkj_firend`
--

LOCK TABLES `ims_mon_xkwkj_firend` WRITE;
/*!40000 ALTER TABLE `ims_mon_xkwkj_firend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mon_xkwkj_firend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mon_xkwkj_order`
--

DROP TABLE IF EXISTS `ims_mon_xkwkj_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mon_xkwkj_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `privnce` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `openid` varchar(200) DEFAULT NULL,
  `outno` varchar(200) DEFAULT NULL,
  `order_no` varchar(100) DEFAULT NULL,
  `wxorder_no` varchar(100) DEFAULT NULL,
  `y_price` float(10,2) DEFAULT NULL,
  `kh_price` float(10,2) DEFAULT NULL,
  `yf_price` float(10,2) DEFAULT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `pay_type` int(2) DEFAULT NULL,
  `p_model` varchar(1000) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `wxnotify` varchar(200) DEFAULT NULL,
  `notifytime` int(10) DEFAULT '0',
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mon_xkwkj_order`
--

LOCK TABLES `ims_mon_xkwkj_order` WRITE;
/*!40000 ALTER TABLE `ims_mon_xkwkj_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mon_xkwkj_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mon_xkwkj_setting`
--

DROP TABLE IF EXISTS `ims_mon_xkwkj_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mon_xkwkj_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) NOT NULL,
  `appid` varchar(200) DEFAULT NULL,
  `appsecret` varchar(200) DEFAULT NULL,
  `mchid` varchar(100) DEFAULT NULL,
  `shkey` varchar(100) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mon_xkwkj_setting`
--

LOCK TABLES `ims_mon_xkwkj_setting` WRITE;
/*!40000 ALTER TABLE `ims_mon_xkwkj_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mon_xkwkj_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_mon_xkwkj_user`
--

DROP TABLE IF EXISTS `ims_mon_xkwkj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_mon_xkwkj_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kid` int(10) NOT NULL,
  `openid` varchar(200) NOT NULL,
  `kd` int(2) DEFAULT NULL,
  `nickname` varchar(100) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `price` float(10,2) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `createtime` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_mon_xkwkj_user`
--

LOCK TABLES `ims_mon_xkwkj_user` WRITE;
/*!40000 ALTER TABLE `ims_mon_xkwkj_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mon_xkwkj_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_music_reply`
--

DROP TABLE IF EXISTS `ims_music_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_music_reply`
--

LOCK TABLES `ims_music_reply` WRITE;
/*!40000 ALTER TABLE `ims_music_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_music_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_news_reply`
--

DROP TABLE IF EXISTS `ims_news_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_news_reply`
--

LOCK TABLES `ims_news_reply` WRITE;
/*!40000 ALTER TABLE `ims_news_reply` DISABLE KEYS */;
INSERT INTO `ims_news_reply` VALUES (1,9,0,'的','','','','','./index.php?i=1&c=site&a=site&do=detail&id=1',0,0,0);
/*!40000 ALTER TABLE `ims_news_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_paycenter_order`
--

DROP TABLE IF EXISTS `ims_paycenter_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_paycenter_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `clerk_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clerk_type` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `uniontid` varchar(40) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '支付方式',
  `trade_type` varchar(10) NOT NULL COMMENT '支付类型:刷卡支付,扫描支付',
  `body` varchar(255) NOT NULL COMMENT '商品信息',
  `fee` varchar(15) NOT NULL COMMENT '商品费用',
  `final_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠后应付价格',
  `credit1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抵消积分',
  `credit1_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '积分抵消金额',
  `credit2` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额支付金额',
  `cash` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '线上支付金额',
  `remark` varchar(255) NOT NULL,
  `auth_code` varchar(30) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '付款人',
  `follow` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关注公众号',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '线上支付状态',
  `credit_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '积分,余额的交易状态.0:未扣除,1:已扣除',
  `paytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_paycenter_order`
--

LOCK TABLES `ims_paycenter_order` WRITE;
/*!40000 ALTER TABLE `ims_paycenter_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_paycenter_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_profile_fields`
--

DROP TABLE IF EXISTS `ims_profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_profile_fields`
--

LOCK TABLES `ims_profile_fields` WRITE;
/*!40000 ALTER TABLE `ims_profile_fields` DISABLE KEYS */;
INSERT INTO `ims_profile_fields` VALUES (1,'realname',1,'真实姓名','',0,1,1,1,0),(2,'nickname',1,'昵称','',1,1,0,1,0),(3,'avatar',1,'头像','',1,0,0,0,0),(4,'qq',1,'QQ号','',0,0,0,1,0),(5,'mobile',1,'手机号码','',0,0,0,0,0),(6,'vip',1,'VIP级别','',0,0,0,0,0),(7,'gender',1,'性别','',0,0,0,0,0),(8,'birthyear',1,'出生生日','',0,0,0,0,0),(9,'constellation',1,'星座','',0,0,0,0,0),(10,'zodiac',1,'生肖','',0,0,0,0,0),(11,'telephone',1,'固定电话','',0,0,0,0,0),(12,'idcard',1,'证件号码','',0,0,0,0,0),(13,'studentid',1,'学号','',0,0,0,0,0),(14,'grade',1,'班级','',0,0,0,0,0),(15,'address',1,'邮寄地址','',0,0,0,0,0),(16,'zipcode',1,'邮编','',0,0,0,0,0),(17,'nationality',1,'国籍','',0,0,0,0,0),(18,'resideprovince',1,'居住地址','',0,0,0,0,0),(19,'graduateschool',1,'毕业学校','',0,0,0,0,0),(20,'company',1,'公司','',0,0,0,0,0),(21,'education',1,'学历','',0,0,0,0,0),(22,'occupation',1,'职业','',0,0,0,0,0),(23,'position',1,'职位','',0,0,0,0,0),(24,'revenue',1,'年收入','',0,0,0,0,0),(25,'affectivestatus',1,'情感状态','',0,0,0,0,0),(26,'lookingfor',1,' 交友目的','',0,0,0,0,0),(27,'bloodtype',1,'血型','',0,0,0,0,0),(28,'height',1,'身高','',0,0,0,0,0),(29,'weight',1,'体重','',0,0,0,0,0),(30,'alipay',1,'支付宝帐号','',0,0,0,0,0),(31,'msn',1,'MSN','',0,0,0,0,0),(32,'email',1,'电子邮箱','',0,0,0,0,0),(33,'taobao',1,'阿里旺旺','',0,0,0,0,0),(34,'site',1,'主页','',0,0,0,0,0),(35,'bio',1,'自我介绍','',0,0,0,0,0),(36,'interest',1,'兴趣爱好','',0,0,0,0,0);
/*!40000 ALTER TABLE `ims_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_qrcode`
--

DROP TABLE IF EXISTS `ims_qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_qrcode`
--

LOCK TABLES `ims_qrcode` WRITE;
/*!40000 ALTER TABLE `ims_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_qrcode_stat`
--

DROP TABLE IF EXISTS `ims_qrcode_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_qrcode_stat`
--

LOCK TABLES `ims_qrcode_stat` WRITE;
/*!40000 ALTER TABLE `ims_qrcode_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_rule`
--

DROP TABLE IF EXISTS `ims_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_rule`
--

LOCK TABLES `ims_rule` WRITE;
/*!40000 ALTER TABLE `ims_rule` DISABLE KEYS */;
INSERT INTO `ims_rule` VALUES (1,0,'城市天气','userapi',255,1),(2,0,'百度百科','userapi',255,1),(3,0,'即时翻译','userapi',255,1),(4,0,'今日老黄历','userapi',255,1),(5,0,'看新闻','userapi',255,1),(6,0,'快递查询','userapi',255,1),(7,1,'个人中心入口设置','cover',0,1),(8,1,'微擎团队入口设置','cover',0,1),(9,1,'文章：的 触发规则','news',0,1),(10,2,'测试','basic',0,1),(11,2,'测试首页','cover',0,1);
/*!40000 ALTER TABLE `ims_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_rule_keyword`
--

DROP TABLE IF EXISTS `ims_rule_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_rule_keyword`
--

LOCK TABLES `ims_rule_keyword` WRITE;
/*!40000 ALTER TABLE `ims_rule_keyword` DISABLE KEYS */;
INSERT INTO `ims_rule_keyword` VALUES (1,1,0,'userapi','^.+天气$',3,255,1),(2,2,0,'userapi','^百科.+$',3,255,1),(3,2,0,'userapi','^定义.+$',3,255,1),(4,3,0,'userapi','^@.+$',3,255,1),(5,4,0,'userapi','日历',1,255,1),(6,4,0,'userapi','万年历',1,255,1),(7,4,0,'userapi','黄历',1,255,1),(8,4,0,'userapi','几号',1,255,1),(9,5,0,'userapi','新闻',1,255,1),(10,6,0,'userapi','^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$',3,255,1),(11,7,1,'cover','个人中心',1,0,1),(12,8,1,'cover','首页',1,0,1),(13,9,1,'news','定位',1,1,1),(14,10,2,'basic','测试',1,0,1),(17,11,2,'cover','首页',1,0,1);
/*!40000 ALTER TABLE `ims_rule_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_article`
--

DROP TABLE IF EXISTS `ims_site_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_article`
--

LOCK TABLES `ims_site_article` WRITE;
/*!40000 ALTER TABLE `ims_site_article` DISABLE KEYS */;
INSERT INTO `ims_site_article` VALUES (1,1,9,0,1,0,0,0,'','的','','','',0,'','',1,'',1494557760,0,'','a:4:{s:6:\"status\";i:0;s:5:\"limit\";i:0;s:5:\"share\";i:0;s:5:\"click\";i:0;}');
/*!40000 ALTER TABLE `ims_site_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_category`
--

DROP TABLE IF EXISTS `ims_site_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_category`
--

LOCK TABLES `ims_site_category` WRITE;
/*!40000 ALTER TABLE `ims_site_category` DISABLE KEYS */;
INSERT INTO `ims_site_category` VALUES (3,1,3,'关于我们',0,0,1,'','about',3,'https://www.baidu.com/',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#efefef\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(4,1,4,'产品中心',0,1,1,'','product',3,'https://www.baidu.com/',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#ffffff\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:10:\"fa fa-bank\";}}'),(5,1,5,'成功案例',0,2,1,'','lizi',3,'https://www.baidu.com/',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-calendar\";}}'),(6,1,6,'促销活动',0,5,1,'','huodong',3,'https://www.baidu.com/',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-arrows-h\";}}'),(7,1,9,'最新动态bbbbb',0,3,1,'','dongtaiu',5,'http://gds.yljfx.cn/app/index.php?i=1&c=home&a=page&id=2',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-arrows-v\";}}'),(8,1,10,'公司地址',0,4,1,'','我问问',2,'http://www.baidu.com',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(9,2,11,'关于我们',0,0,1,'','防守打法',21,'',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(10,2,12,'最新资讯',0,0,1,'','打扫打扫多',16,'',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(11,2,13,'产品中心',0,0,1,'','发',19,'',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}'),(12,2,14,'产品中心',0,0,1,'','45545445',20,'',1,1,'a:1:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}}');
/*!40000 ALTER TABLE `ims_site_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_multi`
--

DROP TABLE IF EXISTS `ims_site_multi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_multi`
--

LOCK TABLES `ims_site_multi` WRITE;
/*!40000 ALTER TABLE `ims_site_multi` DISABLE KEYS */;
INSERT INTO `ims_site_multi` VALUES (1,1,'微擎团队',11,'',1,''),(2,2,'测试首页',21,'a:4:{s:5:\"thumb\";s:51:\"images/2/2017/05/i1582PXqKFPyQh123q6SHqQhFsy02f.png\";s:7:\"keyword\";s:6:\"首页\";s:11:\"description\";s:6:\"测试\";s:6:\"footer\";s:0:\"\";}',1,'');
/*!40000 ALTER TABLE `ims_site_multi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_nav`
--

DROP TABLE IF EXISTS `ims_site_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  `styleid` int(10) NOT NULL COMMENT '风格id',
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_nav`
--

LOCK TABLES `ims_site_nav` WRITE;
/*!40000 ALTER TABLE `ims_site_nav` DISABLE KEYS */;
INSERT INTO `ims_site_nav` VALUES (4,1,1,0,'',1,'产品中心','product',1,'./index.php?c=site&a=site&cid=4&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#ffffff\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:10:\"fa fa-bank\";}s:4:\"name\";a:1:{s:5:\"color\";s:7:\"#ffffff\";}}',1,0,0),(3,1,1,0,'',0,'关于我们','about',1,'./index.php?c=site&a=site&cid=3&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#efefef\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:7:\"#efefef\";}}',1,3,11),(5,1,1,0,'',2,'成功案例','lizi',1,'./index.php?c=site&a=site&cid=5&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-calendar\";}s:4:\"name\";a:1:{s:5:\"color\";s:7:\"#f3f3f3\";}}',1,0,15),(6,1,1,0,'',5,'促销活动','huodong',1,'./index.php?c=site&a=site&cid=6&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-arrows-h\";}s:4:\"name\";a:1:{s:5:\"color\";s:7:\"#f3f3f3\";}}',1,0,0),(8,1,1,5,'',5,'y ',' 6',1,'./index.php?i=1&c=home&t=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,0,14),(9,1,1,0,'',3,'最新动态bbbbb','dongtaiu',1,'./index.php?c=site&a=site&cid=7&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:7:\"#f3f3f3\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:14:\"fa fa-arrows-v\";}s:4:\"name\";a:1:{s:5:\"color\";s:7:\"#f3f3f3\";}}',1,7,14),(10,1,1,0,'',4,'公司地址','我问问',1,'./index.php?c=site&a=site&cid=8&i=1','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,0,0),(11,2,2,0,'',0,'关于我们','防守打法',1,'./index.php?c=site&a=site&cid=9&i=2','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,9,21),(12,2,2,0,'',0,'最新资讯','打扫打扫多',1,'./index.php?c=site&a=site&cid=10&i=2','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,0,16),(13,2,2,0,'',0,'产品中心','发',1,'./index.php?c=site&a=site&cid=11&i=2','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,0,19),(14,2,2,0,'',0,'产品中心','45545445',1,'./index.php?c=site&a=site&cid=12&i=2','','a:2:{s:4:\"icon\";a:4:{s:9:\"font-size\";s:2:\"35\";s:5:\"color\";s:0:\"\";s:5:\"width\";s:2:\"35\";s:4:\"icon\";s:19:\"fa fa-external-link\";}s:4:\"name\";a:1:{s:5:\"color\";s:0:\"\";}}',1,0,20);
/*!40000 ALTER TABLE `ims_site_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_page`
--

DROP TABLE IF EXISTS `ims_site_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_page`
--

LOCK TABLES `ims_site_page` WRITE;
/*!40000 ALTER TABLE `ims_site_page` DISABLE KEYS */;
INSERT INTO `ims_site_page` VALUES (1,1,0,'快捷菜单','','{\"navStyle\":\"2\",\"bgColor\":\"#f4f4f4\",\"menus\":[{\"title\":\"\\u4f1a\\u5458\\u5361\",\"url\":\".\\/index.php?c=mc&a=bond&do=card&i=1\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-credit-card\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]},{\"title\":\"\\u5151\\u6362\",\"url\":\".\\/index.php?c=activity&a=coupon&do=display&&i=1\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-money\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]},{\"title\":\"\\u4ed8\\u6b3e\",\"url\":\"\\\" data-target=\\\"#scan\\\" data-toggle=\\\"modal\\\" href=\\\"javascript:void();\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-qrcode\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":\"\"},{\"title\":\"\\u4e2a\\u4eba\\u4e2d\\u5fc3\",\"url\":\".\\/index.php?i=1&c=mc&\",\"submenus\":[],\"icon\":{\"name\":\"fa fa-user\",\"color\":\"#969696\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":[]}],\"extend\":[],\"position\":{\"homepage\":true,\"usercenter\":true,\"page\":true,\"article\":true},\"ignoreModules\":[]}','<div style=\"background-color: rgb(244, 244, 244);\" class=\"js-quickmenu nav-menu-app has-nav-0  has-nav-4\"   ><ul class=\"nav-group clearfix\"><li class=\"nav-group-item \" ><a href=\"./index.php?c=mc&a=bond&do=card&i=1\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-credit-card\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">会员卡</span></a></li><li class=\"nav-group-item \" ><a href=\"./index.php?c=activity&a=coupon&do=display&&i=1\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-money\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">兑换</span></a></li><li class=\"nav-group-item \" ><a href=\"\" data-target=\"#scan\" data-toggle=\"modal\" href=\"javascript:void();\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-qrcode\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">付款</span></a></li><li class=\"nav-group-item \" ><a href=\"./index.php?i=1&c=mc&\" style=\"background-position: center 2px;\" ><i style=\"color: rgb(150, 150, 150);\"  class=\"fa fa-user\"  js-onclass-name=\"\" js-onclass-color=\"\" ></i><span style=\"color: rgb(150, 150, 150);\" class=\"\"  js-onclass-color=\"\">个人中心</span></a></li></ul></div>','',4,1,1440242655,0),(2,1,0,'微页面标题','','[{\"property\":[{\"id\":\"header\",\"name\":\"\\u5fae\\u9875\\u9762\\u6807\\u9898\",\"params\":{\"title\":\"\\u5fae\\u9875\\u9762\\u6807\\u9898\",\"description\":\"\",\"pageHeight\":568,\"thumb\":\"\",\"bgColor\":\"\",\"bottom_menu\":true,\"baseStyle\":{\"backgroundColor\":\"rgba(0,0,0,0)\",\"color\":\"#000\",\"opacity\":0,\"paddingTop\":0,\"lineHeight\":2,\"fontSize\":14,\"textAlign\":\"left\",\"lock\":false},\"borderStyle\":{\"borderWidth\":0,\"borderRadius\":2,\"borderStyle\":\"solid\",\"borderColor\":\"rgba(0,0,0,1)\",\"transform\":0},\"shadowStyle\":{\"shadowSize\":0,\"shadowBlur\":0,\"shadowColor\":\"rgba(0,0,0,0.5)\",\"shadowDirection\":1},\"positionStyle\":{\"top\":259,\"left\":40,\"width\":240,\"height\":50},\"animationStyle\":{\"animationName\":\"noEffect\",\"animationDuration\":1,\"animationTimingFunction\":\"ease\",\"animationDelay\":0.6,\"animationFillMode\":\"both\"},\"pageLength\":2},\"issystem\":1,\"index\":0,\"displayorder\":0,\"baseStyle\":\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;\",\"borderStyle\":\"border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);\",\"transform\":\"transform: rotateZ(0deg);\",\"shadowStyle\":\"box-shadow: 0px 0px 0px rgba(0,0,0,0.5);\",\"animationStyle\":\"animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\",\"positionStyle\":\"position:absolute; top: 259px; left: 40px; width: 240px; height: 50px;\"},{\"id\":\"onlyText\",\"name\":\"\\u6587\\u5b57\",\"params\":{\"title\":\"\\u4f60\\u597d\",\"baseStyle\":{\"backgroundColor\":\"rgba(0,0,0,0)\",\"color\":\"#000\",\"opacity\":0,\"paddingTop\":0,\"lineHeight\":2,\"fontSize\":14,\"textAlign\":\"center\",\"lock\":false},\"borderStyle\":{\"borderWidth\":0,\"borderRadius\":2,\"borderStyle\":\"solid\",\"borderColor\":\"rgba(0,0,0,1)\",\"transform\":0},\"shadowStyle\":{\"shadowSize\":0,\"shadowBlur\":0,\"shadowColor\":\"rgba(0,0,0,0.5)\",\"shadowDirection\":1},\"animationStyle\":{\"animationName\":\"noEffect\",\"animationDuration\":1,\"animationTimingFunction\":\"ease\",\"animationDelay\":0.6,\"animationFillMode\":\"both\"},\"positionStyle\":{\"top\":9,\"left\":66,\"width\":200,\"height\":30}},\"issystem\":0,\"index\":1,\"displayorder\":1,\"baseStyle\":\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:center;\",\"borderStyle\":\"border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);\",\"transform\":\"transform: rotateZ(0deg);\",\"shadowStyle\":\"box-shadow: 0px 0px 0px rgba(0,0,0,0.5);\",\"positionStyle\":\"position:absolute;top:9px;left:66px;width:200px;height:30px;\",\"animationStyle\":\"animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"},{\"id\":\"image\",\"name\":\"\\u56fe\\u7247\",\"params\":{\"items\":{\"id\":\"\",\"imgurl\":\"\"},\"baseStyle\":{\"backgroundColor\":\"rgba(0,0,0,0)\",\"color\":\"#000\",\"opacity\":0,\"paddingTop\":0,\"lineHeight\":2,\"fontSize\":14,\"textAlign\":\"left\",\"lock\":false},\"borderStyle\":{\"borderWidth\":0,\"borderRadius\":2,\"borderStyle\":\"solid\",\"borderColor\":\"rgba(0,0,0,1)\",\"transform\":0},\"shadowStyle\":{\"shadowSize\":0,\"shadowBlur\":0,\"shadowColor\":\"rgba(0,0,0,0.5)\",\"shadowDirection\":1},\"animationStyle\":{\"animationName\":\"noEffect\",\"animationDuration\":1,\"animationTimingFunction\":\"ease\",\"animationDelay\":0.6,\"animationFillMode\":\"both\"},\"positionStyle\":{\"top\":-207,\"left\":54,\"width\":100,\"height\":100}},\"issystem\":0,\"index\":2,\"displayorder\":2,\"baseStyle\":\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;\",\"borderStyle\":\"border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);\",\"transform\":\"transform: rotateZ(0deg);\",\"shadowStyle\":\"box-shadow: 0px 0px 0px rgba(0,0,0,0.5);\",\"positionStyle\":\"position:absolute;top:-207px;left:54px;width:100px;height:100px;\",\"animationStyle\":\"animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"},{\"id\":\"adImg\",\"name\":\"\\u5e7b\\u706f\\u7247\",\"params\":{\"listStyle\":\"1\",\"sizeType\":1,\"items\":[{\"imgurl\":\"http:\\/\\/gds.yljfx.cn\\/attachment\\/images\\/1\\/2017\\/05\\/Zu500PbYSybm0l04yU7501G0S4sb75.png\",\"title\":\"\",\"url\":\"\",\"isactive\":true}],\"baseStyle\":{\"backgroundColor\":\"rgba(0,0,0,0)\",\"color\":\"#000\",\"opacity\":0,\"paddingTop\":0,\"lineHeight\":2,\"fontSize\":14,\"textAlign\":\"left\",\"lock\":false},\"borderStyle\":{\"borderWidth\":0,\"borderRadius\":2,\"borderStyle\":\"solid\",\"borderColor\":\"rgba(0,0,0,1)\",\"transform\":0},\"shadowStyle\":{\"shadowSize\":0,\"shadowBlur\":0,\"shadowColor\":\"rgba(0,0,0,0.5)\",\"shadowDirection\":1},\"animationStyle\":{\"animationName\":\"noEffect\",\"animationDuration\":1,\"animationTimingFunction\":\"ease\",\"animationDelay\":0.6,\"animationFillMode\":\"both\"},\"positionStyle\":{\"top\":48,\"left\":1,\"width\":320,\"height\":30}},\"issystem\":0,\"index\":3,\"displayorder\":3,\"baseStyle\":\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;\",\"borderStyle\":\"border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);\",\"transform\":\"transform: rotateZ(0deg);\",\"shadowStyle\":\"box-shadow: 0px 0px 0px rgba(0,0,0,0.5);\",\"positionStyle\":\"position:absolute;top:48px;left:1px;width:320px;height:30px;\",\"animationStyle\":\"animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"}],\"active\":true}]','<div style=\"height:1136px\"><div class=\"panes\"><div class=\"pane\"><div type=\"onlytext\" style=\"position: absolute; top: 9px; left: 66px; width: 200px; height: 30px; transform: translate3d(0px, 0px, 0px);\"><div style=\"transform: rotateZ(0deg);width:100%;height:100%\"><div class=\"app-onlyText\" style=\"width:100%;height:100%;background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:center;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"><div class=\"element\" style=\"overflow:hidden\">你好</div></div><div we7-drag=\"\" we7-resize=\"\" we7-rotate=\"\"> </div></div></div><div type=\"image\" style=\"position: absolute; top: -207px; left: 54px; width: 100px; height: 100px; transform: translate3d(0px, 0px, 0px);\"><div style=\"transform: rotateZ(0deg);width:100%;height:100%\"><div class=\"app-image\" style=\"width:100%;height:100%;background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"><img style=\"width:100%;height:100%\" alt=\"\"></div><div we7-drag=\"\" we7-resize=\"\" we7-rotate=\"\"> </div></div></div><div type=\"adimg\" style=\"position: absolute; top: 48px; left: 1px; width: 320px; height: 30px; transform: translate3d(0px, 0px, 0px);\"><link href=\"../app/resource/components/swiper/swiper.min.css\" rel=\"stylesheet\"><div style=\"transform: rotateZ(0deg);\"><div class=\"app-adImg\" style=\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\"><div class=\"inner\"><div class=\"swiper-container swiper-container-horizontal\"><div class=\"swiper-wrapper\"><div class=\"swiper-slide swiper-slide-active\" style=\"width: 100%\"><a href=\"\" style=\"display:block; width:100%; text-align:center\"><img title=\"\" style=\"display:block; height:auto; max-width:100%;  margin:0 auto\" src=\"http://gds.yljfx.cn/attachment/images/1/2017/05/Zu500PbYSybm0l04yU7501G0S4sb75.png\"></a></div></div><div class=\"swiper-pagination swiper-pagination-clickable\"><span class=\"swiper-pagination-bullet swiper-pagination-bullet-active\"></span></div><div class=\"swiper-button-next hidden\"></div><div class=\"swiper-button-prev hidden\"></div></div></div></div><div we7-drag=\"\"></div></div></div></div></div></div>','[\"<div type=\\\"onlytext\\\" style=\\\"position: absolute; top: 9px; left: 66px; width: 200px; height: 30px; transform: translate3d(0px, 0px, 0px);\\\"><div style=\\\"transform: rotateZ(0deg);width:100%;height:100%\\\"><div class=\\\"app-onlyText\\\" style=\\\"width:100%;height:100%;background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:center;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\\\"><div class=\\\"element\\\" style=\\\"overflow:hidden\\\">你好</div></div><div we7-drag=\\\"\\\" we7-resize=\\\"\\\" we7-rotate=\\\"\\\"> </div></div></div><div type=\\\"image\\\" style=\\\"position: absolute; top: -207px; left: 54px; width: 100px; height: 100px; transform: translate3d(0px, 0px, 0px);\\\"><div style=\\\"transform: rotateZ(0deg);width:100%;height:100%\\\"><div class=\\\"app-image\\\" style=\\\"width:100%;height:100%;background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\\\"><img style=\\\"width:100%;height:100%\\\" alt=\\\"\\\"></div><div we7-drag=\\\"\\\" we7-resize=\\\"\\\" we7-rotate=\\\"\\\"> </div></div></div><div type=\\\"adimg\\\" style=\\\"position: absolute; top: 48px; left: 1px; width: 320px; height: 30px; transform: translate3d(0px, 0px, 0px);\\\"><link href=\\\"../app/resource/components/swiper/swiper.min.css\\\" rel=\\\"stylesheet\\\"><div style=\\\"transform: rotateZ(0deg);\\\"><div class=\\\"app-adImg\\\" style=\\\"background-color:rgba(0,0,0,0);color:#000;opacity:1;padding-top:0px;line-height:2;font-size:14px;font-size:14px;text-align:left;border-width:0px;border-radius:2px;border-style:solid;border-color:rgba(0,0,0,1);box-shadow: 0px 0px 0px rgba(0,0,0,0.5);animation: noEffect 1s ease 0.6s both;-webkit-animation: noEffect 1s ease 0.6s both;-moz-animation: noEffect 1s ease 0.6s both;-o-animation: noEffect 1s ease 0.6s both;-ms-animation: noEffect 1s ease 0.6s both;\\\"><div class=\\\"inner\\\"><div class=\\\"swiper-container swiper-container-horizontal\\\"><div class=\\\"swiper-wrapper\\\"><div class=\\\"swiper-slide swiper-slide-active\\\" style=\\\"width: 100%\\\"><a href=\\\"\\\" style=\\\"display:block; width:100%; text-align:center\\\"><img title=\\\"\\\" style=\\\"display:block; height:auto; max-width:100%;  margin:0 auto\\\" src=\\\"http://gds.yljfx.cn/attachment/images/1/2017/05/Zu500PbYSybm0l04yU7501G0S4sb75.png\\\"></a></div></div><div class=\\\"swiper-pagination swiper-pagination-clickable\\\"><span class=\\\"swiper-pagination-bullet swiper-pagination-bullet-active\\\"></span></div><div class=\\\"swiper-button-next hidden\\\"></div><div class=\\\"swiper-button-prev hidden\\\"></div></div></div></div><div we7-drag=\\\"\\\"></div></div></div>\"]',1,1,1494555258,0),(3,1,1,'快捷菜单','','{\"navStyle\":\"2\",\"bgColor\":\"#2B2D30\",\"menus\":[{\"title\":\"\\u6807\\u9898\",\"url\":\"http:\\/\\/gds.yljfx.cn\\/app\\/index.php?i=1&c=home&t=1\",\"submenus\":[],\"icon\":{\"name\":\"fa-home\",\"color\":\"#00ffff\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":\"\"},{\"title\":\"\\u6807\\u9898\",\"url\":\"\",\"submenus\":[],\"icon\":{\"name\":\"fa-home\",\"color\":\"#00ffff\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":\"\"},{\"title\":\"\\u6807\\u9898\",\"url\":\"\",\"submenus\":[],\"icon\":{\"name\":\"fa-home\",\"color\":\"#00ffff\"},\"image\":\"\",\"hoverimage\":\"\",\"hovericon\":\"\"}],\"extend\":[],\"position\":{\"homepage\":true,\"usercenter\":true,\"page\":true,\"article\":true},\"ignoreModules\":[]}','<div class=\"js-quickmenu nav-menu-app has-nav-0  has-nav-3\"    style=\"background-color: rgb(43, 45, 48);\"><ul class=\"nav-group clearfix\"><li class=\"nav-group-item \" ><a href=\"http://gds.yljfx.cn/app/index.php?i=1&c=home&t=1\" style=\"background-position: center 2px\" ><i  class=\"fa fa-home\"  js-onclass-name=\"\" js-onclass-color=\"\"  style=\"color: rgb(0, 255, 255);\"></i><span  js-onclass-color=\"\" class=\"\" style=\"color: rgb(0, 255, 255);\">标题</span></a></li><li class=\"nav-group-item \" ><a href=\"\" style=\"background-position: center 2px\" ><i  class=\"fa fa-home\"  js-onclass-name=\"\" js-onclass-color=\"\"  style=\"color: rgb(0, 255, 255);\"></i><span  js-onclass-color=\"\" class=\"\" style=\"color: rgb(0, 255, 255);\">标题</span></a></li><li class=\"nav-group-item \" ><a href=\"\" style=\"background-position: center 2px\" ><i  class=\"fa fa-home\"  js-onclass-name=\"\" js-onclass-color=\"\"  style=\"color: rgb(0, 255, 255);\"></i><span  js-onclass-color=\"\" class=\"\" style=\"color: rgb(0, 255, 255);\">标题</span></a></li></ul></div>','',2,0,1494565254,0);
/*!40000 ALTER TABLE `ims_site_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_slide`
--

DROP TABLE IF EXISTS `ims_site_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_slide`
--

LOCK TABLES `ims_site_slide` WRITE;
/*!40000 ALTER TABLE `ims_site_slide` DISABLE KEYS */;
INSERT INTO `ims_site_slide` VALUES (1,1,1,'发发发','http://gds.yljfx.cn/app/index.php?i=1&c=home&t=1','images/1/2017/05/B0s0jUEy1iue10HyIBJh0QlH1Bh1bM.jpg',0);
/*!40000 ALTER TABLE `ims_site_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_styles`
--

DROP TABLE IF EXISTS `ims_site_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_styles`
--

LOCK TABLES `ims_site_styles` WRITE;
/*!40000 ALTER TABLE `ims_site_styles` DISABLE KEYS */;
INSERT INTO `ims_site_styles` VALUES (1,1,1,'微站默认模板_gC5C'),(2,1,2,'微站默认模板10_HLRt'),(13,1,12,'微站默认模板11_w6ZQ'),(4,1,5,'微站默认模板23_k3xH'),(12,1,7,'微站默认模板16_gnv9'),(11,1,9,'微站默认模板1_d6yL'),(14,1,10,'qwqwqwqwq_BL0m'),(15,1,11,'123454566_socj'),(21,2,2,'微站默认模板10_OC00'),(20,2,5,'微站默认模板23_f7z9'),(22,2,1,'微站默认模板_pHnS'),(23,2,12,'微站默认模板11_EXOy');
/*!40000 ALTER TABLE `ims_site_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_styles_vars`
--

DROP TABLE IF EXISTS `ims_site_styles_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_styles_vars`
--

LOCK TABLES `ims_site_styles_vars` WRITE;
/*!40000 ALTER TABLE `ims_site_styles_vars` DISABLE KEYS */;
INSERT INTO `ims_site_styles_vars` VALUES (3,1,10,14,'qwe','ddd','aass'),(4,1,11,15,'utut12','ee14','hghg1');
/*!40000 ALTER TABLE `ims_site_styles_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_site_templates`
--

DROP TABLE IF EXISTS `ims_site_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_site_templates`
--

LOCK TABLES `ims_site_templates` WRITE;
/*!40000 ALTER TABLE `ims_site_templates` DISABLE KEYS */;
INSERT INTO `ims_site_templates` VALUES (1,'default','微站默认模板','','由微擎提供默认微站模板套系','微擎团队','http://we7.cc','1',0),(2,'style10','微站默认模板10','9.0','由微擎提供默认微站模板套系','WeEngine Team','http://bbs.we7.cc','shoot',0),(10,'aasd','qwqwqwqwq','','jiudian','sss','http://bbs.we7.cc/','rummery',6),(7,'style16','微站默认模板16','8.0','由微擎提供默认微站模板套系','WeEngine Team','http://bbs.we7.cc','shoot',0),(5,'style23','微站默认模板23','8.0','由微擎提供默认微站模板套系','WeEngine Team','http://bbs.we7.cc','shoot',0),(9,'style1','微站默认模板1','9.0','由微擎提供默认微站模板套系','WeEngine Team','http://bbs.we7.cc','drink',0),(11,'mnbv','123454566','','poiu','wsz','http://bbs.we7.cc/','often',4),(12,'style11','微站默认模板11','9.0','由微擎提供默认微站模板套系','WeEngine Team','http://bbs.we7.cc','shoot',0);
/*!40000 ALTER TABLE `ims_site_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_fans`
--

DROP TABLE IF EXISTS `ims_stat_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_fans`
--

LOCK TABLES `ims_stat_fans` WRITE;
/*!40000 ALTER TABLE `ims_stat_fans` DISABLE KEYS */;
INSERT INTO `ims_stat_fans` VALUES (1,1,0,0,0,'20170510'),(2,1,0,0,0,'20170509'),(3,1,0,0,0,'20170508'),(4,1,0,0,0,'20170507'),(5,1,0,0,0,'20170506'),(6,1,0,0,0,'20170505'),(7,1,0,0,0,'20170504'),(8,1,0,0,1,'20170511'),(9,1,0,0,1,'20170514'),(10,1,0,0,1,'20170513'),(11,1,0,0,1,'20170512'),(12,1,0,0,1,'20170515'),(13,1,0,0,1,'20170516'),(14,1,0,0,1,'20170517'),(15,2,0,0,0,'20170517'),(16,2,0,0,0,'20170516'),(17,2,0,0,0,'20170515'),(18,2,0,0,0,'20170514'),(19,2,0,0,0,'20170513'),(20,2,0,0,0,'20170512'),(21,2,0,0,0,'20170511'),(22,2,0,0,2,'20170518');
/*!40000 ALTER TABLE `ims_stat_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_keyword`
--

DROP TABLE IF EXISTS `ims_stat_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_keyword`
--

LOCK TABLES `ims_stat_keyword` WRITE;
/*!40000 ALTER TABLE `ims_stat_keyword` DISABLE KEYS */;
INSERT INTO `ims_stat_keyword` VALUES (1,2,'10',14,3,1495100288,1495036800),(2,2,'5',9,1,1495158979,1495123200),(3,2,'4',5,1,1495158997,1495123200),(4,2,'11',15,1,1495160847,1495123200);
/*!40000 ALTER TABLE `ims_stat_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_msg_history`
--

DROP TABLE IF EXISTS `ims_stat_msg_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_msg_history`
--

LOCK TABLES `ims_stat_msg_history` WRITE;
/*!40000 ALTER TABLE `ims_stat_msg_history` DISABLE KEYS */;
INSERT INTO `ims_stat_msg_history` VALUES (1,1,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1494914213),(2,2,10,14,'oF4XPvkZcxrQYj0UTrGrCrdUP3wE','basic','a:4:{s:7:\"content\";s:6:\"测试\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495097628),(3,2,10,14,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','basic','a:4:{s:7:\"content\";s:6:\"测试\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495097638),(4,2,10,14,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','basic','a:4:{s:7:\"content\";s:6:\"测试\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495100288),(5,2,0,0,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','','a:4:{s:7:\"content\";s:12:\"快递查询\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495158954),(6,2,5,9,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','userapi','a:4:{s:7:\"content\";s:6:\"新闻\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495158979),(7,2,4,5,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','userapi','a:4:{s:7:\"content\";s:6:\"日历\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495158997),(8,2,4,6,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','userapi','a:4:{s:7:\"content\";s:9:\"万年历\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495159583),(9,2,11,15,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','cover','a:4:{s:7:\"content\";s:6:\"首页\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495160847),(10,2,0,0,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','','a:4:{s:7:\"content\";s:9:\"会员卡\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495161551),(11,2,11,17,'oF4XPvumkwSrdNPYR_ReAEs9fOdQ','cover','a:4:{s:7:\"content\";s:6:\"首页\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1495161555);
/*!40000 ALTER TABLE `ims_stat_msg_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_stat_rule`
--

DROP TABLE IF EXISTS `ims_stat_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_stat_rule`
--

LOCK TABLES `ims_stat_rule` WRITE;
/*!40000 ALTER TABLE `ims_stat_rule` DISABLE KEYS */;
INSERT INTO `ims_stat_rule` VALUES (1,1,0,1,1494914213,1494864000),(2,2,10,3,1495100288,1495036800),(3,2,0,1,1495158954,1495123200),(4,2,5,1,1495158979,1495123200),(5,2,4,2,1495159583,1495123200),(6,2,11,2,1495161555,1495123200),(7,2,0,1,1495161551,1495123200);
/*!40000 ALTER TABLE `ims_stat_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_address`
--

DROP TABLE IF EXISTS `ims_tg_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mid` int(11) DEFAULT NULL COMMENT '粉丝ID',
  `openid` varchar(300) NOT NULL COMMENT '唯一标识',
  `cname` varchar(30) NOT NULL COMMENT '收货人名称',
  `tel` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) NOT NULL COMMENT '省',
  `city` varchar(20) NOT NULL COMMENT '市',
  `county` varchar(20) NOT NULL COMMENT '县(区)',
  `detailed_address` varchar(225) NOT NULL COMMENT '详细地址',
  `uniacid` int(10) NOT NULL COMMENT '公众号id',
  `addtime` varchar(45) NOT NULL COMMENT '最后修改时间',
  `status` int(2) NOT NULL COMMENT '1为默认',
  `type` int(2) NOT NULL COMMENT '1公司，2家庭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_address`
--

LOCK TABLES `ims_tg_address` WRITE;
/*!40000 ALTER TABLE `ims_tg_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_adv`
--

DROP TABLE IF EXISTS `ims_tg_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `advname` varchar(50) DEFAULT '' COMMENT '幻灯片名称',
  `link` varchar(255) DEFAULT '' COMMENT '幻灯片链接',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `displayorder` int(11) DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1显示',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`uniacid`),
  KEY `indx_enabled` (`enabled`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_adv`
--

LOCK TABLES `ims_tg_adv` WRITE;
/*!40000 ALTER TABLE `ims_tg_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_arealimit`
--

DROP TABLE IF EXISTS `ims_tg_arealimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_arealimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `arealimitname` varchar(56) NOT NULL,
  `areas` text NOT NULL,
  `merchantid` int(11) NOT NULL COMMENT '所属商家',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_arealimit`
--

LOCK TABLES `ims_tg_arealimit` WRITE;
/*!40000 ALTER TABLE `ims_tg_arealimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_arealimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_banner`
--

DROP TABLE IF EXISTS `ims_tg_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uniacid` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_banner`
--

LOCK TABLES `ims_tg_banner` WRITE;
/*!40000 ALTER TABLE `ims_tg_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_category`
--

DROP TABLE IF EXISTS `ims_tg_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) NOT NULL COMMENT '分类图片',
  `parentid` int(10) unsigned DEFAULT '0' COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_category`
--

LOCK TABLES `ims_tg_category` WRITE;
/*!40000 ALTER TABLE `ims_tg_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_collect`
--

DROP TABLE IF EXISTS `ims_tg_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `openid` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_collect`
--

LOCK TABLES `ims_tg_collect` WRITE;
/*!40000 ALTER TABLE `ims_tg_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_coupon`
--

DROP TABLE IF EXISTS `ims_tg_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_template_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `cash` varchar(20) NOT NULL,
  `is_at_least` tinyint(3) unsigned NOT NULL,
  `at_least` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `use_time` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL,
  `uniacid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_coupon`
--

LOCK TABLES `ims_tg_coupon` WRITE;
/*!40000 ALTER TABLE `ims_tg_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_coupon_template`
--

DROP TABLE IF EXISTS `ims_tg_coupon_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_coupon_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '优惠券名称',
  `value` varchar(50) NOT NULL COMMENT '最小面值',
  `value_to` varchar(50) NOT NULL COMMENT '最大面值',
  `is_random` tinyint(3) unsigned NOT NULL COMMENT '是否随机',
  `is_at_least` tinyint(3) unsigned NOT NULL COMMENT '是否存在最低消费',
  `at_least` varchar(20) NOT NULL COMMENT '最低消费',
  `is_sync_weixin` tinyint(11) unsigned NOT NULL,
  `user_level` tinyint(11) unsigned DEFAULT NULL,
  `quota` tinyint(10) unsigned NOT NULL COMMENT '领取限制',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `fans_tag` int(10) unsigned NOT NULL,
  `expire_notice` tinyint(4) unsigned NOT NULL,
  `is_share` tinyint(3) unsigned NOT NULL,
  `range_type` tinyint(3) unsigned NOT NULL,
  `is_forbid_preference` tinyint(3) unsigned NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '描述',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `enable` tinyint(3) unsigned NOT NULL COMMENT '优惠券状态，1正常',
  `total` int(10) unsigned NOT NULL COMMENT '优惠券总量',
  `quantity_issue` int(10) unsigned NOT NULL,
  `quantity_used` int(10) unsigned NOT NULL COMMENT '已使用数量',
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_coupon_template`
--

LOCK TABLES `ims_tg_coupon_template` WRITE;
/*!40000 ALTER TABLE `ims_tg_coupon_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_coupon_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_credit_record`
--

DROP TABLE IF EXISTS `ims_tg_credit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_credit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(245) NOT NULL,
  `num` varchar(30) NOT NULL,
  `createtime` varchar(145) NOT NULL,
  `transid` varchar(145) NOT NULL,
  `status` int(11) NOT NULL,
  `paytype` int(2) NOT NULL COMMENT '1微信2后台',
  `ordersn` varchar(145) NOT NULL,
  `type` int(2) NOT NULL COMMENT '1积分2余额',
  `remark` varchar(145) NOT NULL,
  `table` tinyint(4) DEFAULT NULL COMMENT '1微擎2tg',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_credit_record`
--

LOCK TABLES `ims_tg_credit_record` WRITE;
/*!40000 ALTER TABLE `ims_tg_credit_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_credit_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_delivery_price`
--

DROP TABLE IF EXISTS `ims_tg_delivery_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_delivery_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `province` varchar(12) NOT NULL,
  `city` varchar(12) NOT NULL,
  `district` varchar(12) NOT NULL,
  `first_weight` varchar(20) NOT NULL,
  `first_fee` varchar(20) NOT NULL,
  `additional_weight` varchar(20) NOT NULL,
  `additional_fee` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`template_id`),
  KEY `district` (`province`,`city`,`district`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_delivery_price`
--

LOCK TABLES `ims_tg_delivery_price` WRITE;
/*!40000 ALTER TABLE `ims_tg_delivery_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_delivery_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_delivery_template`
--

DROP TABLE IF EXISTS `ims_tg_delivery_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_delivery_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `merchantid` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `region` longtext NOT NULL,
  `data` longtext NOT NULL,
  `updatetime` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_delivery_template`
--

LOCK TABLES `ims_tg_delivery_template` WRITE;
/*!40000 ALTER TABLE `ims_tg_delivery_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_delivery_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_dispatch`
--

DROP TABLE IF EXISTS `ims_tg_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_dispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `dispatchname` varchar(50) NOT NULL DEFAULT '' COMMENT '配送名称',
  `dispatchtype` int(11) NOT NULL DEFAULT '0' COMMENT '配送方式0快递1自提',
  `displayorder` int(11) DEFAULT '0' COMMENT '排序',
  `firstprice` decimal(10,2) DEFAULT '0.00' COMMENT '默认运费',
  `areas` text COMMENT '快递地区',
  `carriers` text COMMENT '自提地区',
  `enabled` int(11) NOT NULL DEFAULT '0' COMMENT '1启用',
  `merchantid` int(11) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_dispatch`
--

LOCK TABLES `ims_tg_dispatch` WRITE;
/*!40000 ALTER TABLE `ims_tg_dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_gift`
--

DROP TABLE IF EXISTS `ims_tg_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_gift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL COMMENT '活动名称',
  `uniacid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL COMMENT '商品id',
  `starttime` varchar(145) DEFAULT NULL COMMENT '活动开启时间',
  `endtime` varchar(145) DEFAULT NULL COMMENT '活动结束时间',
  `gettime` int(11) DEFAULT NULL COMMENT '有效领取时间',
  `times` int(11) DEFAULT NULL COMMENT '领取次数',
  `sendnum` int(11) DEFAULT NULL COMMENT '赠送数量',
  `getnum` int(11) DEFAULT NULL COMMENT '领取数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_gift`
--

LOCK TABLES `ims_tg_gift` WRITE;
/*!40000 ALTER TABLE `ims_tg_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_goods`
--

DROP TABLE IF EXISTS `ims_tg_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) NOT NULL COMMENT '公众号的id',
  `gname` varchar(225) NOT NULL COMMENT '商品名称',
  `fk_typeid` int(10) unsigned DEFAULT NULL COMMENT '一级分类id',
  `gnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `groupnum` int(10) unsigned NOT NULL COMMENT '最低拼团人数',
  `mprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `gprice` decimal(10,2) NOT NULL COMMENT '团购价',
  `oprice` decimal(10,2) NOT NULL COMMENT '单买价',
  `gdesc` text NOT NULL COMMENT '商品简介',
  `gdetaile` longtext NOT NULL COMMENT '商品图文详情',
  `gimg` varchar(225) NOT NULL COMMENT '首页图片',
  `isshow` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1上架2下架3售罄4回收站',
  `isnew` int(2) DEFAULT NULL COMMENT '1最新上架',
  `ishot` int(2) DEFAULT NULL COMMENT '1火爆',
  `isrecommand` int(2) DEFAULT NULL COMMENT '1推荐',
  `isdiscount` int(2) DEFAULT NULL COMMENT '1优惠',
  `salenum` int(10) unsigned NOT NULL COMMENT '销量',
  `displayorder` int(11) DEFAULT NULL COMMENT '首页排序',
  `credits` int(11) DEFAULT NULL COMMENT '单次购买获得积分',
  `endtime` int(11) NOT NULL COMMENT '团购限时（小时数）',
  `hasoption` int(11) NOT NULL COMMENT '1启用商品规格',
  `yunfei_id` int(11) NOT NULL COMMENT '运费模板ID',
  `is_hexiao` int(2) NOT NULL COMMENT '1支持核销',
  `hexiao_id` varchar(115) NOT NULL COMMENT '核销门店ID集',
  `is_share` int(2) DEFAULT NULL COMMENT '1开启分享',
  `is_discount` int(2) DEFAULT NULL COMMENT '1开启2关闭',
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  `share_title` varchar(200) NOT NULL COMMENT '分享标题',
  `share_image` varchar(250) NOT NULL COMMENT '分享图片',
  `share_desc` varchar(200) NOT NULL COMMENT '分享简介',
  `group_level` varchar(1000) NOT NULL COMMENT '阶梯团集',
  `group_level_status` int(11) NOT NULL COMMENT '2开启1关闭',
  `one_limit` int(11) DEFAULT NULL COMMENT '单次购买数',
  `many_limit` int(11) DEFAULT NULL COMMENT '单人购买数',
  `firstdiscount` decimal(10,2) DEFAULT NULL COMMENT '团长优惠金额',
  `category_childid` int(11) DEFAULT NULL COMMENT '二级分类子类ID',
  `category_parentid` int(11) DEFAULT NULL COMMENT '二级分类父类ID',
  `createtime` int(10) unsigned NOT NULL COMMENT '最后修改时间',
  `pv` int(11) DEFAULT NULL COMMENT '浏览次数',
  `uv` int(11) DEFAULT NULL COMMENT '浏览人数',
  `unit` varchar(32) DEFAULT NULL COMMENT '单位',
  `goodstab` varchar(32) DEFAULT NULL COMMENT '商品标签',
  `op_one_limit` int(11) DEFAULT NULL COMMENT '单次购买数',
  `first_free` int(11) DEFAULT NULL COMMENT '1开启团长免单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_goods`
--

LOCK TABLES `ims_tg_goods` WRITE;
/*!40000 ALTER TABLE `ims_tg_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_goods_atlas`
--

DROP TABLE IF EXISTS `ims_tg_goods_atlas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_goods_atlas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `g_id` int(11) NOT NULL COMMENT '商品id',
  `thumb` varchar(145) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_goods_atlas`
--

LOCK TABLES `ims_tg_goods_atlas` WRITE;
/*!40000 ALTER TABLE `ims_tg_goods_atlas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_goods_atlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_goods_option`
--

DROP TABLE IF EXISTS `ims_tg_goods_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_goods_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规格详情',
  `thumb` varchar(60) DEFAULT '' COMMENT '规格图片',
  `productprice` decimal(10,2) DEFAULT '0.00' COMMENT '单独购买价',
  `marketprice` decimal(10,2) DEFAULT '0.00' COMMENT '团购价',
  `costprice` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
  `displayorder` int(11) DEFAULT '0',
  `specs` varchar(445) DEFAULT NULL,
  `stock` varchar(445) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_goods_option`
--

LOCK TABLES `ims_tg_goods_option` WRITE;
/*!40000 ALTER TABLE `ims_tg_goods_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_goods_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_goods_param`
--

DROP TABLE IF EXISTS `ims_tg_goods_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `goodsid` int(10) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名称',
  `value` text NOT NULL COMMENT '属性值',
  `displayorder` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `indx_goodsid` (`goodsid`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_goods_param`
--

LOCK TABLES `ims_tg_goods_param` WRITE;
/*!40000 ALTER TABLE `ims_tg_goods_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_goods_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_group`
--

DROP TABLE IF EXISTS `ims_tg_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `groupnumber` varchar(115) NOT NULL COMMENT '团编号',
  `goodsid` int(11) NOT NULL COMMENT '商品ID',
  `goodsname` varchar(1024) NOT NULL COMMENT '商品名称',
  `groupstatus` int(11) NOT NULL COMMENT '团状态',
  `neednum` int(11) NOT NULL COMMENT '所需人数',
  `lacknum` int(11) NOT NULL COMMENT '缺少人数',
  `starttime` varchar(225) NOT NULL COMMENT '开团时间',
  `endtime` varchar(225) NOT NULL COMMENT '到期时间',
  `grouptype` int(11) NOT NULL COMMENT '1同2异3普通4单',
  `isshare` int(11) NOT NULL COMMENT '1分享2不分享',
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  `price` varchar(11) NOT NULL COMMENT '团价格',
  `successtime` varchar(45) DEFAULT NULL COMMENT '团成功时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_group`
--

LOCK TABLES `ims_tg_group` WRITE;
/*!40000 ALTER TABLE `ims_tg_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_helpbuy`
--

DROP TABLE IF EXISTS `ims_tg_helpbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_helpbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_helpbuy`
--

LOCK TABLES `ims_tg_helpbuy` WRITE;
/*!40000 ALTER TABLE `ims_tg_helpbuy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_helpbuy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_member`
--

DROP TABLE IF EXISTS `ims_tg_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众账号id',
  `openid` varchar(100) NOT NULL COMMENT '微信会员openID',
  `mobile` varchar(45) DEFAULT NULL COMMENT '手机号',
  `realname` varchar(132) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `address` varchar(132) DEFAULT NULL COMMENT '常用地址',
  `tag` varchar(1000) DEFAULT NULL COMMENT '其他属性集',
  `credit1` decimal(10,2) DEFAULT '0.00' COMMENT '积分',
  `credit2` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_member`
--

LOCK TABLES `ims_tg_member` WRITE;
/*!40000 ALTER TABLE `ims_tg_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_merchant`
--

DROP TABLE IF EXISTS `ims_tg_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(145) NOT NULL,
  `name` varchar(145) NOT NULL COMMENT '商家名称',
  `logo` varchar(225) NOT NULL COMMENT '商家logo',
  `industry` varchar(45) DEFAULT NULL COMMENT '行业',
  `address` varchar(115) DEFAULT NULL COMMENT '商家地址',
  `linkman_name` varchar(145) DEFAULT NULL COMMENT '联系人姓名',
  `linkman_mobile` varchar(145) DEFAULT NULL COMMENT '联系电话',
  `thumb` varchar(255) DEFAULT NULL COMMENT '介绍图片',
  `detail` varchar(1222) DEFAULT NULL COMMENT '简介',
  `salenum` int(11) DEFAULT NULL COMMENT '商家销量',
  `open` int(11) DEFAULT NULL COMMENT '2不分配后台权限',
  `uname` varchar(45) DEFAULT NULL COMMENT '商家帐号',
  `password` varchar(145) DEFAULT NULL COMMENT '商家密码',
  `uid` int(11) DEFAULT NULL COMMENT '商家用户ID',
  `messageopenid` varchar(145) DEFAULT NULL COMMENT '被通知者openid',
  `goodsnum` int(11) DEFAULT NULL COMMENT '商家上传商品数量上限',
  `percent` varchar(111) DEFAULT NULL COMMENT '商家上缴佣金百分比',
  `createtime` varchar(115) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_merchant`
--

LOCK TABLES `ims_tg_merchant` WRITE;
/*!40000 ALTER TABLE `ims_tg_merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_merchant_account`
--

DROP TABLE IF EXISTS `ims_tg_merchant_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_merchant_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  `uid` int(11) NOT NULL COMMENT '操作员id',
  `amount` decimal(10,2) NOT NULL COMMENT '交易总金额',
  `updatetime` varchar(45) NOT NULL COMMENT '上次结算时间',
  `no_money` decimal(10,2) NOT NULL COMMENT '目前未结算金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_merchant_account`
--

LOCK TABLES `ims_tg_merchant_account` WRITE;
/*!40000 ALTER TABLE `ims_tg_merchant_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_merchant_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_merchant_record`
--

DROP TABLE IF EXISTS `ims_tg_merchant_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_merchant_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `merchantid` int(11) NOT NULL COMMENT '商家id',
  `money` varchar(45) NOT NULL COMMENT '本次结算金额',
  `uid` int(11) NOT NULL COMMENT '操作员id',
  `createtime` varchar(45) NOT NULL COMMENT '结算时间',
  `orderno` varchar(45) NOT NULL,
  `commission` varchar(45) NOT NULL,
  `percent` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_merchant_record`
--

LOCK TABLES `ims_tg_merchant_record` WRITE;
/*!40000 ALTER TABLE `ims_tg_merchant_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_merchant_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_nav`
--

DROP TABLE IF EXISTS `ims_tg_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uniacid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_nav`
--

LOCK TABLES `ims_tg_nav` WRITE;
/*!40000 ALTER TABLE `ims_tg_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_notice`
--

DROP TABLE IF EXISTS `ims_tg_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uniacid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `enabled` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_notice`
--

LOCK TABLES `ims_tg_notice` WRITE;
/*!40000 ALTER TABLE `ims_tg_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_oplog`
--

DROP TABLE IF EXISTS `ims_tg_oplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT NULL,
  `describe` varchar(225) DEFAULT NULL COMMENT '操作描述',
  `view_url` varchar(225) DEFAULT NULL COMMENT '操作界面url',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `data` varchar(1024) DEFAULT NULL COMMENT '操作数据',
  `createtime` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `user` varchar(32) DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_oplog`
--

LOCK TABLES `ims_tg_oplog` WRITE;
/*!40000 ALTER TABLE `ims_tg_oplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_oplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_order`
--

DROP TABLE IF EXISTS `ims_tg_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) NOT NULL,
  `openid` varchar(145) NOT NULL,
  `helpbuy_opneid` varchar(145) DEFAULT NULL COMMENT '代付人openid',
  `gnum` int(11) NOT NULL COMMENT '购买数量',
  `ptime` varchar(20) DEFAULT NULL COMMENT '支付成功时间',
  `sendtime` varchar(20) DEFAULT NULL COMMENT '发货时间',
  `gettime` varchar(20) DEFAULT NULL COMMENT '收货时间',
  `orderno` varchar(50) NOT NULL COMMENT '订单编号',
  `price` varchar(45) NOT NULL COMMENT '实际支付金额',
  `goodsprice` varchar(45) NOT NULL COMMENT '商品价格',
  `freight` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `status` int(2) NOT NULL COMMENT '0未支付,1支付，2待发货，3已发货，4已签收，5已取消，6待退款，7已退款，8部分退款',
  `addressid` int(11) NOT NULL COMMENT '地址id',
  `addresstype` int(11) NOT NULL COMMENT '地址类型，1公司2家庭',
  `g_id` int(11) NOT NULL COMMENT '商品id',
  `tuan_id` int(11) NOT NULL COMMENT '团id',
  `credits` int(11) DEFAULT NULL COMMENT '积分',
  `is_usecard` int(11) DEFAULT NULL COMMENT '1优惠过（优惠券，团长优惠）',
  `is_tuan` int(2) NOT NULL COMMENT '是否为团1为团0为单人2多余人退款',
  `pay_price` varchar(45) NOT NULL COMMENT '运费加商品费',
  `pay_type` int(4) DEFAULT NULL COMMENT '支付方式',
  `starttime` varchar(45) NOT NULL COMMENT '开始时间',
  `endtime` int(45) NOT NULL COMMENT '结束时间（小时）',
  `tuan_first` int(11) DEFAULT NULL COMMENT '1团长',
  `express` varchar(50) DEFAULT NULL COMMENT '快递公司名称',
  `expresssn` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `transid` varchar(50) DEFAULT NULL COMMENT '微信订单号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `optionid` int(11) DEFAULT NULL COMMENT '规格ID',
  `addname` varchar(50) NOT NULL COMMENT '收货人姓名',
  `mobile` varchar(50) NOT NULL COMMENT '收货人电话',
  `address` varchar(300) NOT NULL COMMENT '收货人地址',
  `checkpay` int(2) DEFAULT NULL COMMENT '1该订单号已被支付（代付）',
  `is_hexiao` int(2) DEFAULT NULL COMMENT '1核销0不是核销',
  `hexiaoma` varchar(45) DEFAULT NULL COMMENT '核销码',
  `veropenid` varchar(200) DEFAULT NULL COMMENT '核销人openid',
  `merchantid` int(11) DEFAULT NULL COMMENT '商家id',
  `optionname` varchar(50) DEFAULT NULL COMMENT '规格名称',
  `issettlement` int(3) DEFAULT NULL COMMENT '0未结算订单1已结算',
  `message` varchar(200) DEFAULT NULL COMMENT '代付留言',
  `ordertype` int(3) DEFAULT NULL COMMENT '1为代付订单',
  `othername` varchar(45) DEFAULT NULL COMMENT '代付人姓名',
  `createtime` varchar(45) NOT NULL COMMENT '订单生成时间',
  `successtime` varchar(45) DEFAULT NULL COMMENT '团成功时间',
  `adminremark` text COMMENT '卖家备注',
  `discount_fee` varchar(32) DEFAULT NULL COMMENT '优惠券优惠的钱',
  `first_fee` varchar(32) DEFAULT NULL COMMENT '团长优惠的钱',
  `couponid` int(11) DEFAULT NULL COMMENT '优惠券id',
  `bdeltime` int(11) DEFAULT NULL COMMENT '预约核销时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_order`
--

LOCK TABLES `ims_tg_order` WRITE;
/*!40000 ALTER TABLE `ims_tg_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_order_print`
--

DROP TABLE IF EXISTS `ims_tg_order_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_order_print` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `pid` int(3) NOT NULL,
  `oid` int(10) NOT NULL,
  `foid` varchar(50) NOT NULL,
  `status` int(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_order_print`
--

LOCK TABLES `ims_tg_order_print` WRITE;
/*!40000 ALTER TABLE `ims_tg_order_print` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_order_print` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_page`
--

DROP TABLE IF EXISTS `ims_tg_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `click_pv` varchar(10) NOT NULL,
  `click_uv` varchar(10) NOT NULL,
  `enter_pv` varchar(10) NOT NULL,
  `enter_uv` varchar(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_page`
--

LOCK TABLES `ims_tg_page` WRITE;
/*!40000 ALTER TABLE `ims_tg_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_print`
--

DROP TABLE IF EXISTS `ims_tg_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `print_no` varchar(30) NOT NULL,
  `key` varchar(30) NOT NULL,
  `print_nums` int(3) NOT NULL,
  `qrcode_link` varchar(100) NOT NULL,
  `status` int(3) NOT NULL,
  `mode` int(11) NOT NULL,
  `member_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_print`
--

LOCK TABLES `ims_tg_print` WRITE;
/*!40000 ALTER TABLE `ims_tg_print` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_print` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_puv`
--

DROP TABLE IF EXISTS `ims_tg_puv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_puv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) NOT NULL,
  `pv` varchar(20) DEFAULT NULL COMMENT '总浏览人次',
  `uv` varchar(50) NOT NULL COMMENT '总浏览人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_puv`
--

LOCK TABLES `ims_tg_puv` WRITE;
/*!40000 ALTER TABLE `ims_tg_puv` DISABLE KEYS */;
INSERT INTO `ims_tg_puv` VALUES (1,'1','14','1');
/*!40000 ALTER TABLE `ims_tg_puv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_puv_record`
--

DROP TABLE IF EXISTS `ims_tg_puv_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_puv_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` varchar(45) NOT NULL,
  `openid` varchar(145) NOT NULL,
  `goodsid` int(11) NOT NULL COMMENT '商品id',
  `createtime` varchar(120) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_puv_record`
--

LOCK TABLES `ims_tg_puv_record` WRITE;
/*!40000 ALTER TABLE `ims_tg_puv_record` DISABLE KEYS */;
INSERT INTO `ims_tg_puv_record` VALUES (1,'1','',0,'1494914253'),(2,'1','',0,'1494914256'),(3,'1','',0,'1494914331'),(4,'1','',0,'1494914332'),(5,'1','',0,'1494914337'),(6,'1','',0,'1494914337'),(7,'1','',0,'1494914338'),(8,'1','',0,'1494914340'),(9,'1','',0,'1494914340'),(10,'1','',0,'1494914341'),(11,'1','',0,'1494914463'),(12,'1','',0,'1494914463'),(13,'1','',0,'1494986238'),(14,'1','',0,'1494986239');
/*!40000 ALTER TABLE `ims_tg_puv_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_refund_record`
--

DROP TABLE IF EXISTS `ims_tg_refund_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_refund_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1手机端2Web端3最后一人退款4部分退款',
  `goodsid` int(11) NOT NULL COMMENT '商品ID',
  `payfee` varchar(100) NOT NULL COMMENT '支付金额',
  `refundfee` varchar(100) NOT NULL COMMENT '退还金额',
  `transid` varchar(115) NOT NULL COMMENT '订单编号',
  `refund_id` varchar(115) NOT NULL COMMENT '微信退款单号',
  `refundername` varchar(100) NOT NULL COMMENT '退款人姓名',
  `refundermobile` varchar(100) NOT NULL COMMENT '退款人电话',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `createtime` varchar(45) NOT NULL COMMENT '退款时间',
  `status` int(11) NOT NULL COMMENT '0未成功1成功',
  `orderid` varchar(45) NOT NULL COMMENT '订单id',
  `merchantid` int(11) NOT NULL COMMENT '商家id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_refund_record`
--

LOCK TABLES `ims_tg_refund_record` WRITE;
/*!40000 ALTER TABLE `ims_tg_refund_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_refund_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_saler`
--

DROP TABLE IF EXISTS `ims_tg_saler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_saler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `openid` varchar(255) DEFAULT '',
  `storeid` varchar(225) DEFAULT '' COMMENT '所属门店id集',
  `nickname` varchar(145) NOT NULL COMMENT '昵称',
  `avatar` varchar(225) NOT NULL COMMENT '头像',
  `status` tinyint(3) DEFAULT '0' COMMENT '1启用',
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`),
  KEY `idx_storeid` (`storeid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_saler`
--

LOCK TABLES `ims_tg_saler` WRITE;
/*!40000 ALTER TABLE `ims_tg_saler` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_saler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_scratch`
--

DROP TABLE IF EXISTS `ims_tg_scratch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_scratch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '活动名称',
  `starttime` varchar(32) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(32) DEFAULT NULL COMMENT '结束时间\n',
  `detail` varchar(145) DEFAULT NULL COMMENT '说明',
  `use_credits` varchar(32) DEFAULT NULL COMMENT '需花费积分',
  `get_credits` varchar(32) DEFAULT NULL COMMENT '得到积分',
  `join_times` int(11) DEFAULT NULL COMMENT '参与次数',
  `winning_rate` varchar(32) DEFAULT NULL COMMENT '中奖率',
  `prize` varchar(1024) DEFAULT NULL COMMENT '奖品',
  `uniacid` int(11) DEFAULT NULL,
  `only_others` int(11) DEFAULT NULL COMMENT '1为只送积分给未中奖人',
  `status` int(11) DEFAULT NULL COMMENT '1开启',
  `alert_logo` varchar(145) DEFAULT NULL COMMENT '弹出的抽奖提示图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_scratch`
--

LOCK TABLES `ims_tg_scratch` WRITE;
/*!40000 ALTER TABLE `ims_tg_scratch` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_scratch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_scratch_record`
--

DROP TABLE IF EXISTS `ims_tg_scratch_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_scratch_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `openid` varchar(145) NOT NULL COMMENT '参与人openid',
  `activity_id` int(11) NOT NULL COMMENT '活动id',
  `type` varchar(45) DEFAULT NULL COMMENT '活动类型',
  `status` int(11) DEFAULT NULL COMMENT '2待领取3已领取',
  `prize` varchar(445) DEFAULT NULL COMMENT '奖品详情',
  `createtime` varchar(145) DEFAULT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_scratch_record`
--

LOCK TABLES `ims_tg_scratch_record` WRITE;
/*!40000 ALTER TABLE `ims_tg_scratch_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_scratch_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_setting`
--

DROP TABLE IF EXISTS `ims_tg_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_setting`
--

LOCK TABLES `ims_tg_setting` WRITE;
/*!40000 ALTER TABLE `ims_tg_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_spec`
--

DROP TABLE IF EXISTS `ims_tg_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `displaytype` tinyint(3) unsigned NOT NULL,
  `content` text NOT NULL,
  `goodsid` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_spec`
--

LOCK TABLES `ims_tg_spec` WRITE;
/*!40000 ALTER TABLE `ims_tg_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_spec_item`
--

DROP TABLE IF EXISTS `ims_tg_spec_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_spec_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) DEFAULT '0',
  `specid` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `show` int(11) DEFAULT '0',
  `displayorder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `indx_weid` (`uniacid`),
  KEY `indx_specid` (`specid`),
  KEY `indx_show` (`show`),
  KEY `indx_displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_spec_item`
--

LOCK TABLES `ims_tg_spec_item` WRITE;
/*!40000 ALTER TABLE `ims_tg_spec_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_spec_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_store`
--

DROP TABLE IF EXISTS `ims_tg_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `storename` varchar(255) DEFAULT '' COMMENT '店铺名称',
  `address` varchar(255) DEFAULT '' COMMENT '店铺地址',
  `tel` varchar(255) DEFAULT '' COMMENT '电话',
  `lat` varchar(255) DEFAULT '' COMMENT '纬度',
  `lng` varchar(255) DEFAULT '' COMMENT '经度',
  `status` tinyint(3) DEFAULT '0' COMMENT '1启用',
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  `createtime` varchar(45) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_store`
--

LOCK TABLES `ims_tg_store` WRITE;
/*!40000 ALTER TABLE `ims_tg_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_user_menu`
--

DROP TABLE IF EXISTS `ims_tg_user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_user_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `extend_title` varchar(50) NOT NULL,
  `extend_url` varchar(255) NOT NULL,
  `extend_icon` varchar(255) NOT NULL,
  `active_urls` text NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_user_menu`
--

LOCK TABLES `ims_tg_user_menu` WRITE;
/*!40000 ALTER TABLE `ims_tg_user_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_user_node`
--

DROP TABLE IF EXISTS `ims_tg_user_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_user_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(300) NOT NULL,
  `do` varchar(255) NOT NULL,
  `ac` varchar(32) DEFAULT NULL,
  `op` varchar(32) DEFAULT NULL,
  `ac_id` int(11) DEFAULT NULL,
  `do_id` int(6) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`do_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_user_node`
--

LOCK TABLES `ims_tg_user_node` WRITE;
/*!40000 ALTER TABLE `ims_tg_user_node` DISABLE KEYS */;
INSERT INTO `ims_tg_user_node` VALUES (97,'店铺设置','','store','setting','copyright',96,95,'',0,3,2),(96,'店铺设置','','store','setting','',0,95,'',0,2,2),(95,'店铺','','store','','',0,0,'',0,1,2),(89,'设置商品属性','','goods','goods','setgoodsproperty',84,83,'',0,3,2),(88,'批量设置','','goods','goods','batch',84,83,'',0,3,2),(87,'上下架/售罄/删除/彻底删除','','goods','goods','single_op',84,83,'',0,3,2),(86,'新增/修改商品','','goods','goods','post',84,83,'',0,3,2),(85,'商品列表','','goods','goods','display',84,83,'',0,3,2),(84,'商品管理','','goods','goods','',0,83,'',0,2,2),(83,'商品','','goods','','',0,0,'',0,1,2),(106,'退款','','order','fetch','refund',60,48,'',0,3,2),(105,'取消发货','','order','fetch','cancelsend',60,48,'',0,3,2),(104,'发货','','order','fetch','confirmsend',60,48,'',0,3,2),(103,'确认付款','','order','fetch','confrimpay',60,48,'',0,3,2),(102,'导出','','order','group','output',98,48,'',0,3,2),(101,'后台核销','','order','group','autogroup',98,48,'',0,3,2),(100,'团详情','','order','group','group_detail',98,48,'',0,3,2),(99,'订单列表','','order','group','all',98,48,'',0,3,2),(98,'团管理','','order','group','',0,48,'',0,2,2),(82,'订单详情','','order','refund','initsync',80,48,'',0,3,2),(81,'订单列表','','order','refund','display',80,48,'',0,3,2),(80,'批量退款','','order','refund','',0,48,'',0,2,2),(79,'导入订单','','order','import','import',76,48,'',0,3,2),(78,'导出订单','','order','import','output',76,48,'',0,3,2),(77,'发货列表','','order','import','display',76,48,'',0,3,2),(76,'批量发货','','order','import','',0,48,'',0,2,2),(75,'删除','','order','delivery','delete',71,48,'',0,3,2),(74,'是否启用','','order','delivery','editstatus',71,48,'',0,3,2),(73,'新增/编辑','','order','delivery','post',71,48,'',0,3,2),(72,'配送列表','','order','delivery','display',71,48,'',0,3,2),(71,'运费模板','','order','delivery','',0,48,'',0,2,2),(64,'导出','','order','fetch','output',60,48,'',0,3,2),(63,'后台核销','','order','fetch','confirm',60,48,'',0,3,2),(62,'订单详情','','order','fetch','detail',60,48,'',0,3,2),(61,'订单列表','','order','fetch','display',60,48,'',0,3,2),(60,'自提订单','','order','fetch','',0,48,'',0,2,2),(59,'退款','','order','order','refund',49,48,'',0,3,2),(58,'取消发货','','order','order','cancelsend',49,48,'',0,3,2),(57,'发货','','order','order','confirmsend',49,48,'',0,3,2),(56,'确认付款','','order','order','confrimpay',49,48,'',0,3,2),(55,'修改收货地址','','order','order','address',49,48,'',0,3,2),(54,'卖家备注','','order','order','remark',49,48,'',0,3,2),(53,'导出','','order','order','output',49,48,'',0,3,2),(52,'订单详情','','order','order','detail',49,48,'',0,3,2),(51,'订单列表','','order','order','received',49,48,'',0,3,2),(50,'订单概况','','order','order','summary',49,48,'',0,3,2),(49,'订单管理','','order','order','',0,48,'',0,2,2),(48,'订单','','order','','',0,0,'',0,1,2),(113,'概要统计','','data','home_data','display',112,34,'',0,3,2),(112,'概要统计','','data','home_data','',0,34,'',0,2,2),(40,'退款日志','','data','refund_log','display',39,34,'',0,3,2),(39,'退款日志','','data','refund_log','',0,34,'',0,2,2),(38,'订单统计','','data','order_data','display',37,34,'',0,3,2),(37,'订单统计','','data','order_data','',0,34,'',0,2,2),(36,'商品统计','','data','goods_data','display',35,34,'',0,3,2),(35,'商品统计','','data','goods_data','',0,34,'',0,2,2),(34,'数据中心','','data','','',0,0,'',0,1,2),(111,'插件列表','','application','plugins','list',110,1,'',0,3,2),(110,'插件列表','','application','plugins','',0,1,'',0,2,2),(33,'选择商品','','application','ladder','ajax',29,1,'',0,3,2),(32,'编辑阶梯团','','application','ladder','edit',29,1,'',0,3,2),(31,'新建阶梯团','','application','ladder','create',29,1,'',0,3,2),(30,'阶梯团列表','','application','ladder','list',29,1,'',0,3,2),(29,'阶梯团','','application','ladder','',0,1,'',0,2,2),(17,'选择门店','','application','bdelete','selectstore',12,1,'',0,3,2),(16,'选择粉丝','','application','bdelete','selectsaler',12,1,'',0,3,2),(15,'核销员','','application','bdelete','saler',12,1,'',0,3,2),(14,'门店管理','','application','bdelete','store',12,1,'',0,3,2),(13,'核销入口','','application','bdelete','hx_entry',12,1,'',0,3,2),(12,'核销管理','','application','bdelete','',0,1,'',0,2,2),(1,'应用与营销','','application','','',0,0,'',0,1,2);
/*!40000 ALTER TABLE `ims_tg_user_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_tg_user_role`
--

DROP TABLE IF EXISTS `ims_tg_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_tg_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `nodes` text NOT NULL COMMENT '权限集',
  `merchantid` int(11) NOT NULL COMMENT '商家ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_tg_user_role`
--

LOCK TABLES `ims_tg_user_role` WRITE;
/*!40000 ALTER TABLE `ims_tg_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_tg_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account`
--

DROP TABLE IF EXISTS `ims_uni_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account`
--

LOCK TABLES `ims_uni_account` WRITE;
/*!40000 ALTER TABLE `ims_uni_account` DISABLE KEYS */;
INSERT INTO `ims_uni_account` VALUES (1,-1,'微擎团队','一个朝气蓬勃的团队',1,5),(2,0,'梦迪是小仙女','的点点滴滴',2,5);
/*!40000 ALTER TABLE `ims_uni_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_group`
--

DROP TABLE IF EXISTS `ims_uni_account_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_group`
--

LOCK TABLES `ims_uni_account_group` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_group` DISABLE KEYS */;
INSERT INTO `ims_uni_account_group` VALUES (4,1,-1),(5,2,-1);
/*!40000 ALTER TABLE `ims_uni_account_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_menus`
--

DROP TABLE IF EXISTS `ims_uni_account_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_menus`
--

LOCK TABLES `ims_uni_account_menus` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_account_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_modules`
--

DROP TABLE IF EXISTS `ims_uni_account_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_modules`
--

LOCK TABLES `ims_uni_account_modules` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_modules` DISABLE KEYS */;
INSERT INTO `ims_uni_account_modules` VALUES (1,1,'basic',1,''),(2,1,'news',1,''),(3,1,'music',1,''),(4,1,'userapi',1,'a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}'),(5,1,'recharge',1,''),(10,1,'feng_fightgroups',1,''),(7,1,'mon_weishare',1,''),(8,1,'mon_xkwkj',1,''),(9,1,'jy_reads',1,''),(11,2,'feng_fightgroups',1,''),(12,2,'mon_weishare',1,''),(13,2,'mon_xkwkj',1,''),(14,2,'jy_reads',1,''),(15,2,'userapi',1,'a:6:{i:1;b:1;i:2;b:1;i:3;b:1;i:4;b:1;i:5;b:1;i:6;b:1;}');
/*!40000 ALTER TABLE `ims_uni_account_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_account_users`
--

DROP TABLE IF EXISTS `ims_uni_account_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_account_users`
--

LOCK TABLES `ims_uni_account_users` WRITE;
/*!40000 ALTER TABLE `ims_uni_account_users` DISABLE KEYS */;
INSERT INTO `ims_uni_account_users` VALUES (10,1,2,'owner',0),(11,2,2,'owner',0);
/*!40000 ALTER TABLE `ims_uni_account_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_group`
--

DROP TABLE IF EXISTS `ims_uni_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(15000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_group`
--

LOCK TABLES `ims_uni_group` WRITE;
/*!40000 ALTER TABLE `ims_uni_group` DISABLE KEYS */;
INSERT INTO `ims_uni_group` VALUES (1,'体验套餐服务','N;','N;',0);
/*!40000 ALTER TABLE `ims_uni_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_settings`
--

DROP TABLE IF EXISTS `ims_uni_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `shortcuts` text NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_settings`
--

LOCK TABLES `ims_uni_settings` WRITE;
/*!40000 ALTER TABLE `ims_uni_settings` DISABLE KEYS */;
INSERT INTO `ims_uni_settings` VALUES (1,'a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}','a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}',0,'a:1:{s:6:\"status\";i:0;}','a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}','a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','a:4:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}}','',1,0,'','',0,'',0,0,''),(2,'','',0,'','','a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','','',2,0,'','',0,'',0,0,'');
/*!40000 ALTER TABLE `ims_uni_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_uni_verifycode`
--

DROP TABLE IF EXISTS `ims_uni_verifycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_uni_verifycode`
--

LOCK TABLES `ims_uni_verifycode` WRITE;
/*!40000 ALTER TABLE `ims_uni_verifycode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_verifycode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_userapi_cache`
--

DROP TABLE IF EXISTS `ims_userapi_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_userapi_cache`
--

LOCK TABLES `ims_userapi_cache` WRITE;
/*!40000 ALTER TABLE `ims_userapi_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_userapi_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_userapi_reply`
--

DROP TABLE IF EXISTS `ims_userapi_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_userapi_reply`
--

LOCK TABLES `ims_userapi_reply` WRITE;
/*!40000 ALTER TABLE `ims_userapi_reply` DISABLE KEYS */;
INSERT INTO `ims_userapi_reply` VALUES (1,1,'\"城市名+天气\", 如: \"北京天气\"','weather.php','','',0),(2,2,'\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"','baike.php','','',0),(3,3,'\"@查询内容(中文或英文)\"','translate.php','','',0),(4,4,'\"日历\", \"万年历\", \"黄历\"或\"几号\"','calendar.php','','',0),(5,5,'\"新闻\"','news.php','','',0),(6,6,'\"快递+单号\", 如: \"申通1200041125\"','express.php','','',0);
/*!40000 ALTER TABLE `ims_userapi_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users`
--

DROP TABLE IF EXISTS `ims_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users`
--

LOCK TABLES `ims_users` WRITE;
/*!40000 ALTER TABLE `ims_users` DISABLE KEYS */;
INSERT INTO `ims_users` VALUES (1,0,'letuadmin','88a820eb70192a77caa1d77d7bc41a21883550bd','12ea7e01',0,0,1494471713,'',1495157387,'222.129.189.17','',0,0),(2,3,'北京乐兔','5f2a73c9d3281ce0171282921ea3203431bed276','Lw3GZxWI',0,2,1494573260,'221.220.149.17',1494921520,'221.220.149.17','主管理员',1494573260,0),(3,1,'ceshiyonghu','1de583e2a622b3920bfbcfb7ea0ea19cd074c6bf','d8ddFqy8',0,2,1494573803,'221.220.149.17',1494832290,'221.220.149.17','',1494573803,0);
/*!40000 ALTER TABLE `ims_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_failed_login`
--

DROP TABLE IF EXISTS `ims_users_failed_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_failed_login`
--

LOCK TABLES `ims_users_failed_login` WRITE;
/*!40000 ALTER TABLE `ims_users_failed_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_failed_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_group`
--

DROP TABLE IF EXISTS `ims_users_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_group`
--

LOCK TABLES `ims_users_group` WRITE;
/*!40000 ALTER TABLE `ims_users_group` DISABLE KEYS */;
INSERT INTO `ims_users_group` VALUES (1,'体验用户组','a:1:{i:0;i:1;}',1,1,30),(2,'白金用户组','a:2:{i:0;i:1;i:1;i:-1;}',2,2,365),(3,'黄金用户组','a:1:{i:0;i:1;}',3,3,180);
/*!40000 ALTER TABLE `ims_users_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_invitation`
--

DROP TABLE IF EXISTS `ims_users_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_invitation`
--

LOCK TABLES `ims_users_invitation` WRITE;
/*!40000 ALTER TABLE `ims_users_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_permission`
--

DROP TABLE IF EXISTS `ims_users_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_permission`
--

LOCK TABLES `ims_users_permission` WRITE;
/*!40000 ALTER TABLE `ims_users_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_users_profile`
--

DROP TABLE IF EXISTS `ims_users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_users_profile`
--

LOCK TABLES `ims_users_profile` WRITE;
/*!40000 ALTER TABLE `ims_users_profile` DISABLE KEYS */;
INSERT INTO `ims_users_profile` VALUES (1,3,1494573803,'测试1','测试','','3399408231','','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(2,2,0,'','','','','','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `ims_users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_video_reply`
--

DROP TABLE IF EXISTS `ims_video_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_video_reply`
--

LOCK TABLES `ims_video_reply` WRITE;
/*!40000 ALTER TABLE `ims_video_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_video_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_voice_reply`
--

DROP TABLE IF EXISTS `ims_voice_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_voice_reply`
--

LOCK TABLES `ims_voice_reply` WRITE;
/*!40000 ALTER TABLE `ims_voice_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_voice_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wechat_attachment`
--

DROP TABLE IF EXISTS `ims_wechat_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wechat_attachment`
--

LOCK TABLES `ims_wechat_attachment` WRITE;
/*!40000 ALTER TABLE `ims_wechat_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wechat_news`
--

DROP TABLE IF EXISTS `ims_wechat_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wechat_news`
--

LOCK TABLES `ims_wechat_news` WRITE;
/*!40000 ALTER TABLE `ims_wechat_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_weishare`
--

DROP TABLE IF EXISTS `ims_weishare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_weishare` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL COMMENT '活动标题',
  `thumb` varchar(100) NOT NULL COMMENT '活动图片',
  `description` varchar(100) NOT NULL COMMENT '活动描述',
  `image` varchar(100) NOT NULL COMMENT '背景图片',
  `max` int(11) NOT NULL COMMENT '得分极限',
  `start` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分值',
  `step` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '助力积分',
  `steprandom` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '助力随机积分',
  `steptype` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '助力随机积分方式',
  `rule` varchar(2000) NOT NULL COMMENT '规则',
  `url` varchar(250) NOT NULL COMMENT '引导关注素材',
  `count` int(11) NOT NULL COMMENT '领卡数量限制',
  `background` varchar(100) NOT NULL COMMENT '背景颜色',
  `tip` varchar(100) NOT NULL COMMENT '提示语',
  `unit` varchar(100) NOT NULL COMMENT '单位',
  `cardname` varchar(100) NOT NULL COMMENT '卡片名称',
  `helplimit` int(11) NOT NULL COMMENT '每天助力限制次数',
  `totallimit` int(11) NOT NULL COMMENT '总得助力次数',
  `limittype` int(1) NOT NULL COMMENT '限制类型',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  `endtime` int(11) unsigned NOT NULL COMMENT '日期',
  `shareIcon` varchar(200) NOT NULL COMMENT '分享图标',
  `shareTitle` varchar(200) NOT NULL,
  `shareContent` varchar(200) NOT NULL,
  `copyright` varchar(100) NOT NULL COMMENT '版权',
  `showu` varchar(1) NOT NULL DEFAULT '0',
  `sortcount` varchar(100) NOT NULL DEFAULT '10',
  `zl_rule` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_weishare`
--

LOCK TABLES `ims_weishare` WRITE;
/*!40000 ALTER TABLE `ims_weishare` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_weishare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_weishare_firend`
--

DROP TABLE IF EXISTS `ims_weishare_firend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_weishare_firend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '分享用户的id',
  `sid` int(10) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_weishare_firend`
--

LOCK TABLES `ims_weishare_firend` WRITE;
/*!40000 ALTER TABLE `ims_weishare_firend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_weishare_firend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_weishare_reply`
--

DROP TABLE IF EXISTS `ims_weishare_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_weishare_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `sid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `new_title` varchar(100) NOT NULL COMMENT '图文标题',
  `new_pic` varchar(100) NOT NULL COMMENT '图文图片',
  `new_desc` varchar(100) NOT NULL COMMENT '图文描述',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_weishare_reply`
--

LOCK TABLES `ims_weishare_reply` WRITE;
/*!40000 ALTER TABLE `ims_weishare_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_weishare_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_weishare_setting`
--

DROP TABLE IF EXISTS `ims_weishare_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_weishare_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned DEFAULT NULL,
  `appid` varchar(200) NOT NULL COMMENT 'appid',
  `secret` varchar(200) NOT NULL COMMENT 'secret',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_weishare_setting`
--

LOCK TABLES `ims_weishare_setting` WRITE;
/*!40000 ALTER TABLE `ims_weishare_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_weishare_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_weishare_user`
--

DROP TABLE IF EXISTS `ims_weishare_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_weishare_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) NOT NULL DEFAULT '0',
  `from_user` varchar(50) NOT NULL COMMENT '用户唯一身份ID',
  `tel` varchar(50) NOT NULL,
  `income` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `createtime` int(10) unsigned NOT NULL COMMENT '日期',
  `helpcount` int(11) DEFAULT '0' COMMENT '助力次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_weishare_user`
--

LOCK TABLES `ims_weishare_user` WRITE;
/*!40000 ALTER TABLE `ims_weishare_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_weishare_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ims_wxcard_reply`
--

DROP TABLE IF EXISTS `ims_wxcard_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ims_wxcard_reply`
--

LOCK TABLES `ims_wxcard_reply` WRITE;
/*!40000 ALTER TABLE `ims_wxcard_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxcard_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-19 11:09:39
