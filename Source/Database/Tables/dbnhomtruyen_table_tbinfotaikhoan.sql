
-- --------------------------------------------------------

--
-- Table structure for table `tbinfotaikhoan`
--

CREATE TABLE `tbinfotaikhoan` (
  `Id` int(11) NOT NULL,
  `MaTaiKHoan` int(11) DEFAULT NULL,
  `HoVaTen` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `Mail` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `SDT` char(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbinfotaikhoan`
--

INSERT INTO `tbinfotaikhoan` (`Id`, `MaTaiKHoan`, `HoVaTen`, `Mail`, `SDT`, `NgayTao`) VALUES
(1, 1, 'Nguyễn Văn AD', 'admin', '020202', '2019-10-20'),
(2, 2, 'Nguyễn Văn User', 'user', '83787129', '2019-10-20');
