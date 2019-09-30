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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Truyện</div>
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

									<td><a href="" class="btn btn-primary" data-toggle="modal"
										data-target="#themmoi">Thêm Mới</a></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>STT</th>
									<th>Hình Ảnh</th>
									<th>Tên Truyện</th>
									<th>Tên Tác Giả</th>
									<th>Thể Loại Truyện</th>
									<th>Số Chương</th>
									<th>Lượt Xem</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td scope="row">${status.index + 1}</td>
										<td class="center">${us.hinhAnh}</td>
										<td>${us.tenTruyen}</td>
										<td class="center">${us.tenTacGia }</td>
										<td class="center">${us.tenTheLoai }</td>
										<td class="center">${us.soChuong }</td>
										<td class="center">${us.luotXem }</td>
										<td class="center">....</td>
										<td class="center"><a class="btn btn-primary btn-circle"
											title="Tất cả chương"
											href="${pageContext.request.contextPath}/quan-tri/ql_truyen/ql_chuong?idtruyen=${us.ID}">
												<i class="fa fa-list-ul"></i>
										</a> <a data-toggle="modal" data-target="#sua"
											class="btn btn-success btn-circle"
											title="Chỉnh sửa thông tin truyện"
											href="${pageContext.request.contextPath}/quan-tri/abcd?id=${us.ID}">
												<i class="fa  fa-edit"></i>
										</a> <a class="btn btn-danger btn-circle" title="Xóa truyện"
											href="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/xoa?id=${us.ID}"><i
												class="fa fa-close"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listTruyen.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listTruyen.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql_truyen?page=${page}" class="nav-item">${page}</a></li>
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
			</div>
		</div>
	</div>
	<div class="modal fade" id="themmoi" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-green">

					<div class="panel-heading">
						<h4>Thêm truyện mới</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form:form modelAttribute="truyen"
									action="${pageContext.request.contextPath}/quan-tri/ql_truyen/them"
									method="post">
									<div class="form-group">
										<label>Tên truyện</label> <input class="form-control"
											name="tenDanhMuc" placeholder="Nhập tên truyện">
									</div>
									<div class="form-group">
										<label>Hình Ảnh Về Truyện</label>
										<form:input path="hinhAnh" type="file" />
									</div>
									<div class="form-group">
										<label>Tác giả</label>
										<form:select path="IdTacGia" class="form-control">
											<form:options items="${tacGia}" itemLabel="tenTacGia"
												itemValue="ID" />
										</form:select>
									</div>
									<div class="form-group">
										<label>Số chương</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập số chương">
									</div>
									<div class="form-group">
										<label>Danh mục</label>
										<form:select path="IdDanhMuc" class="form-control">
											<form:options items="${danhMuc}" itemLabel="tenDanhMuc"
												itemValue="id" />
										</form:select>



									</div>
									<div class="form-group">
										<label>Thể Loại</label>
										<form:select path="IDTheLoai" class="form-control">
											<form:options items="${theLoai}" itemLabel="tenTheLoai"
												itemValue="id" />
										</form:select>
									</div>
									<div class="form-group">
										<label>Giới thiệu chung</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập giới thiệu về truyện">
									</div>
									<button type="submit" class="btn btn-primary">Thêm
										truyện mới</button>
								</form:form>
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