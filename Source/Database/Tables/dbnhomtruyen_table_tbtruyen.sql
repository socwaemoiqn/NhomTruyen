
-- --------------------------------------------------------

--
-- Table structure for table `tbtruyen`
--

CREATE TABLE `tbtruyen` (
  `MaTruyen` int(11) NOT NULL,
  `TenTruyen` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `MaTacGia` int(11) NOT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `SoChuong` int(11) NOT NULL,
  `GioiThieu` text COLLATE utf8mb4_vietnamese_ci,
  `LuotXem` int(11) DEFAULT NULL,
  `Nguon` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `HinhAnh` char(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbtruyen`
--

INSERT INTO `tbtruyen` (`MaTruyen`, `TenTruyen`, `MaTacGia`, `MaNhomDich`, `SoChuong`, `GioiThieu`, `LuotXem`, `Nguon`, `HinhAnh`, `TrangThai`, `NgayTao`) VALUES
(1, 'Vạn Cổ Thần Đế', 1, 1, 10, 'Tình yêu giữa hận thù thì có thể đi đến kết thúc đẹp không? Người hại mình mình hại người, để cả hai cùng tổn thương sâu sắc không còn cách nào cứu chữa được. Phải chăng ngay từ đầu đó đã là một cuộc sắp đặt của định mệnh và đầy chủ ý chăng? Cũng không ai có thể giải thích được điều gì nhất là tình yêu và duyên nợ đã gắn kết họ đến với nhau. ', 10000, 'Chưa biết', 'vancothuande.jpg', 1, '2019-10-09'),
(2, 'CHỌC TỨC VỢ YÊU - MUA MỘT TẶNG MỘT', 2, 1, 100, 'Đã 27 tuổi nhưng đại thiếu gia Lục thị lại chẳng hề rung động vì bất kỳ một cô gái nào nên cha mẹ cùng em trai đã chuốc say anh rồi đưa lên giường một cô gái xa lạ.5 năm sau, tiểu thiếu gia Lục Kình Vũ vì không có mẹ và cú shock quá khứ nên đã rơi vào trầm cảm.Một người cha \"chưa từng có cảm giác rung động trước bất kỳ ai\" và một thằng bé con \"không thích tiếp xúc với bất kỳ ai\" đã trở nên \"lầy lội\" hơn bao giờ hết khi gặp được Ninh Tịch. Cả hai cha con đều vừa gặp đã yêu người phụ nữ này, một người mong muốn chiếm hữu, một người vô cùng ỷ lại, cuối cùng tạo ra những tình huống dở khóc dở cười cho độc giả.', 10000, 'Chưa biết', 'choctucvoyeu.jpg', 1, '2019-10-09');
