-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: dbnhomtruyen
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbchitietdanhmuc` (
  `MaChiTietDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaDanhMuc` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchitietdanhmuc`
--

LOCK TABLES `tbchitietdanhmuc` WRITE;
/*!40000 ALTER TABLE `tbchitietdanhmuc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbchitietdanhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbchitiettheloai`
--

DROP TABLE IF EXISTS `tbchitiettheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbchitiettheloai` (
  `MaChiTietTheLoai` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTheLoai` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchitiettheloai`
--

LOCK TABLES `tbchitiettheloai` WRITE;
/*!40000 ALTER TABLE `tbchitiettheloai` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbchitiettheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbchuong`
--

DROP TABLE IF EXISTS `tbchuong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbchuong` (
  `MaChuong` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTruyen` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
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
/*!40000 ALTER TABLE `tbchuong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdanhmuctruyen`
--

DROP TABLE IF EXISTS `tbdanhmuctruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `tbdanhmuctruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbinfotaikhoan`
--

DROP TABLE IF EXISTS `tbinfotaikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbinfotaikhoan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MaTaiKHoan` int(11) NOT NULL,
  `HoVaTen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
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
/*!40000 ALTER TABLE `tbinfotaikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbnhomdich`
--

DROP TABLE IF EXISTS `tbnhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40000 ALTER TABLE `tbnhomdich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbphanhoi`
--

DROP TABLE IF EXISTS `tbphanhoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbphanhoi` (
  `MaPhanHoi` int(11) NOT NULL AUTO_INCREMENT,
  `ChuDe` char(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `NgayTao` datetime NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbrole` (
  `MaRole` int(11) NOT NULL AUTO_INCREMENT,
  `TenRole` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `TrangThai` tinyint(4) DEFAULT '1',
  `NgayTao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MaRole`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbrole`
--

LOCK TABLES `tbrole` WRITE;
/*!40000 ALTER TABLE `tbrole` DISABLE KEYS */;
INSERT INTO `tbrole` VALUES (1,'Admin','',0,'2019-11-17 23:05:08'),(2,'User','',0,'2019-11-17 23:05:14'),(3,'Translator',NULL,0,'2019-11-17 23:05:19');
/*!40000 ALTER TABLE `tbrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtacgia`
--

DROP TABLE IF EXISTS `tbtacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtacgia` (
  `MaTacGia` int(11) NOT NULL AUTO_INCREMENT,
  `TenTacGia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `GioiThieu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtacgia`
--

LOCK TABLES `tbtacgia` WRITE;
/*!40000 ALTER TABLE `tbtacgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbtacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtaikhoan`
--

DROP TABLE IF EXISTS `tbtaikhoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtaikhoan` (
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenTaiKhoan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `Email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` tinyint(4) DEFAULT '1',
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtaikhoan`
--

LOCK TABLES `tbtaikhoan` WRITE;
/*!40000 ALTER TABLE `tbtaikhoan` DISABLE KEYS */;
INSERT INTO `tbtaikhoan` VALUES (5,'admin123','thanhdat',1,'vovanviettqt2016@gmail.com',1,'2019-11-17');
/*!40000 ALTER TABLE `tbtaikhoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbthanhviennhomdich`
--

DROP TABLE IF EXISTS `tbthanhviennhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtheloaitruyen` (
  `MaTheLoai` int(11) NOT NULL AUTO_INCREMENT,
  `TenTheLoai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
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
/*!40000 ALTER TABLE `tbtheloaitruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtruyen`
--

DROP TABLE IF EXISTS `tbtruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbtruyen` (
  `MaTruyen` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
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
/*!40000 ALTER TABLE `tbtruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtruyencuanhomdich`
--

DROP TABLE IF EXISTS `tbtruyencuanhomdich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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

-- Dump completed on 2019-11-26 10:52:16
