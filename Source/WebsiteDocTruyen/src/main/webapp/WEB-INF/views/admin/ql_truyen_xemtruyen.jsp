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
						<li><a href="#settings" data-toggle="tab">Thông tin khác</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<div class="col-lg-3">
								<div class="panel panel-info">
									<div class="panel-body">
										<img
											src="${pageContext.request.contextPath}/template/admin/truyenmm.png"
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


						<div class="tab-pane fade" id="settings">
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
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->

		</div>
	</div>

</body>
</html>