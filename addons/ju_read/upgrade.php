<?php
//1.2
$sql="
CREATE TABLE  IF NOT EXISTS `ims_ju_read_prizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) DEFAULT '0',
  `rid` int(10) unsigned NOT NULL COMMENT '规则ID',
  `prizename` varchar(50) DEFAULT NULL COMMENT '名称',
  `thumb` varchar(255) DEFAULT NULL COMMENT '奖品图片',
  `prizenum` int(10) DEFAULT '0' COMMENT '总数量',
  `neednum` int(10) DEFAULT '0',
  `prizesy` int(10) DEFAULT '0' COMMENT '总数量',
  `displayorder` int(10) DEFAULT '0' COMMENT '规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
";
pdo_run($sql);
