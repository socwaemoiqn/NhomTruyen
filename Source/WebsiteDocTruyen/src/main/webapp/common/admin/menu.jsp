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
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql-danh-muc-truyen?page=0">QL Danh Mục Truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql-the-loai-truyen">QL Thể Loại Truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql-truyen">QL Truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/ql-tacgia">QL Tác Giả</a></li>
					<li>
						<a href="#"><i ></i>Ql Nhóm dịch
							<span class="fa arrow"></span>
						</a>
						<ul class="nav nav-third-level">
							<li><a href="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich">Tất cả nhóm dịch</a></li>
							<li><a href="${pageContext.request.contextPath}/quan-tri/...">Truyện nhóm dịch</a></li>
							<li><a href="${pageContext.request.contextPath}/quan-tri/sd">..... nhóm dịch</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-file fa-fw"></i>Thống Kê
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="${pageContext.request.contextPath}/quan-tri/thong-ke/truyen">Các thông tin về truyện</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/thong-ke/nhom-dich">Các thông tin về nhóm dịch</a></li>
					<li><a href="${pageContext.request.contextPath}/quan-tri/thong-ke/nguoi-dung">Các thông tin về người dùng</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="active"><i class="fa fa-fw"></i>Người
					dùng</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/quan-tri/tai-khoan"><i class="fa fa-users fa-fw"></i>Quản lý người
					dùng</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro"><i class="fa fa-bolt fa-fw"></i>Quyền
					người dùng</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/quan-tri/phan-hoi"><i
					class="fa fa-support fa-fw"></i>Phản Hồi</a>
			</li>
			<li>
				<a class="active"><i class="fa fa-fw"></i>Trợ
					giúp</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/quan-tri/sabhbha"><i
					class="fa fa-download fa-fw"></i>Dowload Tài liệu</a>
			</li>
			<li>
				<a  class="active"><i class="fa fa-fw">
				</i>By:	︵✰ʑDɱøηкїɗʑ®</a>
			</li>
		</ul>
	</div>
</div>