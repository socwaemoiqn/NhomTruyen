<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->
<button type="button" class="navbar-toggle" data-toggle="collapse"
	data-target=".navbar-collapse">
	<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
	<span class="icon-bar"></span> <span class="icon-bar"></span>
</button>

<ul class="nav navbar-nav navbar-left navbar-top-links">
	<li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-home fa-fw"></i>Nhóm Truyện</a></li>
</ul>

<ul class="nav navbar-right navbar-top-links">


	<li class="dropdown"><a class="dropdown-toggle"
		data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>${sessionScope.admin.tenTaiKhoan}
			<b class="caret"></b>
	</a>
		<ul class="dropdown-menu dropdown-user">
			<li><a href="#"><i class="fa fa-user fa-fw"></i> User
					Profile</a></li>
			<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
			<li class="divider"></li>
			<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i>
					Logout</a></li>
		</ul></li>
</ul>
<!-- /.navbar-top-links -->