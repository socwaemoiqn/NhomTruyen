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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 22:02:23
