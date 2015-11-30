-- MySQL dump 10.13  Distrib 5.6.23, for Linux (x86_64)
--
-- Host: 10.1.0.33    Database: ares_clunicode
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `_cache_logins`
--

DROP TABLE IF EXISTS `_cache_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_cache_logins` (
  `login_oid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(100) NOT NULL DEFAULT '',
  `login_password` varchar(32) NOT NULL DEFAULT '',
  `from_type` int(11) NOT NULL DEFAULT '0',
  `login_token` varchar(32) DEFAULT NULL,
  `login_accesslevel` int(11) NOT NULL DEFAULT '10',
  `login_lastaccess` int(11) unsigned DEFAULT NULL,
  `login_lastip` varchar(20) DEFAULT NULL,
  `login_is_active` tinyint(1) DEFAULT '0',
  `login_fee_point` int(11) DEFAULT '10',
  `login_online` int(10) unsigned NOT NULL DEFAULT '0',
  `login_wallow` int(11) NOT NULL DEFAULT '-1',
  `login_ban_begin` int(10) unsigned NOT NULL DEFAULT '0',
  `login_ban_finish` int(10) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(128) DEFAULT NULL,
  `release_reason` varchar(128) DEFAULT NULL,
  `logout_time` int(10) unsigned NOT NULL DEFAULT '0',
  `wallow_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_oid`),
  UNIQUE KEY `login_name_key` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10360 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_cache_region_load`
--

DROP TABLE IF EXISTS `_cache_region_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_cache_region_load` (
  `region_id` int(11) NOT NULL,
  `time_insec` int(10) unsigned NOT NULL,
  `account_num` int(11) NOT NULL,
  `inqueue_num` int(11) NOT NULL,
  PRIMARY KEY (`region_id`,`time_insec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_dbobj_stat`
--

DROP TABLE IF EXISTS `_dbobj_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_dbobj_stat` (
  `svr_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `obj_type` int(10) unsigned NOT NULL DEFAULT '0',
  `stat_time` int(10) unsigned NOT NULL DEFAULT '0',
  `in_select` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_insert` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_update` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_delete` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_finish` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_query` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_select` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_insert` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_update` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_delete` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_finish` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_query` bigint(20) unsigned NOT NULL DEFAULT '0',
  `in_bytes` bigint(20) unsigned NOT NULL DEFAULT '0',
  `out_bytes` bigint(20) unsigned NOT NULL DEFAULT '0',
  `svr_fail` bigint(20) unsigned NOT NULL DEFAULT '0',
  `db_fail` bigint(20) unsigned NOT NULL DEFAULT '0',
  `txn_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `txn_entry` bigint(20) unsigned NOT NULL DEFAULT '0',
  `txn_fail` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`svr_uid`,`obj_type`,`stat_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_account`
--

DROP TABLE IF EXISTS `_del_char_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_account` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `acc_gold` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acc_cash` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acc_state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_body`
--

DROP TABLE IF EXISTS `_del_char_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_body` (
  `body_uuid` varchar(36) NOT NULL,
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `age` int(11) unsigned NOT NULL DEFAULT '0',
  `change_age_time` int(11) unsigned NOT NULL DEFAULT '0',
  `thew` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `mp` int(11) NOT NULL DEFAULT '0',
  `attack` int(11) NOT NULL DEFAULT '0',
  `defense` int(11) NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `strength` int(11) NOT NULL DEFAULT '0',
  `wit` int(11) NOT NULL DEFAULT '0',
  `agile` int(11) NOT NULL DEFAULT '0',
  `potential` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) NOT NULL DEFAULT '0',
  `jinkRatio` float NOT NULL DEFAULT '0',
  `preventRatio` float NOT NULL DEFAULT '0',
  `killRatio` float NOT NULL DEFAULT '0',
  `tempid` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`body_uuid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_checkpoints`
--

DROP TABLE IF EXISTS `_del_char_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_checkpoints` (
  `char_oid` int(11) unsigned NOT NULL,
  `cpnt_00` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_01` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_02` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_03` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_04` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_05` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_06` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_07` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_08` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_09` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_10` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_11` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_12` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_13` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_14` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_15` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_16` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_17` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_18` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_19` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_20` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_21` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_22` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_23` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_24` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_25` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_26` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_27` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_28` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_29` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_30` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_31` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_circle_quest`
--

DROP TABLE IF EXISTS `_del_char_circle_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_circle_quest` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `cur_goal_day` int(11) NOT NULL DEFAULT '0',
  `cq_school_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_school_level` int(11) NOT NULL DEFAULT '0',
  `cq_school_count` int(11) NOT NULL DEFAULT '0',
  `cq_day_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_day_level` int(11) NOT NULL DEFAULT '0',
  `cq_week_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_week_level` int(11) NOT NULL DEFAULT '0',
  `cq_guild_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_level` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_count` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_farm_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_farm_level` int(11) NOT NULL DEFAULT '0',
  `cq_sjhg_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_sjhg_level` int(11) NOT NULL DEFAULT '0',
  `hole_build_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hole_build_level` int(11) NOT NULL DEFAULT '0',
  `hole_build_count` int(11) NOT NULL DEFAULT '0',
  `hole_study_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hole_study_level` int(11) NOT NULL DEFAULT '0',
  `hole_study_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_cultures`
--

DROP TABLE IF EXISTS `_del_char_cultures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_cultures` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `culture_type` int(11) NOT NULL DEFAULT '0',
  `culture_id` int(11) unsigned NOT NULL DEFAULT '0',
  `culture_state` int(11) NOT NULL DEFAULT '0',
  `culture_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`culture_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_currency`
--

DROP TABLE IF EXISTS `_del_char_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_currency` (
  `char_oid` int(10) unsigned NOT NULL,
  `vip_coin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vip_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vip_point` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vip_fund` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cash` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vipcoin_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `viptime_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vipcoin_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `viptime_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vipfund_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vipfund_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cash_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cash_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `isSetBindGold` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isSetBindSilver` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bind_cash_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bind_cash_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bind_cash_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `vip_start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `viptime_updatetime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bind_gold` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bind_gold_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `bind_gold_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_data`
--

DROP TABLE IF EXISTS `_del_char_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_data` (
  `char_oid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `char_order` int(11) NOT NULL DEFAULT '0',
  `gm_authority` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `race_id` int(11) NOT NULL DEFAULT '0',
  `title_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `svr_line_id` int(11) NOT NULL DEFAULT '0',
  `map_id` int(11) NOT NULL DEFAULT '0',
  `pos_x` float(9,3) DEFAULT '0.000',
  `pos_y` float(9,3) DEFAULT '0.000',
  `pos_z` float(9,3) DEFAULT '0.000',
  `rotation` float(9,3) DEFAULT '0.000',
  `vip_type` int(11) NOT NULL DEFAULT '0',
  `cur_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cur_hp` int(11) NOT NULL DEFAULT '0',
  `cur_thew` int(11) NOT NULL DEFAULT '0',
  `cur_energy` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_ip` varchar(20) NOT NULL,
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(20) NOT NULL,
  `last_logout_time` int(11) unsigned NOT NULL DEFAULT '0',
  `online_time` int(11) unsigned NOT NULL,
  `chat_channel` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_weapon` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_body` int(11) unsigned NOT NULL DEFAULT '0',
  `state_bit1` int(11) unsigned NOT NULL DEFAULT '0',
  `state_bit2` int(11) unsigned NOT NULL DEFAULT '0',
  `activity_val` int(11) NOT NULL DEFAULT '0',
  `activity_max_val` int(11) NOT NULL DEFAULT '0',
  `activity_val_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `account_oid` (`account_oid`,`entry_id`,`char_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_draw_info`
--

DROP TABLE IF EXISTS `_del_char_draw_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_draw_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `goodDrawCnt` int(11) NOT NULL DEFAULT '0',
  `preGoodSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `curGoodSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `goodFreeCnt` int(11) NOT NULL DEFAULT '0',
  `lastGoodDrawTime` int(11) unsigned NOT NULL DEFAULT '0',
  `betterDrawCnt` int(11) NOT NULL DEFAULT '0',
  `preBetterSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `curBetterSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `betterFreeCnt` int(11) NOT NULL DEFAULT '0',
  `lastBetterDrawTime` int(11) unsigned NOT NULL DEFAULT '0',
  `bestDrawCnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_equips`
--

DROP TABLE IF EXISTS `_del_char_equips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_equips` (
  `equip_uuid` varchar(36) NOT NULL,
  `owner_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `starId` int(11) NOT NULL DEFAULT '0',
  `broach` int(11) NOT NULL DEFAULT '0',
  `jewel1` int(11) NOT NULL DEFAULT '0',
  `jewel2` int(11) NOT NULL DEFAULT '0',
  `jewel3` int(11) NOT NULL DEFAULT '0',
  `jewel4` int(11) NOT NULL DEFAULT '0',
  `subjoin_type1` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete1` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue1` int(11) NOT NULL DEFAULT '0',
  `subjoin_type2` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete2` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue2` int(11) NOT NULL DEFAULT '0',
  `subjoin_type3` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete3` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue3` int(11) NOT NULL DEFAULT '0',
  `subjoin_type4` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete4` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue4` int(11) NOT NULL DEFAULT '0',
  `subjoin_type5` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete5` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue5` int(11) NOT NULL DEFAULT '0',
  `subjoin_type6` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete6` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue6` int(11) NOT NULL DEFAULT '0',
  `subjoin_type7` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete7` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue7` int(11) NOT NULL DEFAULT '0',
  `subjoin_type8` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete8` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue8` int(11) NOT NULL DEFAULT '0',
  `addstar_money` int(11) NOT NULL DEFAULT '0',
  `refine_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`equip_uuid`),
  KEY `charOid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_fellows`
--

DROP TABLE IF EXISTS `_del_char_fellows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_fellows` (
  `fellow_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `loc` int(11) unsigned NOT NULL DEFAULT '0',
  `npc_tplt_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `mode` int(11) NOT NULL DEFAULT '0',
  `cur_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cur_hp` int(11) NOT NULL DEFAULT '0',
  `cur_mp` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `rebuild_item_count` int(11) NOT NULL DEFAULT '0',
  `mastery_count` int(11) NOT NULL DEFAULT '0',
  `talent_count` int(11) NOT NULL DEFAULT '0',
  `coin_cost` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude` int(11) NOT NULL DEFAULT '0',
  `defence_aptitude` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `def_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `base_npc_tplt_id` int(11) NOT NULL DEFAULT '0',
  `spell_pool_lv` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fellow_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_fightsetting`
--

DROP TABLE IF EXISTS `_del_char_fightsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_fightsetting` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `fight_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump0_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump1_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump2_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump3_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump4_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet1_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet2_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`fight_id`),
  KEY `char_oid` (`char_oid`),
  KEY `fight_id` (`fight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_items`
--

DROP TABLE IF EXISTS `_del_char_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_items` (
  `item_uuid` varchar(36) NOT NULL DEFAULT '',
  `template_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cool_remain_time` int(11) unsigned NOT NULL DEFAULT '0',
  `life_left` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `cur_fray` int(11) unsigned NOT NULL DEFAULT '0',
  `stack_count` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `store_loc` smallint(6) NOT NULL DEFAULT '0',
  `equip_slotno` smallint(6) NOT NULL DEFAULT '0',
  `coin_type` smallint(6) NOT NULL DEFAULT '0',
  `is_judged` tinyint(1) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_use` bigint(20) NOT NULL DEFAULT '0',
  `use_count` int(11) unsigned NOT NULL DEFAULT '0',
  `record_info` varchar(256) NOT NULL,
  PRIMARY KEY (`item_uuid`),
  KEY `template_oid` (`template_oid`),
  KEY `owner_oid` (`owner_oid`,`store_loc`,`equip_slotno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_ladder_info`
--

DROP TABLE IF EXISTS `_del_char_ladder_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_ladder_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `ladderExp` int(11) NOT NULL DEFAULT '0',
  `ladderLevel` int(11) NOT NULL DEFAULT '0',
  `ladderRound` int(11) NOT NULL DEFAULT '0',
  `ladderUpResult1` int(11) NOT NULL DEFAULT '0',
  `ladderUpResult2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_mails`
--

DROP TABLE IF EXISTS `_del_char_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_mails` (
  `mail_uuid` char(36) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `delete_time` int(11) unsigned NOT NULL,
  `receiver_oid` int(11) unsigned NOT NULL,
  `mail_type` tinyint(3) unsigned NOT NULL,
  `mail_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mail_subject` varchar(60) NOT NULL,
  `has_attachment` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mail_content` varchar(512) NOT NULL,
  `coin0_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin0_count` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `count0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `count1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `count2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `count3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `count4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_uuid`),
  KEY `receiveroid` (`receiver_oid`),
  KEY `delete_time` (`delete_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_match`
--

DROP TABLE IF EXISTS `_del_char_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_match` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `join_award` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_cumulate_point` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_actual_point` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_place` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_pk_cumulate_point` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_notifies`
--

DROP TABLE IF EXISTS `_del_char_notifies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_notifies` (
  `char_oid` int(11) unsigned NOT NULL,
  `noti_00` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_01` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_02` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_03` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_04` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_05` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_06` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_07` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_08` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_09` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_10` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_11` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_12` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_13` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_14` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_15` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_16` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_17` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_package_info`
--

DROP TABLE IF EXISTS `_del_char_package_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_package_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `normalSlots` int(11) NOT NULL DEFAULT '0',
  `bodySlots` int(11) NOT NULL DEFAULT '0',
  `equipslots` int(11) NOT NULL DEFAULT '0',
  `trumpSlots` int(11) NOT NULL DEFAULT '0',
  `soulSlots` int(11) NOT NULL DEFAULT '0',
  `petSlots` int(11) NOT NULL DEFAULT '0',
  `storageSlots` int(11) NOT NULL DEFAULT '0',
  `deleStorageSlots` int(11) NOT NULL DEFAULT '0',
  `petStorageSlots` int(11) NOT NULL DEFAULT '0',
  `fellowStorageSlots` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_pets`
--

DROP TABLE IF EXISTS `_del_char_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_pets` (
  `pet_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_loc` int(11) unsigned NOT NULL DEFAULT '25',
  `pet_tplt_id` int(11) NOT NULL DEFAULT '0',
  `pet_npc_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `left_life` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `mp` int(11) NOT NULL DEFAULT '0',
  `attack` int(11) NOT NULL DEFAULT '0',
  `defence` int(11) NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `strength` int(11) NOT NULL DEFAULT '0',
  `wit` int(11) NOT NULL DEFAULT '0',
  `agile` int(11) NOT NULL DEFAULT '0',
  `potential` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude` int(11) NOT NULL DEFAULT '0',
  `defence_aptitude` int(11) NOT NULL DEFAULT '0',
  `speed_aptitude` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `def_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `speed_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `kill_ratio` float NOT NULL DEFAULT '0',
  `jink_ratio` float NOT NULL DEFAULT '0',
  `counterattack_ratio` float NOT NULL DEFAULT '0',
  `max_hp` int(11) NOT NULL DEFAULT '0',
  `max_mp` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ext_flag` int(10) unsigned NOT NULL DEFAULT '0',
  `bat_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pet_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_quests`
--

DROP TABLE IF EXISTS `_del_char_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_quests` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(11) unsigned NOT NULL DEFAULT '0',
  `accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_state` int(11) NOT NULL DEFAULT '0',
  `quest_extra` int(11) NOT NULL DEFAULT '0',
  `trace_time` int(11) unsigned NOT NULL DEFAULT '0',
  `check_type1` int(11) NOT NULL DEFAULT '0',
  `check_id1` int(11) NOT NULL DEFAULT '0',
  `check_count1` int(11) NOT NULL DEFAULT '0',
  `check_state1` int(11) NOT NULL DEFAULT '0',
  `check_type2` int(11) NOT NULL DEFAULT '0',
  `check_id2` int(11) NOT NULL DEFAULT '0',
  `check_count2` int(11) NOT NULL DEFAULT '0',
  `check_state2` int(11) NOT NULL DEFAULT '0',
  `check_type3` int(11) NOT NULL DEFAULT '0',
  `check_id3` int(11) NOT NULL DEFAULT '0',
  `check_count3` int(11) NOT NULL DEFAULT '0',
  `check_state3` int(11) NOT NULL DEFAULT '0',
  `check_type4` int(11) NOT NULL DEFAULT '0',
  `check_id4` int(11) NOT NULL DEFAULT '0',
  `check_count4` int(11) NOT NULL DEFAULT '0',
  `check_state4` int(11) NOT NULL DEFAULT '0',
  `check_type5` int(11) NOT NULL DEFAULT '0',
  `check_id5` int(11) NOT NULL DEFAULT '0',
  `check_count5` int(11) NOT NULL DEFAULT '0',
  `check_state5` int(11) NOT NULL DEFAULT '0',
  `check_type6` int(11) NOT NULL DEFAULT '0',
  `check_id6` int(11) NOT NULL DEFAULT '0',
  `check_count6` int(11) NOT NULL DEFAULT '0',
  `check_state6` int(11) NOT NULL DEFAULT '0',
  `cq_award_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_award_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_cont` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_school_cont` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_bind_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `mult_star` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_quests_history`
--

DROP TABLE IF EXISTS `_del_char_quests_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_quests_history` (
  `char_id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) DEFAULT NULL,
  `times` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`char_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_remedy`
--

DROP TABLE IF EXISTS `_del_char_remedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_remedy` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `remedy_id` int(11) NOT NULL DEFAULT '0',
  `remedy_count` int(11) NOT NULL DEFAULT '0',
  `remedy_luck` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_ride`
--

DROP TABLE IF EXISTS `_del_char_ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_ride` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `upgrade_cost` int(11) NOT NULL DEFAULT '0',
  `build_cost` int(11) NOT NULL DEFAULT '0',
  `res_id` int(11) NOT NULL DEFAULT '0',
  `res_list` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_sign_info`
--

DROP TABLE IF EXISTS `_del_char_sign_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_sign_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `signDailyDays` int(11) NOT NULL DEFAULT '0',
  `dailyGetState` int(11) NOT NULL DEFAULT '0',
  `signContinueDays` int(11) NOT NULL DEFAULT '0',
  `continueGetState` int(11) NOT NULL DEFAULT '0',
  `lastContinueSignTime` int(11) unsigned NOT NULL DEFAULT '0',
  `daily_onlineaward_index` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_skills`
--

DROP TABLE IF EXISTS `_del_char_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_skills` (
  `skill_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(11) unsigned NOT NULL DEFAULT '0',
  `effect_level` int(11) NOT NULL DEFAULT '0',
  `effect_quality` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`skill_oid`),
  KEY `charOid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_soul`
--

DROP TABLE IF EXISTS `_del_char_soul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_soul` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_1` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_2` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_3` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_4` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_5` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_6` int(11) unsigned NOT NULL DEFAULT '0',
  `xp_value` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `energy` int(11) NOT NULL DEFAULT '0',
  `school` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_point` int(11) NOT NULL DEFAULT '0',
  `farm_oid` int(11) NOT NULL DEFAULT '0',
  `gui_op` int(11) NOT NULL DEFAULT '0',
  `make_trump_level` int(11) NOT NULL DEFAULT '0',
  `make_trump_point` int(11) NOT NULL DEFAULT '0',
  `make_equip_level` int(11) NOT NULL DEFAULT '0',
  `make_equip_point` int(11) NOT NULL DEFAULT '0',
  `make_body_level` int(11) NOT NULL DEFAULT '0',
  `make_body_point` int(11) NOT NULL DEFAULT '0',
  `make_drug_level` int(11) NOT NULL DEFAULT '0',
  `make_drug_point` int(11) NOT NULL DEFAULT '0',
  `make_charm_level` int(11) NOT NULL DEFAULT '0',
  `make_charm_point` int(11) NOT NULL DEFAULT '0',
  `make_skill_book_level` int(11) NOT NULL DEFAULT '0',
  `make_skill_book_point` int(11) NOT NULL DEFAULT '0',
  `alchemy_level` int(11) NOT NULL DEFAULT '0',
  `plant_level` int(11) NOT NULL DEFAULT '0',
  `feed_level` int(11) NOT NULL DEFAULT '0',
  `attack_level` int(11) NOT NULL DEFAULT '0',
  `defence_level` int(11) NOT NULL DEFAULT '0',
  `catch_level` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) NOT NULL DEFAULT '0',
  `spell_xp_main` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_spells`
--

DROP TABLE IF EXISTS `_del_char_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_spells` (
  `instance_oid` bigint(20) NOT NULL,
  `char_oid` int(11) NOT NULL DEFAULT '0',
  `spell_oid` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) DEFAULT '0',
  `slot_no` int(11) DEFAULT NULL,
  `last_cast` bigint(11) unsigned DEFAULT '0',
  `can_use` int(11) unsigned NOT NULL DEFAULT '1',
  `trump_spell_attr1` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr2` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr3` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`instance_oid`,`char_oid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_stages`
--

DROP TABLE IF EXISTS `_del_char_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_stages` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_id` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_chapters` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_hard_type` int(11) NOT NULL DEFAULT '0',
  `stage_result` int(11) NOT NULL DEFAULT '0',
  `stage_create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_statistics`
--

DROP TABLE IF EXISTS `_del_char_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_statistics` (
  `char_oid` int(11) unsigned NOT NULL,
  `stat0` int(11) NOT NULL DEFAULT '0',
  `stat1` int(11) NOT NULL DEFAULT '0',
  `stat2` int(11) NOT NULL DEFAULT '0',
  `stat3` int(11) NOT NULL DEFAULT '0',
  `stat4` int(11) NOT NULL DEFAULT '0',
  `stat5` int(11) NOT NULL DEFAULT '0',
  `stat6` int(11) NOT NULL DEFAULT '0',
  `stat7` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_stores`
--

DROP TABLE IF EXISTS `_del_char_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_stores` (
  `char_oid` int(11) unsigned NOT NULL,
  `store_type` int(11) unsigned NOT NULL,
  `last_refresh_time` int(11) unsigned NOT NULL,
  `manual_refresh_times` int(11) unsigned NOT NULL,
  `item1TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item1StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item1_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item1_price` int(11) NOT NULL DEFAULT '0',
  `item2TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item2StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item2_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item2_price` int(11) NOT NULL DEFAULT '0',
  `item3TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item3StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item3_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item3_price` int(11) NOT NULL DEFAULT '0',
  `item4TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item4StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item4_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item4_price` int(11) NOT NULL DEFAULT '0',
  `item5TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item5StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item5_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item5_price` int(11) NOT NULL DEFAULT '0',
  `item6TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item6StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item6_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item6_price` int(11) NOT NULL DEFAULT '0',
  `item7TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item7StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item7_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item7_price` int(11) NOT NULL DEFAULT '0',
  `item8TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item8StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item8_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item8_price` int(11) NOT NULL DEFAULT '0',
  `item9TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item9StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item9_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item9_price` int(11) NOT NULL DEFAULT '0',
  `item10TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item10StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item10_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item10_price` int(11) NOT NULL DEFAULT '0',
  `item11TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item11StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item11_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item11_price` int(11) NOT NULL DEFAULT '0',
  `item12TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item12StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item12_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item12_price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`store_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_title`
--

DROP TABLE IF EXISTS `_del_char_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_title` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `title_id` int(11) unsigned NOT NULL DEFAULT '0',
  `disappear_time` int(11) unsigned NOT NULL DEFAULT '0',
  `life_time` int(11) NOT NULL DEFAULT '0',
  `own_state` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_char_trumps`
--

DROP TABLE IF EXISTS `_del_char_trumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_char_trumps` (
  `trump_uuid` varchar(36) NOT NULL,
  `trump_tpltid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trump_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trump_level` int(11) NOT NULL DEFAULT '0',
  `trump_energy` int(11) NOT NULL DEFAULT '0',
  `trump_hp` int(11) NOT NULL DEFAULT '0',
  `trump_qualityid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_starid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip1_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip2_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip3_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip4_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip5_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip6_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trump_uuid`),
  KEY `charOid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_fellow_spell_container`
--

DROP TABLE IF EXISTS `_del_fellow_spell_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_fellow_spell_container` (
  `fellow_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `slot_flag0` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag1` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag2` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag3` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag4` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag5` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag6` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag7` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag8` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag9` int(11) unsigned NOT NULL DEFAULT '0',
  `slot0` int(11) NOT NULL DEFAULT '0',
  `slot1` int(11) NOT NULL DEFAULT '0',
  `slot2` int(11) NOT NULL DEFAULT '0',
  `slot3` int(11) NOT NULL DEFAULT '0',
  `slot4` int(11) NOT NULL DEFAULT '0',
  `slot5` int(11) NOT NULL DEFAULT '-1',
  `slot6` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`fellow_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_mail_cache`
--

DROP TABLE IF EXISTS `_del_mail_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_mail_cache` (
  `mail_uuid` char(36) NOT NULL,
  `receiver_oid` int(11) unsigned NOT NULL,
  `mail_subject` varchar(60) NOT NULL,
  `mail_content` varchar(512) NOT NULL,
  `exist_time` int(11) unsigned NOT NULL,
  `has_attachment` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `coin0_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin0_count` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `count0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `count1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `count2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `count3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `count4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_del_pet_skill_container`
--

DROP TABLE IF EXISTS `_del_pet_skill_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_del_pet_skill_container` (
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `grid_index` int(11) NOT NULL DEFAULT '0',
  `skill_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner_oid`,`grid_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_stat_script_count`
--

DROP TABLE IF EXISTS `_stat_script_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_stat_script_count` (
  `stat_date` date NOT NULL,
  `stat_type` int(11) unsigned NOT NULL,
  `stat_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_date`,`stat_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_ban_log`
--

DROP TABLE IF EXISTS `account_ban_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_ban_log` (
  `ban_id` int(11) NOT NULL AUTO_INCREMENT,
  `ban_account` int(11) NOT NULL,
  `ban_name` varchar(64) NOT NULL,
  `ban_start` int(11) NOT NULL,
  `ban_end` int(11) NOT NULL,
  `ban_reason` varbinary(512) NOT NULL,
  `ban_type` tinyint(1) NOT NULL DEFAULT '1',
  `ban_user` varchar(50) NOT NULL,
  `ban_created` int(11) NOT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `ban_account` (`ban_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_festival_activity`
--

DROP TABLE IF EXISTS `account_festival_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_festival_activity` (
  `account_oid` int(11) NOT NULL,
  `char_oid` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `act_para1` int(11) NOT NULL,
  `act_para2` int(11) NOT NULL,
  `act_para3` int(11) NOT NULL,
  `all_count` int(11) NOT NULL,
  `draw_count` int(11) NOT NULL,
  PRIMARY KEY (`account_oid`,`char_oid`,`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_log`
--

DROP TABLE IF EXISTS `account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_log` (
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `first_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `login_ban_begin` int(10) unsigned NOT NULL DEFAULT '0',
  `login_ban_finish` int(10) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(128) NOT NULL,
  `release_reason` varchar(128) NOT NULL,
  `is_adult` int(10) unsigned NOT NULL DEFAULT '0',
  `account_gold` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_present`
--

DROP TABLE IF EXISTS `account_present`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_present` (
  `present_uuid` varchar(36) NOT NULL,
  `account_id` int(11) unsigned NOT NULL DEFAULT '0',
  `award_type` int(11) NOT NULL DEFAULT '0',
  `draw_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`present_uuid`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_award`
--

DROP TABLE IF EXISTS `active_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_award` (
  `active_type` int(11) NOT NULL,
  `active_name` varchar(64) NOT NULL,
  `active_begin` int(11) NOT NULL,
  `active_end` int(11) NOT NULL,
  `award_item1_id` int(11) NOT NULL,
  `award_item1_count` int(11) NOT NULL,
  `award_item2_id` int(11) NOT NULL,
  `award_item2_count` int(11) NOT NULL,
  `award_item3_id` int(11) NOT NULL,
  `award_item3_count` int(11) NOT NULL,
  `award_item4_id` int(11) NOT NULL DEFAULT '0',
  `award_item4_count` int(11) NOT NULL DEFAULT '0',
  `award_item5_id` int(11) NOT NULL DEFAULT '0',
  `award_item5_count` int(11) NOT NULL DEFAULT '0',
  `award_item6_id` int(11) NOT NULL DEFAULT '0',
  `award_item6_count` int(11) NOT NULL DEFAULT '0',
  `active_created` int(11) NOT NULL,
  `active_check_need` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`active_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_svr_log`
--

DROP TABLE IF EXISTS `admin_svr_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_svr_log` (
  `log_uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL,
  `client_ip` int(10) unsigned NOT NULL,
  `svr_uid` int(10) unsigned NOT NULL,
  `command` text NOT NULL,
  `com_str` text NOT NULL,
  PRIMARY KEY (`log_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ashx_report`
--

DROP TABLE IF EXISTS `ashx_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ashx_report` (
  `error_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `error_msg` text NOT NULL,
  `bill_info` text NOT NULL,
  `remote_ip` char(15) NOT NULL,
  `error_date` datetime NOT NULL DEFAULT '2008-01-01 00:00:00',
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bad_words`
--

DROP TABLE IF EXISTS `bad_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bad_words` (
  `bw_id` int(11) NOT NULL AUTO_INCREMENT,
  `bw_word` varchar(250) DEFAULT NULL,
  `bw_split` varchar(20) DEFAULT NULL,
  `bw_repeat` varchar(20) DEFAULT NULL,
  `bw_priority` int(11) DEFAULT NULL,
  `bw_rela_id` int(11) DEFAULT NULL,
  `bw_rela_order` int(11) DEFAULT NULL,
  `bw_rela_split` varchar(20) DEFAULT NULL,
  `bw_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bw_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ban_speak`
--

DROP TABLE IF EXISTS `ban_speak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ban_speak` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `begin_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_auto_setting`
--

DROP TABLE IF EXISTS `battle_auto_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_auto_setting` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `hp_percent` int(3) unsigned NOT NULL DEFAULT '0',
  `mp_percent` int(3) unsigned NOT NULL DEFAULT '0',
  `catch_mode` int(1) unsigned NOT NULL DEFAULT '0',
  `attack_mode` int(1) unsigned NOT NULL DEFAULT '0',
  `skill_site` int(2) unsigned NOT NULL DEFAULT '0',
  `pet_hp_percent` int(3) unsigned NOT NULL DEFAULT '0',
  `pet_mp_percent` int(3) unsigned NOT NULL DEFAULT '0',
  `pet_attack_mode` int(1) unsigned NOT NULL DEFAULT '0',
  `pet_skill_site` int(2) unsigned NOT NULL DEFAULT '0',
  `trump_site` int(2) unsigned NOT NULL DEFAULT '0',
  `pet_trump_site` int(2) unsigned NOT NULL DEFAULT '0',
  `is_add_player_hp` int(11) unsigned NOT NULL DEFAULT '0',
  `is_add_player_mp` int(11) unsigned NOT NULL DEFAULT '0',
  `is_add_pet_hp` int(11) unsigned NOT NULL DEFAULT '0',
  `is_add_pet_mp` int(11) unsigned NOT NULL DEFAULT '0',
  `is_add_loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `is_use_double_item` int(11) unsigned NOT NULL DEFAULT '0',
  `use_add_hp_item_order` int(11) unsigned NOT NULL DEFAULT '0',
  `use_add_mp_item_order` int(11) unsigned NOT NULL DEFAULT '0',
  `use_add_pet_hp_item_order` int(11) unsigned NOT NULL DEFAULT '0',
  `use_add_pet_mp_item_order` int(11) unsigned NOT NULL DEFAULT '0',
  `loyalty_precent` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `challenge_power`
--

DROP TABLE IF EXISTS `challenge_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenge_power` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `fighter_type` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `max_hp` int(11) NOT NULL DEFAULT '0',
  `max_mp` int(11) NOT NULL DEFAULT '0',
  `attack` int(11) NOT NULL DEFAULT '0',
  `defence` int(11) NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `kill_val` int(11) NOT NULL DEFAULT '0',
  `dec_kill` int(11) NOT NULL DEFAULT '0',
  `hit_val` int(11) NOT NULL DEFAULT '0',
  `jink_val` int(11) NOT NULL DEFAULT '0',
  `counter_val` int(11) NOT NULL DEFAULT '0',
  `dec_counter` int(11) NOT NULL DEFAULT '0',
  `control_val` int(11) NOT NULL DEFAULT '0',
  `dec_control` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_account`
--

DROP TABLE IF EXISTS `char_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_account` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `acc_gold` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acc_cash` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acc_state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_auth_cmd`
--

DROP TABLE IF EXISTS `char_auth_cmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_auth_cmd` (
  `cmd_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `auth_cmd` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cmd_id`),
  UNIQUE KEY `auth_cmd` (`auth_cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_authority`
--

DROP TABLE IF EXISTS `char_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_authority` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `auth_cmd` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`,`auth_cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_body`
--

DROP TABLE IF EXISTS `char_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_body` (
  `body_uuid` varchar(36) NOT NULL,
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `age` int(11) unsigned NOT NULL DEFAULT '0',
  `change_age_time` int(11) unsigned NOT NULL DEFAULT '0',
  `thew` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `mp` int(11) NOT NULL DEFAULT '0',
  `attack` int(11) NOT NULL DEFAULT '0',
  `defense` int(11) NOT NULL DEFAULT '0',
  `speed` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `strength` int(11) NOT NULL DEFAULT '0',
  `wit` int(11) NOT NULL DEFAULT '0',
  `agile` int(11) NOT NULL DEFAULT '0',
  `potential` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) NOT NULL DEFAULT '0',
  `jinkRatio` float NOT NULL DEFAULT '0',
  `preventRatio` float NOT NULL DEFAULT '0',
  `killRatio` float NOT NULL DEFAULT '0',
  `tempid` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`body_uuid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_buffs`
--

DROP TABLE IF EXISTS `char_buffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_buffs` (
  `owner_oid` bigint(20) NOT NULL DEFAULT '0',
  `buff_id` int(11) NOT NULL,
  `remain_value` int(11) NOT NULL,
  `stack_count` int(11) NOT NULL,
  `effect_count` int(11) NOT NULL,
  `effect_val` float(9,3) NOT NULL DEFAULT '0.000',
  `off_ticks` int(11) NOT NULL DEFAULT '0',
  `off_rule` int(2) NOT NULL,
  `extend_time` int(11) NOT NULL DEFAULT '0',
  `src_type` int(11) NOT NULL DEFAULT '0',
  `talentValA` float(9,3) NOT NULL DEFAULT '0.000',
  `talentValB` float(9,3) NOT NULL DEFAULT '0.000',
  `talentValC` float(9,3) NOT NULL DEFAULT '0.000',
  `talentValD` float(9,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`owner_oid`,`buff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_challenge`
--

DROP TABLE IF EXISTS `char_challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_challenge` (
  `challenge_order` int(11) NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `body_tempid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`challenge_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_checkpoints`
--

DROP TABLE IF EXISTS `char_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_checkpoints` (
  `char_oid` int(11) unsigned NOT NULL,
  `cpnt_00` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_01` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_02` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_03` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_04` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_05` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_06` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_07` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_08` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_09` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_10` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_11` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_12` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_13` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_14` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_15` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_16` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_17` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_18` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_19` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_20` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_21` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_22` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_23` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_24` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_25` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_26` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_27` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_28` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_29` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_30` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpnt_31` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_circle_quest`
--

DROP TABLE IF EXISTS `char_circle_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_circle_quest` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `cur_goal_day` int(11) NOT NULL DEFAULT '0',
  `cq_school_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_school_level` int(11) NOT NULL DEFAULT '0',
  `cq_school_count` int(11) NOT NULL DEFAULT '0',
  `cq_day_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_day_level` int(11) NOT NULL DEFAULT '0',
  `cq_week_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_week_level` int(11) NOT NULL DEFAULT '0',
  `cq_guild_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_level` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_count` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_farm_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_farm_level` int(11) NOT NULL DEFAULT '0',
  `cq_sjhg_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_sjhg_level` int(11) NOT NULL DEFAULT '0',
  `hole_build_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hole_build_level` int(11) NOT NULL DEFAULT '0',
  `hole_build_count` int(11) NOT NULL DEFAULT '0',
  `hole_study_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hole_study_level` int(11) NOT NULL DEFAULT '0',
  `hole_study_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_coordinate`
--

DROP TABLE IF EXISTS `char_coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_coordinate` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `coordinate_id` int(11) NOT NULL DEFAULT '0',
  `map_id` int(11) NOT NULL,
  `pos_x` int(11) NOT NULL,
  `pos_y` int(11) NOT NULL,
  `remark` varchar(64) NOT NULL,
  KEY `char_oid` (`char_oid`,`coordinate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_cultures`
--

DROP TABLE IF EXISTS `char_cultures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_cultures` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `culture_type` int(11) NOT NULL DEFAULT '0',
  `culture_id` int(11) unsigned NOT NULL DEFAULT '0',
  `culture_state` int(11) NOT NULL DEFAULT '0',
  `culture_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`culture_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_currency`
--

DROP TABLE IF EXISTS `char_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_currency` (
  `char_oid` int(10) unsigned NOT NULL,
  `gold_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `silver_num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gold_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `gold_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  `silver_got` bigint(20) unsigned NOT NULL DEFAULT '0',
  `silver_out` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_data`
--

DROP TABLE IF EXISTS `char_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_data` (
  `char_oid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(11) unsigned NOT NULL DEFAULT '0',
  `char_order` int(11) NOT NULL DEFAULT '0',
  `gm_authority` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `race_id` int(11) NOT NULL DEFAULT '0',
  `title_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `svr_line_id` int(11) NOT NULL DEFAULT '0',
  `map_id` int(11) NOT NULL DEFAULT '0',
  `pos_x` float(9,3) DEFAULT '0.000',
  `pos_y` float(9,3) DEFAULT '0.000',
  `pos_z` float(9,3) DEFAULT '0.000',
  `rotation` float(9,3) DEFAULT '0.000',
  `vip_type` int(11) NOT NULL DEFAULT '0',
  `cur_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cur_spellpoint` int(11) unsigned NOT NULL DEFAULT '0',
  `cur_hp` int(11) NOT NULL DEFAULT '0',
  `cur_strength` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_ip` varchar(20) NOT NULL,
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(20) NOT NULL,
  `last_logout_time` int(11) unsigned NOT NULL DEFAULT '0',
  `online_time` int(11) unsigned NOT NULL,
  `daily_online_time` int(11) unsigned NOT NULL DEFAULT '0',
  `chat_channel` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_weapon` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_body` int(11) unsigned NOT NULL DEFAULT '0',
  `state_bit1` int(11) unsigned NOT NULL DEFAULT '0',
  `state_bit2` int(11) unsigned NOT NULL DEFAULT '0',
  `activity_val` int(11) NOT NULL DEFAULT '0',
  `activity_max_val` int(11) NOT NULL DEFAULT '0',
  `activity_val_time` int(11) NOT NULL DEFAULT '0',
  `vipmonthpresent_lost_time` int(11) NOT NULL DEFAULT '0',
  `vipmonthpresent_gold_monthsum` int(11) NOT NULL DEFAULT '0',
  `last_targetpos_id` int(11) NOT NULL DEFAULT '0',
  `mystery_shop_unlock_time` int(11) unsigned NOT NULL DEFAULT '0',
  `precious_shop_unlock_time` int(11) unsigned NOT NULL DEFAULT '0',
  `expedition_coin` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_point` int(11) unsigned NOT NULL DEFAULT '0',
  `ladder_point` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_point` int(11) unsigned NOT NULL DEFAULT '0',
  `catman_level` int(11) NOT NULL DEFAULT '0',
  `catman_exp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `account_oid` (`account_oid`,`char_order`)
) ENGINE=InnoDB AUTO_INCREMENT=20661 DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_draw_info`
--

DROP TABLE IF EXISTS `char_draw_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_draw_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `goodDrawCnt` int(11) NOT NULL DEFAULT '0',
  `preGoodSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `curGoodSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `goodFreeCnt` int(11) NOT NULL DEFAULT '0',
  `lastGoodDrawTime` int(11) unsigned NOT NULL DEFAULT '0',
  `betterDrawCnt` int(11) NOT NULL DEFAULT '0',
  `preBetterSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `curBetterSecGenCnt` int(11) NOT NULL DEFAULT '0',
  `betterFreeCnt` int(11) NOT NULL DEFAULT '0',
  `lastBetterDrawTime` int(11) unsigned NOT NULL DEFAULT '0',
  `bestDrawCnt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_equips`
--

DROP TABLE IF EXISTS `char_equips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_equips` (
  `equip_uuid` varchar(36) NOT NULL,
  `owner_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `starId` int(11) NOT NULL DEFAULT '0',
  `broach` int(11) NOT NULL DEFAULT '0',
  `jewel1` int(11) NOT NULL DEFAULT '0',
  `jewel2` int(11) NOT NULL DEFAULT '0',
  `jewel3` int(11) NOT NULL DEFAULT '0',
  `jewel4` int(11) NOT NULL DEFAULT '0',
  `subjoin_type1` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete1` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue1` int(11) NOT NULL DEFAULT '0',
  `subjoin_type2` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete2` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue2` int(11) NOT NULL DEFAULT '0',
  `subjoin_type3` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete3` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue3` int(11) NOT NULL DEFAULT '0',
  `subjoin_type4` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete4` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue4` int(11) NOT NULL DEFAULT '0',
  `subjoin_type5` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete5` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue5` int(11) NOT NULL DEFAULT '0',
  `subjoin_type6` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete6` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue6` int(11) NOT NULL DEFAULT '0',
  `subjoin_type7` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete7` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue7` int(11) NOT NULL DEFAULT '0',
  `subjoin_type8` int(11) NOT NULL DEFAULT '0',
  `subjoin_complete8` int(11) NOT NULL DEFAULT '0',
  `subjoin_maxvalue8` int(11) NOT NULL DEFAULT '0',
  `addstar_money` int(11) NOT NULL DEFAULT '0',
  `refine_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`equip_uuid`),
  KEY `charOid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_fellows`
--

DROP TABLE IF EXISTS `char_fellows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_fellows` (
  `fellow_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `loc` int(11) unsigned NOT NULL DEFAULT '0',
  `npc_tplt_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `mode` int(11) NOT NULL DEFAULT '0',
  `cur_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cur_hp` int(11) NOT NULL DEFAULT '0',
  `cur_mp` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `rebuild_item_count` int(11) NOT NULL DEFAULT '0',
  `mastery_count` int(11) NOT NULL DEFAULT '0',
  `talent_count` int(11) NOT NULL DEFAULT '0',
  `coin_cost` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude` int(11) NOT NULL DEFAULT '0',
  `defence_aptitude` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude` int(11) NOT NULL DEFAULT '0',
  `hp_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `def_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `attack_aptitude_cost` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `base_npc_tplt_id` int(11) NOT NULL DEFAULT '0',
  `spell_pool_lv` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fellow_uid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_fightsetting`
--

DROP TABLE IF EXISTS `char_fightsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_fightsetting` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_type` int(11) unsigned NOT NULL DEFAULT '0',
  `trump0_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump1_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump2_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump3_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump4_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet0_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet1_tplid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`stage_type`),
  UNIQUE KEY `char_oid_fight_id` (`char_oid`,`stage_type`),
  KEY `char_oid` (`char_oid`),
  KEY `fight_id` (`stage_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_guild_info`
--

DROP TABLE IF EXISTS `char_guild_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_guild_info` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `award_flag` bigint(20) unsigned NOT NULL DEFAULT '0',
  `welfare_state` int(11) unsigned NOT NULL DEFAULT '0',
  `business_count` int(11) unsigned NOT NULL DEFAULT '0',
  `business_accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_item_cool`
--

DROP TABLE IF EXISTS `char_item_cool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_item_cool` (
  `char_oid` int(11) unsigned NOT NULL,
  `item_group` int(11) unsigned NOT NULL,
  `start_ticks` bigint(11) unsigned NOT NULL DEFAULT '0',
  `cool_period` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`item_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_item_sort`
--

DROP TABLE IF EXISTS `char_item_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_item_sort` (
  `object_uid` varchar(36) NOT NULL,
  `sort_type` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_effect_val1` int(11) NOT NULL DEFAULT '0',
  `sort_effect_val2` int(11) NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sort_type`,`object_uid`),
  KEY `object_uid` (`object_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_items`
--

DROP TABLE IF EXISTS `char_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_items` (
  `item_uuid` varchar(36) NOT NULL DEFAULT '',
  `template_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cool_remain_time` int(11) unsigned NOT NULL DEFAULT '0',
  `life_left` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `cur_fray` int(11) unsigned NOT NULL DEFAULT '0',
  `stack_count` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `store_loc` smallint(6) NOT NULL DEFAULT '0',
  `equip_slotno` smallint(6) NOT NULL DEFAULT '0',
  `coin_type` smallint(6) NOT NULL DEFAULT '0',
  `is_judged` tinyint(1) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_use` bigint(20) NOT NULL DEFAULT '0',
  `use_count` int(11) unsigned NOT NULL DEFAULT '0',
  `record_info` varchar(256) NOT NULL,
  PRIMARY KEY (`item_uuid`),
  UNIQUE KEY `owner_oid` (`owner_oid`,`store_loc`,`equip_slotno`),
  KEY `template_oid` (`template_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_kill_ghost`
--

DROP TABLE IF EXISTS `char_kill_ghost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_kill_ghost` (
  `char_oid` int(11) unsigned NOT NULL,
  `kill_type` int(11) NOT NULL DEFAULT '0',
  `ring` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `cancel_time` int(11) unsigned NOT NULL,
  `accept_time` int(11) unsigned NOT NULL,
  `npc_oid` bigint(20) unsigned NOT NULL,
  `npc_tpltid` int(11) unsigned NOT NULL,
  `map_id` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `tplt_x` int(11) NOT NULL,
  `tplt_y` int(11) NOT NULL,
  `npc_name` varchar(32) NOT NULL,
  PRIMARY KEY (`char_oid`,`kill_type`),
  KEY `npc_oid` (`npc_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_ladder_info`
--

DROP TABLE IF EXISTS `char_ladder_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_ladder_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `ladderExp` int(11) NOT NULL DEFAULT '0',
  `ladderLevel` int(11) NOT NULL DEFAULT '0',
  `ladderRound` int(11) NOT NULL DEFAULT '0',
  `ladderUpResult1` int(11) NOT NULL DEFAULT '0',
  `ladderUpResult2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_limits`
--

DROP TABLE IF EXISTS `char_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_limits` (
  `limit_oid` int(11) NOT NULL,
  `char_oid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `last_update` int(11) NOT NULL,
  `reserver0` int(11) NOT NULL,
  `reserver1` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`limit_oid`,`char_oid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_log`
--

DROP TABLE IF EXISTS `char_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_log` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `account_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_logout_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_ip` varchar(20) NOT NULL,
  `last_login_ip` varchar(20) NOT NULL,
  `is_online` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `body_level` int(11) unsigned NOT NULL DEFAULT '0',
  `soul_level` int(11) unsigned NOT NULL DEFAULT '0',
  `char_gold` int(11) unsigned NOT NULL DEFAULT '0',
  `char_bonus` int(11) unsigned NOT NULL DEFAULT '0',
  `char_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `online_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_mails`
--

DROP TABLE IF EXISTS `char_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_mails` (
  `mail_uuid` char(36) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `delete_time` int(11) unsigned NOT NULL,
  `receiver_oid` int(11) unsigned NOT NULL,
  `mail_type` tinyint(3) unsigned NOT NULL,
  `mail_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mail_subject` varchar(60) NOT NULL,
  `has_attachment` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mail_content` varchar(300) NOT NULL,
  `coin0_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin0_count` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `count0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `count1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `count2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `count3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `count4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_uuid`),
  KEY `receiveroid` (`receiver_oid`),
  KEY `delete_time` (`delete_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_match`
--

DROP TABLE IF EXISTS `char_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_match` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `join_award` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_cumulate_point` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_actual_point` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_place` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_pk_cumulate_point` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_note`
--

DROP TABLE IF EXISTS `char_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_note` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `note_type` int(11) NOT NULL DEFAULT '0',
  `day_reset` int(11) NOT NULL DEFAULT '0',
  `remark1` int(11) NOT NULL DEFAULT '0',
  `remark2` int(11) NOT NULL DEFAULT '0',
  `remark3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`note_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_notifies`
--

DROP TABLE IF EXISTS `char_notifies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_notifies` (
  `char_oid` int(11) unsigned NOT NULL,
  `noti_00` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_01` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_02` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_03` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_04` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_05` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_06` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_07` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_08` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_09` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_10` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_11` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_12` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_13` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_14` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_15` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_16` bigint(20) unsigned NOT NULL DEFAULT '0',
  `noti_17` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_package_info`
--

DROP TABLE IF EXISTS `char_package_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_package_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `normalSlots` int(11) NOT NULL DEFAULT '0',
  `bodySlots` int(11) NOT NULL DEFAULT '0',
  `equipslots` int(11) NOT NULL DEFAULT '0',
  `trumpSlots` int(11) NOT NULL DEFAULT '0',
  `soulSlots` int(11) NOT NULL DEFAULT '0',
  `petSlots` int(11) NOT NULL DEFAULT '0',
  `storageSlots` int(11) NOT NULL DEFAULT '0',
  `deleStorageSlots` int(11) NOT NULL DEFAULT '0',
  `petStorageSlots` int(11) NOT NULL DEFAULT '0',
  `fellowStorageSlots` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_pets`
--

DROP TABLE IF EXISTS `char_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_pets` (
  `pet_uuid` varchar(36) NOT NULL DEFAULT '',
  `pet_tpltid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_level` int(11) NOT NULL DEFAULT '0',
  `pet_qualityid` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_combat_hp` int(11) NOT NULL DEFAULT '0',
  `pet_expedition_hp` int(11) NOT NULL DEFAULT '0',
  `pet_train_hp` int(11) NOT NULL DEFAULT '0',
  `pet_train_PhysicalAtk` int(11) NOT NULL DEFAULT '0',
  `pet_train_MagicalAtk` int(11) NOT NULL DEFAULT '0',
  `pet_train_PhysicalDef` int(11) NOT NULL DEFAULT '0',
  `pet_train_MagicalDef` int(11) NOT NULL DEFAULT '0',
  `pet_train_LastFreeTime` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_spell1` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_spell2` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_spell3` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pet_uuid`),
  KEY `owner_oid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_quests`
--

DROP TABLE IF EXISTS `char_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_quests` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(11) unsigned NOT NULL DEFAULT '0',
  `accept_time` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_state` int(11) NOT NULL DEFAULT '0',
  `quest_extra` int(11) NOT NULL DEFAULT '0',
  `trace_time` int(11) unsigned NOT NULL DEFAULT '0',
  `check_type1` int(11) NOT NULL DEFAULT '0',
  `check_id1` int(11) NOT NULL DEFAULT '0',
  `check_count1` int(11) NOT NULL DEFAULT '0',
  `check_state1` int(11) NOT NULL DEFAULT '0',
  `check_type2` int(11) NOT NULL DEFAULT '0',
  `check_id2` int(11) NOT NULL DEFAULT '0',
  `check_count2` int(11) NOT NULL DEFAULT '0',
  `check_state2` int(11) NOT NULL DEFAULT '0',
  `check_type3` int(11) NOT NULL DEFAULT '0',
  `check_id3` int(11) NOT NULL DEFAULT '0',
  `check_count3` int(11) NOT NULL DEFAULT '0',
  `check_state3` int(11) NOT NULL DEFAULT '0',
  `check_type4` int(11) NOT NULL DEFAULT '0',
  `check_id4` int(11) NOT NULL DEFAULT '0',
  `check_count4` int(11) NOT NULL DEFAULT '0',
  `check_state4` int(11) NOT NULL DEFAULT '0',
  `check_type5` int(11) NOT NULL DEFAULT '0',
  `check_id5` int(11) NOT NULL DEFAULT '0',
  `check_count5` int(11) NOT NULL DEFAULT '0',
  `check_state5` int(11) NOT NULL DEFAULT '0',
  `check_type6` int(11) NOT NULL DEFAULT '0',
  `check_id6` int(11) NOT NULL DEFAULT '0',
  `check_count6` int(11) NOT NULL DEFAULT '0',
  `check_state6` int(11) NOT NULL DEFAULT '0',
  `cq_award_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_award_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_guild_cont` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_school_cont` int(11) unsigned NOT NULL DEFAULT '0',
  `cq_bind_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `mult_star` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_quests_history`
--

DROP TABLE IF EXISTS `char_quests_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_quests_history` (
  `char_id` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_id` int(11) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `state` int(11) DEFAULT NULL,
  `times` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`char_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_rank_params`
--

DROP TABLE IF EXISTS `char_rank_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_rank_params` (
  `rank_type` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(36) NOT NULL,
  `rank_val1_min` int(11) NOT NULL DEFAULT '0',
  `rank_val2_min` int(11) NOT NULL DEFAULT '0',
  `in_used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='init';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_relation`
--

DROP TABLE IF EXISTS `char_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_relation` (
  `subjective_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `objective_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `relation` int(11) NOT NULL DEFAULT '0',
  `mentor_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `relational_num` int(11) unsigned NOT NULL DEFAULT '0',
  `master_award` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjective_oid`,`objective_oid`),
  KEY `objective_oid` (`objective_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_remedy`
--

DROP TABLE IF EXISTS `char_remedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_remedy` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `remedy_id` int(11) NOT NULL DEFAULT '0',
  `remedy_count` int(11) NOT NULL DEFAULT '0',
  `remedy_luck` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_ride`
--

DROP TABLE IF EXISTS `char_ride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_ride` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `upgrade_cost` int(11) NOT NULL DEFAULT '0',
  `build_cost` int(11) NOT NULL DEFAULT '0',
  `res_id` int(11) NOT NULL DEFAULT '0',
  `res_list` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_setting`
--

DROP TABLE IF EXISTS `char_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_setting` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `flag` int(11) unsigned NOT NULL DEFAULT '0',
  `volumn` int(11) unsigned NOT NULL DEFAULT '0',
  `hint_record` int(11) unsigned NOT NULL DEFAULT '0',
  `quest_record` int(11) unsigned NOT NULL DEFAULT '0',
  `level_award_record` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_shortcuts`
--

DROP TABLE IF EXISTS `char_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_shortcuts` (
  `char_oid` int(11) NOT NULL DEFAULT '0',
  `slot_flag0` int(11) NOT NULL DEFAULT '0',
  `slot_flag1` int(11) NOT NULL DEFAULT '0',
  `slot_flag2` int(11) NOT NULL DEFAULT '0',
  `slot_00` int(11) NOT NULL DEFAULT '0',
  `slot_01` int(11) NOT NULL DEFAULT '0',
  `slot_02` int(11) NOT NULL DEFAULT '0',
  `slot_03` int(11) NOT NULL DEFAULT '0',
  `slot_04` int(11) NOT NULL DEFAULT '0',
  `slot_05` int(11) NOT NULL DEFAULT '0',
  `slot_06` int(11) NOT NULL DEFAULT '0',
  `slot_07` int(11) NOT NULL DEFAULT '0',
  `slot_08` int(11) NOT NULL DEFAULT '0',
  `slot_09` int(11) NOT NULL DEFAULT '0',
  `slot_10` int(11) NOT NULL DEFAULT '0',
  `slot_11` int(11) NOT NULL DEFAULT '0',
  `slot_12` int(11) NOT NULL DEFAULT '0',
  `slot_13` int(11) NOT NULL DEFAULT '0',
  `slot_14` int(11) NOT NULL DEFAULT '0',
  `slot_15` int(11) NOT NULL DEFAULT '0',
  `slot_16` int(11) NOT NULL DEFAULT '0',
  `slot_17` int(11) NOT NULL DEFAULT '0',
  `slot_18` int(11) NOT NULL DEFAULT '0',
  `slot_19` int(11) NOT NULL DEFAULT '0',
  `slot_20` int(11) NOT NULL DEFAULT '0',
  `slot_21` int(11) NOT NULL DEFAULT '0',
  `slot_22` int(11) NOT NULL DEFAULT '0',
  `slot_23` int(11) NOT NULL DEFAULT '0',
  `slot_24` int(11) NOT NULL DEFAULT '0',
  `slot_25` int(11) NOT NULL DEFAULT '0',
  `slot_26` int(11) NOT NULL DEFAULT '0',
  `slot_27` int(11) NOT NULL DEFAULT '0',
  `slot_28` int(11) NOT NULL DEFAULT '0',
  `slot_29` int(11) NOT NULL DEFAULT '0',
  `slot_30` int(11) NOT NULL DEFAULT '0',
  `slot_31` int(11) NOT NULL DEFAULT '0',
  `slot_32` int(11) NOT NULL DEFAULT '0',
  `slot_33` int(11) NOT NULL DEFAULT '0',
  `slot_34` int(11) NOT NULL DEFAULT '0',
  `slot_35` int(11) NOT NULL DEFAULT '0',
  `slot_36` int(11) NOT NULL DEFAULT '0',
  `slot_37` int(11) NOT NULL DEFAULT '0',
  `slot_38` int(11) NOT NULL DEFAULT '0',
  `slot_39` int(11) NOT NULL DEFAULT '0',
  `slot_40` int(11) NOT NULL DEFAULT '0',
  `slot_41` int(11) NOT NULL DEFAULT '0',
  `slot_42` int(11) NOT NULL DEFAULT '0',
  `slot_43` int(11) NOT NULL DEFAULT '0',
  `slot_44` int(11) NOT NULL DEFAULT '0',
  `slot_45` int(11) NOT NULL DEFAULT '0',
  `slot_46` int(11) NOT NULL DEFAULT '0',
  `slot_47` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_sign_info`
--

DROP TABLE IF EXISTS `char_sign_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_sign_info` (
  `charOid` int(11) unsigned NOT NULL DEFAULT '0',
  `signDailyDays` int(11) NOT NULL DEFAULT '0',
  `dailyGetState` int(11) NOT NULL DEFAULT '0',
  `signContinueDays` int(11) NOT NULL DEFAULT '0',
  `continueGetState` int(11) NOT NULL DEFAULT '0',
  `lastContinueSignTime` int(11) unsigned NOT NULL DEFAULT '0',
  `daily_onlineaward_index` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charOid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_soul`
--

DROP TABLE IF EXISTS `char_soul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_soul` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_1` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_2` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_3` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_4` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_5` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_xp_6` int(11) unsigned NOT NULL DEFAULT '0',
  `xp_value` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `energy` int(11) NOT NULL DEFAULT '0',
  `school` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_point` int(11) NOT NULL DEFAULT '0',
  `farm_oid` int(11) NOT NULL DEFAULT '0',
  `gui_op` int(11) NOT NULL DEFAULT '0',
  `make_trump_level` int(11) NOT NULL DEFAULT '0',
  `make_trump_point` int(11) NOT NULL DEFAULT '0',
  `make_equip_level` int(11) NOT NULL DEFAULT '0',
  `make_equip_point` int(11) NOT NULL DEFAULT '0',
  `make_body_level` int(11) NOT NULL DEFAULT '0',
  `make_body_point` int(11) NOT NULL DEFAULT '0',
  `make_drug_level` int(11) NOT NULL DEFAULT '0',
  `make_drug_point` int(11) NOT NULL DEFAULT '0',
  `make_charm_level` int(11) NOT NULL DEFAULT '0',
  `make_charm_point` int(11) NOT NULL DEFAULT '0',
  `make_skill_book_level` int(11) NOT NULL DEFAULT '0',
  `make_skill_book_point` int(11) NOT NULL DEFAULT '0',
  `alchemy_level` int(11) NOT NULL DEFAULT '0',
  `plant_level` int(11) NOT NULL DEFAULT '0',
  `feed_level` int(11) NOT NULL DEFAULT '0',
  `attack_level` int(11) NOT NULL DEFAULT '0',
  `defence_level` int(11) NOT NULL DEFAULT '0',
  `catch_level` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) NOT NULL DEFAULT '0',
  `spell_xp_main` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_spells`
--

DROP TABLE IF EXISTS `char_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_spells` (
  `instance_oid` bigint(20) NOT NULL AUTO_INCREMENT,
  `char_oid` int(11) NOT NULL DEFAULT '0',
  `spell_oid` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT '0',
  `cur_exp` int(11) DEFAULT '0',
  `slot_no` int(11) DEFAULT NULL,
  `last_cast` bigint(11) unsigned DEFAULT '0',
  `can_use` int(11) unsigned NOT NULL DEFAULT '1',
  `trump_spell_attr1` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr2` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr3` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_spell_attr4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`instance_oid`,`char_oid`),
  KEY `char_oid` (`char_oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3134 DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_stages`
--

DROP TABLE IF EXISTS `char_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_stages` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_id` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_chapters` int(11) unsigned NOT NULL DEFAULT '0',
  `stage_hard_type` int(11) NOT NULL DEFAULT '0',
  `stage_result` int(11) NOT NULL DEFAULT '0',
  `stage_create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_stat_sort`
--

DROP TABLE IF EXISTS `char_stat_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_stat_sort` (
  `char_oid` int(11) NOT NULL DEFAULT '0',
  `sort_type` int(11) NOT NULL DEFAULT '0',
  `char_name` varchar(64) NOT NULL DEFAULT '0',
  `race` int(11) NOT NULL DEFAULT '0',
  `sort_effect_val1` int(11) NOT NULL DEFAULT '0',
  `sort_effect_val2` int(11) NOT NULL DEFAULT '0',
  `sort_effect_val3` int(11) NOT NULL DEFAULT '0',
  `sort_effect_val4` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sort_type`,`char_oid`),
  KEY `char_oid` (`char_oid`),
  KEY `sort_type` (`sort_type`,`sort_effect_val1`,`sort_effect_val2`,`sort_effect_val3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_statistics`
--

DROP TABLE IF EXISTS `char_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_statistics` (
  `char_oid` int(11) unsigned NOT NULL,
  `stat0` int(11) NOT NULL DEFAULT '0',
  `stat1` int(11) NOT NULL DEFAULT '0',
  `stat2` int(11) NOT NULL DEFAULT '0',
  `stat3` int(11) NOT NULL DEFAULT '0',
  `stat4` int(11) NOT NULL DEFAULT '0',
  `stat5` int(11) NOT NULL DEFAULT '0',
  `stat6` int(11) NOT NULL DEFAULT '0',
  `stat7` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_stores`
--

DROP TABLE IF EXISTS `char_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_stores` (
  `char_oid` int(11) unsigned NOT NULL,
  `store_type` int(11) unsigned NOT NULL,
  `last_refresh_time` int(11) unsigned NOT NULL,
  `manual_refresh_times` int(11) unsigned NOT NULL,
  `item1TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item1StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item1_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item1_price` int(11) NOT NULL DEFAULT '0',
  `item2TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item2StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item2_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item2_price` int(11) NOT NULL DEFAULT '0',
  `item3TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item3StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item3_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item3_price` int(11) NOT NULL DEFAULT '0',
  `item4TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item4StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item4_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item4_price` int(11) NOT NULL DEFAULT '0',
  `item5TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item5StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item5_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item5_price` int(11) NOT NULL DEFAULT '0',
  `item6TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item6StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item6_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item6_price` int(11) NOT NULL DEFAULT '0',
  `item7TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item7StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item7_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item7_price` int(11) NOT NULL DEFAULT '0',
  `item8TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item8StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item8_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item8_price` int(11) NOT NULL DEFAULT '0',
  `item9TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item9StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item9_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item9_price` int(11) NOT NULL DEFAULT '0',
  `item10TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item10StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item10_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item10_price` int(11) NOT NULL DEFAULT '0',
  `item11TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item11StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item11_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item11_price` int(11) NOT NULL DEFAULT '0',
  `item12TplId` int(11) unsigned NOT NULL DEFAULT '0',
  `item12StackCount` int(11) unsigned NOT NULL DEFAULT '0',
  `item12_cointype` tinyint(4) NOT NULL DEFAULT '0',
  `item12_price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`store_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_title`
--

DROP TABLE IF EXISTS `char_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_title` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `title_id` int(11) unsigned NOT NULL DEFAULT '0',
  `disappear_time` int(11) unsigned NOT NULL DEFAULT '0',
  `life_time` int(11) NOT NULL DEFAULT '0',
  `own_state` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`,`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_trumps`
--

DROP TABLE IF EXISTS `char_trumps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_trumps` (
  `trump_uuid` varchar(36) NOT NULL,
  `trump_tpltid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trump_exp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trump_level` int(11) NOT NULL DEFAULT '0',
  `trump_energy` int(11) NOT NULL DEFAULT '0',
  `trump_hp` int(11) NOT NULL DEFAULT '0',
  `trump_normal_energy` int(11) NOT NULL DEFAULT '0',
  `trump_normal_hp` int(11) NOT NULL DEFAULT '0',
  `trump_qualityid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_starid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip1_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip1_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip2_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip2_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip3_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip3_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip4_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip4_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip5_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip5_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_id` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_level` int(11) NOT NULL DEFAULT '0',
  `trump_equip6_exp` int(11) unsigned NOT NULL DEFAULT '0',
  `trump_equip6_upperid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trump_uuid`),
  KEY `owner_oid` (`owner_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_wages`
--

DROP TABLE IF EXISTS `char_wages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_wages` (
  `char_oid` int(11) NOT NULL,
  `day_wage` int(11) NOT NULL,
  `quest_wage` int(11) NOT NULL,
  `master_wage` int(11) NOT NULL,
  `quest_count` int(11) NOT NULL DEFAULT '0',
  `daily_flag` int(11) NOT NULL DEFAULT '0',
  `daily_time` int(11) NOT NULL DEFAULT '0',
  `daily_update` int(11) NOT NULL DEFAULT '0',
  `lucre_flag` int(11) NOT NULL DEFAULT '0',
  `lucre_login_time` int(11) NOT NULL DEFAULT '0',
  `lucre_days_inweek` int(11) NOT NULL DEFAULT '0',
  `lucre_week_update` int(11) NOT NULL DEFAULT '0',
  `lucre_logout_time` int(11) NOT NULL DEFAULT '0',
  `lucre_leave_count` int(11) NOT NULL DEFAULT '0',
  `double_exp_time` int(11) NOT NULL DEFAULT '0',
  `jackaroo_cur` int(11) NOT NULL DEFAULT '0',
  `jackaroo_max` int(11) NOT NULL DEFAULT '0',
  `vip_relive_count` int(11) NOT NULL DEFAULT '0',
  `vip_turn_card_count` int(11) NOT NULL DEFAULT '0',
  `farm_take_money` int(11) NOT NULL DEFAULT '0',
  `coordinate_count` int(11) NOT NULL DEFAULT '10',
  `challenge_limit` int(11) NOT NULL DEFAULT '0',
  `challenge_time` int(11) NOT NULL DEFAULT '0',
  `vip_culture_count` int(11) NOT NULL DEFAULT '0',
  `free_rebuild_spell_count` int(11) NOT NULL DEFAULT '0',
  `vip_rebuild_spell_count` int(11) NOT NULL DEFAULT '0',
  `cash_exchange_count` int(11) NOT NULL DEFAULT '0',
  `bind_cash_exchange_count` int(11) NOT NULL DEFAULT '0',
  `exchange_start_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `char_weibo_log`
--

DROP TABLE IF EXISTS `char_weibo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_weibo_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(10) unsigned NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `weibo_id` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_bills`
--

DROP TABLE IF EXISTS `charge_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_bills` (
  `orderno` varchar(32) NOT NULL,
  `serviceid` int(11) NOT NULL,
  `account_oid` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `money` float NOT NULL DEFAULT '0',
  `transtime` int(10) NOT NULL,
  `sign` char(32) NOT NULL,
  `drawtime` int(10) NOT NULL,
  `status` int(8) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `created` int(10) NOT NULL,
  PRIMARY KEY (`orderno`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crash_log`
--

DROP TABLE IF EXISTS `crash_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crash_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(11) unsigned NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `account_id` int(11) unsigned NOT NULL,
  `charge_type` int(11) unsigned NOT NULL,
  `gold_coins` int(11) unsigned NOT NULL,
  `silver_coins` int(11) unsigned NOT NULL,
  `is_success` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `success_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_desc` text NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exchange_failed_log`
--

DROP TABLE IF EXISTS `exchange_failed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_failed_log` (
  `efl_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `efl_account` int(11) unsigned NOT NULL DEFAULT '0',
  `efl_roleid` int(11) unsigned NOT NULL DEFAULT '0',
  `efl_point` int(11) NOT NULL DEFAULT '0',
  `efl_balance` int(11) NOT NULL DEFAULT '0',
  `efl_server` int(11) unsigned NOT NULL DEFAULT '0',
  `efl_map` int(11) NOT NULL DEFAULT '0',
  `efl_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `efl_gold_balance` int(11) NOT NULL DEFAULT '0',
  `efl_authority` int(11) NOT NULL DEFAULT '0',
  `efl_failed_point` int(11) NOT NULL DEFAULT '0',
  `efl_desc` varchar(256) NOT NULL,
  PRIMARY KEY (`efl_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fellow_spell_container`
--

DROP TABLE IF EXISTS `fellow_spell_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fellow_spell_container` (
  `fellow_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `slot_flag0` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag1` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag2` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag3` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag4` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag5` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag6` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag7` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag8` int(11) unsigned NOT NULL DEFAULT '0',
  `slot_flag9` int(11) unsigned NOT NULL DEFAULT '0',
  `slot0` int(11) NOT NULL DEFAULT '0',
  `slot1` int(11) NOT NULL DEFAULT '0',
  `slot2` int(11) NOT NULL DEFAULT '0',
  `slot3` int(11) NOT NULL DEFAULT '0',
  `slot4` int(11) NOT NULL DEFAULT '0',
  `slot5` int(11) NOT NULL DEFAULT '-1',
  `slot6` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`fellow_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `festival_activity`
--

DROP TABLE IF EXISTS `festival_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festival_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `activety_name` varchar(64) NOT NULL,
  `activety_desc` varchar(256) NOT NULL,
  `region_id` int(11) NOT NULL DEFAULT '0',
  `act_begin_time` int(11) NOT NULL DEFAULT '0',
  `act_end_time` int(11) NOT NULL DEFAULT '0',
  `draw_begin_time` int(11) NOT NULL DEFAULT '0',
  `draw_end_time` int(11) NOT NULL DEFAULT '0',
  `act_para1` int(11) NOT NULL DEFAULT '0',
  `act_para2` int(11) NOT NULL DEFAULT '0',
  `act_para3` int(11) NOT NULL DEFAULT '0',
  `award_count_limit` int(11) NOT NULL DEFAULT '0',
  `award_id1` int(11) NOT NULL DEFAULT '0',
  `award_id2` int(11) NOT NULL DEFAULT '0',
  `award_id3` int(11) NOT NULL DEFAULT '0',
  `award_id4` int(11) NOT NULL DEFAULT '0',
  `award_id5` int(11) NOT NULL DEFAULT '0',
  `award_id6` int(11) NOT NULL DEFAULT '0',
  `award_id7` int(11) NOT NULL DEFAULT '0',
  `award_id8` int(11) NOT NULL DEFAULT '0',
  `award_id9` int(11) NOT NULL DEFAULT '0',
  `award_id10` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `festival_award`
--

DROP TABLE IF EXISTS `festival_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `festival_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(64) NOT NULL,
  `award_desc` varchar(128) NOT NULL,
  `bind_cash` int(11) NOT NULL DEFAULT '0',
  `vip_fund` int(11) NOT NULL DEFAULT '0',
  `item_id1` int(11) NOT NULL DEFAULT '0',
  `item_count1` int(11) NOT NULL DEFAULT '0',
  `item_id2` int(11) NOT NULL DEFAULT '0',
  `item_count2` int(11) NOT NULL DEFAULT '0',
  `item_id3` int(11) NOT NULL DEFAULT '0',
  `item_count3` int(11) NOT NULL DEFAULT '0',
  `item_id4` int(11) NOT NULL DEFAULT '0',
  `item_count4` int(11) NOT NULL DEFAULT '0',
  `item_id5` int(11) NOT NULL DEFAULT '0',
  `item_count5` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data`
--

DROP TABLE IF EXISTS `field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data` (
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL DEFAULT '',
  `field_level` int(11) unsigned NOT NULL DEFAULT '0',
  `field_state` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_name` varchar(64) NOT NULL DEFAULT '',
  `occupy_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_issue`
--

DROP TABLE IF EXISTS `gm_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_issue` (
  `issue_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `region_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `exten_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `issue_type` int(11) NOT NULL DEFAULT '0',
  `issue_title` varchar(50) NOT NULL DEFAULT '',
  `char_oid` int(11) unsigned NOT NULL,
  `report_ip` int(11) unsigned DEFAULT '0',
  `report_time` int(11) unsigned DEFAULT '0',
  `acct_name` varchar(16) NOT NULL DEFAULT '',
  `char_name` varchar(36) NOT NULL DEFAULT '',
  `request_desc` text,
  `gm_oid` int(11) unsigned DEFAULT '0',
  `start_time` int(11) unsigned DEFAULT '0',
  `close_time` int(11) unsigned DEFAULT '0',
  `queue_length` int(11) unsigned DEFAULT '0',
  `state` int(11) DEFAULT '0',
  `resolution` int(11) DEFAULT '0',
  `resolve_type` int(11) DEFAULT '0',
  `issue_comment` text,
  PRIMARY KEY (`issue_uid`),
  KEY `char_oid` (`char_oid`),
  KEY `report_time` (`report_time`),
  KEY `area_uid` (`area_uid`,`region_uid`,`exten_uid`),
  KEY `gm_oid_idx` (`gm_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_issue_history`
--

DROP TABLE IF EXISTS `gm_issue_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_issue_history` (
  `issue_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `region_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `exten_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `issue_type` int(11) NOT NULL DEFAULT '0',
  `issue_title` varchar(50) NOT NULL DEFAULT '',
  `char_oid` int(11) unsigned NOT NULL,
  `report_ip` int(11) unsigned DEFAULT '0',
  `report_time` int(11) unsigned DEFAULT '0',
  `acct_name` varchar(16) NOT NULL DEFAULT '',
  `char_name` varchar(36) NOT NULL DEFAULT '',
  `request_desc` text,
  `gm_oid` int(11) unsigned DEFAULT '0',
  `start_time` int(11) unsigned DEFAULT '0',
  `close_time` int(11) unsigned DEFAULT '0',
  `queue_length` int(11) unsigned DEFAULT '0',
  `state` int(11) DEFAULT '0',
  `resolution` int(11) DEFAULT '0',
  `resolve_type` int(11) DEFAULT '0',
  `issue_comment` text,
  PRIMARY KEY (`issue_uid`),
  KEY `char_oid` (`char_oid`),
  KEY `report_time` (`report_time`),
  KEY `area_uid` (`area_uid`,`region_uid`,`exten_uid`),
  KEY `gm_oid_idx` (`gm_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_response`
--

DROP TABLE IF EXISTS `gm_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_response` (
  `rspn_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `region_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `exten_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `issue_uid` int(11) unsigned NOT NULL,
  `rspn_type` int(11) NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL,
  `gm_oid` int(11) unsigned NOT NULL,
  `rspn_time` int(11) unsigned NOT NULL DEFAULT '0',
  `rspn_state` int(11) DEFAULT '0',
  `rspn_content` text,
  PRIMARY KEY (`rspn_uid`),
  KEY `issue_uid` (`issue_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_response_history`
--

DROP TABLE IF EXISTS `gm_response_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_response_history` (
  `rspn_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `region_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `exten_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `issue_uid` int(11) unsigned NOT NULL,
  `rspn_type` int(11) NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL,
  `gm_oid` int(11) unsigned NOT NULL,
  `rspn_time` int(11) unsigned NOT NULL DEFAULT '0',
  `rspn_state` int(11) DEFAULT '0',
  `rspn_content` text,
  PRIMARY KEY (`rspn_uid`),
  KEY `issue_uid` (`issue_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gold_trade`
--

DROP TABLE IF EXISTS `gold_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_trade` (
  `trade_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `char_name` varchar(64) NOT NULL DEFAULT '',
  `trade_type` int(11) NOT NULL DEFAULT '0',
  `trade_num` int(11) NOT NULL DEFAULT '0',
  `trade_price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trade_fee` bigint(20) unsigned NOT NULL DEFAULT '0',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `over_time` int(11) unsigned NOT NULL DEFAULT '0',
  `trade_state` int(11) NOT NULL DEFAULT '0',
  `trade_char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `trade_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_oid`),
  KEY `char_oid` (`char_oid`),
  KEY `start_time` (`start_time`),
  KEY `over_time` (`over_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gold_trade_history`
--

DROP TABLE IF EXISTS `gold_trade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gold_trade_history` (
  `trade_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `char_name` varchar(64) NOT NULL DEFAULT '',
  `trade_type` int(11) NOT NULL DEFAULT '0',
  `trade_num` int(11) NOT NULL DEFAULT '0',
  `trade_price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trade_fee` bigint(20) unsigned NOT NULL DEFAULT '0',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `over_time` int(11) unsigned NOT NULL DEFAULT '0',
  `trade_state` int(11) NOT NULL DEFAULT '0',
  `trade_char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `trade_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trade_oid`),
  KEY `char_oid` (`char_oid`),
  KEY `start_time` (`start_time`),
  KEY `over_time` (`over_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_shop`
--

DROP TABLE IF EXISTS `goods_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_shop` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_label` int(11) unsigned NOT NULL,
  `second_label` int(11) unsigned NOT NULL,
  `slot_no` int(10) unsigned NOT NULL,
  `template_oid` int(11) unsigned NOT NULL,
  `goods_name` varchar(64) NOT NULL,
  `goods_desc` text NOT NULL,
  `sale_state` varchar(12) NOT NULL,
  `coin_type` int(10) unsigned NOT NULL DEFAULT '2',
  `price` bigint(20) NOT NULL,
  `stack_count` int(11) NOT NULL,
  `life_time` int(11) NOT NULL,
  `limit_max` int(11) NOT NULL,
  `refresh_space` int(11) unsigned NOT NULL DEFAULT '0',
  `refresh_num` int(11) unsigned NOT NULL DEFAULT '0',
  `operate_flag` varchar(36) NOT NULL DEFAULT '',
  `operate_flag_enable` int(11) NOT NULL DEFAULT '1',
  `goods_state` int(10) unsigned NOT NULL,
  `sale_time` datetime NOT NULL,
  `sale_time_out` datetime NOT NULL,
  `is_overdraft` int(11) unsigned NOT NULL DEFAULT '0',
  `is_vip` int(11) unsigned NOT NULL DEFAULT '0',
  `present_integral` int(11) unsigned NOT NULL DEFAULT '0',
  `present_cash` int(11) unsigned NOT NULL DEFAULT '0',
  `present_vip_time` int(11) unsigned NOT NULL DEFAULT '0',
  `goods_name_color` varchar(12) NOT NULL,
  `sale_state_color` varchar(12) NOT NULL,
  `goods_price_color` varchar(12) NOT NULL,
  `cur_space` int(11) NOT NULL,
  `cur_amount` int(11) NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `first_label` (`first_label`),
  KEY `second_label` (`second_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_data`
--

DROP TABLE IF EXISTS `guild_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_data` (
  `guild_id` int(11) unsigned NOT NULL,
  `name` varchar(36) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `bankroll` int(11) NOT NULL DEFAULT '0',
  `boom` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `bulletin` varchar(512) NOT NULL,
  `leader_name` varchar(64) NOT NULL,
  `ext_flag` int(11) unsigned NOT NULL DEFAULT '0',
  `firm_distillate` int(11) NOT NULL DEFAULT '0',
  `vital_distillate` int(11) NOT NULL DEFAULT '0',
  `caloric_distillate` int(11) NOT NULL DEFAULT '0',
  `liquid_distillate` int(11) NOT NULL DEFAULT '0',
  `domanial_distillate` int(11) NOT NULL DEFAULT '0',
  `count_award_flag` bigint(20) unsigned NOT NULL DEFAULT '0',
  `contribute_time` int(11) NOT NULL DEFAULT '0',
  `member_count` int(10) unsigned NOT NULL DEFAULT '0',
  `back_bankroll` int(11) unsigned NOT NULL DEFAULT '0',
  `pk_cumulate_point` int(11) unsigned NOT NULL DEFAULT '0',
  `occupy_hole_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`),
  KEY `level` (`level`,`member_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_limits`
--

DROP TABLE IF EXISTS `guild_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_limits` (
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `limit_id` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `last_update` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`,`limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_pk_info`
--

DROP TABLE IF EXISTS `guild_pk_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_pk_info` (
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_name` varchar(36) NOT NULL,
  `bid_bankroll` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `match_state` int(11) NOT NULL DEFAULT '0',
  `match_result` int(11) NOT NULL DEFAULT '0',
  `pk_index` int(11) NOT NULL DEFAULT '0',
  `killed_guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_pk_scene`
--

DROP TABLE IF EXISTS `guild_pk_scene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_pk_scene` (
  `guild_id1` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_name1` varchar(36) NOT NULL,
  `guild_id2` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_name2` varchar(36) NOT NULL,
  `scene_tpye` int(11) NOT NULL DEFAULT '0',
  `win_guild_name` varchar(36) NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id1`,`guild_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_produce`
--

DROP TABLE IF EXISTS `guild_produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_produce` (
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `main_level` int(11) unsigned NOT NULL DEFAULT '0',
  `main_state` int(11) unsigned NOT NULL DEFAULT '0',
  `main_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `resource_level` int(11) unsigned NOT NULL DEFAULT '0',
  `resource_state` int(11) unsigned NOT NULL DEFAULT '0',
  `resource_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `business_level` int(11) unsigned NOT NULL DEFAULT '0',
  `business_state` int(11) unsigned NOT NULL DEFAULT '0',
  `business_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `skill_store_level` int(11) unsigned NOT NULL DEFAULT '0',
  `skill_store_state` int(11) unsigned NOT NULL DEFAULT '0',
  `skill_store_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `manufacture_level` int(11) unsigned NOT NULL DEFAULT '0',
  `manufacture_state` int(11) unsigned NOT NULL DEFAULT '0',
  `manufacture_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `relation_level` int(11) unsigned NOT NULL DEFAULT '0',
  `relation_state` int(11) unsigned NOT NULL DEFAULT '0',
  `relation_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `instance_level` int(11) unsigned NOT NULL DEFAULT '0',
  `instance_state` int(11) unsigned NOT NULL DEFAULT '0',
  `instance_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `star_tower_level` int(11) unsigned NOT NULL DEFAULT '0',
  `star_tower_state` int(11) unsigned NOT NULL DEFAULT '0',
  `star_tower_build_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_owe_time` int(11) unsigned NOT NULL DEFAULT '0',
  `series_owe_count` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_skill`
--

DROP TABLE IF EXISTS `guild_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guild_skill` (
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `make_trump_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_trump_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_trump_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `make_equip_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_equip_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_equip_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `make_body_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_body_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_body_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `make_drug_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_drug_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_drug_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `make_charm_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_charm_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_charm_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `make_skillbook_level` int(11) unsigned NOT NULL DEFAULT '0',
  `make_skillbook_state` int(11) unsigned NOT NULL DEFAULT '0',
  `make_skillbook_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `alchemy_level` int(11) unsigned NOT NULL DEFAULT '0',
  `alchemy_state` int(11) unsigned NOT NULL DEFAULT '0',
  `alchemy_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `plant_level` int(11) unsigned NOT NULL DEFAULT '0',
  `plant_state` int(11) unsigned NOT NULL DEFAULT '0',
  `plant_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `feed_level` int(11) unsigned NOT NULL DEFAULT '0',
  `feed_state` int(11) unsigned NOT NULL DEFAULT '0',
  `feed_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `attack_level` int(11) unsigned NOT NULL DEFAULT '0',
  `attack_state` int(11) unsigned NOT NULL DEFAULT '0',
  `attack_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `defence_level` int(11) unsigned NOT NULL DEFAULT '0',
  `defence_state` int(11) unsigned NOT NULL DEFAULT '0',
  `defence_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  `catch_level` int(11) unsigned NOT NULL DEFAULT '0',
  `catch_state` int(11) unsigned NOT NULL DEFAULT '0',
  `catch_research_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hole_data`
--

DROP TABLE IF EXISTS `hole_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hole_data` (
  `hole_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hole_name` varchar(64) NOT NULL DEFAULT '',
  `hole_state` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_id` int(11) unsigned NOT NULL DEFAULT '0',
  `guild_name` varchar(64) NOT NULL DEFAULT '',
  `occupy_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hole_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_cache`
--

DROP TABLE IF EXISTS `mail_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_cache` (
  `mail_uuid` char(36) NOT NULL,
  `receiver_oid` int(11) unsigned NOT NULL,
  `mail_subject` varchar(60) NOT NULL,
  `mail_content` varchar(300) NOT NULL,
  `exist_time` int(11) unsigned NOT NULL,
  `coin0_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin0_count` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_t` int(11) unsigned NOT NULL DEFAULT '0',
  `coin1_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `count0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `count1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `count2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `count3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `count4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_log` (
  `update_time` int(11) unsigned NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `update_type` varchar(36) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_rows` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_name`,`update_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='init';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_skill_container`
--

DROP TABLE IF EXISTS `pet_skill_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_skill_container` (
  `owner_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `grid_index` int(11) NOT NULL DEFAULT '0',
  `skill_oid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`owner_oid`,`grid_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_count_log`
--

DROP TABLE IF EXISTS `player_count_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_count_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `line_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_info`
--

DROP TABLE IF EXISTS `player_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_info` (
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `sex_id` int(11) NOT NULL DEFAULT '0',
  `zodiac_id` int(11) NOT NULL DEFAULT '0',
  `constellation_id` int(11) NOT NULL DEFAULT '0',
  `school` varchar(64) NOT NULL DEFAULT '',
  `city` varchar(64) NOT NULL DEFAULT '',
  `decade` int(11) NOT NULL DEFAULT '0',
  `career` varchar(64) NOT NULL DEFAULT '',
  `salary` varchar(64) NOT NULL DEFAULT '',
  `sign` varchar(512) NOT NULL DEFAULT '',
  `picture` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`char_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_power`
--

DROP TABLE IF EXISTS `player_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) unsigned NOT NULL DEFAULT '0',
  `char_oid` int(11) unsigned NOT NULL DEFAULT '0',
  `school` int(11) NOT NULL DEFAULT '0',
  `power` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `body_tempid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_name` varchar(64) NOT NULL,
  `body_info` varchar(64) NOT NULL,
  `fly_info` varchar(64) NOT NULL,
  `run_info` varchar(64) NOT NULL,
  `trump_info` text NOT NULL,
  `equip_info` text NOT NULL,
  `pet_info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redeem_award`
--

DROP TABLE IF EXISTS `redeem_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redeem_award` (
  `redeem_uuid` varchar(36) NOT NULL,
  `redeem_name` varchar(64) NOT NULL,
  `account_oid` int(10) unsigned NOT NULL,
  `char_oid` int(10) unsigned NOT NULL,
  `redeem_exp` int(11) NOT NULL,
  `soul_exp` int(11) NOT NULL,
  `trump_point` int(11) NOT NULL,
  `money_cash` int(11) NOT NULL,
  `bind_cash` int(11) NOT NULL,
  `drop_id` int(11) NOT NULL,
  `item_id1` int(11) NOT NULL,
  `item_count1` int(11) NOT NULL,
  `item_id2` int(11) NOT NULL,
  `item_count2` int(11) NOT NULL,
  `item_id3` int(11) NOT NULL,
  `item_count3` int(11) NOT NULL,
  `item_id4` int(11) NOT NULL,
  `item_count4` int(11) NOT NULL,
  `item_id5` int(11) NOT NULL,
  `item_count5` int(11) NOT NULL,
  `create_time` int(10) unsigned NOT NULL,
  `gain_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`redeem_uuid`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `svr_bulletins`
--

DROP TABLE IF EXISTS `svr_bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svr_bulletins` (
  `blt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blt_begin` int(10) unsigned NOT NULL,
  `blt_finish` int(10) unsigned NOT NULL,
  `blt_interval` int(10) unsigned NOT NULL DEFAULT '60',
  `blt_channel` int(11) NOT NULL,
  `blt_content` varchar(255) NOT NULL,
  `blt_create` int(10) unsigned NOT NULL,
  `blt_char` varchar(36) NOT NULL,
  `blt_ipaddr` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`blt_id`),
  KEY `blt_begin` (`blt_begin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='clean';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `svr_params`
--

DROP TABLE IF EXISTS `svr_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svr_params` (
  `p_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `p_region` int(11) unsigned NOT NULL DEFAULT '0',
  `p_type` int(11) NOT NULL DEFAULT '0',
  `p_type_key` int(11) NOT NULL DEFAULT '0',
  `p_name` varchar(50) NOT NULL DEFAULT '',
  `p_val_type` char(1) DEFAULT NULL,
  `p_value` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`p_type`,`p_type_key`,`p_name`),
  UNIQUE KEY `p_id` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_data`
--

DROP TABLE IF EXISTS `system_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_data` (
  `key_enum` int(11) NOT NULL,
  `str_value` varchar(64) NOT NULL,
  PRIMARY KEY (`key_enum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_create_log`
--

DROP TABLE IF EXISTS `table_create_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_create_log` (
  `log_uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(11) unsigned NOT NULL,
  `table_type` tinyint(4) unsigned NOT NULL,
  `table_name` varchar(100) NOT NULL,
  PRIMARY KEY (`log_uid`),
  UNIQUE KEY `table_name` (`table_name`),
  KEY `table_type` (`table_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_xml`
--

DROP TABLE IF EXISTS `template_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `temp` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pkey` varchar(50) NOT NULL,
  `def_file` varchar(50) NOT NULL,
  `def_node` varchar(50) NOT NULL,
  `c_file` varchar(50) NOT NULL,
  `c_node` varchar(256) NOT NULL,
  `list` varchar(512) NOT NULL,
  `search` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `def_file` (`def_file`),
  UNIQUE KEY `temp` (`temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools_export_field`
--

DROP TABLE IF EXISTS `tools_export_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools_export_field` (
  `field_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_id` int(11) unsigned NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_intable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `field_status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `field_sort` int(1) unsigned NOT NULL DEFAULT '1',
  `field_defaultname` varchar(100) NOT NULL,
  `field_realname` varchar(100) DEFAULT NULL,
  `field_type` int(1) unsigned NOT NULL DEFAULT '1',
  `field_typepara1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `field_typepara2` text NOT NULL,
  `field_source` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_sourcepara` varchar(100) DEFAULT NULL,
  `field_validrule` text NOT NULL,
  `field_inlist` tinyint(1) unsigned NOT NULL,
  `field_hasurl` tinyint(1) NOT NULL DEFAULT '0',
  `field_url` varchar(256) DEFAULT NULL,
  `field_inshow` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `field_indetail` tinyint(1) unsigned NOT NULL,
  `field_detailedit` tinyint(1) unsigned NOT NULL,
  `field_inadd` tinyint(1) unsigned NOT NULL,
  `field_addedit` tinyint(1) unsigned NOT NULL,
  `field_insearch` tinyint(1) unsigned NOT NULL,
  `field_searchtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `table_id` (`table_id`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools_export_table`
--

DROP TABLE IF EXISTS `tools_export_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tools_export_table` (
  `table_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `table_desc` varchar(50) NOT NULL,
  `table_islog` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `table_oneday` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `table_primary` varchar(50) NOT NULL,
  `table_condition` varchar(200) NOT NULL,
  `table_orderby` varchar(100) NOT NULL,
  `table_list` varchar(50) NOT NULL,
  `table_add` varchar(50) NOT NULL,
  `table_show` varchar(50) NOT NULL,
  `table_detail` varchar(50) NOT NULL,
  `table_search` varchar(50) NOT NULL,
  `table_exec` varchar(256) NOT NULL,
  PRIMARY KEY (`table_id`),
  UNIQUE KEY `table_name` (`table_name`,`table_islog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wastebook_gold`
--

DROP TABLE IF EXISTS `wastebook_gold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wastebook_gold` (
  `wbg_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wbg_account` int(10) unsigned NOT NULL DEFAULT '0',
  `wbg_charid` int(10) unsigned NOT NULL DEFAULT '0',
  `wbg_use_type` int(11) NOT NULL DEFAULT '0',
  `wbg_income` int(11) NOT NULL DEFAULT '0',
  `wbg_payout` int(11) NOT NULL DEFAULT '0',
  `wbg_svr_line_id` int(11) unsigned NOT NULL DEFAULT '0',
  `wbg_point_after` int(11) NOT NULL DEFAULT '0',
  `wbg_point` int(11) NOT NULL DEFAULT '0',
  `wbg_gold_balance` int(11) NOT NULL DEFAULT '0',
  `wbg_desc` text NOT NULL,
  `wbg_server` int(11) unsigned NOT NULL DEFAULT '0',
  `wbg_map` int(11) NOT NULL DEFAULT '0',
  `wbg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `wbg_authority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wbg_uid`,`wbg_server`),
  KEY `time_stamp_index` (`wbg_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2212 DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wastebook_mall`
--

DROP TABLE IF EXISTS `wastebook_mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wastebook_mall` (
  `wbs_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `wbs_account` int(10) unsigned NOT NULL DEFAULT '0',
  `wbs_charid` int(10) unsigned NOT NULL DEFAULT '0',
  `wbs_amount` int(11) NOT NULL DEFAULT '0',
  `wbs_coin` int(11) NOT NULL DEFAULT '0',
  `wbs_goodid` int(11) unsigned NOT NULL DEFAULT '0',
  `wbs_itemid` int(11) unsigned NOT NULL DEFAULT '0',
  `wbs_server` int(10) unsigned NOT NULL DEFAULT '0',
  `wbs_svr_line` int(11) unsigned NOT NULL DEFAULT '0',
  `wbs_map` int(11) NOT NULL DEFAULT '0',
  `wbs_timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `wbs_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `wbs_shop_type` int(11) unsigned NOT NULL DEFAULT '0',
  `wbs_authority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wbs_uid`,`wbs_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='merge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_golog`
--

DROP TABLE IF EXISTS `zu_golog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_golog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_time` int(11) NOT NULL DEFAULT '0',
  `log_desc` text NOT NULL,
  `log_type` int(11) NOT NULL DEFAULT '0',
  `log_level` int(11) NOT NULL DEFAULT '0',
  `log_obj` int(11) NOT NULL DEFAULT '0',
  `log_loger` varchar(50) NOT NULL DEFAULT '',
  `log_region` int(10) unsigned NOT NULL DEFAULT '0',
  `log_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `log_loger` (`log_loger`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='gmop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_groups`
--

DROP TABLE IF EXISTS `zu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_groups` (
  `gp_id` int(8) NOT NULL AUTO_INCREMENT,
  `gp_name` varchar(100) NOT NULL DEFAULT '',
  `gp_active` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gp_id`),
  UNIQUE KEY `gp_name` (`gp_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='gmop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_rights`
--

DROP TABLE IF EXISTS `zu_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_rights` (
  `rt_id` int(8) NOT NULL AUTO_INCREMENT,
  `rt_name` varchar(100) NOT NULL DEFAULT '',
  `rt_comment` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`rt_id`),
  UNIQUE KEY `rt_name` (`rt_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_rightsgroups`
--

DROP TABLE IF EXISTS `zu_rightsgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_rightsgroups` (
  `rg_id` int(8) NOT NULL AUTO_INCREMENT,
  `rg_groups` varchar(100) NOT NULL DEFAULT '',
  `rg_rights` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`rg_id`),
  UNIQUE KEY `rg_groups` (`rg_groups`,`rg_rights`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_rightsuser`
--

DROP TABLE IF EXISTS `zu_rightsuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_rightsuser` (
  `ru_id` int(8) NOT NULL AUTO_INCREMENT,
  `ru_user` varchar(100) NOT NULL DEFAULT '',
  `ru_rights` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ru_id`),
  UNIQUE KEY `ru_user` (`ru_user`,`ru_rights`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_user`
--

DROP TABLE IF EXISTS `zu_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `real_name` varchar(255) NOT NULL,
  `user_email` varchar(150) NOT NULL DEFAULT '',
  `user_password` varchar(50) NOT NULL DEFAULT '',
  `user_active` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='gmop';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zu_usergroup`
--

DROP TABLE IF EXISTS `zu_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zu_usergroup` (
  `ug_id` int(8) NOT NULL AUTO_INCREMENT,
  `ug_group` varchar(100) NOT NULL DEFAULT '',
  `ug_user` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`ug_id`),
  UNIQUE KEY `ug_group` (`ug_group`,`ug_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='gmop';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-25 15:47:19
