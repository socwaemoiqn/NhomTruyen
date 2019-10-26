
-- --------------------------------------------------------

--
-- Table structure for table `tbphanhoi`
--

CREATE TABLE `tbphanhoi` (
  `MaPhanHoi` int(11) NOT NULL,
  `ThoiGian` date NOT NULL,
  `MaTruyen` int(11) NOT NULL,
  `NoiDung` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
