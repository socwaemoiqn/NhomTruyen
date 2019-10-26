
-- --------------------------------------------------------

--
-- Table structure for table `tbtaikhoan`
--

CREATE TABLE `tbtaikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenTaiKhoan` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MatKhau` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbtaikhoan`
--

INSERT INTO `tbtaikhoan` (`MaTaiKhoan`, `TenTaiKhoan`, `MatKhau`, `MaRole`, `NgayTao`) VALUES
(1, 'admin@adminc.om', 'admin', 1, '2019-10-10'),
(2, 'user', 'admin', 2, '2019-10-10'),
(3, 'tlt', 'admin', 3, '2019-10-10');
