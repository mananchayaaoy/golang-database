CREATE DATABASE  IF NOT EXISTS `testsck` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `testsck`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testsck
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `district`
--


DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`district_id`,`province_id`),
  KEY `fk_district_province_idx` (`province_id`),
  CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'โป่งน้ำร้อน',1);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'จันทบุรี');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soldier_address`
--

DROP TABLE IF EXISTS `soldier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `soldier_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `home_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `road_soi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `subdistrict_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`,`province_id`,`district_id`,`subdistrict_id`),
  KEY `fk_soldier_address_province1_idx` (`province_id`),
  KEY `fk_soldier_address_district1_idx` (`district_id`),
  KEY `fk_soldier_address_subdistrict1_idx` (`subdistrict_id`),
  CONSTRAINT `fk_soldier_address_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`district_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_soldier_address_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_soldier_address_subdistrict1` FOREIGN KEY (`subdistrict_id`) REFERENCES `subdistrict` (`subdistrict_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soldier_address`
--

LOCK TABLES `soldier_address` WRITE;
/*!40000 ALTER TABLE `soldier_address` DISABLE KEYS */;
INSERT INTO `soldier_address` VALUES (1,'95/3','5','-',1,1,1);
/*!40000 ALTER TABLE `soldier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdistrict`
--

DROP TABLE IF EXISTS `subdistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdistrict` (
  `subdistrict_id` int(11) NOT NULL AUTO_INCREMENT,
  `subdistrict_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`subdistrict_id`,`district_id`,`province_id`),
  KEY `fk_subdistrict_district1_idx` (`district_id`,`province_id`),
  CONSTRAINT `fk_subdistrict_district1` FOREIGN KEY (`district_id`, `province_id`) REFERENCES `district` (`district_id`, `province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdistrict`
--

LOCK TABLES `subdistrict` WRITE;
/*!40000 ALTER TABLE `subdistrict` DISABLE KEYS */;
INSERT INTO `subdistrict` VALUES (1,'ทับไทร',1,1);
/*!40000 ALTER TABLE `subdistrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `citizen_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `birthyear` int(11) NOT NULL,
  `firstname_father` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname_father` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname_mother` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname_mother` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soldier_id` int(11) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`address_id`),
  UNIQUE KEY `citizen_id_UNIQUE` (`citizen_id`),
  KEY `fk_users_soldier_address1_idx` (`address_id`),
  CONSTRAINT `fk_users_soldier_address1` FOREIGN KEY (`address_id`) REFERENCES `soldier_address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'มนัญชยา','อมรพลัง','1220400152343',1994,'เมษา','อมรพลัง','สายทอง','อมรพลัง',777,1),(2,'ศุภากร','อมรพลัง','1210400123323',1997,'ไกรสร','อมรพลัง','สายทอง','อมรพลัง',789,1),(4,'กันต์','อมรพลัง','1220400123434',1997,'มาร์ค','อมรพลัง','สายทอง','อมรพลัง',678,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09 16:38:54
