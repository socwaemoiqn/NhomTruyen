<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản trị - Thống kế</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý thể loại truyện</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">

					<c:if test="${not empty sessionScope.tuKhoa}">
						<div class="alert alert-info alert-dismissible">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">×</button>
							Kết quả tìm kiếm cho từ khóa ${sessionScope.tuKhoa}:
						</div>
					</c:if>

					<%
						request.getSession().removeAttribute("tenTheLoai");
					%>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/quan-tri/thong-ke"
										class="btn btn-warning" title="Trở lại"> <i
											class="fa  fa-arrow-left fa-1x"></i>
									</a></td>
									<td>
										<form
											action="${pageContext.request.contextPath}/quan-tri/thong-ke/truyen/loc-thong-tin"
											method="get">
											<div style="float: left">
												<select id="select-tacvu" name="thong-ke"
													class="form-control">
													<c:choose>
														<c:when test="${not empty thongKe }">
															<c:forEach var="tk" items="${thongKe }">
																<option value="${tk.key }">${tk.value}</option>
															</c:forEach>

														</c:when>
														<c:otherwise>
															<option value="">Thống kê</option>
														</c:otherwise>
													</c:choose>
													<option value="full">Số lượng truyện Full</option>
													<option value="hot">Số lượng truyện Hot</option>
													<option value="news">Số lượng truyện News</option>
													<option value="search">Số lượng tìm kiếm truyện</option>
													<option value="#">Số lượng .</option>
												</select>
											</div>
											<div style="float: left; margin-left: 3%;">
												<select id="select-tacvu" name="thoi-gian"
													class="form-control">
													<c:choose>
														<c:when test="${not empty thoiGian }">
															<c:forEach var="tk" items="${thoiGian }">
																<option value="${tk.key }">${tk.value}</option>
															</c:forEach>

														</c:when>
														<c:otherwise>
															<option value="">Thời gian</option>
														</c:otherwise>
													</c:choose>
													<option value="days">Ngày</option>
													<option value="weeks">Tuần</option>
													<option value="months">Tháng</option>
												</select>
											</div>
											<div style="float: left; margin-left: 1%; margin-top: 1%">
												or</div>
											<div style="float: left; margin-left: 1%;">
												<input class="form-control" name="begin" type="date"
													value="${begin }">
											</div>
											<div style="float: left; margin-left: 1%; margin-top: 1%">
												to</div>
											<div style="float: left; margin-left: 1%;">
												<input class="form-control" name="end" type="date"
													value="${end }">
											</div>
											<div style="margin-left: 5%; float: left">
												<input class="btn btn-primary" type="submit"
													value="Lọc thông tin">
											</div>

										</form>
									</td>


									<td><a href="" class="btn btn-danger">In báo cáo</a></td>

								</tr>
							</tbody>
						</table>

						<c:choose>

							<c:when test="${not empty thongKeTruyen}">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<caption align="top"
										style="text-align: center; font-size: 22px; text-transform: capitalize; font-weight: bold;">${mess }</caption>

									<thead>
										<tr>
											<th>STT</th>
											<th>Tên truyện</th>
											<th>Tác giả</th>
											<th>Số chương</th>
											<th>Lượt Xem</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${thongKeTruyen}" var="us"
											varStatus="status">

											<tr class="odd gradeX">
												<td style="padding-top: 2%;">${status.index + 1}</td>
												<td style="padding-top: 2%;">${us.tenTruyen}</td>
												<td style="padding-top: 2%;">${us.tenTacGia }</td>
												<td style="padding-top: 2%;">${us.soChuong }</td>

												<td style="padding-top: 2%;">${us.luotXem }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:when>

							<c:otherwise>
										<h4 style="text-align: center;">Danh Sách Trống.</h4>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>