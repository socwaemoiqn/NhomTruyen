<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title/></title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/icon/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/path.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/tool.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/login.css">

<dec:head />
</head>
<body>
	<div class="topnav" id="myTopnav">
		<a href="${pageContext.request.contextPath}/index" id="home"> <span class="fa-stack"> <i
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
				
				<a href="${pageContext.request.contextPath}/danh-muc/truyen-full">
					<strong class="danhMucFull">Truyện full <span
						data-placeholder="Truyện full"> </span>
					</strong> </b></a> 
				<a href="${pageContext.request.contextPath}/danh-muc/truyen-hot">
					<strong class="danhMucHot">Truyện hot 
						<span data-placeholder="Truyện hot"></span>
					</strong></a> 
				<a href="${pageContext.request.contextPath}/danh-muc/truyen-news">
					<strong class="danhMucNew">Truyện mới cập nhật 
						<span data-placeholder="Truyện mới cập nhập"></span>
					</strong>
				</a> 
				<a href="${pageContext.request.contextPath}/abcd">
					<strong>Truyện abcd
						<span data-placeholder="Truyện mới cập nhập"></span>
					</strong>
				</a> 
				<a href="${pageContext.request.contextPath}/abcd">
					<strong>Truyện abcd
						<span data-placeholder="Truyện abcd"></span>
					</strong>
				</a> 
			</div>
		</div>
		<div class="dropdown" id="theLoai">
			<button class="dropbtn">
				<i class="fa fa-sort"></i> Thể loại <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<c:forEach var="i" begin="1" end="${(sltl/7)+1}">
					<table class="list">
						<c:forEach items="${theLoaiTruyen}" var="tl" begin="${7*(i-1)}"
							end="${(7*i)-1}">
							<tr>
								<td>
								<c:forEach items="${urlTheLoai}" var="url">
									<c:if test="${url.value==tl.id }">									
										<a href="${pageContext.request.contextPath}/the-loai/${url.key}">
											<strong> ${tl.tenTheLoai } 
												<span data-placeholder="${tl.tenTheLoai }"></span>
											</strong>
										</a>
									</c:if>
								</c:forEach>
								
								</td>
							</tr>
						</c:forEach>
					</table>
				</c:forEach>
			</div>
		</div>
		<div
			style="position: absolute; right: 25%; top: 0; width: 300px; padding: 10px;">
			<form action="${pageContext.request.contextPath}/tim-kiem">
				<input type="text" placeholder="Search.." name="tu-khoa">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>
			
		</div>
		<!-- Nút đăng nhập-->
		<div class="dropdown" id="user">
			<button class="dropbtn" style="cursor: pointer; font-weight: bold">
				<i class="fa fa-user"></i> Đăng nhập

			</button>
		</div>
		<a style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
	</div>
	<dec:body />
	<div class="tool">
		<span class="tool-item" id="tool-item-top"><span
			class="tool-mota">Về đầu trang</span><i
			class="far fa-arrow-alt-circle-up"></i></span> <span class="tool-item"><span
			class="tool-mota">Liên hệ Facebook</span><a target="_blank"
			href="https://facebook.com"><i class="fab fa-facebook-f"></i></a></span> <span
			class="tool-item"><span class="tool-mota">Phản hồi</span><a
			target="_blank" href="${pageContext.request.contextPath}/contact"><i
				class="far fa-envelope"></i></a></span>
	</div>
	<div class="footer">
		<div class="footer-left">
			<a href="${pageContext.request.contextPath}/index" id="home"> <span class="fa-stack"> <i
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
						<td style="width:30%; margin: 5%;">Truyện full</td>
						<td style="width:40%; margin: 5%; ">Truyện mới cập nhật</td>
						<td style="width:30%;margin: 3%;">Truyện hot</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${truyenFull}" var="tr" begin="0" end="2">
							<c:forEach items="${urlTruyen}" var="url">
								<c:if test="${url.value == tr.ID}">
									<td><a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }</a></td>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach items="${truyenHot}" var="tr" begin="0" end="2">
							<c:forEach items="${urlTruyen}" var="url">
								<c:if test="${url.value == tr.ID}">
									<td><a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }</a></td>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
					<tr>
						<c:forEach items="${truyenNew}" var="tr" begin="0" end="2">
							<c:forEach items="${urlTruyen}" var="url">
								<c:if test="${url.value == tr.ID}">
									<td><a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }</a></td>
								</c:if>
							</c:forEach>
						</c:forEach>
					</tr>
					<!-- <tr>
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
					</tr> -->
				</tbody>
			</table>
		</div>
		<div class="footer-right">
			<span>Đề tài:</span> Xây dựng ứng dụng web đọc truyện online <br>
			<span>Môn:</span> Phát triển phần mềm chuyên nghiệp 
			<br> Thành viên: 
			<br> <a class="tool-mota" href="https://www.facebook.com/MustusFranky">- Võ Văn Việt</a> 
			<br> <a class="tool-mota" href="https://www.facebook.com/profile.php?id=100004515130207"> - Nguyễn Công Toàn </a>
			<br>- Phạm Ngọc Văn 
			<span id="footer-right-term">
				<i class="fab fa-steam-symbol"></i> 
				<a href="${pageContext.request.contextPath}/term">Terms of Service</a>
			</span>
		</div>
	</div>
	<div id="container-login">
		<i class="fas fa-times-circle fa-lg"></i>
		<form action="login" method="post">
			<h1 id="abac">Đăng nhập</h1>
			<div class="txtb">
				<input type="text" name="userName" required=""> <span
					data-placeholder="Tài khoản"></span>
			</div>
			<div class="txtb" required="">
				<input type="password" name="passWord"> <span
					data-placeholder="Mật khẩu"></span>
			</div>
			<button class="btn" type="submit">Đăng Nhâp</button>
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
			<button class="btn" type="submit">Đăng Ký</button>
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
	<!-- JS phần menu và responsive -->
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/menu-responsive.js"></script>
	<!-- JS phần menu và responsive -->
	<!-- JS phần index -->
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/index.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/tool.js"></script>
	<!-- JS phần index -->
</body>
</html>