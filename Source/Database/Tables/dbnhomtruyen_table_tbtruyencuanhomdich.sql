
-- --------------------------------------------------------

--
-- Table structure for table `tbtruyencuanhomdich`
--

CREATE TABLE `tbtruyencuanhomdich` (
  `Id` int(11) NOT NULL,
  `MaTruyen` int(11) DEFAULT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
