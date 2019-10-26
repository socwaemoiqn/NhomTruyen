
-- --------------------------------------------------------

--
-- Table structure for table `tbthanhviennhomdich`
--

CREATE TABLE `tbthanhviennhomdich` (
  `Id` int(11) NOT NULL,
  `MaTaiKHoan` int(11) DEFAULT NULL,
  `MaNhomDich` int(11) DEFAULT NULL,
  `MaRole` int(11) DEFAULT NULL,
  `NgayTao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
