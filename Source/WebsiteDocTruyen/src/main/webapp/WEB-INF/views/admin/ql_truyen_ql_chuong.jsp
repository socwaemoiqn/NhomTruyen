<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
				<div class="panel-heading">Truyện acbd</div>
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
										href="${pageContext.request.contextPath}/quan-tri/ql_truyen/ql_chuong/them_chuong"
										class="btn btn-primary">Thêm Chương Mới</a></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>STT</th>
									<th>ID Chương</th>
									<th>Tên Chương</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listChuongOfTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td scope="row">${status.index + 1}</td>
										<td>${us.IDTruyen }</td>
										<td>${us.tieuDe}</td>
										<td class="center">dùng check</td>
										<td class="center"><a class="btn btn-primary btn-circle"
											title="Xem trước"
											href="${pageContext.request.contextPath}/quan-tri/ql_truyen/ql_chuong/xem_chuong?idChuong=${us.id}">
												<i class="fa fa-eye"></i>
										</a> <a 
											class="btn btn-success btn-circle"
											title="Chỉnh sửa nội dung chương"
											href="${pageContext.request.contextPath}/quan-tri/ql_truyen/ql_chuong/sua_chuong?idChuong=${us.id}">
												<i class="fa  fa-edit"></i>
										</a> <a class="btn btn-danger btn-circle" title="Xóa chương"
											href="${pageContext.request.contextPath}/quan-tri/ql_danhmuc_truyen/xoa?id=${us.id}"><i
												class="fa fa-close"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listChuongOfTruyen.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listChuongOfTruyen.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql_chuong?page=${page}&idtruyen=${idt}"
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
			</div>
		</div>
	</div>
	</div>


</body>
</html>