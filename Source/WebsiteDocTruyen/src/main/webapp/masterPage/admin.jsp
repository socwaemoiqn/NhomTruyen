<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Trị</title>
	<script src="${pageContext.request.contextPath}/template/admin/js/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="${pageContext.request.contextPath}/template/admin/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/template/admin/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/template/admin/css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/template/admin/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	<script src="${pageContext.request.contextPath}/template/admin/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<%@ include file="/common/admin/header.jsp"%>
			<%@ include file="/common/admin/menu.jsp"%>
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<dec:body />
			</div>
		</div>
	</div>
	<!-- jQuery -->
	

	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/template/admin/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/template/admin/js/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="${pageContext.request.contextPath}/template/admin/js/raphael.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/admin/js/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/admin/js/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/template/admin/js/startmin.js"></script>
</body>
</html>