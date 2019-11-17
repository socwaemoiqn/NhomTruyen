-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: dbnhomtruyen
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbchitietdanhmuc`
--

DROP TABLE IF EXISTS `tbchitietdanhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbchitietdanhmuc` (
  `MaChiTietDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaDanhMuc` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchitietdanhmuc`
--

LOCK TABLES `tbchitietdanhmuc` WRITE;
/*!40000 ALTER TABLE `tbchitietdanhmuc` DISABLE KEYS */;
INSERT INTO `tbchitietdanhmuc` VALUES (1,'1',1),(2,'1',2),(3,'1',3),(4,'2',2),(5,'2',3),(6,'1',4),(7,'1224914332',1),(8,'1224914332',2),(9,'1224914332',4),(10,'1224914332',5),(11,'123522150',2),(12,'123525667',1),(13,'123525667',2),(14,'123525667',4),(15,'123525667',5),(16,'2132953691',2),(17,'2132953691',4),(18,'2132953691',5),(19,'TR897201911220545285897',1),(20,'TR897201911220545285897',2),(21,'TR897201911220545285897',4),(22,'TR897201911220545285897',5),(23,'TR_793_201911220852905+793',1),(24,'TR_793_201911220852905+793',2),(25,'TR_793_201911220852905+793',4),(26,'TR_793_201911220852905+793',5),(27,'TR_273_2019112/20104389_273',1),(28,'TR_273_2019112/20104389_273',2),(29,'TR_273_2019112/20104389_273',4),(30,'TR_0.38034725_2019112/201438454_402',2),(31,'TR_0.38034725_2019112/201438454_402',4),(32,'TR_0.84090346_2019112/201525901_789',2),(33,'TR_0.84090346_2019112/201525901_789',4),(34,'TR5862019112201715153677',1),(35,'TR5862019112201715153677',2),(36,'TR5862019112201715153677',4),(37,'TR80620191122018226913878364603523042084',5),(38,'TR_3392019112202057870.01655254807502815',1),(39,'TR_3392019112202057870.01655254807502815',2),(40,'TR_3392019112202057870.01655254807502815',4),(41,'TR_42220191122021352513125',1),(42,'TR_17201911374735797883',4),(43,'TR_17201911374735797883',5),(44,'TR_5412019118147113571867',4),(45,'TR_7562019118147437982952',4),(46,'TR_8201911814861158660',4),(47,'TR_9702019118148479898798',4),(48,'TR_9112019111012597628929',1),(49,'TR_9112019111012597628929',2),(50,'TR_9112019111012597628929',4),(51,'TR_89520191110130585857201',2),(52,'TR_9702019111013438352215',1),(53,'TR_9702019111013438352215',2),(54,'TR_46120191110135515382341',2),(55,'TR_11920191110136372691063',2),(56,'TR_5872019111013737841621',1),(57,'TR_5872019111013737841621',2),(58,'TR_5872019111013737841621',4),(59,'TR_5872019111013737841621',5),(60,'TR_142201911112313501046210',2),(61,'TR_142201911112313501046210',2),(62,'TR_445201911112250362149841',2);
/*!40000 ALTER TABLE `tbchitietdanhmuc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 22:02:24