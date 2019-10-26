
-- --------------------------------------------------------

--
-- Table structure for table `tbdanhmuctruyen`
--

CREATE TABLE `tbdanhmuctruyen` (
  `MaDanhMuc` int(11) NOT NULL,
  `TenDanhMuc` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbdanhmuctruyen`
--

INSERT INTO `tbdanhmuctruyen` (`MaDanhMuc`, `TenDanhMuc`, `GioiThieu`, `TrangThai`, `NgayTao`) VALUES
(1, 'Truyện hot', 'Tập các truyện hot', 1, '2019-10-22'),
(2, 'Truyện Full', 'Tập hợp các truyện đã hoàn chỉnh', 1, '2019-10-17'),
(4, 'Viet', 'sjhvhj', 1, '2019-10-17');
