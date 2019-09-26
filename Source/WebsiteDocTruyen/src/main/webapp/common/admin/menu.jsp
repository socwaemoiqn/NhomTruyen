<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Nhập nội dung...">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" id="d">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!-- /input-group -->
			</li>
			<li><a href="${pageContext.request.contextPath}/quan-tri/home" class="active"><i
					class="fa fa-home fa-fw"></i>Trang Chủ</a></li>
			<li><a href="#"><i class="fa fa-table fa-fw"></i>Quản Lý<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen?page=0">QL Danh Mục Truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql_theloai_truyen">QL Thể Loại truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql_truyen">QL Truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql_tacgia">QL Tác Giả</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql_nhomdich">QL Nhóm dịch</a></li>
				</ul></li>
			<li><a href="#"><i class="fa fa-folder fa-fw"></i>Báo Cáo<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="${pageContext.request.contextPath}/quan-tri/sd">Doanh Thu</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/sd">Sản Phẩm Tồn Kho</a></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="#"><i class="fa fa-file fa-fw"></i>Thống Kê<span
					class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="ab">Doanh Thu</a></li>
					<li><a href="a">....</a></li>
				</ul> <!-- /.nav-second-level --></li>
			<li><a href="#" class="active"><i class="fa fa-fw"></i>Người
					dùng</a></li>
			<li><a href="${pageContext.request.contextPath}/quan-tri/sabhbha"><i class="fa fa-users fa-fw"></i>Người
					Dùng</a></li>
			<li><a href="${pageContext.request.contextPath}/quan-tri/sabhbha"><i class="fa fa-bolt fa-fw"></i>Quyền
					Người Dùng</a></li>
			<li><a href="${pageContext.request.contextPath}/quan-tri/sabhbha"><i
					class="fa fa-support fa-fw"></i>Phản Hồi</a></li>
			<!--ph?n tiêu đ? menu-->
			<li><a class="active"><i class="fa fa-fw"></i>Trợ
					giúp</a></li>
			<li><a href="${pageContext.request.contextPath}/quan-tri/sabhbha"><i
					class="fa fa-download fa-fw"></i>Dowload Tài liệu</a></li>
			<li><a  class="active"><i class="fa fa-fw"></i>By:
					︵✰ʑDɱøηкїɗʑ®</a></li>
		</ul>
	</div>
</div>