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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 22:02:19
