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
  `NgayTao` datetime NOT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtacgia`
--

LOCK TABLES `tbtacgia` WRITE;
/*!40000 ALTER TABLE `tbtacgia` DISABLE KEYS */;
INSERT INTO `tbtacgia` VALUES (4,'Dược Thiên Sầu','Tác giả người TQ.',1,'2019-11-18 09:31:07'),(5,'Hoàng Nhiên','Không có giới thiệu',1,'2019-11-18 09:42:12'),(6,'Hoàng Dung Ân (Sea Ice)','Không có giới thiệu',1,'2019-11-18 09:48:12'),(7,'Trừ Chín Mươi','Không có giới thiệu',1,'2019-11-18 09:52:42'),(8,'Tống Thị Phương Anh','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 10:03:54'),(9,'Võ Anh Thơ','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 10:09:46'),(10,'Tân Sinh','Tác Giả người Hoa',1,'2019-11-18 10:16:46'),(11,'Lạt Tiêu','Tác giả người TQ.',1,'2019-11-18 15:58:04'),(12,'Phạm Vũ Anh Thư','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 16:02:12'),(13,'Trần Phan Trúc Giang','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 16:13:37'),(14,'Dạ Thảo','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 16:19:41'),(15,'Hà Thanh Phúc','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 16:22:45'),(16,'M MT','Tác giả người Việt Nam. Mọi người nhớ ủng hộ',1,'2019-11-18 16:24:33');
/*!40000 ALTER TABLE `tbtacgia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26 23:20:40
