
-- --------------------------------------------------------

--
-- Table structure for table `tbchitietdanhmuc`
--

CREATE TABLE `tbchitietdanhmuc` (
  `MaChiTietDanhMuc` int(11) NOT NULL,
  `MaTruyen` int(11) NOT NULL,
  `MaDanhMuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbchitietdanhmuc`
--

INSERT INTO `tbchitietdanhmuc` (`MaChiTietDanhMuc`, `MaTruyen`, `MaDanhMuc`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 1, 4);
