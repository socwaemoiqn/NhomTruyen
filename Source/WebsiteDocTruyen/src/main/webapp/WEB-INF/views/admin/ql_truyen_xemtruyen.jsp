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
				<div class="panel-heading">Thông tin</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab">Cơ
								bản</a></li>
						<li><a href="#thongtinkhac" data-toggle="tab">Thông tin
								khác</a></li>
						<li><a href="#chuong" data-toggle="tab">Chương</a></li>
						<div style="float: right;">
							<a href="" class="btn btn-success" data-toggle="modal"
								data-target="#editThongTinTruyen">Chỉnh Sửa Thông Tin</a>
						</div>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<div class="col-lg-3">
								<div class="panel panel-info">
									<div class="panel-body">
										<img
											src="${pageContext.request.contextPath}/truyen/img/${truyenById.hinhAnh}"
											width="99%" />
									</div>
								</div>
							</div>

							<h3>${truyenById.tenTruyen }</h3>
							<p>
								Danh Mục:
								<c:forEach items="${dmById}" var="d" varStatus="status">
									<a>${d.tenDanhMuc }</a>,
								</c:forEach>
							</p>
							<p>
								Thể loại:
								<%-- <c:forEach items="${dmById}" var="d" varStatus="status">
									<a>${d.tenDanhMuc }</a>,
								</c:forEach> --%>
							</p>
							<p>
								Tác giả: <a> ${truyenById.tenTacGia }</a>
							</p>
							<p>
								Nhóm dịch: <a> ${truyenById.tenNhomDich }</a>
							</p>
							<p>Giới thiệu:</p>
							<p>${truyenById.gioiThieu }</p>

						</div>


						<div class="tab-pane fade" id="thongtinkhac">
							<h4>Một số thông tin khác</h4>
							<p>
								Số chương: <a> ${truyenById.soChuong }</a>
							</p>
							<p>
								Lượt xem: <a> ${truyenById.luotXem }</a>
							</p>
							<p>
								Trạng thái: <a> <c:choose>
										<c:when test="${truyenById.trangThai == '1' }"> Full</c:when>
										<c:otherwise>Đang cập nhật</c:otherwise>
									</c:choose>
								</a>
							</p>
							<p>
								Ngày tạo: <a> ${truyenById.ngayTao }</a>
							</p>
						</div>
						<div class="tab-pane fade" id="chuong">
							<h4>Tất cả chương của truyện: ${truyenById.tenTruyen }</h4>

							<div class="panel-group" id="accordion">
							<c:forEach var="i" begin="1" end="${(slChuong/2)+1}">
								<div class="panel panel-default">

									<div id="collapseOne" class="panel-collapse collapse collapse">
										<div class="panel-body">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example">
												<thead>
													<tr>
														<th>STT</th>
														<th>Tên Chương</th>
														<th>Trạng Thái</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:forEach>
							
								
								<div class="panel panel-default">

									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example">
												<thead>
													<tr>
														<th>STT</th>
														<th>Tên Chương</th>
														<th>Trạng Thái</th>
														<th></th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="panel panel-default">

									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-example">
												<thead>
													<tr>
														<th>STT</th>
														<th>Tên Chương</th>
														<th>Trạng Thái</th>
														<th></th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="grid_3 grid_5 agileits">
									<div class="col-md-6">
										<nav>
											<ul class="pagination pagination-lg">

												<li><a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne">1</a></li>
												<li><a data-toggle="collapse" data-parent="#accordion"
													href="#collapseTwo">2</a></li>
												<li><a data-toggle="collapse" data-parent="#accordion"
													href="#collapseThree">3</a></li>

											</ul>
										</nav>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->

		</div>
	</div>
	<div class="modal fade" id="editThongTinTruyen" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-success">

					<div class="panel-heading">
						<h4>Chỉnh sửa thông tin truyện</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập lại thông tin về truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form action="#" method="post">
									<div class="form-group">
										<label>Giới thiệu chung</label>

									</div>
									<button type="submit" class="btn btn-success">Đồng ý</button>
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