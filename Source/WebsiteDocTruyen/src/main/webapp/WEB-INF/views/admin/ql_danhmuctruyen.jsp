<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Danh Mục Truyện</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<td><input class="form-control" type="text"
										placeholder="Nhập nội dung tìm kiếm"></td>
									<td><input class="btn btn-default" type="submit"
										value="Tìm kiếm"></td>

									<td><a
										href="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/them"
										class="btn btn-primary" data-toggle="modal"
										data-target="#themmoi">Thêm Mới</a></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>STT</th>
									<th>ID Danh mục</th>
									<th>Tên Danh Mục</th>
									<th>Số lượng Truyện</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${danhMucTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td scope="row">${status.index + 1}</td>
										<td>${us.id}</td>
										<td>${us.tenDanhMuc}</td>
										<td class="center">4</td>
										<td class="center">
										dùng check
										</td>
										<td class="center">
											<a class="btn btn-primary btn-circle" title="Tất cả truyện"
											href="${pageContext.request.contextPath}/quan-tri/abcd?id=${us.id}">
												<i class="fa fa-list-ul"></i>
											</a> 
											<a data-toggle="modal" data-target="#sua" class="btn btn-success btn-circle" title="Chỉnh sửa danh mục"
											 href="${pageContext.request.contextPath}/quan-tri/abcd?id=${us.id}">
												<i class="fa  fa-edit"></i>
											</a>
											<a class="btn btn-danger btn-circle" title="Xóa danh mục"
											href="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/xoa?id=${us.id}"><i
												class="fa fa-close"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${danhMucTruyen.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${danhMucTruyen.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql_danhmuc_truyen?page=${page}"
													class="nav-item">${page}</a></li>
											</c:if>
											<c:if test="${page == -1 }">
												<li><a><span> ... </span></a></li>
											</c:if>
										</c:forEach>
									</ul>
								</nav>
							</div>
						</c:if>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="modal fade" id="themmoi" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-green">

					<div class="panel-heading">
						<h4>Thêm danh mục truyện mới</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về danh mục truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/them"
									method="post">
									<div class="form-group">
										<label>Tên danh mục truyện</label> <input class="form-control"
											name="tenDanhMuc" placeholder="Nhập tên danh mục truyện">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập giới thiệu về danh mục">
									</div>
									<button type="submit" class="btn btn-primary">Thêm
										danh mục</button>
								</form>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
	<div class="modal fade" id="sua" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-green">

					<div class="panel-heading">
						<h4>Thêm danh mục truyện mới</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về danh mục truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/them"
									method="post">
									<div class="form-group">
										<label>Tên danh mục truyện</label> <input class="form-control"
											name="tenDanhMuc" placeholder="Nhập tên danh mục truyện">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập giới thiệu về danh mục">
									</div>
									<button type="submit" class="btn btn-primary">Thêm
										danh mục</button>
								</form>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- //Modal content-->
		</div>
	</div>
</body>
</html>