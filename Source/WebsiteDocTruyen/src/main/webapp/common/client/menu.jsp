	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	
	<%@ include file="/common/taglib.jsp"%>
	
	
	
	<div class="topnav" id="myTopnav">
		<a href="${pageContext.request.contextPath}/index" id="home"> <span
			class="fa-stack"> <i class="fa fa-circle fa-stack-2x"></i> <i
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
						<td><strong>Tình yêu<span data-placeholder="Tình yêu"></span></strong>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<a id="search"
			style="position: absolute; right: 25%; top: 0; width: 300px; padding: 10px;">
			<input type="text" placeholder="Nhập nội dung tìm kiếm" name="search">
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
	<div id="container-login">
		<i class="fas fa-times-circle fa-lg"></i>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<h1 id="abac">Đăng nhập</h1>
			<div class="txtb">
				<input type="text" name="userName" required=""> <span
					data-placeholder="Tài khoản" ></span>
			</div>
			<div class="txtb">
				<input type="password" name="passWord" required=""> <span
					data-placeholder="Mật khẩu"></span>
			</div>
			<button class="btn" type="submit">Đăng Nhâp</button>
			<div class="bottom-text">
				Chưa có tài khoản? <a HREF="#">Đăng ký</a>
			</div>
		</form>
	</div>
	<div class="cover-login"></div>
	<!-- JS phần login -->
	<script type="text/javascript">
		var user = document.getElementById("user");
		var input = document.querySelectorAll(".txtb input");
		var container_login = document.getElementById("container-login");
		var exit_login = document.querySelector("#container-login i");
		var cover_login = document.querySelector("div.cover-login");
		exit_login.onclick = function() {
			container_login.classList.remove("show-login");
			cover_login.classList.remove("cover-login-show");
	
		};
		input[0].onfocus = function() {
			this.classList.add("focus");
		};
		input[0].onblur = function() {
			if (this.value == "")
				this.classList.remove("focus");
		};
		input[1].onfocus = function() {
			this.classList.add("focus");
		};
		input[1].onblur = function() {
			if (this.value == "")
				this.classList.remove("focus");
		};
		user.onclick = function() {
			container_login.classList.add("show-login");
			cover_login.classList.add("cover-login-show");
		};
	</script>
	<!-- JS phần login -->