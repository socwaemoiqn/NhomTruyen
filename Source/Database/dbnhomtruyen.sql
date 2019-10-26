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
  `MaTruyen` int(11) NOT NULL,
  `MaDanhMuc` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchitietdanhmuc`
--

LOCK TABLES `tbchitietdanhmuc` WRITE;
/*!40000 ALTER TABLE `tbchitietdanhmuc` DISABLE KEYS */;
INSERT INTO `tbchitietdanhmuc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,2),(5,2,3),(6,1,4);
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
  `MaTruyen` int(11) NOT NULL,
  `MaTheLoai` int(11) NOT NULL,
  PRIMARY KEY (`MaChiTietTheLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbchuong` (
  `MaChuong` int(11) NOT NULL AUTO_INCREMENT,
  `MaTruyen` int(11) NOT NULL,
  `TenChuong` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NoiDung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaChuong`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbchuong`
--

LOCK TABLES `tbchuong` WRITE;
/*!40000 ALTER TABLE `tbchuong` DISABLE KEYS */;
INSERT INTO `tbchuong` VALUES (1,1,'Mang thai bảy tháng','<p><span style=\"font-size:22px\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Nhiệt độ n&oacute;ng rực như thể nham thạch n&oacute;ng chảy trong l&ograve;ng n&uacute;i lửa dường như muốn đốt ch&aacute;y c&ocirc;, thứ duy nhất c&oacute; thể giải tho&aacute;t cho c&ocirc; chỉ c&oacute; người đ&agrave;n &ocirc;ng trước mặt.......</span></span></p>\r\n',1,'2019-10-20'),(2,1,'chương 2','<p><span style=\"font-family:Comic Sans MS,cursive\"><span style=\"font-size:26px\">&quot;N&oacute;i cho m&agrave;y hay! Tối đ&oacute; m&agrave;y uống rượu do tao chế, đừng n&oacute;i dục cầu bất m&atilde;n, tao đ&atilde; c&oacute; l&ograve;ng tốt t&igrave;m cho m&agrave;y hai t&ecirc;n cao to rồi, ai ngờ m&agrave;y lại kh&ocirc;ng biết tốt xấu, tự dưng đi chui v&agrave;o ph&ograve;ng của thằng n&agrave;o đ&oacute;, đ&atilde; thế c&ograve;n kh&ocirc;ng ch&uacute;t kh&aacute;ch kh&iacute; c&ugrave;ng người ta...&quot; Ninh Tuyết Lạc ch&aacute;n gh&eacute;t mở miệng: &quot;Anh Diễn c&oacute; l&ograve;ng tốt, sợ m&agrave;y tỉnh dậy kh&ocirc;ng chịu nổi n&ecirc;n mới n&oacute;i người c&ugrave;ng m&agrave;y tối h&ocirc;m đ&oacute; l&agrave; anh ấy th&ocirc;i!&quot; M&agrave;y...&quot; Ninh Tịch tức run l&ecirc;n, nghe tới đ&acirc;y, c&ocirc; kh&ocirc;ng nhịn nổi nữa, liền b&oacute;p chặt lấy cổ tay Ninh Tuyết Lạc: &quot;Sao m&agrave;y lại l&agrave;m thế với tao? Tại sao! M&agrave;y hại tao như thế c&ograve;n chưa đủ sao?&rdquo; Ninh Tuyết Lạc mới đầu c&ograve;n c&acirc;ng c&acirc;ng l&ecirc;n, định đẩy Ninh Tịch ra, đ&uacute;ng l&uacute;c đ&oacute; lại thấy T&ocirc; Diễn ph&iacute;a sau Ninh Tịch, giọng điệu lập tức nhũn xuống, tỏ ra điềm đạm đ&aacute;ng y&ecirc;u: &quot;Chị, em biết em sai rồi, chị muốn đ&aacute;nh muốn mắng em thế n&agrave;o cũng được, nhưng đừng tr&aacute;ch anh Diễn...&quot; Ninh Tịch ngẩn ra, ngay sau đ&oacute;, lại thấy Ninh Tuyết Lạc tự nhi&ecirc;n ng&atilde; lăn ra đất, tr&ocirc;ng như bị c&ocirc; đẩy vậy. &quot;Ninh Tịch! Em l&agrave;m g&igrave; vậy......&quot; Tiếng quở tr&aacute;ch vang l&ecirc;n. Ninh Tịch ngạc nhi&ecirc;n quay lại li&ecirc;n thấy vẻ mặt lạnh l&ugrave;ng của T&ocirc; Diễn. T&ocirc; Diễn l&aacute;ch qua người c&ocirc;, đỡ Ninh Tuyết Lạc dậy: &quot;Tuyết Lạc, em kh&ocirc;ng sao chứ?&quot; Cả người Ninh Tuyết Lạc như treo tr&ecirc;n người T&ocirc; Diễn: &quot;Anh Diễn, em kh&ocirc;ng cố &yacute;, em thật sự biết sai rồi... Chuyện th&agrave;nh ra thế n&agrave;y đều tại em c&oacute; lỗi với chị...&quot; &quot;Được rồi, c&oacute; chuyện g&igrave; cũng c&oacute; anh ở đ&acirc;y rồi!&quot; T&ocirc; Diễn vỗ vai Ninh Tuyết Lạc, đưa c&ocirc; l&ecirc;n xe: &quot;Để anh n&oacute;i r&otilde; với Ninh Tịch.&quot; Đầu Ninh Tịch trống rỗng, c&ocirc; thấy T&ocirc; Diễn đi về ph&iacute;a m&igrave;nh, rồi lại thấy miệng T&ocirc; Diễn cứ mở ra rồi kh&eacute;p lại. Anh ta n&oacute;i g&igrave; đ&oacute; rất l&acirc;u. N&oacute;i về việc những năm th&aacute;ng họ l&agrave; thanh mai tr&uacute;c m&atilde;, n&oacute;i về việc anh đ&atilde; đấu tranh thế n&agrave;o khi y&ecirc;u Ninh Tuyết Lạc, n&oacute;i anh cũng tức giận khi biết Ninh Tuyết Lạc hại c&ocirc;, n&oacute;i về việc anh cảm thấy rất khiếp sợ v&agrave; &aacute;y n&aacute;y khi biết Ninh Tịch mang thai, n&oacute;i anh đ&atilde; chấp nhận lời xin lỗi của Ninh Tuyết Lạc...Cuối c&ugrave;ng, anh n&oacute;i: &quot;Ninh Tịch, xin lỗi, anh kh&ocirc;ng thể lấy em. Kh&ocirc;ng phải anh gh&eacute;t bỏ em v&igrave; chuyện ng&agrave;y h&ocirc;m đ&oacute; hay đứa trẻ trẻ n&agrave;y, m&agrave; v&igrave; anh kh&ocirc;ng thể phụ l&ograve;ng Tuyết Lạc, anh cũng kh&ocirc;ng thể lại lừa dối t&igrave;nh cảm của ch&iacute;nh m&igrave;nh th&ecirc;m nữa.&rdquo; Mấy th&aacute;ng nay, g&atilde; đều đưa Ninh Tuyết Lạc ra nước ngo&agrave;i, sớm chiều đều d&iacute;nh lấy nhau kh&ocirc;ng rời, mặc d&ugrave; bề ngo&agrave;i g&atilde; v&igrave; muốn b&ugrave; đắp lại tổn thương cho Ninh Tịch n&ecirc;n mới nhận tối h&ocirc;m đ&oacute; ch&iacute;nh g&atilde; đ&atilde; quan hệ với c&ocirc;, nhưng từ tận s&acirc;u trong đ&aacute;y l&ograve;ng, g&atilde; đ&atilde; sớm chọn Ninh Tuyết Lạc rồi. Thế n&ecirc;n sau khi biết tin Ninh Tịch mang thai, g&atilde; kh&ocirc;ng đ&agrave;nh l&ograve;ng tới Ninh gia n&oacute;i r&otilde; chuyện n&agrave;y với hai b&aacute;c m&agrave; muốn n&oacute;i r&otilde; sự thật với Ninh Tịch trước. &quot;N&oacute;i vậy c&oacute; nghĩa l&agrave;... T&ocirc; Diễn... Ngay từ đầu anh đ&atilde; biết việc Ninh Tuyết Lạc bỏ thuốc để hủy hoại trinh tiết của t&ocirc;i? V&igrave; muốn bao che cho n&oacute;, n&ecirc;n anh mới n&oacute;i với t&ocirc;i người đ&agrave;n &ocirc;ng tối h&ocirc;m đ&oacute; l&agrave; anh?&quot; Ninh Tịch cuối c&ugrave;ng cũng t&igrave;m về được giọng n&oacute;i của m&igrave;nh, hồn bay ph&aacute;ch lạc nh&igrave;n vẻ mặt b&igrave;nh tĩnh của T&ocirc; Diễn. &quot;Ninh Tịch, Tuyết Lạc c&ocirc; ấy kh&ocirc;ng cố t&igrave;nh, c&ocirc; ấy c&ograve;n nhỏ, t&iacute;nh t&igrave;nh manh động....&quot; &quot;Vậy c&ograve;n t&ocirc;i th&igrave; sao?&quot; Ninh Tịch ngẩng l&ecirc;n nh&igrave;n T&ocirc; Diễn, tr&agrave;n đầy tuyệt vọng: &quot;C&aacute;c người c&oacute; từng nghĩ tới t&ocirc;i một ch&uacute;t n&agrave;o kh&ocirc;ng?&quot; T&ocirc; Diễn c&acirc;m bặt, một l&uacute;c sau, hắn mới vươn tay k&eacute;o Ninh Tịch: &quot;Ở đ&acirc;y nắng qu&aacute;, ch&uacute;ng ta về nh&agrave; trước đ&atilde;...&quot;&quot;Đừng c&oacute; chạm v&agrave;o t&ocirc;i...&quot; Ninh Tịch hất tay T&ocirc; Diễn ra, c&ocirc; bỗng cười ph&aacute; l&ecirc;n.Sống tới tận giờ, Ninh Tịch bỗng cảm thấy cuộc sống của m&igrave;nh như một tr&ograve; hề.Để tới được th&agrave;nh phố của T&ocirc; Diễn, c&ocirc; đ&atilde; cố gắng thi v&agrave;o được đại học B.Để lấy l&ograve;ng T&ocirc; Diễn, c&ocirc; từ bỏ cả ước ở l&agrave;m diễn vi&ecirc;n của m&igrave;nh.Để m&ocirc;n đăng hộ đối với anh ta, c&ocirc; từ bỏ cả cha mẹ nu&ocirc;i để về Ninh gia, cả ng&agrave;y chỉ biết vụng về nịnh nọt c&aacute;i nh&acirc;n vật được gọi l&agrave; nổi tiếng n&agrave;y. Cuối c&ugrave;ng, chỉ để đổi lại một c&acirc;u: &quot;Anh kh&ocirc;ng thể phụ l&ograve;ng Tuyết Lạc.&quot;Ninh Tuyết Lạc, kh&ocirc;ng chỉ chiếm lấy danh phận của c&ocirc;, cướp mất cha mẹ đẻ của c&ocirc;, giờ... c&ograve;n cướp mất người trong l&ograve;ng c&ocirc;!Ninh Tuyết Lạc c&ograve;n nhỏ, l&agrave;m sai c&oacute; thể được tha thứ?Vậy... Ai sẽ trả gi&aacute; cho cuộc đời của c&ocirc; đ&acirc;y? C&ocirc; thậm ch&iacute;... ngay đến cả người đ&agrave;n &ocirc;ng tối h&ocirc;m đ&oacute; l&agrave; ai cũng kh&ocirc;ng biết! Ninh Tịch bưng mặt, c&ocirc; run l&ecirc;n bần bật, tuyệt vọng tới cực điểm. T&ocirc; Diễn thấy Ninh Tịch thần t&igrave;nh hoảng loạn lảo đảo đi ra giữa l&ograve;ng đường, g&atilde; liền vứt bỏ điếu thuốc đang kẹp tr&ecirc;n tay, muốn đuổi theo, lại bị Ninh Tuyết Lạc ở sau k&eacute;o tay &aacute;o: &quot;Anh Diễn, anh muốn đi đ&acirc;u?&quot; Ch&iacute;nh v&agrave;o l&uacute;c T&ocirc; Diễn đang chần chừ, chỉ nghe thấy một tiếng động lớn vang l&ecirc;n, Ninh Tịch đang đi tr&ecirc;n lối qua đường bị hất tung l&ecirc;n, rồi rơi xuống đất. &quot;Cứu người... Cứu người với... Đ&acirc;m phải thai phụ rồi...&quot; &Aacute;nh s&aacute;ng ch&oacute;i mắt rọi tới, Ninh Tịch thấy b&oacute;ng người chớp nho&aacute;ng v&agrave; hai gương mặt khiến c&ocirc; ph&aacute;t tởm, bụng truyền đến cơn đau co r&uacute;t khiến c&ocirc; &yacute; thức được một ch&uacute;t g&igrave; đ&oacute; đang mất đi, c&ocirc; chỉ chớp mắt một c&aacute;i, m&aacute;u tươi tr&ecirc;n tr&aacute;n chảy đầm đ&igrave;a, chảy dọc v&agrave;o mắt c&ocirc;... cả thế giới rơi v&agrave;o một mảnh tối đen...</span></span></p>\r\n',1,'2019-10-20'),(3,1,'chương 3','<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:22px\">Dịch: Độc H&agrave;nh<br />\r\n<br />\r\n&quot;Ngươi nh&igrave;n thấy B&aacute;ch L&yacute; Cuồng Phong?&quot; Mạc Vấn nh&iacute;u m&agrave;y nh&igrave;n về ph&iacute;a l&atilde;o Ngũ, người được l&atilde;o Ngũ gọi l&agrave; Nhị gia chỉ c&oacute; B&aacute;ch L&yacute; Cuồng Phong, nhưng B&aacute;ch L&yacute; Cuồng Phong đ&atilde; sớm bị Liễu Sanh giết chết, đ&acirc;y l&agrave; hắn tận mắt nh&igrave;n thấy.<br />\r\n<br />\r\n&quot;Đ&uacute;ng vậy.&quot; L&atilde;o Ngũ mở lớn mắt gật đầu.<br />\r\n<br />\r\n&quot;Ngươi biết r&otilde; hắn đ&atilde; sớm gi&aacute; hạc, l&agrave;m sao c&oacute; thể gặp hắn?&quot; Mạc Vấn lắc đầu n&oacute;i ra. Nếu l&atilde;o Ngũ nh&igrave;n thấy Liễu Sanh, hắn tuyệt sẽ kh&ocirc;ng ngạc nhi&ecirc;n, nhưng l&atilde;o Ngũ nh&igrave;n thấy ch&iacute;nh l&agrave; B&aacute;ch L&yacute; Cuồng Phong, m&agrave; hồn ph&aacute;ch B&aacute;ch L&yacute; Cuồng Phong đ&atilde; kh&ocirc;ng c&ograve;n.<br />\r\n<br />\r\n&quot;Thật sự l&agrave; hắn, ta tuyệt kh&ocirc;ng nh&igrave;n lầm.&quot; L&atilde;o Ngũ cực kỳ khẳng định.<br />\r\n<br />\r\n&quot;Kể r&otilde; lại sự việc cho ta nghe.&quot; Mạc Vấn đi ra ngo&agrave;i cửa nh&igrave;n Tần V&acirc;n chỉ chỉ ch&iacute;nh ph&ograve;ng. Tần V&acirc;n hiểu &yacute;, c&ugrave;ng Hạnh nhi đi đến ch&iacute;nh ph&ograve;ng.<br />\r\n<br />\r\n&quot;Mấy ng&agrave;y trước ta đi một chuyến đến Bất H&agrave;m Sơn, tr&ecirc;n một đỉnh n&uacute;i rất cao thấy hắn. Hắn cưỡi một con hổ h&igrave;nh th&ugrave; cổ qu&aacute;i, ta thấy hắn liền bay về ph&iacute;a ngọn n&uacute;i kia, kh&ocirc;ng đợi ta bay đến th&igrave; hắn đ&atilde; cưỡi hổ chạy đi. Ta gọi hắn, hắn kh&ocirc;ng l&ecirc;n tiếng.&quot; L&atilde;o Ngũ n&oacute;i xong, cầm b&igrave;nh nước tr&ecirc;n b&agrave;n mở miệng lớn uống.<br />\r\n<br />\r\nMạc Vấn nghe vậy hơi trầm ng&acirc;m, mở miệng hỏi: &quot;Người n&agrave;y d&ugrave;ng binh kh&iacute; g&igrave;?&quot;<br />\r\n<br />\r\n&quot;Tay kh&ocirc;ng, kh&ocirc;ng cầm g&igrave; cả.&quot; L&atilde;o Ngũ bu&ocirc;ng b&igrave;nh nước, lắc đầu.<br />\r\n<br />\r\n&quot;Ngươi chắc chắn kh&ocirc;ng nh&igrave;n lầm người?&quot; Mạc Vấn lắc đầu n&oacute;i ra. B&aacute;ch L&yacute; Cuồng Phong khi c&ograve;n sống d&ugrave;ng Lang Nha cự bổng, cũng kh&ocirc;ng cưỡi con hổ n&agrave;o cả. B&ecirc;n trong đầm lầy đ&ocirc;ng bắc th&acirc;m sơn c&oacute; nhiều T&aacute;t M&atilde;n y&ecirc;u nh&acirc;n, th&acirc;n h&igrave;nh của bọn họ cũng rất cao lớn, l&atilde;o Ngũ nh&igrave;n lầm cũng kh&ocirc;ng c&oacute; g&igrave; lạ.<br />\r\n<br />\r\n&quot;Ta cảm thấy hẳn l&agrave; kh&ocirc;ng nh&igrave;n lầm, chẳng qua nếu đ&uacute;ng l&agrave; Nhị gia, hắn sẽ phải để &yacute; đến ta.&quot; L&atilde;o Ngũ nhếch miệng.<br />\r\n<br />\r\n&quot;Ngươi đi Bất H&agrave;m Sơn l&agrave;m g&igrave; đ&oacute;?&quot; Mạc Vấn thuận miệng hỏi.<br />\r\n<br />\r\n&quot;Xuất m&ocirc;n mang kh&ocirc;ng đủ tiền, ta đi lấy tiền x&agrave;i.&quot; L&atilde;o Ngũ cười n&oacute;i.<br />\r\n<br />\r\n&quot;V&agrave;ng bạc chỗ đ&oacute; kh&ocirc;ng phải đều đ&atilde; chuyển đi rồi sao?&quot; Mạc Vấn chỉ tay xuống.<br />\r\n<br />\r\n&quot;C&ograve;n lại một &iacute;t. &Agrave; c&ograve;n nữa, Tần Phong kh&ocirc;ng muốn trở về...&quot; L&atilde;o Ngũ l&uacute;c trước đ&atilde; từng b&aacute;o cho Mạc Vấn l&agrave; đ&atilde; chuyển to&agrave;n bộ v&agrave;ng bạc ở Bất H&agrave;m Sơn đi rồi, giờ thấy n&oacute;i lỡ miệng, lại nghĩ chuyển chủ đề.<br />\r\n<br />\r\n&quot;Dị loại trong Bất H&agrave;m Sơn c&oacute; dị động g&igrave; kh&ocirc;ng?&quot; Mạc Vấn cắt ngang lời l&atilde;o Ngũ.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng thấy c&oacute; g&igrave; dị động g&igrave;, ta đi cấp b&aacute;ch, cũng kh&ocirc;ng đi xem Hắc Tam.&quot; L&atilde;o Ngũ n&oacute;i ra.<br />\r\n<br />\r\n&quot;C&aacute;c ngươi lần n&agrave;y xuất m&ocirc;n đ&atilde; đi nơi n&agrave;o?&quot; Mạc Vấn hỏi. Đ&aacute;m người l&atilde;o Ngũ đ&atilde; đi hơn nửa th&aacute;ng.<br />\r\n<br />\r\n&quot;Cũng kh&ocirc;ng đi đ&acirc;u, chỉ đi loanh quanh quanh qu&ecirc; qu&aacute;n Nhị phu nh&acirc;n. Đ&uacute;ng rồi, ta c&ograve;n đi một chuyến đến Lương quốc, Lương quốc lại bắt một &iacute;t h&ograve;a thượng, ta đo&aacute;n ng&agrave;i kh&ocirc;ng rảnh, liền tự tra x&eacute;t rồi, c&oacute; mấy t&ecirc;n h&ograve;a thượng bắt được từ trong n&uacute;i, bọn họ đều đ&atilde; gặp Khổng Tước Vương, n&oacute;i l&agrave; tr&ograve;ng mắt m&agrave;u t&iacute;m đấy.&quot; L&atilde;o Ngũ n&oacute;i ra.<br />\r\n<br />\r\nMạc Vấn nghe vậy nhẹ gật đầu, đưa tay &yacute; bảo l&atilde;o Ngũ tiếp tục n&oacute;i.<br />\r\n<br />\r\n&quot;Mấy năm trước Tứ gia cơ hồ giết hết ho&agrave; thượng ở Lương quốc, c&ograve;n lại lẻ tẻ v&agrave;i người chạy v&agrave;o trốn trong n&uacute;i. N&uacute;i kia gọi l&agrave; g&igrave; nhỉ, ta cũng kh&ocirc;ng nhớ r&otilde;. Mấy h&ograve;a thượng n&agrave;y ở ngay trong miếu sơn thần trong n&uacute;i trốn tr&aacute;nh. L&uacute;c bọn hắn tới th&igrave; Khổng Tước Vương đ&atilde; ở đ&oacute; rồi, người n&agrave;y ở c&ugrave;ng l&atilde;o h&ograve;a thượng trong n&uacute;i đ&atilde; hơn một năm. Th&aacute;ng s&aacute;u năm trước miếu sơn thần c&oacute; tới hai Hồ tăng, đ&atilde; mang Khổng Tước Vương đi rồi.&quot; L&atilde;o Ngũ n&oacute;i ra.<br />\r\n<br />\r\nMạc Vấn nghe vậy l&ocirc;ng m&agrave;y cau chặt, th&aacute;ng s&aacute;u năm trước đ&uacute;ng l&agrave; thời kỳ mạt thế đến. Trước khi mạt thế h&agrave;ng l&acirc;m, Thi&ecirc;n Đ&igrave;nh sẽ dừng thỉnh ti&ecirc;n nh&acirc;n nh&acirc;n gian l&ecirc;n Thi&ecirc;n Đ&igrave;nh, Phật gia hẳn l&agrave; cũng an b&agrave;i tương tự. &quot;Mấy h&ograve;a thượng n&oacute;i l&uacute;c Khổng Tước Vương đi c&oacute; n&oacute;i với bọn họ l&agrave; sẽ trở về tiếp tục giảng kinh cho bọn họ. Ta nghĩ mấy t&ecirc;n h&ograve;a thượng n&agrave;y kh&ocirc;ng thể nhốt trong nh&agrave; t&ugrave;, n&ecirc;n sai Tư Đồ phủ đưa bọn họ trở về rồi, cho bọn họ ăn, giam giữ tại miếu sơn thần.&quot; L&atilde;o Ngũ n&oacute;i ra.<br />\r\n<br />\r\n&quot;An b&agrave;i như thế rất thỏa đ&aacute;ng.&quot; Mạc Vấn khen ngợi gật đầu. Khổng Tước Vương l&uacute;c n&agrave;y kh&ocirc;ng thể nghi ngờ đ&atilde; trở lại T&acirc;y Thi&ecirc;n, sau khi mạt thế chấm dứt mới xuất hiện lại.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng c&ograve;n chuyện g&igrave; ta đi về trước dọn dẹp một ch&uacute;t nha.&quot; L&atilde;o Ngũ được Mạc Vấn kh&iacute;ch lệ, t&acirc;m t&igrave;nh rất tốt, xoay người xuất m&ocirc;n trở về Đ&ocirc;ng viện.<br />\r\n<br />\r\nL&atilde;o Ngũ đi rồi, Tần V&acirc;n bưng tr&agrave; n&oacute;ng l&ecirc;n đưa, cẩn thận từng li từng t&iacute; b&aacute;o cho Mạc Vấn Tần Phong kh&ocirc;ng muốn rời khỏi cha mẹ. Mạc Vấn đ&atilde; sớm biết từ chỗ l&atilde;o Ngũ chỗ l&agrave; Tần Phong kh&ocirc;ng c&ugrave;ng trở về. Đối với chuyện n&agrave;y hắn cũng kh&ocirc;ng bất m&atilde;n, Tần Phong kh&aacute;c với V&ocirc; Danh, hai người kh&ocirc;ng phải thầy tr&ograve;, hắn cũng kh&ocirc;ng k&yacute; th&aacute;c kỳ vọng lớn v&agrave;o Tần Phong.<br />\r\n<br />\r\nGiờ ngọ, Mạc Vấn mời ch&uacute;ng nh&acirc;n b&ecirc;n ngo&agrave;i đến T&acirc;y viện đ&oacute;n tiếp tẩy trần, sau đ&oacute; Thượng Thanh Quan liền trở về y&ecirc;n tĩnh.<br />\r\n<br />\r\nNg&agrave;y đ&oacute; buổi tối, Mạc Vấn nghỉ ngơi trong ch&iacute;nh ph&ograve;ng. Tần V&acirc;n về nh&agrave; chồng đ&atilde; nhiều ng&agrave;y rồi, thủy chung kh&ocirc;ng thấy động tĩnh. Tần V&acirc;n c&oacute; ch&uacute;t lo lắng, Mạc Vấn cũng như thế, nhưng chuyện con nối d&otilde;i ch&iacute;nh l&agrave; thi&ecirc;n định, sốt ruột cũng v&ocirc; &iacute;ch.<br />\r\n<br />\r\nSau một đoạn thời gian Mạc Vấn ở đan ph&ograve;ng chuy&ecirc;n t&acirc;m th&ocirc;i diễn ph&aacute;p m&ocirc;n tu h&agrave;nh nội đan. Đạo gia c&oacute; T&iacute;ch Cốc thuật, th&ocirc;i diễn đến chỗ mấu chốt mấy ng&agrave;y kh&ocirc;ng ngủ kh&ocirc;ng nghỉ kh&ocirc;ng ăn kh&ocirc;ng uống. Cứ thế qua nửa th&aacute;ng, ph&aacute;p m&ocirc;n tu h&agrave;nh nội đan đại kh&aacute;i th&agrave;nh h&igrave;nh, sau đ&oacute; cần phải l&agrave;m l&agrave; tiến th&ecirc;m một bước suy luận nghiệm chứng, bảo đảm ph&aacute;p m&ocirc;n h&agrave;nh kh&iacute; l&agrave;m an to&agrave;n dễ d&agrave;ng hơn.<br />\r\n<br />\r\nThế gian cũng kh&ocirc;ng phải chỉ c&oacute; C&agrave;n đạo, c&ograve;n c&oacute; số lượng kh&ocirc;ng &iacute;t nữ giới. Ph&aacute;p m&ocirc;n cho nữ giới luyện kh&iacute; ho&agrave;n to&agrave;n kh&aacute;c với C&agrave;n đạo, nữ giới c&oacute; huyết kh&ocirc;ng tinh, thời điểm luyện kh&iacute; cần r&egrave;n luyện kh&iacute; huyết. Phương ph&aacute;p luyện huyết ho&aacute; kh&iacute; hắn kh&ocirc;ng c&aacute;ch n&agrave;o th&ocirc;i diễn, Tần V&acirc;n lại kh&ocirc;ng chịu học, bất đắc dĩ đ&agrave;nh phải tạm thời bu&ocirc;ng tha. Đ&atilde; c&oacute; ph&aacute;p m&ocirc;n tu h&agrave;nh nội đan C&agrave;n đạo, nữ giới c&oacute; thể tự phỏng theo nghi&ecirc;n cứu suy luận ph&aacute;p m&ocirc;n tu h&agrave;nh nội đan th&iacute;ch hợp cho m&igrave;nh.<br />\r\n<br />\r\nSuy diễn Nội Đan thuật lặp đi lặp lại, sau đ&oacute; Mạc Vấn ch&eacute;p kỹ lại ba lần phương ph&aacute;p h&agrave;nh kh&iacute;, tạm g&aacute;c lại thi&ecirc;n địa trọng khai, sau đ&oacute; truyền thụ c&aacute;c t&ocirc;ng Tam Thanh.<br />\r\n<br />\r\n&quot;L&atilde;o gia, tr&aacute;i c&acirc;y ch&iacute;n rồi.&quot; L&atilde;o Ngũ từ ngo&agrave;i cửa h&ocirc;.<br />\r\n<br />\r\nMạc Vấn nghe tiếng đ&aacute;p một tiếng. L&atilde;o Ngũ đẩy cửa v&agrave;o, trong tay cầm mấy miếng tr&aacute;i c&acirc;y kỳ dị, những thứ tr&aacute;i c&acirc;y n&agrave;y l&agrave; linh vật Nam Hải, h&igrave;nh như con thoi, m&agrave;u t&iacute;m, m&ugrave;i thơm lạ l&ugrave;ng x&ocirc;ng v&agrave;o mũi.<br />\r\n<br />\r\n&quot;Những tr&aacute;i c&acirc;y n&agrave;y c&oacute; hiệu quả an thần, ngươi cứ ăn đi.&quot; Mạc Vấn n&oacute;i với l&atilde;o Ngũ.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng cần, ta ăn l&atilde;ng ph&iacute; đ&oacute;.&quot; L&atilde;o Ngũ lắc đầu n&oacute;i ra.<br />\r\n<br />\r\n&quot;Nuốt to&agrave;n bộ, đợi đến l&uacute;c dược lực tan ra c&oacute; thể biến ảo da l&ocirc;ng b&ecirc;n ngo&agrave;i.&quot; Mạc Vấn n&oacute;i ra.<br />\r\n<br />\r\n&quot;Thật vậy sao, vậy ta kh&ocirc;ng kh&aacute;ch kh&iacute; nha.&quot; L&atilde;o Ngũ nghe vậy hết sức vui mừng. G&atilde; phản cảm nhất ch&iacute;nh l&agrave; trước khi biến th&acirc;n lu&ocirc;n lu&ocirc;n phải cởi bỏ &aacute;o cho&agrave;ng.<br />\r\n<br />\r\nMạc Vấn gật đầu sau đ&oacute; nhắm mắt lại. Trước mắt ph&aacute;p m&ocirc;n tu h&agrave;nh nội đan đ&atilde; th&ocirc;i diễn xong, hắn bế quan l&agrave; để tu luyện Tam Muội ch&acirc;n hỏa. Trọc kh&iacute; trong cơ thể hắn trước đ&acirc;y đ&atilde; bị Toan Ngh&ecirc; nội đan đốt đi nhiều rồi, l&uacute;c n&agrave;y ph&iacute;a b&ecirc;n ngực phải c&ograve;n c&oacute; một &iacute;t trọc kh&iacute;. Nếu như trừ hết trọc kh&iacute; n&agrave;y, trong cơ thể hắn kh&ocirc;ng c&ograve;n trọc kh&iacute; nữa, kh&ocirc;ng c&oacute; trọc kh&iacute; sẽ kh&ocirc;ng c&oacute; nhược điểm, kh&ocirc;ng c&oacute; trọc kh&iacute; c&oacute; thể t&ugrave;y t&acirc;m biến h&oacute;a.<br />\r\n<br />\r\n&quot;L&atilde;o gia, ta muốn đi ra ngo&agrave;i một chuyến, đi thăm C&aacute;t Nhi.&quot; L&atilde;o Ngũ mở miệng thương nghị.<br />\r\n<br />\r\n&quot;Đi đi, trở về b&aacute;o cho ta biết t&igrave;nh h&igrave;nh chiến sự b&ecirc;n đ&oacute;.&quot; Mạc Vấn thuận miệng n&oacute;i ra. Đ&aacute;m dị loại phương nam kia ở trong địa đạo Bắc thượng đ&atilde; hơn hai mươi ng&agrave;y rồi, đến b&acirc;y giờ bọn ch&uacute;ng cũng kh&ocirc;ng ph&aacute;t động tiến c&ocirc;ng, điều n&agrave;y cho thấy ch&uacute;ng đến đ&ocirc;ng bắc, sau đ&oacute; được an b&agrave;i chỗ ẩn th&acirc;n v&agrave; đồ ăn, c&oacute; thể cấp cho ch&uacute;ng những điều n&agrave;y chỉ c&oacute; Y&ecirc;n quốc.<br />\r\n<br />\r\n&quot;Tốt, ta đi đ&acirc;y.&quot; L&atilde;o Ngũ cầm lấy tr&aacute;i c&acirc;y xoay người rời đi.<br />\r\n<br />\r\nMạc Vấn đứng dậy theo, cất bước xuất m&ocirc;n. Hắn xuất m&ocirc;n kh&ocirc;ng phải l&agrave; v&igrave; tiễn l&atilde;o Ngũ, m&agrave; l&agrave; hắn cảm thấy một đạo kh&iacute; tức dị loại quen thuộc từ phương bắc đi tới.<br />\r\n<br />\r\nMạc Vấn đi tới cửa mở ra đại m&ocirc;n, một con dế nhũi to lớn m&agrave;u v&agrave;ng từ t&acirc;y nam lượn về ph&iacute;a nam, tr&ecirc;n lưng dế nhũi ngồi một người, ch&iacute;nh l&agrave; Vương gia Đại quốc Th&aacute;c Bạt Thập Kỳ.<br />\r\n<br />\r\nĐến ngo&agrave;i sơn m&ocirc;n, dế nhũi đ&aacute;p xuống đất. Th&aacute;c Bạt Thập Kỳ mặt đầy phong trần từ tr&ecirc;n lưng dế nhũi nhảy xuống, bước nhanh đến gần Mạc Vấn chắp tay h&agrave;nh lễ: &quot;Ch&acirc;n nh&acirc;n vạn an.&quot;&quot;Ph&uacute;c Sinh V&ocirc; Lượng Thi&ecirc;n T&ocirc;n, l&agrave; người sơn d&atilde; đảm đương kh&ocirc;ng nổi vạn chữ, mời Vương gia.&quot; Mạc Vấn đưa tay mời kh&aacute;ch.<br />\r\n<br />\r\n&quot;Ho&agrave;ng Y Lang b&aacute;i kiến ch&acirc;n nh&acirc;n.&quot; Dế nhũi biến th&acirc;n th&agrave;nh người, đi l&ecirc;n chắp tay h&agrave;nh lễ với Mạc Vấn.<br />\r\n<br />\r\nHo&agrave;ng Y Lang l&agrave; người quen cũ hắn quen l&uacute;c đ&ocirc;ng chinh, nh&igrave;n thấy người n&agrave;y hắn liền nhớ tới đoạn thời gian nhiều năm trước kia: &quot;Ho&agrave;ng huynh vất vả, mời v&agrave;o.&quot;<br />\r\n<br />\r\nHo&agrave;ng Y Lang tuy l&agrave; dị loại, những đ&atilde; được Mạc Vấn độ h&oacute;a, v&igrave; vậy đi v&agrave;o đại điện lập tức thắp hương Tổ Sư. Mạc Vấn v&agrave; Th&aacute;c Bạt Thập Kỳ ph&acirc;n chủ kh&aacute;ch ngồi xuống.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng quan trọng lễ mọn, đ&ocirc;i ch&uacute;t biểu hiện tấm l&ograve;ng, vạn thỉnh ch&acirc;n nh&acirc;n nhận cho.&quot; Th&aacute;c Bạt Thập Kỳ lấy từ trong ngực ra một hộp đồng vu&ocirc;ng nhỏ bỏ l&ecirc;n b&agrave;n.<br />\r\n<br />\r\n&quot;Vương gia đến đ&acirc;y l&agrave; v&igrave; chuyện g&igrave;?&quot; Mạc Vấn cũng kh&ocirc;ng cự tuyệt đối phương tặng, tuy c&aacute;ch hộp đồng hắn vẫn c&oacute; thể ngửi được m&ugrave;i xạ hương. Th&aacute;c Bạt Thập Kỳ mang đến xạ hương ch&iacute;nh l&agrave; hoa lan xạ hương thượng phẩm, c&oacute; t&aacute;c dụng n&acirc;ng cao tinh thần tỉnh n&atilde;o, khai khiếu th&ocirc;ng lạc.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng dối gạt ch&acirc;n nh&acirc;n, Đại quốc năm nay kh&ocirc;ng mưa, b&aacute;ch thảo h&eacute;o rũ, đất cằn ng&agrave;n dặm, đ&agrave;o đất hơn mười trượng cũng kh&ocirc;ng thấy nước, ch&uacute;ng ta v&ocirc; kế khả thi, đ&agrave;nh phải mặt d&agrave;y đến đ&acirc;y, cầu ch&acirc;n nh&acirc;n từ bi cứu trợ.&quot; Th&aacute;c Bạt Thập Kỳ lo lắng n&oacute;i.<br />\r\n<br />\r\n&quot;Việc n&agrave;y l&agrave; sơ sẩy của ta, Vương gia chớ lo, trong v&ograve;ng ba ng&agrave;y Đại quốc tất c&oacute; mưa xuống, chỉ l&agrave; kh&ocirc;ng biết cần mưa bao nhi&ecirc;u?&quot; Mạc Vấn thuận miệng n&oacute;i ra.<br />\r\n<br />\r\nTh&aacute;c Bạt Thập Kỳ nghe vậy đại hỉ, đứng l&ecirc;n c&uacute;i thấp: &quot;Cầu một x&iacute;ch l&agrave; đủ.&quot;<br />\r\n<br />\r\nMạc Vấn gật đầu nhẹ, đưa tay &yacute; bảo Th&aacute;c Bạt Thập Kỳ ngồi xuống, chỉ Ho&agrave;ng Y Lang đ&atilde; thắp hương xong ngồi b&ecirc;n cạnh dưới tay. Ho&agrave;ng Y Lang thấy thế vui mừng tiến l&ecirc;n, ngồi xuống chỗ gần chủ nh&agrave;. Y l&agrave; Mạc Vấn đề cử đến Đại quốc đấy, cử động lần n&agrave;y của Mạc Vấn cho thấy tuy rất l&acirc;u kh&ocirc;ng li&ecirc;n hệ nhưng vẫn kh&ocirc;ng xem y l&agrave; ngoại nh&acirc;n.<br />\r\n<br />\r\n&quot;Ti&ecirc;u Ngọc Lan tốt chứ?&quot; Mạc Vấn hỏi Ho&agrave;ng Y Lang.<br />\r\n<br />\r\n&quot;Y&ecirc;u phụ mỏ nhọn kia kh&ocirc;ng biết t&igrave;m được d&atilde; loại từ nơi n&agrave;o, năm nay đ&atilde; sản xuất ba lượt, biệt viện ch&acirc;n nh&acirc;n giờ cũng sắp th&agrave;nh hang chuột rồi.&quot; Ho&agrave;ng Y Lang cười đ&aacute;p.<br />\r\n<br />\r\n&quot;Kh&ocirc;ng ngại, mặc kệ n&oacute; đi.&quot; Mạc Vấn mỉm cười gật đầu.<br />\r\n<br />\r\nMạc Vấn n&oacute;i xong, quay đầu nh&igrave;n về ph&iacute;a Th&aacute;c Bạt Thập Kỳ: &quot;Vương gia tới thật đ&uacute;ng l&uacute;c, bần đạo c&oacute; việc hỏi?&quot;<br />\r\n<br />\r\nTh&aacute;c Bạt Thập Kỳ nghi&ecirc;ng người mở miệng: &quot;Ch&acirc;n nh&acirc;n mời n&oacute;i.&quot;<br />\r\n<br />\r\n&quot;Đại quốc v&agrave; Y&ecirc;n quốc gi&aacute;p giới, kh&ocirc;ng biết Y&ecirc;n quốc thời gian gần đ&acirc;y c&oacute; động tĩnh g&igrave; kh&ocirc;ng?&quot; Mạc Vấn tiếp nhận nước tr&agrave; Hạnh nhi đưa tới, chuyển qua hai người.<br />\r\n<br />\r\n&quot;Dị động?&quot; Th&aacute;c Bạt Thập Kỳ tiếp nhận ch&eacute;n tr&agrave;, mặt lộ vẻ nghi hoặc.<br />\r\n<br />\r\n&quot;Tỷ như điều động qu&acirc;n đội dị thường, t&iacute;ch trữ lương thảo dị thường.&quot; Mạc Vấn hỏi r&otilde;.<br />\r\n<br />\r\nTh&aacute;c Bạt Thập Kỳ nghe vậy gật đầu nhẹ, mở miệng n&oacute;i ra: &quot;Ch&acirc;n nh&acirc;n chắc hẳn biết r&otilde; trước mắt Y&ecirc;n quốc đang x&acirc;m nhập ph&iacute;a nam, đại qu&acirc;n chủ lực đều tại ba quận đ&ocirc;ng bắc, m&agrave; ba quận đ&ocirc;ng bắc c&aacute;ch Đại quốc kh&aacute; xa, v&igrave; vậy t&igrave;nh huống đội ngũ Y&ecirc;n quốc ta cũng kh&ocirc;ng r&otilde;. Chẳng qua đoạn thời gian gần đ&acirc;y Y&ecirc;n quốc li&ecirc;n tiếp x&acirc;m t&acirc;y, trắng trợn cướp đoạt d&ecirc; b&ograve; của c&aacute;c bộ lạc ph&acirc;n t&aacute;n tr&ecirc;n thảo nguy&ecirc;n. Qu&acirc;n thần nước ta ghi nhớ lời ch&acirc;n nh&acirc;n dạy, giấu t&agrave;i kh&ocirc;ng lộ, bảo hộ nhiều hơn đối với bộ lạc ở b&ecirc;n ngo&agrave;i, nhưng cũng kh&ocirc;ng tiến c&ocirc;ng trả th&ugrave;.&quot;<br />\r\n<br />\r\n&quot;Trước đ&acirc;y Y&ecirc;n quốc c&oacute; x&acirc;m t&acirc;y kh&ocirc;ng?&quot; Mạc Vấn hỏi.<br />\r\n<br />\r\n&quot;C&oacute;, nhưng kh&ocirc;ng nhiều, thời gian gần đ&acirc;y đặc biệt nhiều lần, tướng l&atilde;nh rất l&agrave; nghi hoặc với cử chỉ của Y&ecirc;n quốc lần n&agrave;y. Nếu để cho qu&acirc;n đội tự d&ugrave;ng, bọn hắn ăn kh&ocirc;ng được nhiều như vậy, nhưng nếu chuyển đến cho ba quận, lại qu&aacute; mức xa x&ocirc;i.&quot; Th&aacute;c Bạt Thập Kỳ n&oacute;i ra.<br />\r\n<br />\r\nMạc Vấn nghe vậy chậm r&atilde;i gật đầu, vậy l&uacute;c trước hắn đo&aacute;n kh&ocirc;ng sai, Y&ecirc;n quốc rất c&oacute; thể đ&atilde; li&ecirc;n thủ với Xi Vưu, những dị loại kia hẳn l&agrave; l&uacute;c n&agrave;y tụ tập tại chỗ b&iacute; mật n&agrave;o ở Y&ecirc;n quốc, chỉ đợi thời cơ ch&iacute;n muồi sẽ x&acirc;m nhập ph&iacute;a nam với quy m&ocirc; lớn... </span></span></p>\r\n',1,'2019-10-20');
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
INSERT INTO `tbdanhmuctruyen` VALUES (1,'Truyện hot','Tập các truyện hot',1,'2019-10-22'),(2,'Truyện Full','Tập hợp các truyện đã hoàn chỉnh',1,'2019-10-17'),(4,'Viet','sjhvhj',1,'2019-10-17');
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
  `MaTaiKHoan` int(11) DEFAULT NULL,
  `HoVaTen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `SDT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbinfotaikhoan`
--

LOCK TABLES `tbinfotaikhoan` WRITE;
/*!40000 ALTER TABLE `tbinfotaikhoan` DISABLE KEYS */;
INSERT INTO `tbinfotaikhoan` VALUES (1,1,'Nguyễn Văn AD','admin','020202','2019-10-20'),(2,2,'Nguyễn Văn User','user','83787129','2019-10-20');
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
  `MaTruyen` int(11) NOT NULL,
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
  `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT,
  `TenTaiKhoan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MatKhau` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTaiKhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtaikhoan`
--

LOCK TABLES `tbtaikhoan` WRITE;
/*!40000 ALTER TABLE `tbtaikhoan` DISABLE KEYS */;
INSERT INTO `tbtaikhoan` VALUES (1,'admin@adminc.om','admin',1,'2019-10-10'),(2,'user','admin',2,'2019-10-10'),(3,'tlt','admin',3,'2019-10-10');
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
  `TenTheLoai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTheLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtheloaitruyen`
--

LOCK TABLES `tbtheloaitruyen` WRITE;
/*!40000 ALTER TABLE `tbtheloaitruyen` DISABLE KEYS */;
INSERT INTO `tbtheloaitruyen` VALUES (1,'Tiên hiệp','Là truyện tiểu thuyết của TQ',1,'2019-10-19'),(2,'Ngôn Tình','Là truyện tình cảm của TQ, HQ, NB',1,'2019-10-19'),(3,'Kiếm Hiệp','Là truyện đánh nhau của TQ',1,'2019-10-19');
/*!40000 ALTER TABLE `tbtheloaitruyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtruyen`
--

DROP TABLE IF EXISTS `tbtruyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbtruyen` (
  `MaTruyen` int(11) NOT NULL AUTO_INCREMENT,
  `TenTruyen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTacGia` int(11) NOT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `SoChuong` int(11) NOT NULL,
  `GioiThieu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci,
  `LuotXem` int(11) DEFAULT NULL,
  `Nguon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `HinhAnh` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL,
  PRIMARY KEY (`MaTruyen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtruyen`
--

LOCK TABLES `tbtruyen` WRITE;
/*!40000 ALTER TABLE `tbtruyen` DISABLE KEYS */;
INSERT INTO `tbtruyen` VALUES (1,'Vạn Cổ Thần Đế',1,1,10,'Tình yêu giữa hận thù thì có thể đi đến kết thúc đẹp không? Người hại mình mình hại người, để cả hai cùng tổn thương sâu sắc không còn cách nào cứu chữa được. Phải chăng ngay từ đầu đó đã là một cuộc sắp đặt của định mệnh và đầy chủ ý chăng? Cũng không ai có thể giải thích được điều gì nhất là tình yêu và duyên nợ đã gắn kết họ đến với nhau. ',10000,'Chưa biết','vancothuande.jpg',1,'2019-10-09'),(2,'CHỌC TỨC VỢ YÊU - MUA MỘT TẶNG MỘT',2,1,100,'Đã 27 tuổi nhưng đại thiếu gia Lục thị lại chẳng hề rung động vì bất kỳ một cô gái nào nên cha mẹ cùng em trai đã chuốc say anh rồi đưa lên giường một cô gái xa lạ.5 năm sau, tiểu thiếu gia Lục Kình Vũ vì không có mẹ và cú shock quá khứ nên đã rơi vào trầm cảm.Một người cha \"chưa từng có cảm giác rung động trước bất kỳ ai\" và một thằng bé con \"không thích tiếp xúc với bất kỳ ai\" đã trở nên \"lầy lội\" hơn bao giờ hết khi gặp được Ninh Tịch. Cả hai cha con đều vừa gặp đã yêu người phụ nữ này, một người mong muốn chiếm hữu, một người vô cùng ỷ lại, cuối cùng tạo ra những tình huống dở khóc dở cười cho độc giả.',10000,'Chưa biết','choctucvoyeu.jpg',1,'2019-10-09');
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

-- Dump completed on 2019-10-26 16:00:31
