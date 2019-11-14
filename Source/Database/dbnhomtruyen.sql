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

--
-- Table structure for table `tbchitiettheloai`
--

DROP TABLE IF EXISTS `tbchitiettheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbchitiettheloai` (
  `MaChiTietTheLoai` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTheLoai` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchitiettheloai`
--

LOCK TABLES `tbchitiettheloai` WRITE;
/*!40000 ALTER TABLE `tbchitiettheloai` DISABLE KEYS */;
INSERT INTO `tbchitiettheloai` VALUES (1,'1',1),(2,'1',2),(3,'1',3),(4,'40382202',17),(5,'40382202',18),(6,'40382202',19),(7,'40382202',20),(8,'221637062',3),(9,'1637063',1),(10,'1637064',3),(11,'324',3),(12,'122337589',1),(13,'122337589',2),(14,'122360111',2),(15,'1224713658',11),(16,'1224713658',12),(17,'1224713658',13),(18,'1224914332',2),(19,'1224914332',3),(20,'1224914332',4),(21,'123522150',1),(22,'123522150',2),(23,'123522150',3),(24,'123525667',2),(25,'2132953691',1),(26,'2132953691',2),(27,'2132953691',3),(28,'2132953691',4),(29,'2132953691',5),(30,'2132953691',6),(31,'2132953691',7),(32,'2132953691',8),(33,'2132953691',9),(34,'2132953691',10),(35,'2132953691',11),(36,'TR897201911220545285897',1),(37,'TR897201911220545285897',2),(38,'TR897201911220545285897',3),(39,'TR_793_201911220852905+793',1),(40,'TR_793_201911220852905+793',2),(41,'TR_793_201911220852905+793',3),(42,'TR_793_201911220852905+793',4),(43,'TR_273_2019112/20104389_273',1),(44,'TR_273_2019112/20104389_273',2),(45,'TR_273_2019112/20104389_273',3),(46,'TR_0.38034725_2019112/201438454_402',1),(47,'TR_0.38034725_2019112/201438454_402',2),(48,'TR_0.38034725_2019112/201438454_402',3),(49,'TR_0.84090346_2019112/201525901_789',1),(50,'TR_0.84090346_2019112/201525901_789',2),(51,'TR_0.84090346_2019112/201525901_789',3),(52,'TR_0.84090346_2019112/201525901_789',4),(53,'TR5862019112201715153677',1),(54,'TR5862019112201715153677',2),(55,'TR5862019112201715153677',3),(56,'TR80620191122018226913878364603523042084',1),(57,'TR_3392019112202057870.01655254807502815',1),(58,'TR_3392019112202057870.01655254807502815',2),(59,'TR_42220191122021352513125',2),(60,'TR_17201911374735797883',1),(61,'TR_17201911374735797883',2),(62,'TR_17201911374735797883',3),(63,'TR_17201911374735797883',4),(64,'TR_17201911374735797883',5),(65,'TR_5412019118147113571867',8),(66,'TR_5412019118147113571867',12),(67,'TR_5412019118147113571867',16),(68,'TR_7562019118147437982952',8),(69,'TR_7562019118147437982952',12),(70,'TR_7562019118147437982952',16),(71,'TR_8201911814861158660',8),(72,'TR_8201911814861158660',12),(73,'TR_8201911814861158660',16),(74,'TR_9702019118148479898798',8),(75,'TR_9702019118148479898798',12),(76,'TR_9702019118148479898798',16),(77,'TR_9112019111012597628929',1),(78,'TR_9112019111012597628929',2),(79,'TR_9112019111012597628929',3),(80,'TR_9112019111012597628929',4),(81,'TR_9112019111012597628929',5),(82,'TR_9112019111012597628929',6),(83,'TR_9112019111012597628929',7),(84,'TR_9112019111012597628929',8),(85,'TR_9112019111012597628929',9),(86,'TR_9112019111012597628929',10),(87,'TR_9112019111012597628929',11),(88,'TR_9112019111012597628929',12),(89,'TR_9112019111012597628929',13),(90,'TR_9112019111012597628929',14),(91,'TR_9112019111012597628929',15),(92,'TR_9112019111012597628929',16),(93,'TR_9112019111012597628929',17),(94,'TR_9112019111012597628929',18),(95,'TR_9112019111012597628929',19),(96,'TR_9112019111012597628929',20),(97,'TR_89520191110130585857201',3),(98,'TR_9702019111013438352215',1),(99,'TR_9702019111013438352215',2),(100,'TR_9702019111013438352215',3),(101,'TR_46120191110135515382341',1),(102,'TR_11920191110136372691063',1),(103,'TR_5872019111013737841621',1),(104,'TR_5872019111013737841621',2),(105,'TR_5872019111013737841621',3),(106,'TR_5872019111013737841621',4),(107,'TR_13120191111937109678247',19),(108,'TR_13120191111937109678247',20),(109,'TR_19420191111112545191799',3),(110,'TR_19420191111112545191799',4),(111,'TR_19420191111112545191799',5),(112,'TR_19420191111112545191799',6),(113,'TR_19420191111112545191799',7),(114,'TR_19420191111112545191799',8),(115,'TR_19420191111112545191799',9),(116,'TR_19420191111112545191799',10),(117,'TR_19420191111112545191799',11),(118,'TR_19420191111112545191799',12),(119,'TR_19420191111112545191799',13),(120,'TR_19420191111112545191799',14),(121,'TR_19420191111112545191799',15),(122,'TR_19420191111112545191799',16),(123,'TR_19420191111112545191799',17),(124,'TR_19420191111112545191799',18),(125,'TR_10020191111143529395754',2),(126,'TR_10020191111143529395754',3),(127,'TR_10020191111143529395754',4),(128,'TR_67820191111155821284453',20),(129,'TR_43720191111160248328478',1),(130,'TR_43720191111160248328478',2),(131,'TR_181201911111613331370',2),(132,'TR_752201911111611489477',1),(133,'TR_526201911111627439556399',1),(134,'TR_526201911111627439556399',2),(135,'TR_526201911111627439556399',3),(136,'TR_526201911111627439556399',4),(137,'TR_526201911111627439556399',5),(138,'TR_526201911111627439556399',6),(139,'TR_526201911111627439556399',7),(140,'TR_526201911111627439556399',8),(141,'TR_526201911111627439556399',9),(142,'TR_526201911111627439556399',10),(143,'TR_526201911111627439556399',11),(144,'TR_526201911111627439556399',12),(145,'TR_526201911111627439556399',13),(146,'TR_526201911111627439556399',14),(147,'TR_526201911111627439556399',15),(148,'TR_526201911111627439556399',16),(149,'TR_526201911111627439556399',17),(150,'TR_526201911111627439556399',18),(151,'TR_526201911111627439556399',19),(152,'TR_526201911111627439556399',20),(153,'TR_526201911111627439556399',21),(154,'TR_4452019111117599664020',1),(155,'TR_4452019111117599664020',2),(156,'TR_4452019111117599664020',3),(157,'TR_4452019111117599664020',4),(158,'TR_4452019111117599664020',5),(159,'TR_4452019111117599664020',6),(160,'TR_4452019111117599664020',7),(161,'TR_4452019111117599664020',8),(162,'TR_4452019111117599664020',9),(163,'TR_4452019111117599664020',10),(164,'TR_4452019111117599664020',11),(165,'TR_4452019111117599664020',12),(166,'TR_4452019111117599664020',13),(167,'TR_4452019111117599664020',14),(168,'TR_4452019111117599664020',15),(169,'TR_4452019111117599664020',16),(170,'TR_4452019111117599664020',17),(171,'TR_4452019111117599664020',18),(172,'TR_4452019111117599664020',19),(173,'TR_4452019111117599664020',20),(174,'TR_4452019111117599664020',21),(175,'TR_7062019111117717657983',1),(176,'TR_7062019111117717657983',2),(177,'TR_7062019111117717657983',3),(178,'TR_7062019111117717657983',4),(179,'TR_7062019111117717657983',5),(180,'TR_7062019111117717657983',6),(181,'TR_7062019111117717657983',7),(182,'TR_7062019111117717657983',8),(183,'TR_7062019111117717657983',9),(184,'TR_7062019111117717657983',10),(185,'TR_7062019111117717657983',11),(186,'TR_7062019111117717657983',12),(187,'TR_7062019111117717657983',13),(188,'TR_7062019111117717657983',14),(189,'TR_7062019111117717657983',15),(190,'TR_7062019111117717657983',16),(191,'TR_7062019111117717657983',17),(192,'TR_7062019111117717657983',18),(193,'TR_7062019111117717657983',19),(194,'TR_7062019111117717657983',20),(195,'TR_7062019111117717657983',21),(196,'TR_27920191111203054468154',1),(197,'TR_27920191111203054468154',2),(198,'TR_27920191111203054468154',3),(199,'TR_27920191111203054468154',4),(200,'TR_27920191111203054468154',5),(201,'TR_27920191111203054468154',6),(202,'TR_27920191111203054468154',7),(203,'TR_27920191111203054468154',8),(204,'TR_27920191111203054468154',9),(205,'TR_27920191111203054468154',10),(206,'TR_27920191111203054468154',11),(207,'TR_27920191111203054468154',12),(208,'TR_27920191111203054468154',13),(209,'TR_27920191111203054468154',14),(210,'TR_27920191111203054468154',15),(211,'TR_27920191111203054468154',16),(212,'TR_27920191111203054468154',17),(213,'TR_27920191111203054468154',18),(214,'TR_27920191111203054468154',19),(215,'TR_27920191111203054468154',20),(216,'TR_27920191111203054468154',21),(217,'TR_11720191113165821314790',1),(218,'TR_11720191113165821314790',2),(219,'TR_11720191113165821314790',3),(220,'TR_11720191113165821314790',4),(221,'TR_11720191113165821314790',5),(222,'TR_11720191113165821314790',6),(223,'TR_11720191113165821314790',7),(224,'TR_11720191113165821314790',8),(225,'TR_11720191113165821314790',9),(226,'TR_11720191113165821314790',10),(227,'TR_11720191113165821314790',11),(228,'TR_11720191113165821314790',12),(229,'TR_11720191113165821314790',13),(230,'TR_11720191113165821314790',14),(231,'TR_11720191113165821314790',15),(232,'TR_11720191113165821314790',16),(233,'TR_11720191113165821314790',17),(234,'TR_11720191113165821314790',18),(235,'TR_11720191113165821314790',19),(236,'TR_11720191113165821314790',20),(237,'TR_11720191113165821314790',21),(238,'TR_52820191113238176083706',1),(239,'TR_52820191113238176083706',2),(240,'TR_79720191113238486032468',2),(241,'TR_79720191113238486032468',3),(242,'TR_6732019111494842752445',2),(243,'TR_89420191114949236114927',1),(244,'TR_89420191114949236114927',2),(245,'TR_89420191114949236114927',3),(246,'TR_920201911141110533331914',2),(247,'TR_920201911141110533331914',3),(248,'TR_920201911141110533331914',4),(249,'TR_374201911142035377223352',20);
/*!40000 ALTER TABLE `tbchitiettheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbchuong`
--

DROP TABLE IF EXISTS `tbchuong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbchuong` (
  `MaChuong` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTruyen` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TenChuong` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` datetime NOT NULL,
  PRIMARY KEY (`MaChuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchuong`
--

LOCK TABLES `tbchuong` WRITE;
/*!40000 ALTER TABLE `tbchuong` DISABLE KEYS */;
INSERT INTO `tbchuong` VALUES ('CH_179201911141626571791453','TR_6732019111494842752445','nnsvb','<p>sbdvhjsd</p>\r\n',1,'2019-11-14 16:26:57'),('CH_344201911141625529107571','TR_6732019111494842752445','nbsdbvjb','<p>bjhbfhjvbqjbhj</p>\r\n',1,'2019-11-14 16:25:52'),('CH_350201911141633454512664','TR_6732019111494842752445','chương mới này','<p>bhbvhjsbjv vsbsvh hsvbs bvsh</p>\r\n',1,'2019-11-14 16:33:45'),('CH_41720191114161934422481','TR_6732019111494842752445','sbvhjjh','<p>hbhjvsbdhjb</p>\r\n',1,'2019-11-14 16:19:03'),('CH_477201911141624583743699','TR_6732019111494842752445','bhjbjfvbjh','<p>hbhjbbshdbhj</p>\r\n',1,'2019-11-14 16:24:58'),('CH_51420191114163634384873','TR_6732019111494842752445','thvjadbhjb','<p>bsdbvj</p>\r\n',1,'2019-11-14 16:36:34'),('CH_66120191114161810759069','TR_6732019111494842752445','chuong 1','<p>hbvshbhjbs</p>\r\n',1,'2019-11-14 16:18:10'),('CH_807201911141628179077334','TR_6732019111494842752445','tesvnbsb','<p>bjsbvj</p>\r\n',1,'2019-11-14 16:28:17'),('CH_878201911141634494758287','TR_6732019111494842752445','hdsbvhj','<p>jbsjbjb</p>\r\n',1,'2019-11-14 16:34:49'),('CH_947201911141640467666445','TR_6732019111494842752445','chương nữa','<p>sdbvjhb</p>\r\n',1,'2019-11-14 16:40:46');
/*!40000 ALTER TABLE `tbchuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdanhmuctruyen`
--

DROP TABLE IF EXISTS `tbdanhmuctruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbdanhmuctruyen` (
  `MaDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `TenDanhMuc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdanhmuctruyen`
--

LOCK TABLES `tbdanhmuctruyen` WRITE;
/*!40000 ALTER TABLE `tbdanhmuctruyen` DISABLE KEYS */;
INSERT INTO `tbdanhmuctruyen` VALUES (1,'Truyện Hot','Danh sách những truyện đang hot, có nhiều người đọc và quan tâm nhất trong tháng này.',1,'2019-10-22'),(2,'Truyện Full','Danh sách những truyện đã hoàn thành, ra đủ chương.',1,'2019-10-17'),(4,'Truyện mới cập nhật','Danh sách truyện chữ được cập nhật (vừa ra mắt, thêm chương mới, sửa nội dung,..) gần đây.',1,'2019-10-17'),(5,'Truyện New','Danh sác truyện mới cập nhật trong ngày',1,'2019-10-27');
/*!40000 ALTER TABLE `tbdanhmuctruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbinfotaikhoan`
--

DROP TABLE IF EXISTS `tbinfotaikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbinfotaikhoan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKHoan` char(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `HoVaTen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `SDT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbinfotaikhoan`
--

LOCK TABLES `tbinfotaikhoan` WRITE;
/*!40000 ALTER TABLE `tbinfotaikhoan` DISABLE KEYS */;
INSERT INTO `tbinfotaikhoan` VALUES (1,'TK9620191121621648996','jbsvbbsjhb','jbsvbbsjhb','','2019-11-02'),(2,'TK541201911216220409541','sdffds','sdffds','','2019-11-02'),(3,'TK124201911216227781124','hbdvshhjbvsdb','hbdvshhjbvsdb','','2019-11-02'),(4,'TK73201911216221621973','sbvhjbdsjh','sbvhjbdsjh','','2019-11-02');
/*!40000 ALTER TABLE `tbinfotaikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbnhomdich`
--

DROP TABLE IF EXISTS `tbnhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbnhomdich` (
  `MaNhomDich` int(11) NOT NULL AUTO_INCREMENT,
  `TenNhomDich` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `NgayTao` date NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaNhomDich`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbnhomdich`
--

LOCK TABLES `tbnhomdich` WRITE;
/*!40000 ALTER TABLE `tbnhomdich` DISABLE KEYS */;
INSERT INTO `tbnhomdich` VALUES (1,'admin','2019-10-24',1);
/*!40000 ALTER TABLE `tbnhomdich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbphanhoi`
--

DROP TABLE IF EXISTS `tbphanhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbphanhoi` (
  `MaPhanHoi` int(11) NOT NULL AUTO_INCREMENT,
  `ThoiGian` date NOT NULL,
  `MaTruyen` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `NoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaPhanHoi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbphanhoi`
--

LOCK TABLES `tbphanhoi` WRITE;
/*!40000 ALTER TABLE `tbphanhoi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbphanhoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbrole`
--

DROP TABLE IF EXISTS `tbrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbrole` (
  `MaRole` int(11) NOT NULL AUTO_INCREMENT,
  `TenRole` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  PRIMARY KEY (`MaRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbrole`
--

LOCK TABLES `tbrole` WRITE;
/*!40000 ALTER TABLE `tbrole` DISABLE KEYS */;
INSERT INTO `tbrole` VALUES (1,'Admin'),(2,'User'),(3,'tlt');
/*!40000 ALTER TABLE `tbrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtacgia`
--

DROP TABLE IF EXISTS `tbtacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtacgia` (
  `MaTacGia` int(11) NOT NULL AUTO_INCREMENT,
  `TenTacGia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `GioiThieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtacgia`
--

LOCK TABLES `tbtacgia` WRITE;
/*!40000 ALTER TABLE `tbtacgia` DISABLE KEYS */;
INSERT INTO `tbtacgia` VALUES (1,'Phi Thiên Ngư','Tác giả người TQ(hết rồi)',1,'2019-10-19'),(2,'Miêu Nị','Tác giả người TQ(hết rồi)',1,'2019-10-19'),(3,'Bắc Khuynh','Tác giả người TQ(hết rồi)',1,'2019-10-19');
/*!40000 ALTER TABLE `tbtacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtaikhoan`
--

DROP TABLE IF EXISTS `tbtaikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtaikhoan` (
  `MaTaiKhoan` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TenTaiKhoan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtaikhoan`
--

LOCK TABLES `tbtaikhoan` WRITE;
/*!40000 ALTER TABLE `tbtaikhoan` DISABLE KEYS */;
INSERT INTO `tbtaikhoan` VALUES ('1','admin@adminc.om','admin',1,'2019-10-10'),('2','user','admin',2,'2019-10-10'),('3','tlt','admin',3,'2019-10-10'),('Dsadasdadasd','admin@admin.com','admin',2,'2019-11-02'),('TK124201911216227781124','admin@admin.com','admin',2,'2019-11-02'),('TK144201911216173278144','admin@admin.com','admin',2,'2019-11-02'),('TK2362019112161751106236','admin@admin.com','admin',2,'2019-11-02'),('TK277201911216202481277','admin@admin.com','admin',2,'2019-11-02'),('TK414201911216175982414','admin@admin.com','admin',2,'2019-11-02'),('TK541201911216220409541','admin@admin.com','admin',2,'2019-11-02'),('TK73201911216221621973','admin@admin.com','admin',2,'2019-11-02'),('TK784201911216211657784','admin@admin.com','admin',2,'2019-11-02'),('TK863201911216202782863','admin@admin.com','admin',2,'2019-11-02'),('TK9620191121621648996','admin@admin.com','admin',2,'2019-11-02'),('TK9762019112161715111976','admin@admin.com','admin',2,'2019-11-02');
/*!40000 ALTER TABLE `tbtaikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbthanhviennhomdich`
--

DROP TABLE IF EXISTS `tbthanhviennhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbthanhviennhomdich` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKHoan` int(11) DEFAULT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbthanhviennhomdich`
--

LOCK TABLES `tbthanhviennhomdich` WRITE;
/*!40000 ALTER TABLE `tbthanhviennhomdich` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbthanhviennhomdich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtheloaitruyen`
--

DROP TABLE IF EXISTS `tbtheloaitruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtheloaitruyen` (
  `MaTheLoai` int(11) NOT NULL AUTO_INCREMENT,
  `TenTheLoai` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date DEFAULT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtheloaitruyen`
--

LOCK TABLES `tbtheloaitruyen` WRITE;
/*!40000 ALTER TABLE `tbtheloaitruyen` DISABLE KEYS */;
INSERT INTO `tbtheloaitruyen` VALUES (1,'Tiên hiệp','Là truyện tiểu thuyết của TQ',1,'2019-10-19'),(2,'Ngôn Tình','Là truyện tình cảm của TQ, HQ, NB',1,'2019-10-19'),(3,'Kiếm Hiệp','Là truyện đánh nhau của TQ',1,'2019-10-19'),(4,'Đô thị','Những truyện có nội dung chủ yếu diễn ra trong môi trường đô thị hiện đại.',1,'2019-10-19'),(5,'Quan Trường','Là truyện kể về những khía cạnh cũng như quá trình thăng quan tiến chức của nhân vật chính',1,'2019-10-19'),(6,'Võng Du','Là thể loại truyện thuộc dạng khoa học viễn tượng, lấy bối cảnh thường là các game online trên mạng với công nghệ cao, hình ảnh chất lượng cao, kỹ xảo đồ sộ, mức chân thật cao, kỳ ảo, và tác giả của thể loại này thường rất giàu trí tưởng tượng :))',1,'2019-10-19'),(7,'Khoa Huyễn','Những bộ truyện có yếu tố khoa học bí ẩn.',1,'2019-10-19'),(8,'Dị Giới','Trong truyện có xuất hiện những thế giới kỳ dị, khác với thế giới chúng ta đang sinh sống',1,'2019-10-19'),(9,'Dị Năng','Truyện dị năng là thể loại thường có những nhân vật sở hữu các năng lực siêu nhiên đặc biệt mà người thường không thể nào có được.',1,'2019-10-19'),(10,'Quân Sự','Truyện có yếu tố quân sự, thường diễn ra trong môi trường quân đội, quân lính.',1,'2019-10-19'),(11,'Lịch Sử','Nội dung truyện thường xảy ra trong lịch sử, có nhiều yếu tố tương tự so với lịch sử thế giới thật.',1,'2019-10-19'),(12,'Xuyên Không','Xuyên Không, Xuyên Việt là thể loại nhân vật chính vì một lý do nào đó mà bị đưa đến sinh sống ở một không gian hay một khoảng thời gian khác.',1,'2019-10-19'),(13,'Trinh Thám','Truyện trinh thám trong và ngoài nước.',1,'2019-10-19'),(14,'Thám hiểm','Nội dung truyện thường là những cuộc phiêu lưu thám hiểm những địa danh kỳ bí cực gay cấn.',1,'2019-10-19'),(15,'Cung Đấu','Truyện cung đấu là thể loại truyện có các nhân vật trong hoàng cung thời phong kiến đấu đá, âm mưu tính toán lẫn nhau.',1,'2019-10-19'),(16,'Hài Hước','Những bộ truyện có nội dung hài hước, đem lại tiếng cười vui vẻ cho độc giả.',1,'2019-10-19'),(17,'Phương Tây','Những tác phẩm được viết bởi các tác giả phương Tây.',1,'2019-10-19'),(18,'Việt Nam','Các tác phẩm của nền văn học Việt Nam, được viết bởi các danh tác nổi tiếng.',1,'2019-10-19'),(19,'Cổ Đại','Truyện có nội dung xảy ra ở thời cổ đại phong kiến.',1,'2019-10-19'),(20,'Bách Hợp','Truyện tình cảm giữa nữ và nữ.',1,'2019-10-19'),(21,'Khác','Những truyện không thuộc những thể loại đã có ở Truyện Full sẽ \"được\" nhét vào đây.',1,'2019-10-19');
/*!40000 ALTER TABLE `tbtheloaitruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtruyen`
--

DROP TABLE IF EXISTS `tbtruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtruyen` (
  `MaTruyen` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TenTruyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTacGia` int(11) NOT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `SoChuong` int(11) NOT NULL,
  `GioiThieu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `LuotXem` int(11) DEFAULT NULL,
  `Nguon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `HinhAnh` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Full` tinyint(4) DEFAULT NULL,
  `Hot` tinyint(4) DEFAULT NULL,
  `New` tinyint(4) DEFAULT NULL,
  `HienThi` tinyint(4) DEFAULT NULL,
  `NgayTao` datetime NOT NULL,
  PRIMARY KEY (`MaTruyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtruyen`
--

LOCK TABLES `tbtruyen` WRITE;
/*!40000 ALTER TABLE `tbtruyen` DISABLE KEYS */;
INSERT INTO `tbtruyen` VALUES ('TR_374201911142035377223352','k k j k',1,1,0,'nsvkjsv',0,'vbhjbshvbjs','',0,0,1,1,'2019-11-14 20:35:37'),('TR_6732019111494842752445','Thế giới mộng  tuyết',1,1,10,'jhj',0,'hbhjh','',1,1,1,1,'2019-11-14 09:48:42'),('TR_79720191113238486032468','Hoa Mộng Tuyết',1,1,0,'svd',0,'sdv','',1,1,1,1,'2019-11-13 23:08:48');
/*!40000 ALTER TABLE `tbtruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtruyencuanhomdich`
--

DROP TABLE IF EXISTS `tbtruyencuanhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtruyencuanhomdich` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` int(11) DEFAULT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtruyencuanhomdich`
--

LOCK TABLES `tbtruyencuanhomdich` WRITE;
/*!40000 ALTER TABLE `tbtruyencuanhomdich` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbtruyencuanhomdich` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 22:01:24
