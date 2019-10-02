<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trang thành viên nhóm dịch</title>

<!-- //custom-theme -->
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/component.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/export.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/flipclock.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/circles.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/style_grid.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/style.css"
	rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/table-style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/basictable.css" />

<!-- font-awesome-icons -->
<link
	href="${pageContext.request.contextPath}/template/TranslateTeam/css/font-awesome.css"
	rel="stylesheet">
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">

</head>
<body>
	<div class="wthree_agile_admin_info">
		<%@ include file="/common/translateTeam/members/menu.jsp"%>

		<dec:body />
	</div>
	<%@ include file="/common/translateTeam/members/footer.jsp"%>


	<!-- js -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/jquery-2.1.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/modernizr.custom.js"></script>

	<script
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/classie.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/gnmenu.js"></script>
	<script>
		new gnMenu(document.getElementById('gn-menu'));
	</script>
	<!-- tables -->

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/jquery.basictable.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#table').basictable();

			$('#table-breakpoint').basictable({
				breakpoint : 768
			});

			$('#table-swap-axis').basictable({
				swapAxis : true
			});

			$('#table-force-off').basictable({
				forceResponsive : false
			});

			$('#table-no-resize').basictable({
				noResize : true
			});

			$('#table-two-axis').basictable();

			$('#table-max-height').basictable({
				tableWrapper : true
			});
		});
	</script>
	<!-- //js -->
	<script src="js/screenfull.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/jquery.nicescroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/scripts.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/template/TranslateTeam/js/bootstrap-3.1.1.min.js"></script>
</body>
</html>