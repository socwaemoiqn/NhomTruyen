<%@ page language="java" contentType="text/html; charset=Utf8"
	pageEncoding="Utf8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/contact.css">
</head>
<body>
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
					<form method="" action="">
						<div>
							Tên / Name: <br> <input type="text" name=""
								placeholder="Nhập tên của bạn"> <br>
							<br> Email: <br> <input type="text" name=""
								placeholder="Địa chỉ email của bạn"> <br>
							<br> Chủ đề / Subject: <br> <select>
								<option value="">Chọn một / Choose one</option>
								<option value="">Báo lỗi / Report an error</option>
								<option value="">Góp ý / Suggest</option>
								<option value="">Quảng cáo / Advertisement</option>
								<option value="">Khác / Other</option>
							</select>
						</div>
						<div>
							Nội dung / Message: <br>
							<textarea name="" placeholder="Nội dung"></textarea>
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