
--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbchitietdanhmuc`
--
ALTER TABLE `tbchitietdanhmuc`
  ADD PRIMARY KEY (`MaChiTietDanhMuc`);

--
-- Indexes for table `tbchitiettheloai`
--
ALTER TABLE `tbchitiettheloai`
  ADD PRIMARY KEY (`MaChiTietTheLoai`);

--
-- Indexes for table `tbchuong`
--
ALTER TABLE `tbchuong`
  ADD PRIMARY KEY (`MaChuong`);

--
-- Indexes for table `tbdanhmuctruyen`
--
ALTER TABLE `tbdanhmuctruyen`
  ADD PRIMARY KEY (`MaDanhMuc`);

--
-- Indexes for table `tbinfotaikhoan`
--
ALTER TABLE `tbinfotaikhoan`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbnhomdich`
--
ALTER TABLE `tbnhomdich`
  ADD PRIMARY KEY (`MaNhomDich`);

--
-- Indexes for table `tbphanhoi`
--
ALTER TABLE `tbphanhoi`
  ADD PRIMARY KEY (`MaPhanHoi`);

--
-- Indexes for table `tbrole`
--
ALTER TABLE `tbrole`
  ADD PRIMARY KEY (`MaRole`);

--
-- Indexes for table `tbtacgia`
--
ALTER TABLE `tbtacgia`
  ADD PRIMARY KEY (`MaTacGia`);

--
-- Indexes for table `tbtaikhoan`
--
ALTER TABLE `tbtaikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`);

--
-- Indexes for table `tbthanhviennhomdich`
--
ALTER TABLE `tbthanhviennhomdich`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbtheloaitruyen`
--
ALTER TABLE `tbtheloaitruyen`
  ADD PRIMARY KEY (`MaTheLoai`);

--
-- Indexes for table `tbtruyen`
--
ALTER TABLE `tbtruyen`
  ADD PRIMARY KEY (`MaTruyen`);

--
-- Indexes for table `tbtruyencuanhomdich`
--
ALTER TABLE `tbtruyencuanhomdich`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbchitietdanhmuc`
--
ALTER TABLE `tbchitietdanhmuc`
  MODIFY `MaChiTietDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbchitiettheloai`
--
ALTER TABLE `tbchitiettheloai`
  MODIFY `MaChiTietTheLoai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbchuong`
--
ALTER TABLE `tbchuong`
  MODIFY `MaChuong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbdanhmuctruyen`
--
ALTER TABLE `tbdanhmuctruyen`
  MODIFY `MaDanhMuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=898;

--
-- AUTO_INCREMENT for table `tbinfotaikhoan`
--
ALTER TABLE `tbinfotaikhoan`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbnhomdich`
--
ALTER TABLE `tbnhomdich`
  MODIFY `MaNhomDich` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbphanhoi`
--
ALTER TABLE `tbphanhoi`
  MODIFY `MaPhanHoi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbrole`
--
ALTER TABLE `tbrole`
  MODIFY `MaRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbtacgia`
--
ALTER TABLE `tbtacgia`
  MODIFY `MaTacGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbtaikhoan`
--
ALTER TABLE `tbtaikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbthanhviennhomdich`
--
ALTER TABLE `tbthanhviennhomdich`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbtheloaitruyen`
--
ALTER TABLE `tbtheloaitruyen`
  MODIFY `MaTheLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbtruyen`
--
ALTER TABLE `tbtruyen`
  MODIFY `MaTruyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbtruyencuanhomdich`
--
ALTER TABLE `tbtruyencuanhomdich`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
