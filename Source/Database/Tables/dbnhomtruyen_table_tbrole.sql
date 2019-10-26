
-- --------------------------------------------------------

--
-- Table structure for table `tbrole`
--

CREATE TABLE `tbrole` (
  `MaRole` int(11) NOT NULL,
  `TenRole` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tbrole`
--

INSERT INTO `tbrole` (`MaRole`, `TenRole`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'tlt');
