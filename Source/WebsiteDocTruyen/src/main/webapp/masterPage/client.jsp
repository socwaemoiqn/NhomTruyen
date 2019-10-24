<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm Truyện</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/icon/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/login.css">
<dec:head/>
</head>
<body>
	<div class="topnav" id="myTopnav">
		<a href="index.html" id="home"> <span class="fa-stack"> <i
				class="fa fa-circle fa-stack-2x"></i> <i
				class="fa fa-book-open fa-spin fa-stack-1x fa-inverse"
				style="color: black;"></i>
		</span> TRUYỆN PHP
		</a>
		<div class="dropdown" id="danhMuc">
			<button class="dropbtn">
				<i class="fas fa-list"></i> Danh mục <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content" id="dropdown-content">
				<a href="#"><b>Truyện full <span
						data-placeholder="Truyện full"></span>
				</b></a> <a href="#"><strong>Truyện hot <span
						data-placeholder="Truyện hot"></span>
				</strong></a> <a href="#"><strong>Truyện mới cập nhật <span
						data-placeholder="Truyện mới cập nhập"></span>
				</strong></a>
			</div>
		</div>
		<div class="dropdown" id="theLoai">
			<button class="dropbtn">
				<i class="fa fa-sort"></i> Thể loại <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<table width="100%">
					<tr>
						<td><strong>Tiên hiệp <span
								data-placeholder="Tiên hiệp"></span></strong></td>
						<td><strong>Kiếm hiệp <span
								data-placeholder="Kiếm hiệp"></span>
						</strong></td>
					</tr>
					<tr>
						<td><strong>Huyền huyễn <span
								data-placeholder="Huyền huyễn"></span>
						</strong></td>
						<td><strong>Tu chân <span data-placeholder="Tu chân"></span></strong>

						</td>
					</tr>
					<tr>
						<td><strong>Đô thị <span data-placeholder="Đô thị"></span></strong>
							</strong></td>
						<td><strong>Tình yêu<span
								data-placeholder="Tình yêu"></span></strong></td>
					</tr>
				</table>
			</div>
		</div>
		<a id="search"
			style="position: absolute; right: 25%; top: 0; width: 300px; padding: 10px;">
			<input type="text" placeholder="Search.." name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</a>
		<!-- Nút đăng nhập-->
		<div class="dropdown" id="user">
			<button class="dropbtn" style="cursor: pointer; font-weight: bold">
				<i class="fa fa-user"></i> Đăng nhập

			</button>
		</div>
		<a style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
	</div>
	<dec:body />
	<div class="footer">
		<div class="footer-left">
			<a href="#home" id="home"> <span class="fa-stack"> <i
					class="fa fa-circle fa-stack-2x"></i> <i
					class="fa fa-book-open fa-spin fa-stack-1x fa-inverse"
					style="color: black;"></i>
			</span> TRUYỆN PHP
			</a>
		</div>
		<div class="footer-mid">
			<table>
				<thead>
					<tr>
						<td>Truyện full</td>
						<td>Truyện mới cập nhật</td>
						<td>Truyện hot</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="#">Thiên hạ vô song</a></td>
						<td><a href="#">Duy ngã độc tôn</a></td>
						<td><a href="#">Vô địch thiên hạ</a></td>
					</tr>
					<tr>
						<td><a href="#">Thiên hạ vô song</a></td>
						<td><a href="#">Duy ngã độc tôn</a></td>
						<td><a href="#">Vô địch thiên hạ</a></td>
					</tr>
					<tr>
						<td><a href="#">Thiên hạ vô song</a></td>
						<td><a href="#">Duy ngã độc tôn</a></td>
						<td><a href="#">Vô địch thiên hạ</a></td>
					</tr>
					<tr>
						<td><a href="#">Thiên hạ vô song</a></td>
						<td><a href="#">Duy ngã độc tôn</a></td>
						<td><a href="#">Vô địch thiên hạ</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="footer-right">
			<span>Đề tài:</span> Xây dựng ứng dụng web đọc truyện online <br>
			<span>Môn:</span> Phát triển phần mềm chuyên nghiệp <br> Thành
			viên: <br> - Võ Văn Việt <br> - Nguyễn Công Toàn <br>-
			Phạn Ngọc Văn <br> <span>Liên hệ:</span> <a href="#"><i
				class="fab fa-facebook"></i></a href="#"><i class="fas fa-envelope-square"></i></a>
		</div>
	</div>
	<div id="container-login">
		<i class="fas fa-times-circle fa-lg"></i>
		<form action="#" method="post">
			<h1 id="abac">Đăng nhập</h1>
			<div class="txtb">
				<input type="text"> <span data-placeholder="Tài khoản"></span>
			</div>
			<div class="txtb">
				<input type="password"> <span data-placeholder="Mật khẩu"></span>
			</div>
			<input type="button" value="Đăng nhập">
			<div class="bottom-text">
				Chưa có tài khoản? <a HREF="#" id="btn-logup">Đăng ký</a>
			</div>
		</form>
	</div>
	<div id="container-logup">
		<i class="fas fa-times-circle fa-lg"></i>
		<form action="#" method="post">
			<h1 id="abac">Đăng ký</h1>
			<div class="txtb">
				<input type="text"> <span data-placeholder="Tài khoản"></span>
			</div>
			<div class="txtb">
				<input type="password"> <span data-placeholder="Mật khẩu"></span>
			</div>
			<div class="txtb">
				<input type="password"> <span
					data-placeholder="Xác nhận mật khẩu"></span>
			</div>
			<div class="txtb">
				<input type="text"> <span data-placeholder="Email"></span>
			</div>
			<input type="button" value="Đăng ký">
			<div class="bottom-text">
				Đã có tài khoản? <a HREF="#" id="btn-login">Quay lại</a>
			</div>
		</form>
	</div>
	<div class="cover-login"></div>
	<!-- JS phần login -->
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/login.js">
		
	</script>
	<!-- JS phần login -->


</body>
</html>