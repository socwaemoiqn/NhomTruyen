
-- --------------------------------------------------------

--
-- Table structure for table `tbtheloaitruyen`
--

CREATE TABLE `tbtheloaitruyen` (
  `MaTheLoai` int(11) NOT NULL,
  `TenTheLoai` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `GioiThieu` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbtheloaitruyen`
--

INSERT INTO `tbtheloaitruyen` (`MaTheLoai`, `TenTheLoai`, `GioiThieu`, `TrangThai`, `NgayTao`) VALUES
(1, 'Tiên hiệp', 'Là truyện tiểu thuyết của TQ', 1, '2019-10-19'),
(2, 'Ngôn Tình', 'Là truyện tình cảm của TQ, HQ, NB', 1, '2019-10-19'),
(3, 'Kiếm Hiệp', 'Là truyện đánh nhau của TQ', 1, '2019-10-19');
