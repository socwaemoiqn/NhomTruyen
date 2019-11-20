<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/client/assets/css/info-truyen.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/client/assets/css/tool.css">
</head>
<body>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i> Truyện <span class="path"> /</span> <span
				class="path-truyen">${truyenById.tenTruyen }</span>
		</div>
		<div class="row">
			<div class="col-7" id="thong-tin-truyen">
				<div class="title">
					<i class="fas fa-info-circle"></i> THÔNG TIN Truyện
				</div>
				<div class="content">
					<div class="info-picture">
						<img
							src="https://cdnaz.truyenfull.vn/cover/o/eJzLyTDT17WITwqMNNQtNKp01A_zNXY1ifQuc8301HeEghwTR_1IV8PsTO-w4HKTUP1yIzNT3QxjSzMANU0RrA==/pham-nhan-tu-tien.jpg" />
						<div class="info-picture-content">
							Tác giả: ${truyenById.tenTacGia } <br> Thể loại: Tiên hiệp,
							Huyền huyễn <br> Nguồn: ${truyenById.nguon } <br> Trạng
							thái:
							<c:choose>
								<c:when test="${truyenById.trangThai == '1' }"> Đã Full</c:when>
								<c:otherwise>Đang cập nhật</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="info-content">
						<div class="info-content-title">${truyenById.tenTruyen }</div>
						<hr>
						<div class="info-content-rate">
							<!-- <i class="fas fa-star"></i> -->
							<i id="icon-1" class="fas fa-star"></i> <i id="icon-2"
								class="fas fa-star"></i> <i id="icon-3" class="fas fa-star"></i>
							<i id="icon-4" class="fas fa-star"></i> <i id="icon-5"
								class="fas fa-star"></i> <i id="icon-6" class="fas fa-star"></i>
							<i id="icon-7" class="fas fa-star"></i> <i id="icon-8"
								class="fas fa-star"></i> <i id="icon-9" class="fas fa-star"></i>
							<i id="icon-10" class="fas fa-star"></i> <br> <span>Đánh
								giá: <b>6.4</b>/10 từ <b>2122 lượt</b>
							</span>

						</div>
						<div class="info-content-content">
							Nhóm dịch: <span id="nhomdich">${truyenById.tenNhomDich }</span>
							<br> ${truyenById.gioiThieu }
						</div>
					</div>
				</div>
			</div>
			<div class="col-3" id="truyen-vua-doc">
				<div class="title">
					Truyện VỪA ĐỌC <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table>
						<tr>
							<td><a href="info-truyen.html"><i
									class="fas fa-book-reader"></i> Tối cường thần thoại đế hoàng <br>
									(Chương 1998)</a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Đế
									tôn <br> (Chương 203)</a></a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Thiên
									mệnh chân tử <br> (Chương 2032)</a></a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Đế
									tôn <br> (Chương 203)</a></a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-3" id="truyen-cung-tac-gia">
				<div class="title">
					Truyện CÙNG TÁC GIẢ <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table>
						<tr>
							<td><a href="info-truyen.html"><i
									class="fas fa-book-reader"></i> Tối cường thần thoại đế hoàng <br>
									(Chương 1998)</a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Đế
									tôn <br> (Chương 203)</a></a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Thiên
									mệnh chân tử <br> (Chương 2032)</a></a></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-3" id="truyen-dang-hot">
				<div class="title">
					Truyện ĐANG HOT <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table cellspacing="5">
						<tr>
							<td style="padding-left: 5%; padding-right: 5%;"><span
								class="type-time">Ngày</span><span class="type-time">Tháng</span><span
								class="type-time">Năm</span></td>
						</tr>
						<tr>
							<td><span class="index" id="one">1</span><span class="name"><a>Chọc
										tức vợ yêu - Mua tặng ...</a></span></td>
						</tr>
						<tr>
							<td><span class="index" id="two">2</span><span class="name"><a>Chọc
										tức vợ yêu - Mua tặng ...</a></span></td>
						</tr>
						<tr>
							<td><span class="index" id="three">3</span><span
								class="name">Chọc tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">4</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">5</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">6</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">7</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">8</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">9</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">10</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-7" id="danh-sach-chuong">
				<div class="title">
					DANH SÁCH CHƯƠNG <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<div class="list-chuong">
						<table>


							<c:forEach items="${listChuong}" var="ch" varStatus="status">
								<tr>
								<td><i class="fas fa-certificate"></i> 
								<a href="${pageContext.request.contextPath}/truyen/chuong?id=${ch.id}">
										Chương ${ch.id }:
										 ${ch.tieuDe }</a></td>
							</tr>
							</c:forEach>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="read.html">
										Chương 1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										2: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										3: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										4: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										5: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										6: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										7: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										8: Vô địch thật tịch mịch</a></td>
							</tr>
						</table>
					</div>
					<div class="list-chuong">
						<table>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
							<tr>
								<td><i class="fas fa-certificate"></i> <a href="#">Chương
										1: Vô địch thật tịch mịch</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-7" id="binh-luan"
				style="background: #fff; text-align: center;">
				<div class="title">
					<i class="fas fa-comments"></i> BÌNH LUẬN
				</div>
				<div class="content" style="padding: 5px;">
					<div class="fb-comments"
						data-href="http://localhost:5500/info-truyen.html"
						style="border: none; visibility: visible; width: 100%;"
						data-colorscheme="" data-width="" data-numposts="5"></div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/menu-responsive.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/info-truyen.js"></script>
	<!-- JS phần menu và responsive -->
</body>
</html>