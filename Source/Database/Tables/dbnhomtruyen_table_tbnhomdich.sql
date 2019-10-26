
-- --------------------------------------------------------

--
-- Table structure for table `tbnhomdich`
--

CREATE TABLE `tbnhomdich` (
  `MaNhomDich` int(11) NOT NULL,
  `TenNhomDich` varchar(250) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `NgayTao` date NOT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbnhomdich`
--

INSERT INTO `tbnhomdich` (`MaNhomDich`, `TenNhomDich`, `NgayTao`, `TrangThai`) VALUES
(1, 'admin', '2019-10-24', 1);
