<%@ page language="java" contentType="text/html; charset=Utf8"
	pageEncoding="Utf8"%>
	<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/contact.css">
</head>
<body>
	<c:if test="${not empty mess}">
	 	<script>alert('${mess}')</script>
	</c:if>
	<% request.getSession().removeAttribute("mess"); %>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i> Truyện <span class="path">/</span> <span
				class="path-search">Contact - Liên hệ</span>
		</div>
		<div class="row">
			<div class="col-7" id="contact-form">
				<div class="title">
					<i class="fas fa-envelope"></i> CONTACT - LIÊN HỆ
				</div>
				<div class="content">
					<form method="post" action="${pageContext.request.contextPath}/quan-tri/phan-hoi/insert">
						<div>
							Tên / Name: <br> <input type="text" name="tenNguoiGui"
								placeholder="Nhập tên của bạn" required="required"> <br>
							<br> Email: <br> <input type="text" name="email"
								placeholder="Địa chỉ email của bạn" required="required"> <br>
							<br> Chủ đề / Subject: <br> <select name="chuDe">
								<option value="">Chọn một / Choose one</option>
								<option value="error">Báo lỗi / Report an error</option>
								<option value="feedback">Góp ý / Suggest</option>
								<option value="ads">Quảng cáo / Advertisement</option>
								<option value="other">Khác / Other</option>
							</select>
						</div>
						<div>
							Nội dung / Message: <br>
							<textarea name="noiDung" placeholder="Nội dung" required="required"></textarea>
							<br>
							<button>Gửi / Send</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-3" id="contact-info">
				<div class="title">
					<i class="fas fa-envelope"></i> Thông tin liên hệ
				</div>
				<div class="content">
					<span> Nhóm truyện PHP <br> Email:
						contact@nhomtruyen.vn <br> Facebook: facebook.com/NhomTruyen
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>