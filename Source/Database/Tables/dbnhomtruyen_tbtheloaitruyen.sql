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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 22:02:21
