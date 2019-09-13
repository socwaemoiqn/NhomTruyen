<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm Truyện</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/assets/icon/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/assets/css/index.css">
</head>
<body>
	<%@ include file="/common/client/menu.jsp"%>
	<div class="main">This is index page</div>
	<dec:body />

	<script>
		var y = document.getElementById("user");
		var z = document.getElementById("search");
		window.onload = function() {
			resize();
		};
		window.onresize = function() {
			resize();
		};
		function resize() {

			if (screen.width > 1039 && document.body.clientWidth > 1039) {
				y.style.position = "absolute";
			} else {
				y.style.position = "static";
			}
			if (screen.width <= 351 && document.body.clientWidth <= 351) {
				z.style.width = "250px";
			} else {
				z.style.width = "300px";
			}
		}
		function myFunction() {

			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";

			} else {
				x.className = "topnav";

			}
		}
	</script>
</body>
</html>