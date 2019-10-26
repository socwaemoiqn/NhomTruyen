
-- --------------------------------------------------------

--
-- Table structure for table `tbtacgia`
--

CREATE TABLE `tbtacgia` (
  `MaTacGia` int(11) NOT NULL,
  `TenTacGia` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `GioiThieu` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbtacgia`
--

INSERT INTO `tbtacgia` (`MaTacGia`, `TenTacGia`, `GioiThieu`, `TrangThai`, `NgayTao`) VALUES
(1, 'Phi Thiên Ngư', 'Tác giả người TQ(hết rồi)', 1, '2019-10-19'),
(2, 'Miêu Nị', 'Tác giả người TQ(hết rồi)', 1, '2019-10-19'),
(3, 'Bắc Khuynh', 'Tác giả người TQ(hết rồi)', 1, '2019-10-19');
