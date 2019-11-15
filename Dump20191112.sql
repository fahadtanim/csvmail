CREATE DATABASE  IF NOT EXISTS `mm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mm`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mm
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `action_history`
--

DROP TABLE IF EXISTS `action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTION_TIME` datetime DEFAULT NULL,
  `ACTION_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3F3AF36B3E20AD51` (`USER_ID`),
  CONSTRAINT `FK3F3AF36B3E20AD51` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_history`
--

LOCK TABLES `action_history` WRITE;
/*!40000 ALTER TABLE `action_history` DISABLE KEYS */;
INSERT INTO `action_history` VALUES (1,'2019-11-12 04:01:19','NEW CHECK','CHK#: :1',1),(2,'2019-11-12 04:01:47','SETTLE CHECK','CHK#: :1;TOTAL:304.00',1),(3,'2019-11-12 04:02:51','NEW CHECK','CHK#: :2',2),(4,'2019-11-12 04:04:05','EDIT CHECK','CHK#: :2',2),(5,'2019-11-12 04:04:23','SETTLE CHECK','CHK#: :2;TOTAL:139.28',2);
/*!40000 ALTER TABLE `action_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendence_history`
--

DROP TABLE IF EXISTS `attendence_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendence_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLOCK_IN_TIME` datetime DEFAULT NULL,
  `CLOCK_OUT_TIME` datetime DEFAULT NULL,
  `CLOCK_IN_HOUR` smallint(6) DEFAULT NULL,
  `CLOCK_OUT_HOUR` smallint(6) DEFAULT NULL,
  `CLOCKED_OUT` bit(1) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `SHIFT_ID` int(11) DEFAULT NULL,
  `TERMINAL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDFE829A3E20AD51` (`USER_ID`),
  KEY `FKDFE829A7660A5E3` (`SHIFT_ID`),
  KEY `FKDFE829A2AD2D031` (`TERMINAL_ID`),
  CONSTRAINT `FKDFE829A2AD2D031` FOREIGN KEY (`TERMINAL_ID`) REFERENCES `terminal` (`ID`),
  CONSTRAINT `FKDFE829A3E20AD51` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`AUTO_ID`),
  CONSTRAINT `FKDFE829A7660A5E3` FOREIGN KEY (`SHIFT_ID`) REFERENCES `shift` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendence_history`
--

LOCK TABLES `attendence_history` WRITE;
/*!40000 ALTER TABLE `attendence_history` DISABLE KEYS */;
INSERT INTO `attendence_history` VALUES (1,'2019-11-12 03:15:42',NULL,3,NULL,'\0',1,1,8202),(2,'2019-11-12 04:02:35',NULL,4,NULL,'\0',2,1,9449);
/*!40000 ALTER TABLE `attendence_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_drawer_reset_history`
--

DROP TABLE IF EXISTS `cash_drawer_reset_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_drawer_reset_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESET_TIME` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `drawer_reset_time` (`RESET_TIME`),
  KEY `FK719418223E20AD51` (`USER_ID`),
  CONSTRAINT `FK719418223E20AD51` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_drawer_reset_history`
--

LOCK TABLES `cash_drawer_reset_history` WRITE;
/*!40000 ALTER TABLE `cash_drawer_reset_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_drawer_reset_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooking_instruction`
--

DROP TABLE IF EXISTS `cooking_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooking_instruction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_instruction`
--

LOCK TABLES `cooking_instruction` WRITE;
/*!40000 ALTER TABLE `cooking_instruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooking_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_and_discount`
--

DROP TABLE IF EXISTS `coupon_and_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_and_discount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  `EXPIRY_DATE` datetime DEFAULT NULL,
  `DISABLED` bit(1) DEFAULT NULL,
  `NEVER_EXPIRE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_and_discount`
--

LOCK TABLES `coupon_and_discount` WRITE;
/*!40000 ALTER TABLE `coupon_and_discount` DISABLE KEYS */;
INSERT INTO `coupon_and_discount` VALUES (1,'5%',6,5,NULL,'\0',''),(2,'10%',6,10,NULL,'\0',''),(3,'11%',6,11,'2019-11-16 00:00:00','\0','\0'),(4,'15%',6,15,'2019-11-16 00:00:00','\0','\0');
/*!40000 ALTER TABLE `coupon_and_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `AUTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOYALTY_NO` varchar(30) DEFAULT NULL,
  `LOYALTY_POINT` int(11) DEFAULT NULL,
  `PICTURE` blob,
  `TELEPHONE_NO` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `DOB` varchar(16) DEFAULT NULL,
  `SSN` varchar(30) DEFAULT NULL,
  `ADDRESS` varchar(120) DEFAULT NULL,
  `CITY` varchar(30) DEFAULT NULL,
  `STATE` varchar(30) DEFAULT NULL,
  `ZIP_CODE` varchar(10) DEFAULT NULL,
  `COUNTRY` varchar(30) DEFAULT NULL,
  `VIP` bit(1) DEFAULT NULL,
  `CREDIT_LIMIT` double DEFAULT NULL,
  `CREDIT_SPENT` double DEFAULT NULL,
  `CREDIT_CARD_NO` varchar(30) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_properties`
--

DROP TABLE IF EXISTS `customer_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_properties` (
  `id` int(11) NOT NULL,
  `property_value` varchar(255) DEFAULT NULL,
  `property_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`property_name`),
  KEY `FKD43068347BBCCF0` (`id`),
  CONSTRAINT `FKD43068347BBCCF0` FOREIGN KEY (`id`) REFERENCES `customer` (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_properties`
--

LOCK TABLES `customer_properties` WRITE;
/*!40000 ALTER TABLE `customer_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_update_info`
--

DROP TABLE IF EXISTS `data_update_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_update_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_update_info`
--

LOCK TABLES `data_update_info` WRITE;
/*!40000 ALTER TABLE `data_update_info` DISABLE KEYS */;
INSERT INTO `data_update_info` VALUES (1,'2019-11-12 04:04:25');
/*!40000 ALTER TABLE `data_update_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drawer_assigned_history`
--

DROP TABLE IF EXISTS `drawer_assigned_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drawer_assigned_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIME` datetime DEFAULT NULL,
  `OPERATION` varchar(60) DEFAULT NULL,
  `A_USER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK5A823C91F1DD782B` (`A_USER`),
  CONSTRAINT `FK5A823C91F1DD782B` FOREIGN KEY (`A_USER`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drawer_assigned_history`
--

LOCK TABLES `drawer_assigned_history` WRITE;
/*!40000 ALTER TABLE `drawer_assigned_history` DISABLE KEYS */;
INSERT INTO `drawer_assigned_history` VALUES (1,'2019-11-12 04:01:15','ASSIGN',1);
/*!40000 ALTER TABLE `drawer_assigned_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drawer_pull_report`
--

DROP TABLE IF EXISTS `drawer_pull_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drawer_pull_report` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REPORT_TIME` datetime DEFAULT NULL,
  `REG` varchar(15) DEFAULT NULL,
  `TICKET_COUNT` int(11) DEFAULT NULL,
  `BEGIN_CASH` double DEFAULT NULL,
  `NET_SALES` double DEFAULT NULL,
  `SALES_TAX` double DEFAULT NULL,
  `CASH_TAX` double DEFAULT NULL,
  `TOTAL_REVENUE` double DEFAULT NULL,
  `GROSS_RECEIPTS` double DEFAULT NULL,
  `GIFTCERTRETURNCOUNT` int(11) DEFAULT NULL,
  `GIFTCERTRETURNAMOUNT` double DEFAULT NULL,
  `GIFTCERTCHANGEAMOUNT` double DEFAULT NULL,
  `CASH_RECEIPT_NO` int(11) DEFAULT NULL,
  `CASH_RECEIPT_AMOUNT` double DEFAULT NULL,
  `CREDIT_CARD_RECEIPT_NO` int(11) DEFAULT NULL,
  `CREDIT_CARD_RECEIPT_AMOUNT` double DEFAULT NULL,
  `DEBIT_CARD_RECEIPT_NO` int(11) DEFAULT NULL,
  `DEBIT_CARD_RECEIPT_AMOUNT` double DEFAULT NULL,
  `REFUND_RECEIPT_COUNT` int(11) DEFAULT NULL,
  `REFUND_AMOUNT` double DEFAULT NULL,
  `RECEIPT_DIFFERENTIAL` double DEFAULT NULL,
  `CASH_BACK` double DEFAULT NULL,
  `CASH_TIPS` double DEFAULT NULL,
  `CHARGED_TIPS` double DEFAULT NULL,
  `TIPS_PAID` double DEFAULT NULL,
  `TIPS_DIFFERENTIAL` double DEFAULT NULL,
  `PAY_OUT_NO` int(11) DEFAULT NULL,
  `PAY_OUT_AMOUNT` double DEFAULT NULL,
  `DRAWER_BLEED_NO` int(11) DEFAULT NULL,
  `DRAWER_BLEED_AMOUNT` double DEFAULT NULL,
  `DRAWER_ACCOUNTABLE` double DEFAULT NULL,
  `CASH_TO_DEPOSIT` double DEFAULT NULL,
  `VARIANCE` double DEFAULT NULL,
  `totalVoidWst` double DEFAULT NULL,
  `totalVoid` double DEFAULT NULL,
  `totalDiscountCount` int(11) DEFAULT NULL,
  `totalDiscountAmount` double DEFAULT NULL,
  `totalDiscountSales` double DEFAULT NULL,
  `totalDiscountGuest` int(11) DEFAULT NULL,
  `totalDiscountPartySize` int(11) DEFAULT NULL,
  `totalDiscountCheckSize` int(11) DEFAULT NULL,
  `totalDiscountPercentage` double DEFAULT NULL,
  `totalDiscountRatio` double DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TERMINAL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `drawer_report_time` (`REPORT_TIME`),
  KEY `FKAEC362203E20AD51` (`USER_ID`),
  KEY `FKAEC362202AD2D031` (`TERMINAL_ID`),
  CONSTRAINT `FKAEC362202AD2D031` FOREIGN KEY (`TERMINAL_ID`) REFERENCES `terminal` (`ID`),
  CONSTRAINT `FKAEC362203E20AD51` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drawer_pull_report`
--

LOCK TABLES `drawer_pull_report` WRITE;
/*!40000 ALTER TABLE `drawer_pull_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `drawer_pull_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drawer_pull_report_voidtickets`
--

DROP TABLE IF EXISTS `drawer_pull_report_voidtickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drawer_pull_report_voidtickets` (
  `DPREPORT_ID` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `hast` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  KEY `FK98CF9B143EF4CD9B` (`DPREPORT_ID`),
  CONSTRAINT `FK98CF9B143EF4CD9B` FOREIGN KEY (`DPREPORT_ID`) REFERENCES `drawer_pull_report` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drawer_pull_report_voidtickets`
--

LOCK TABLES `drawer_pull_report_voidtickets` WRITE;
/*!40000 ALTER TABLE `drawer_pull_report_voidtickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `drawer_pull_report_voidtickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gratuity`
--

DROP TABLE IF EXISTS `gratuity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gratuity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` double DEFAULT NULL,
  `PAID` bit(1) DEFAULT NULL,
  `TICKET_ID` int(11) DEFAULT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `TERMINAL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK34E4E377AA075D69` (`OWNER_ID`),
  KEY `FK34E4E3771DF2D7F1` (`TICKET_ID`),
  KEY `FK34E4E3772AD2D031` (`TERMINAL_ID`),
  CONSTRAINT `FK34E4E3771DF2D7F1` FOREIGN KEY (`TICKET_ID`) REFERENCES `ticket` (`ID`),
  CONSTRAINT `FK34E4E3772AD2D031` FOREIGN KEY (`TERMINAL_ID`) REFERENCES `terminal` (`ID`),
  CONSTRAINT `FK34E4E377AA075D69` FOREIGN KEY (`OWNER_ID`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gratuity`
--

LOCK TABLES `gratuity` WRITE;
/*!40000 ALTER TABLE `gratuity` DISABLE KEYS */;
/*!40000 ALTER TABLE `gratuity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_group`
--

DROP TABLE IF EXISTS `inventory_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_group`
--

LOCK TABLES `inventory_group` WRITE;
/*!40000 ALTER TABLE `inventory_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_item`
--

DROP TABLE IF EXISTS `inventory_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `PACKAGE_BARCODE` varchar(30) DEFAULT NULL,
  `UNIT_BARCODE` varchar(30) DEFAULT NULL,
  `UNIT_PER_PACKAGE` double DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `PACKAGE_REORDER_LEVEL` int(11) DEFAULT NULL,
  `PACKAGE_REPLENISH_LEVEL` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `AVERAGE_PACKAGE_PRICE` double DEFAULT NULL,
  `TOTAL_PACKAGES` int(11) DEFAULT NULL,
  `TOTAL_RECEPIE_UNITS` double DEFAULT NULL,
  `UNIT_PURCHASE_PRICE` double DEFAULT NULL,
  `UNIT_SELLING_PRICE` double DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `PUNIT_ID` int(11) DEFAULT NULL,
  `ITEM_GROUP_ID` int(11) DEFAULT NULL,
  `ITEM_LOCATION_ID` int(11) DEFAULT NULL,
  `ITEM_VENDOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK7DC968369E60C333` (`ITEM_VENDOR_ID`),
  KEY `FK7DC968362CD583C1` (`ITEM_GROUP_ID`),
  KEY `FK7DC968363525E956` (`PUNIT_ID`),
  KEY `FK7DC9683695E455D3` (`ITEM_LOCATION_ID`),
  CONSTRAINT `FK7DC968362CD583C1` FOREIGN KEY (`ITEM_GROUP_ID`) REFERENCES `inventory_group` (`ID`),
  CONSTRAINT `FK7DC968363525E956` FOREIGN KEY (`PUNIT_ID`) REFERENCES `packaging_unit` (`ID`),
  CONSTRAINT `FK7DC9683695E455D3` FOREIGN KEY (`ITEM_LOCATION_ID`) REFERENCES `inventory_location` (`ID`),
  CONSTRAINT `FK7DC968369E60C333` FOREIGN KEY (`ITEM_VENDOR_ID`) REFERENCES `inventory_vendor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_item`
--

LOCK TABLES `inventory_item` WRITE;
/*!40000 ALTER TABLE `inventory_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_location`
--

DROP TABLE IF EXISTS `inventory_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `WAREHOUSE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK59073B58C46A9C15` (`WAREHOUSE_ID`),
  CONSTRAINT `FK59073B58C46A9C15` FOREIGN KEY (`WAREHOUSE_ID`) REFERENCES `inventory_warehouse` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_location`
--

LOCK TABLES `inventory_location` WRITE;
/*!40000 ALTER TABLE `inventory_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_meta_code`
--

DROP TABLE IF EXISTS `inventory_meta_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_meta_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) DEFAULT NULL,
  `CODE_TEXT` varchar(255) DEFAULT NULL,
  `CODE_NO` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_meta_code`
--

LOCK TABLES `inventory_meta_code` WRITE;
/*!40000 ALTER TABLE `inventory_meta_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_meta_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_transaction`
--

DROP TABLE IF EXISTS `inventory_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_DATE` datetime DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `UNIT_PRICE` double DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `TRAN_TYPE` int(11) DEFAULT NULL,
  `REFERENCE_ID` int(11) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `VENDOR_ID` int(11) DEFAULT NULL,
  `FROM_WAREHOUSE_ID` int(11) DEFAULT NULL,
  `TO_WAREHOUSE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKAF48F43BFF3F328A` (`FROM_WAREHOUSE_ID`),
  KEY `FKAF48F43B5B397C5` (`REFERENCE_ID`),
  KEY `FKAF48F43B96A3D6BF` (`ITEM_ID`),
  KEY `FKAF48F43BEDA09759` (`TO_WAREHOUSE_ID`),
  KEY `FKAF48F43BD152C95F` (`VENDOR_ID`),
  CONSTRAINT `FKAF48F43B5B397C5` FOREIGN KEY (`REFERENCE_ID`) REFERENCES `purchase_order` (`ID`),
  CONSTRAINT `FKAF48F43B96A3D6BF` FOREIGN KEY (`ITEM_ID`) REFERENCES `inventory_item` (`ID`),
  CONSTRAINT `FKAF48F43BD152C95F` FOREIGN KEY (`VENDOR_ID`) REFERENCES `inventory_vendor` (`ID`),
  CONSTRAINT `FKAF48F43BEDA09759` FOREIGN KEY (`TO_WAREHOUSE_ID`) REFERENCES `inventory_warehouse` (`ID`),
  CONSTRAINT `FKAF48F43BFF3F328A` FOREIGN KEY (`FROM_WAREHOUSE_ID`) REFERENCES `inventory_warehouse` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_transaction`
--

LOCK TABLES `inventory_transaction` WRITE;
/*!40000 ALTER TABLE `inventory_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_unit`
--

DROP TABLE IF EXISTS `inventory_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHORT_NAME` varchar(255) DEFAULT NULL,
  `LONG_NAME` varchar(255) DEFAULT NULL,
  `ALT_NAME` varchar(255) DEFAULT NULL,
  `CONV_FACTOR1` varchar(255) DEFAULT NULL,
  `CONV_FACTOR2` varchar(255) DEFAULT NULL,
  `CONV_FACTOR3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_unit`
--

LOCK TABLES `inventory_unit` WRITE;
/*!40000 ALTER TABLE `inventory_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_vendor`
--

DROP TABLE IF EXISTS `inventory_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_vendor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_vendor`
--

LOCK TABLES `inventory_vendor` WRITE;
/*!40000 ALTER TABLE `inventory_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_warehouse`
--

DROP TABLE IF EXISTS `inventory_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_warehouse` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_warehouse`
--

LOCK TABLES `inventory_warehouse` WRITE;
/*!40000 ALTER TABLE `inventory_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_ticket_table_num`
--

DROP TABLE IF EXISTS `kit_ticket_table_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kit_ticket_table_num` (
  `kit_ticket_id` int(11) NOT NULL,
  `TABLE_ID` varchar(255) DEFAULT NULL,
  KEY `FK5696584BB73E273E` (`kit_ticket_id`),
  CONSTRAINT `FK5696584BB73E273E` FOREIGN KEY (`kit_ticket_id`) REFERENCES `kitchen_ticket` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_ticket_table_num`
--

LOCK TABLES `kit_ticket_table_num` WRITE;
/*!40000 ALTER TABLE `kit_ticket_table_num` DISABLE KEYS */;
/*!40000 ALTER TABLE `kit_ticket_table_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_ticket`
--

DROP TABLE IF EXISTS `kitchen_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kitchen_ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TICKET_ID` int(11) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CLOSE_DATE` datetime DEFAULT NULL,
  `VOIDED` bit(1) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `SERVER_NAME` varchar(30) DEFAULT NULL,
  `TICKET_TYPE` varchar(20) DEFAULT NULL,
  `PG_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ticketvoided` (`VOIDED`),
  KEY `FK341CBC275CF1375F` (`PG_ID`),
  CONSTRAINT `FK341CBC275CF1375F` FOREIGN KEY (`PG_ID`) REFERENCES `printer_group` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_ticket`
--

LOCK TABLES `kitchen_ticket` WRITE;
/*!40000 ALTER TABLE `kitchen_ticket` DISABLE KEYS */;
INSERT INTO `kitchen_ticket` VALUES (1,1,'2019-11-12 04:01:47',NULL,'\0','WAITING','Nahid','TAKE_OUT',NULL),(2,2,'2019-11-12 04:04:23',NULL,'\0','WAITING','Forhad','TAKE_OUT',NULL);
/*!40000 ALTER TABLE `kitchen_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen_ticket_item`
--

DROP TABLE IF EXISTS `kitchen_ticket_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kitchen_ticket_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COOKABLE` bit(1) DEFAULT NULL,
  `MENU_ITEM_CODE` varchar(255) DEFAULT NULL,
  `MENU_ITEM_NAME` varchar(30) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `VOIDED` bit(1) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `KITHEN_TICKET_ID` int(11) DEFAULT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK1462F02BCB07FAA3` (`KITHEN_TICKET_ID`),
  CONSTRAINT `FK1462F02BCB07FAA3` FOREIGN KEY (`KITHEN_TICKET_ID`) REFERENCES `kitchen_ticket` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen_ticket_item`
--

LOCK TABLES `kitchen_ticket_item` WRITE;
/*!40000 ALTER TABLE `kitchen_ticket_item` DISABLE KEYS */;
INSERT INTO `kitchen_ticket_item` VALUES (1,'','1','Chicken Slider (Mini)',5,'\0','WAITING',1,0),(2,'','3','Shada Moner Pasta',1,'\0','WAITING',1,1),(3,'','2','Brown Burger',1,'\0','WAITING',2,0),(4,'','4','Pasta Laal-E-Laal',1,'\0','WAITING',2,1),(5,'','3','Shada Moner Pasta',1,'\0','WAITING',2,2);
/*!40000 ALTER TABLE `kitchen_ticket_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(120) NOT NULL,
  `TRANSLATED_NAME` varchar(120) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `BEVERAGE` bit(1) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `BTN_COLOR` int(11) DEFAULT NULL,
  `TEXT_COLOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `food_category_visible` (`VISIBLE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_category`
--

LOCK TABLES `menu_category` WRITE;
/*!40000 ALTER TABLE `menu_category` DISABLE KEYS */;
INSERT INTO `menu_category` VALUES (1,'Burgers','Burgers','','\0',9999,-1,-16777216),(2,'Sub-Sandwich','Sub-Sandwich','','\0',9999,-3342337,-16777216),(3,'Wraps & Sandwich','Wraps & Sandwich','','\0',9999,-3355393,-16777216),(4,'Meat Box','Meat Box','','\0',9999,-103,-16777216),(5,'Coffee','Coffee','','\0',9999,-3342439,-16777216),(6,'Shakes & Juices','Shakes & Juices','','\0',9999,-13108,-16777216),(7,'Pasta','Pasta','','\0',9999,-6684724,-16777216);
/*!40000 ALTER TABLE `menu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_group`
--

DROP TABLE IF EXISTS `menu_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(120) NOT NULL,
  `TRANSLATED_NAME` varchar(120) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `BTN_COLOR` int(11) DEFAULT NULL,
  `TEXT_COLOR` int(11) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `menugroupvisible` (`VISIBLE`),
  KEY `FK4DC1AB7F2E347FF0` (`CATEGORY_ID`),
  CONSTRAINT `FK4DC1AB7F2E347FF0` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `menu_category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_group`
--

LOCK TABLES `menu_group` WRITE;
/*!40000 ALTER TABLE `menu_group` DISABLE KEYS */;
INSERT INTO `menu_group` VALUES (1,'Burgers','Burgers','',9999,-1250856,-16777216,1),(2,'Pasta','Pasta','',9999,-1250856,-16777216,7);
/*!40000 ALTER TABLE `menu_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(120) NOT NULL,
  `TRANSLATED_NAME` varchar(120) DEFAULT NULL,
  `BARCODE` varchar(120) DEFAULT NULL,
  `BUY_PRICE` double NOT NULL,
  `PRICE` double NOT NULL,
  `DISCOUNT_RATE` double DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `BTN_COLOR` int(11) DEFAULT NULL,
  `TEXT_COLOR` int(11) DEFAULT NULL,
  `IMAGE` blob,
  `SHOW_IMAGE_ONLY` bit(1) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `TAX_ID` int(11) DEFAULT NULL,
  `RECEPIE` int(11) DEFAULT NULL,
  `PG_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4CD5A1F35188AA24` (`GROUP_ID`),
  KEY `FK4CD5A1F3F3B77C57` (`RECEPIE`),
  KEY `FK4CD5A1F35CF1375F` (`PG_ID`),
  KEY `FK4CD5A1F3A4802F83` (`TAX_ID`),
  CONSTRAINT `FK4CD5A1F35188AA24` FOREIGN KEY (`GROUP_ID`) REFERENCES `menu_group` (`ID`),
  CONSTRAINT `FK4CD5A1F35CF1375F` FOREIGN KEY (`PG_ID`) REFERENCES `printer_group` (`ID`),
  CONSTRAINT `FK4CD5A1F3A4802F83` FOREIGN KEY (`TAX_ID`) REFERENCES `tax` (`ID`),
  CONSTRAINT `FK4CD5A1F3F3B77C57` FOREIGN KEY (`RECEPIE`) REFERENCES `recepie` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'Chicken Slider (Mini)','Chicken Slider (Mini)','',0,45,0,'',9999,-1250856,-16777216,NULL,'\0',1,NULL,NULL,NULL),(2,'Brown Burger','Brown Burger','',0,55,0,'',9999,-1250856,-16777216,NULL,'\0',1,NULL,NULL,NULL),(3,'Shada Moner Pasta','Shada Moner Pasta','',0,79,0,'',9999,-1250856,-16777216,NULL,'\0',2,NULL,NULL,NULL),(4,'Pasta Laal-E-Laal','Pasta Laal-E-Laal','',0,48,89,'',9999,-1250856,-16777216,NULL,'\0',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_modifier`
--

DROP TABLE IF EXISTS `menu_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_modifier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(120) DEFAULT NULL,
  `TRANSLATED_NAME` varchar(120) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `EXTRA_PRICE` double DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `BTN_COLOR` int(11) DEFAULT NULL,
  `TEXT_COLOR` int(11) DEFAULT NULL,
  `ENABLE` bit(1) DEFAULT NULL,
  `PRINT_TO_KITCHEN` bit(1) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `TAX_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `modifierenabled` (`ENABLE`),
  KEY `FK59B6B1B75E0C7B8D` (`GROUP_ID`),
  KEY `FK59B6B1B7A4802F83` (`TAX_ID`),
  CONSTRAINT `FK59B6B1B75E0C7B8D` FOREIGN KEY (`GROUP_ID`) REFERENCES `menu_modifier_group` (`ID`),
  CONSTRAINT `FK59B6B1B7A4802F83` FOREIGN KEY (`TAX_ID`) REFERENCES `tax` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_modifier`
--

LOCK TABLES `menu_modifier` WRITE;
/*!40000 ALTER TABLE `menu_modifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_modifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_modifier_group`
--

DROP TABLE IF EXISTS `menu_modifier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_modifier_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) DEFAULT NULL,
  `TRANSLATED_NAME` varchar(60) DEFAULT NULL,
  `ENABLED` bit(1) DEFAULT NULL,
  `EXCLUSIVED` bit(1) DEFAULT NULL,
  `REQUIRED` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `mg_enable` (`ENABLED`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_modifier_group`
--

LOCK TABLES `menu_modifier_group` WRITE;
/*!40000 ALTER TABLE `menu_modifier_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_modifier_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem_modifiergroup`
--

DROP TABLE IF EXISTS `menuitem_modifiergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem_modifiergroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_QUANTITY` int(11) DEFAULT NULL,
  `MAX_QUANTITY` int(11) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `MODIFIER_GROUP` int(11) DEFAULT NULL,
  `MENUITEM_MODIFIERGROUP_ID` int(11) DEFAULT NULL,
  `GR_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK312B355B40FDA3C9` (`MODIFIER_GROUP`),
  KEY `FK312B355B6E7B8B68` (`MENUITEM_MODIFIERGROUP_ID`),
  CONSTRAINT `FK312B355B40FDA3C9` FOREIGN KEY (`MODIFIER_GROUP`) REFERENCES `menu_modifier_group` (`ID`),
  CONSTRAINT `FK312B355B6E7B8B68` FOREIGN KEY (`MENUITEM_MODIFIERGROUP_ID`) REFERENCES `menu_item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem_modifiergroup`
--

LOCK TABLES `menuitem_modifiergroup` WRITE;
/*!40000 ALTER TABLE `menuitem_modifiergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitem_modifiergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem_shift`
--

DROP TABLE IF EXISTS `menuitem_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuitem_shift` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SHIFT_PRICE` double DEFAULT NULL,
  `SHIFT_ID` int(11) DEFAULT NULL,
  `MENUITEM_ID` int(11) DEFAULT NULL,
  `SHIFT_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE03C92D533662891` (`MENUITEM_ID`),
  KEY `FKE03C92D57660A5E3` (`SHIFT_ID`),
  CONSTRAINT `FKE03C92D533662891` FOREIGN KEY (`MENUITEM_ID`) REFERENCES `menu_item` (`ID`),
  CONSTRAINT `FKE03C92D57660A5E3` FOREIGN KEY (`SHIFT_ID`) REFERENCES `shift` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem_shift`
--

LOCK TABLES `menuitem_shift` WRITE;
/*!40000 ALTER TABLE `menuitem_shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitem_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type_properties`
--

DROP TABLE IF EXISTS `order_type_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type_properties` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OTYPE` varchar(16) DEFAULT NULL,
  `ALIAS` varchar(40) DEFAULT NULL,
  `BTN_COLOR` int(11) DEFAULT NULL,
  `TEXT_COLOR` int(11) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `POST_PAID` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type_properties`
--

LOCK TABLES `order_type_properties` WRITE;
/*!40000 ALTER TABLE `order_type_properties` DISABLE KEYS */;
INSERT INTO `order_type_properties` VALUES (1,'DINE_IN','',0,0,'\0','\0'),(2,'TAKE_OUT','',0,0,'','\0'),(3,'PICKUP','',0,0,'\0','\0'),(4,'HOME_DELIVERY','',0,0,'\0','\0'),(5,'DRIVE_THRU','',0,0,'\0','\0'),(6,'BAR_TAB','',0,0,'\0','\0');
/*!40000 ALTER TABLE `order_type_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packaging_unit`
--

DROP TABLE IF EXISTS `packaging_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packaging_unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `SHORT_NAME` varchar(10) DEFAULT NULL,
  `FACTOR` double DEFAULT NULL,
  `BASEUNIT` bit(1) DEFAULT NULL,
  `DIMENSION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packaging_unit`
--

LOCK TABLES `packaging_unit` WRITE;
/*!40000 ALTER TABLE `packaging_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `packaging_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payout_reasons`
--

DROP TABLE IF EXISTS `payout_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payout_reasons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REASON` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payout_reasons`
--

LOCK TABLES `payout_reasons` WRITE;
/*!40000 ALTER TABLE `payout_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `payout_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payout_recepients`
--

DROP TABLE IF EXISTS `payout_recepients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payout_recepients` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payout_recepients`
--

LOCK TABLES `payout_recepients` WRITE;
/*!40000 ALTER TABLE `payout_recepients` DISABLE KEYS */;
/*!40000 ALTER TABLE `payout_recepients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_configuration`
--

DROP TABLE IF EXISTS `printer_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_configuration` (
  `ID` int(11) NOT NULL,
  `RECEIPT_PRINTER` varchar(255) DEFAULT NULL,
  `KITCHEN_PRINTER` varchar(255) DEFAULT NULL,
  `PRWTS` bit(1) DEFAULT NULL,
  `PRWTP` bit(1) DEFAULT NULL,
  `PKWTS` bit(1) DEFAULT NULL,
  `PKWTP` bit(1) DEFAULT NULL,
  `UNPFT` bit(1) DEFAULT NULL,
  `UNPFK` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_configuration`
--

LOCK TABLES `printer_configuration` WRITE;
/*!40000 ALTER TABLE `printer_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_group`
--

DROP TABLE IF EXISTS `printer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_group`
--

LOCK TABLES `printer_group` WRITE;
/*!40000 ALTER TABLE `printer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_group_printers`
--

DROP TABLE IF EXISTS `printer_group_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printer_group_printers` (
  `printer_id` int(11) NOT NULL,
  `PRINTER_NAME` varchar(255) DEFAULT NULL,
  KEY `FKC05B805E5F31265C` (`printer_id`),
  CONSTRAINT `FKC05B805E5F31265C` FOREIGN KEY (`printer_id`) REFERENCES `printer_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_group_printers`
--

LOCK TABLES `printer_group_printers` WRITE;
/*!40000 ALTER TABLE `printer_group_printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer_group_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` varchar(30) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepie`
--

DROP TABLE IF EXISTS `recepie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENU_ITEM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK6B4E177764931EFC` (`MENU_ITEM`),
  CONSTRAINT `FK6B4E177764931EFC` FOREIGN KEY (`MENU_ITEM`) REFERENCES `menu_item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepie`
--

LOCK TABLES `recepie` WRITE;
/*!40000 ALTER TABLE `recepie` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepie_item`
--

DROP TABLE IF EXISTS `recepie_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepie_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERCENTAGE` double DEFAULT NULL,
  `INVENTORY_DEDUCTABLE` bit(1) DEFAULT NULL,
  `INVENTORY_ITEM` int(11) DEFAULT NULL,
  `RECEPIE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK855626DBCAE89B83` (`RECEPIE_ID`),
  KEY `FK855626DB1682B10E` (`INVENTORY_ITEM`),
  CONSTRAINT `FK855626DB1682B10E` FOREIGN KEY (`INVENTORY_ITEM`) REFERENCES `inventory_item` (`ID`),
  CONSTRAINT `FK855626DBCAE89B83` FOREIGN KEY (`RECEPIE_ID`) REFERENCES `recepie` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepie_item`
--

LOCK TABLES `recepie_item` WRITE;
/*!40000 ALTER TABLE `recepie_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepie_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `ID` int(11) NOT NULL,
  `UNIQUE_ID` int(11) DEFAULT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `ADDRESS_LINE1` varchar(60) DEFAULT NULL,
  `ADDRESS_LINE2` varchar(60) DEFAULT NULL,
  `ADDRESS_LINE3` varchar(60) DEFAULT NULL,
  `ZIP_CODE` varchar(10) DEFAULT NULL,
  `TELEPHONE` varchar(16) DEFAULT NULL,
  `CAPACITY` int(11) DEFAULT NULL,
  `TABLES` int(11) DEFAULT NULL,
  `CNAME` varchar(20) DEFAULT NULL,
  `CSYMBOL` varchar(10) DEFAULT NULL,
  `SC_PERCENTAGE` double DEFAULT NULL,
  `GRATUITY_PERCENTAGE` double DEFAULT NULL,
  `TICKET_FOOTER` varchar(60) DEFAULT NULL,
  `PRICE_INCLUDES_TAX` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,714539571,'Mustard Moshai','66 Naha Road, Mymensingh','','','','+8801312667424',0,0,'Taka','TK',0,0,'---  THANK YOU ---','');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `SHIFT_LEN` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'General','1970-01-01 00:00:00','1970-01-01 23:59:00',86340000);
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_floor`
--

DROP TABLE IF EXISTS `shop_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_floor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) DEFAULT NULL,
  `OCCUPIED` bit(1) DEFAULT NULL,
  `IMAGE` mediumblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_floor`
--

LOCK TABLES `shop_floor` WRITE;
/*!40000 ALTER TABLE `shop_floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_table`
--

DROP TABLE IF EXISTS `shop_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(60) DEFAULT NULL,
  `CAPACITY` int(11) DEFAULT NULL,
  `TABLE_NUMBER` varchar(255) DEFAULT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `OCCUPIED` bit(1) DEFAULT NULL,
  `BOOKED` bit(1) DEFAULT NULL,
  `DIRTY` bit(1) DEFAULT NULL,
  `FLOOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TABLE_NUMBER` (`TABLE_NUMBER`),
  KEY `FK2458E9258979C3CD` (`FLOOR_ID`),
  CONSTRAINT `FK2458E9258979C3CD` FOREIGN KEY (`FLOOR_ID`) REFERENCES `shop_floor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_table`
--

LOCK TABLES `shop_table` WRITE;
/*!40000 ALTER TABLE `shop_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_table_type`
--

DROP TABLE IF EXISTS `shop_table_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_table_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(120) DEFAULT NULL,
  `TABLE_TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKB0564614B7F9D66C` (`TABLE_TYPE`),
  CONSTRAINT `FKB0564614B7F9D66C` FOREIGN KEY (`TABLE_TYPE`) REFERENCES `shop_table` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_table_type`
--

LOCK TABLES `shop_table_type` WRITE;
/*!40000 ALTER TABLE `shop_table_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_table_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `RATE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax`
--

LOCK TABLES `tax` WRITE;
/*!40000 ALTER TABLE `tax` DISABLE KEYS */;
INSERT INTO `tax` VALUES (1,'US',6);
/*!40000 ALTER TABLE `tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminal` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `OPENING_BALANCE` double DEFAULT NULL,
  `CURRENT_BALANCE` double DEFAULT NULL,
  `HAS_CASH_DRAWER` bit(1) DEFAULT NULL,
  `ASSIGNED_USER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKE83D827C969C6DE` (`ASSIGNED_USER`),
  CONSTRAINT `FKE83D827C969C6DE` FOREIGN KEY (`ASSIGNED_USER`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (8202,'8202',500,500,'',NULL),(9449,'9449',500,5000443.28,'',1);
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CLOSING_DATE` datetime DEFAULT NULL,
  `ACTIVE_DATE` datetime DEFAULT NULL,
  `DELIVEERY_DATE` datetime DEFAULT NULL,
  `CREATION_HOUR` int(11) DEFAULT NULL,
  `PAID` bit(1) DEFAULT NULL,
  `VOIDED` bit(1) DEFAULT NULL,
  `VOID_REASON` varchar(255) DEFAULT NULL,
  `WASTED` bit(1) DEFAULT NULL,
  `REFUNDED` bit(1) DEFAULT NULL,
  `SETTLED` bit(1) DEFAULT NULL,
  `DRAWER_RESETTED` bit(1) DEFAULT NULL,
  `SUB_TOTAL` double DEFAULT NULL,
  `TOTAL_DISCOUNT` double DEFAULT NULL,
  `TOTAL_TAX` double DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `PAID_AMOUNT` double DEFAULT NULL,
  `DUE_AMOUNT` double DEFAULT NULL,
  `ADVANCE_AMOUNT` double DEFAULT NULL,
  `NUMBER_OF_GUESTS` int(11) DEFAULT NULL,
  `STATUS` varchar(30) DEFAULT NULL,
  `IS_TAX_EXEMPT` bit(1) DEFAULT NULL,
  `IS_RE_OPENED` bit(1) DEFAULT NULL,
  `SERVICE_CHARGE` double DEFAULT NULL,
  `DELIVERY_CHARGE` double DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(120) DEFAULT NULL,
  `CUSTOMER_PICKEUP` bit(1) DEFAULT NULL,
  `DELIVERY_EXTRA_INFO` varchar(255) DEFAULT NULL,
  `TICKET_TYPE` varchar(20) DEFAULT NULL,
  `SHIFT_ID` int(11) DEFAULT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `DRIVER_ID` int(11) DEFAULT NULL,
  `GRATUITY_ID` int(11) DEFAULT NULL,
  `VOID_BY_USER` int(11) DEFAULT NULL,
  `TERMINAL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creationHour` (`CREATION_HOUR`),
  KEY `ticketpaid` (`PAID`),
  KEY `ticketactiveDate` (`ACTIVE_DATE`),
  KEY `ticketcreateDate` (`CREATE_DATE`),
  KEY `ticketsettled` (`SETTLED`),
  KEY `deliveryDate` (`DELIVEERY_DATE`),
  KEY `ticketclosingDate` (`CLOSING_DATE`),
  KEY `drawerresetted` (`DRAWER_RESETTED`),
  KEY `ticketvoided` (`VOIDED`),
  KEY `FK937B5F0CF575C7D4` (`DRIVER_ID`),
  KEY `FK937B5F0CAA075D69` (`OWNER_ID`),
  KEY `FK937B5F0C7660A5E3` (`SHIFT_ID`),
  KEY `FK937B5F0CC188EA51` (`GRATUITY_ID`),
  KEY `FK937B5F0C1F6A9A4A` (`VOID_BY_USER`),
  KEY `FK937B5F0C2AD2D031` (`TERMINAL_ID`),
  CONSTRAINT `FK937B5F0C1F6A9A4A` FOREIGN KEY (`VOID_BY_USER`) REFERENCES `users` (`AUTO_ID`),
  CONSTRAINT `FK937B5F0C2AD2D031` FOREIGN KEY (`TERMINAL_ID`) REFERENCES `terminal` (`ID`),
  CONSTRAINT `FK937B5F0C7660A5E3` FOREIGN KEY (`SHIFT_ID`) REFERENCES `shift` (`ID`),
  CONSTRAINT `FK937B5F0CAA075D69` FOREIGN KEY (`OWNER_ID`) REFERENCES `users` (`AUTO_ID`),
  CONSTRAINT `FK937B5F0CC188EA51` FOREIGN KEY (`GRATUITY_ID`) REFERENCES `gratuity` (`ID`),
  CONSTRAINT `FK937B5F0CF575C7D4` FOREIGN KEY (`DRIVER_ID`) REFERENCES `users` (`AUTO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'2019-11-12 03:53:30','2019-11-12 04:01:46','2019-11-12 04:02:03','2019-11-12 04:03:30',3,'','\0',NULL,'\0','\0','','\0',304,0,0,304,304,0,0,1,NULL,'\0','\0',0,0,NULL,'\0',NULL,'TAKE_OUT',1,1,NULL,NULL,NULL,9449),(2,'2019-11-12 04:02:41','2019-11-12 04:04:23','2019-11-12 04:04:25','2019-11-12 04:12:41',4,'','\0',NULL,'\0','\0','','\0',182,42.72,0,139.28,139.28,0,0,1,NULL,'\0','\0',0,0,NULL,'\0',NULL,'TAKE_OUT',1,2,NULL,NULL,NULL,9449);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_coupon_discount`
--

DROP TABLE IF EXISTS `ticket_coupon_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_coupon_discount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COUPON_DISCOUNT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  `TICKET_ID` int(11) DEFAULT NULL,
  `D_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3A1F32071DF2D7F1` (`TICKET_ID`),
  CONSTRAINT `FK3A1F32071DF2D7F1` FOREIGN KEY (`TICKET_ID`) REFERENCES `ticket` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_coupon_discount`
--

LOCK TABLES `ticket_coupon_discount` WRITE;
/*!40000 ALTER TABLE `ticket_coupon_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_coupon_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_item`
--

DROP TABLE IF EXISTS `ticket_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_COUNT` int(11) DEFAULT NULL,
  `ITEM_NAME` varchar(120) DEFAULT NULL,
  `GROUP_NAME` varchar(120) DEFAULT NULL,
  `CATEGORY_NAME` varchar(120) DEFAULT NULL,
  `ITEM_PRICE` double DEFAULT NULL,
  `DISCOUNT_RATE` double DEFAULT NULL,
  `ITEM_TAX_RATE` double DEFAULT NULL,
  `SUB_TOTAL` double DEFAULT NULL,
  `SUB_TOTAL_WITHOUT_MODIFIERS` double DEFAULT NULL,
  `DISCOUNT` double DEFAULT NULL,
  `TAX_AMOUNT` double DEFAULT NULL,
  `TAX_AMOUNT_WITHOUT_MODIFIERS` double DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `TOTAL_PRICE_WITHOUT_MODIFIERS` double DEFAULT NULL,
  `BEVERAGE` bit(1) DEFAULT NULL,
  `INVENTORY_HANDLED` bit(1) DEFAULT NULL,
  `PRINT_TO_KITCHEN` bit(1) DEFAULT NULL,
  `HAS_MODIIERS` bit(1) DEFAULT NULL,
  `PRINTED_TO_KITCHEN` bit(1) DEFAULT NULL,
  `TICKET_ID` int(11) DEFAULT NULL,
  `PG_ID` int(11) DEFAULT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK979F54665CF1375F` (`PG_ID`),
  KEY `FK979F54661DF2D7F1` (`TICKET_ID`),
  CONSTRAINT `FK979F54661DF2D7F1` FOREIGN KEY (`TICKET_ID`) REFERENCES `ticket` (`ID`),
  CONSTRAINT `FK979F54665CF1375F` FOREIGN KEY (`PG_ID`) REFERENCES `printer_group` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_item`
--

LOCK TABLES `ticket_item` WRITE;
/*!40000 ALTER TABLE `ticket_item` DISABLE KEYS */;
INSERT INTO `ticket_item` VALUES (1,1,5,'Chicken Slider (Mini)','Burgers','Burgers',45,0,0,225,225,0,0,0,225,225,'\0','\0','','\0','',1,NULL,0),(2,3,1,'Shada Moner Pasta','Pasta','Pasta',79,0,0,79,79,0,0,0,79,79,'\0','\0','','\0','',1,NULL,1),(3,2,1,'Brown Burger','Burgers','Burgers',55,0,0,55,55,0,0,0,55,55,'\0','\0','','\0','',2,NULL,0),(4,4,1,'Pasta Laal-E-Laal','Pasta','Pasta',48,89,0,48,48,42.72,0,0,5.28,5.28,'\0','\0','','\0','',2,NULL,1),(5,3,1,'Shada Moner Pasta','Pasta','Pasta',79,0,0,79,79,0,0,0,79,79,'\0','\0','','\0','',2,NULL,2);
/*!40000 ALTER TABLE `ticket_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_item_cooking_instruction`
--

DROP TABLE IF EXISTS `ticket_item_cooking_instruction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_item_cooking_instruction` (
  `TICKET_ITEM_ID` int(11) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `printedToKitchen` bit(1) DEFAULT NULL,
  `ITEM_ORDER` int(11) NOT NULL,
  PRIMARY KEY (`TICKET_ITEM_ID`,`ITEM_ORDER`),
  KEY `FK3825F9D0DEC6120A` (`TICKET_ITEM_ID`),
  CONSTRAINT `FK3825F9D0DEC6120A` FOREIGN KEY (`TICKET_ITEM_ID`) REFERENCES `ticket_item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_item_cooking_instruction`
--

LOCK TABLES `ticket_item_cooking_instruction` WRITE;
/*!40000 ALTER TABLE `ticket_item_cooking_instruction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_item_cooking_instruction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_item_modifier`
--

DROP TABLE IF EXISTS `ticket_item_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_item_modifier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `ITEM_COUNT` int(11) DEFAULT NULL,
  `MODIFIER_NAME` varchar(30) DEFAULT NULL,
  `MODIFIER_PRICE` double DEFAULT NULL,
  `EXTRA_PRICE` double DEFAULT NULL,
  `MODIFIER_TAX_RATE` double DEFAULT NULL,
  `MODIFIER_TYPE` int(11) DEFAULT NULL,
  `SUBTOTAL_PRICE` double DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `TAX_AMOUNT` double DEFAULT NULL,
  `PRINT_TO_KITCHEN` bit(1) DEFAULT NULL,
  `PRINTED_TO_KITCHEN` bit(1) DEFAULT NULL,
  `ModifierGroup_ID` int(11) DEFAULT NULL,
  `TICKETITEMMODIFIERGROUP_ID` int(11) DEFAULT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK8FD6290C04D31C4` (`ModifierGroup_ID`),
  KEY `FK8FD6290267493E3` (`TICKETITEMMODIFIERGROUP_ID`),
  CONSTRAINT `FK8FD6290267493E3` FOREIGN KEY (`TICKETITEMMODIFIERGROUP_ID`) REFERENCES `ticketitem_modifiergroup` (`ID`),
  CONSTRAINT `FK8FD6290C04D31C4` FOREIGN KEY (`ModifierGroup_ID`) REFERENCES `ticketitem_modifiergroup` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_item_modifier`
--

LOCK TABLES `ticket_item_modifier` WRITE;
/*!40000 ALTER TABLE `ticket_item_modifier` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_item_modifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_properties`
--

DROP TABLE IF EXISTS `ticket_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_properties` (
  `id` int(11) NOT NULL,
  `property_value` text,
  `property_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`property_name`),
  KEY `FK70ECD046223049DE` (`id`),
  CONSTRAINT `FK70ECD046223049DE` FOREIGN KEY (`id`) REFERENCES `ticket` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_properties`
--

LOCK TABLES `ticket_properties` WRITE;
/*!40000 ALTER TABLE `ticket_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_table_num`
--

DROP TABLE IF EXISTS `ticket_table_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_table_num` (
  `ticket_id` int(11) NOT NULL,
  `TABLE_ID` varchar(255) DEFAULT NULL,
  KEY `FK65AF15E21DF2D7F1` (`ticket_id`),
  CONSTRAINT `FK65AF15E21DF2D7F1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_table_num`
--

LOCK TABLES `ticket_table_num` WRITE;
/*!40000 ALTER TABLE `ticket_table_num` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_table_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketitem_modifiergroup`
--

DROP TABLE IF EXISTS `ticketitem_modifiergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticketitem_modifiergroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) DEFAULT NULL,
  `MIN_QUANTITY` int(11) DEFAULT NULL,
  `MAX_QUANTITY` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `TICKETITEM_ID` int(11) DEFAULT NULL,
  `ITEM_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK21D455C8A73C1B20` (`parent`),
  KEY `FK21D455C8DC1B1BB1` (`TICKETITEM_ID`),
  CONSTRAINT `FK21D455C8A73C1B20` FOREIGN KEY (`parent`) REFERENCES `ticket_item` (`ID`),
  CONSTRAINT `FK21D455C8DC1B1BB1` FOREIGN KEY (`TICKETITEM_ID`) REFERENCES `ticket_item` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketitem_modifiergroup`
--

LOCK TABLES `ticketitem_modifiergroup` WRITE;
/*!40000 ALTER TABLE `ticketitem_modifiergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticketitem_modifiergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_properties`
--

DROP TABLE IF EXISTS `transaction_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_properties` (
  `id` int(11) NOT NULL,
  `property_value` varchar(255) DEFAULT NULL,
  `property_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`property_name`),
  KEY `FKE3DE65548E8203BC` (`id`),
  CONSTRAINT `FKE3DE65548E8203BC` FOREIGN KEY (`id`) REFERENCES `transactions` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_properties`
--

LOCK TABLES `transaction_properties` WRITE;
/*!40000 ALTER TABLE `transaction_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYMENT_TYPE` varchar(30) NOT NULL,
  `TRANSACTION_TIME` datetime DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `TIPS_AMOUNT` double DEFAULT NULL,
  `TENDER_AMOUNT` double DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(20) NOT NULL,
  `PAYMENT_SUB_TYPE` varchar(40) NOT NULL,
  `CAPTURED` bit(1) DEFAULT NULL,
  `AUTHORIZABLE` bit(1) DEFAULT NULL,
  `CARD_TRACK` text,
  `CARD_NUMBER` varchar(40) DEFAULT NULL,
  `CARD_AUTH_CODE` varchar(30) DEFAULT NULL,
  `CARD_TYPE` varchar(20) DEFAULT NULL,
  `CARD_TRANSACTION_ID` varchar(255) DEFAULT NULL,
  `CARD_MERCHANT_GATEWAY` varchar(60) DEFAULT NULL,
  `CARD_EXP_MONTH` varchar(16) DEFAULT NULL,
  `CARD_EXP_YEAR` varchar(4) DEFAULT NULL,
  `CARD_READER` varchar(20) DEFAULT NULL,
  `GIFT_CERT_NUMBER` varchar(64) DEFAULT NULL,
  `GIFT_CERT_FACE_VALUE` double DEFAULT NULL,
  `GIFT_CERT_PAID_AMOUNT` double DEFAULT NULL,
  `GIFT_CERT_CASH_BACK_AMOUNT` double DEFAULT NULL,
  `DRAWER_RESETTED` bit(1) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `TERMINAL_ID` int(11) DEFAULT NULL,
  `TICKET_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `PAYOUT_REASON_ID` int(11) DEFAULT NULL,
  `PAYOUT_RECEPIENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `tran_drawer_resetted` (`DRAWER_RESETTED`),
  KEY `FKFE9871553E20AD51` (`USER_ID`),
  KEY `FKFE987155FC697D9E` (`PAYOUT_REASON_ID`),
  KEY `FKFE987155CA43B6` (`PAYOUT_RECEPIENT_ID`),
  KEY `FKFE9871551DF2D7F1` (`TICKET_ID`),
  KEY `FKFE9871552AD2D031` (`TERMINAL_ID`),
  CONSTRAINT `FKFE9871551DF2D7F1` FOREIGN KEY (`TICKET_ID`) REFERENCES `ticket` (`ID`),
  CONSTRAINT `FKFE9871552AD2D031` FOREIGN KEY (`TERMINAL_ID`) REFERENCES `terminal` (`ID`),
  CONSTRAINT `FKFE9871553E20AD51` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`AUTO_ID`),
  CONSTRAINT `FKFE987155CA43B6` FOREIGN KEY (`PAYOUT_RECEPIENT_ID`) REFERENCES `payout_recepients` (`ID`),
  CONSTRAINT `FKFE987155FC697D9E` FOREIGN KEY (`PAYOUT_REASON_ID`) REFERENCES `payout_reasons` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'CASH','2019-11-12 04:01:46',304,0,304,'CREDIT','CASH','','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,9449,1,1,NULL,NULL),(2,'CASH','2019-11-12 04:04:23',139.28,0,139.28,'CREDIT','CASH','','\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'\0',NULL,9449,2,2,NULL,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission` (
  `NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
INSERT INTO `user_permission` VALUES ('Add Discount'),('Authorize Tickets'),('Create New Ticket'),('Drawer Assignment'),('Drawer Pull'),('Edit Ticket'),('Manage Table Layout'),('Pay Out'),('Perform Administrative Task'),('Perform Manager Task'),('Refund'),('Reopen Ticket'),('Settle Ticket'),('Shut Down'),('Split Ticket'),('Take Out'),('View All Open Ticket'),('View Back Office'),('View Explorers'),('View Reports'),('Void Ticket');
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `P_NAME` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Administrator'),(2,'MANAGER'),(3,'CASHIER'),(4,'SR. CASHIER');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permission`
--

DROP TABLE IF EXISTS `user_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permission` (
  `permissionId` int(11) NOT NULL,
  `elt` varchar(40) NOT NULL,
  PRIMARY KEY (`permissionId`,`elt`),
  KEY `FK2DBEAA4F283ECC6` (`permissionId`),
  KEY `FK2DBEAA4F8F23F5E` (`elt`),
  CONSTRAINT `FK2DBEAA4F283ECC6` FOREIGN KEY (`permissionId`) REFERENCES `user_type` (`ID`),
  CONSTRAINT `FK2DBEAA4F8F23F5E` FOREIGN KEY (`elt`) REFERENCES `user_permission` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permission`
--

LOCK TABLES `user_user_permission` WRITE;
/*!40000 ALTER TABLE `user_user_permission` DISABLE KEYS */;
INSERT INTO `user_user_permission` VALUES (1,'Add Discount'),(1,'Authorize Tickets'),(1,'Create New Ticket'),(1,'Drawer Assignment'),(1,'Drawer Pull'),(1,'Edit Ticket'),(1,'Manage Table Layout'),(1,'Pay Out'),(1,'Perform Administrative Task'),(1,'Perform Manager Task'),(1,'Refund'),(1,'Reopen Ticket'),(1,'Settle Ticket'),(1,'Shut Down'),(1,'Split Ticket'),(1,'Take Out'),(1,'View All Open Ticket'),(1,'View Back Office'),(1,'View Explorers'),(1,'View Reports'),(1,'Void Ticket'),(2,'Authorize Tickets'),(2,'Create New Ticket'),(2,'Drawer Assignment'),(2,'Drawer Pull'),(2,'Edit Ticket'),(2,'Pay Out'),(2,'Perform Manager Task'),(2,'Reopen Ticket'),(2,'Settle Ticket'),(2,'Shut Down'),(2,'Split Ticket'),(2,'Take Out'),(2,'View All Open Ticket'),(2,'View Reports'),(3,'Create New Ticket'),(3,'Edit Ticket'),(3,'Settle Ticket'),(3,'Split Ticket'),(3,'View All Open Ticket'),(4,'Create New Ticket'),(4,'Edit Ticket'),(4,'Settle Ticket'),(4,'Split Ticket'),(4,'Take Out');
/*!40000 ALTER TABLE `user_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `AUTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `USER_PASS` varchar(16) NOT NULL,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `SSN` varchar(30) DEFAULT NULL,
  `COST_PER_HOUR` double DEFAULT NULL,
  `CLOCKED_IN` bit(1) DEFAULT NULL,
  `LAST_CLOCK_IN_TIME` datetime DEFAULT NULL,
  `PHONE_NO` varchar(20) DEFAULT NULL,
  `IS_DRIVER` bit(1) DEFAULT NULL,
  `AVAILABLE_FOR_DELIVERY` bit(1) DEFAULT NULL,
  `ACTIVE` bit(1) DEFAULT NULL,
  `SHIFT_ID` int(11) DEFAULT NULL,
  `currentTerminal` int(11) DEFAULT NULL,
  `N_USER_TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`AUTO_ID`),
  UNIQUE KEY `USER_PASS` (`USER_PASS`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  KEY `FK4D495E87660A5E3` (`SHIFT_ID`),
  KEY `FK4D495E8D9409968` (`currentTerminal`),
  KEY `FK4D495E8897B1E39` (`N_USER_TYPE`),
  CONSTRAINT `FK4D495E87660A5E3` FOREIGN KEY (`SHIFT_ID`) REFERENCES `shift` (`ID`),
  CONSTRAINT `FK4D495E8897B1E39` FOREIGN KEY (`N_USER_TYPE`) REFERENCES `user_type` (`ID`),
  CONSTRAINT `FK4D495E8D9409968` FOREIGN KEY (`currentTerminal`) REFERENCES `terminal` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,123,'4912','Nahid','Rahman','123',0,'','2019-11-12 03:15:42','','\0','\0','',1,8202,1),(2,124,'0099','Forhad','Manager','124',0,'','2019-11-12 04:02:35','','\0','\0','',1,9449,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_printer`
--

DROP TABLE IF EXISTS `virtual_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_printer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_printer`
--

LOCK TABLES `virtual_printer` WRITE;
/*!40000 ALTER TABLE `virtual_printer` DISABLE KEYS */;
INSERT INTO `virtual_printer` VALUES (1,'Kabab');
/*!40000 ALTER TABLE `virtual_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualprinter_order_type`
--

DROP TABLE IF EXISTS `virtualprinter_order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualprinter_order_type` (
  `printer_id` int(11) NOT NULL,
  `ORDER_TYPE` varchar(255) DEFAULT NULL,
  KEY `FK9AF7853BCF15F4A6` (`printer_id`),
  CONSTRAINT `FK9AF7853BCF15F4A6` FOREIGN KEY (`printer_id`) REFERENCES `virtual_printer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualprinter_order_type`
--

LOCK TABLES `virtualprinter_order_type` WRITE;
/*!40000 ALTER TABLE `virtualprinter_order_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualprinter_order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `void_reasons`
--

DROP TABLE IF EXISTS `void_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `void_reasons` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `REASON_TEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `void_reasons`
--

LOCK TABLES `void_reasons` WRITE;
/*!40000 ALTER TABLE `void_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `void_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_code_vs_delivery_charge`
--

DROP TABLE IF EXISTS `zip_code_vs_delivery_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zip_code_vs_delivery_charge` (
  `AUTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ZIP_CODE` varchar(10) NOT NULL,
  `DELIVERY_CHARGE` double NOT NULL,
  PRIMARY KEY (`AUTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_code_vs_delivery_charge`
--

LOCK TABLES `zip_code_vs_delivery_charge` WRITE;
/*!40000 ALTER TABLE `zip_code_vs_delivery_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `zip_code_vs_delivery_charge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12  4:10:53
