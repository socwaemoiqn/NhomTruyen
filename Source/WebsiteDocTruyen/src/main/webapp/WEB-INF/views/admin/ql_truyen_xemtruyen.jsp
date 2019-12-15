<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý truyện - ${truyenById.tenTruyen }</title>

  <!-- DataTables CSS -->
  <link href="${pageContext.request.contextPath}/template/admin/css/dataTables/dataTables.bootstrap.css" rel="stylesheet">

  <!-- DataTables Responsive CSS -->
  <link href="${pageContext.request.contextPath}/template/admin/css/dataTables/dataTables.responsive.css" rel="stylesheet">
	
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">Thông tin chi tiết về truyện</h2>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				<c:if test="${not empty sessionScope.themChuong}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                               	 Đã thêm chương:
                               	 <a href="" class="alert-link">${sessionScope.themChuong}</a>.
                               	 <i> Nhấn tab <a href="#chuong" data-toggle="tab">Chương</a> để xem chi tiết.</i> 
                           </div>
					</c:if>
					
					<%
					        request.getSession().removeAttribute("themChuong");
							request.getSession().removeAttribute("name_truyen_add");
					%>
				
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
							
							<li class="active"><a href="#home" data-toggle="tab">Cơ
									bản</a></li>
							<li><a href="#thongtinkhac" data-toggle="tab">Thông tin
									khác</a></li>
							<li><a href="#chuong" data-toggle="tab">Chương</a></li>
				
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

							<h3>Tên: ${truyenById.tenTruyen }</h3>
							<div style="float: right;">
								<a href="" class="btn btn-success" data-toggle="modal"
									data-target="#editThongTinTruyen">Chỉnh Sửa Thông Tin</a>
							</div>
							<p>
								Thể loại:
								
									<a>${truyenById.theLoaiTruyen }</a>
								
							</p>
							<p>
								Tác giả: <a> ${truyenById.tenTacGia }</a>
							</p>
							<p>
								Nhóm dịch: <a> ${truyenById.tenNhomDich }</a>
							</p>
							<p>
								Nguồn: <a> ${truyenById.nguon }</a>
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
								Ngày tạo: <a> ${truyenById.ngayTao }</a>
							</p>
						</div>
						<div class="tab-pane fade" id="chuong">
							<h4> <i>${truyenById.tenTruyen } hiện có </i> : ${truyenById.soChuong } chương. </h4>
							<p style="float: right;">
								<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${tenTruyen}"
									class="btn btn-primary">Quản lý chương</a>
							</p>
							<div class="clearfix"></div>

							<div class="panel-group" id="accordion">
								<c:forEach var="i" begin="1" end="${(slChuong/25)+1}">
									<div class="panel panel-default">
										<c:choose>
											<c:when test="${i == 1}">
												<c:set value="in" var="in" />
											</c:when>
											<c:otherwise>
												<c:set value="collapse" var="in" />
											</c:otherwise>
										</c:choose>
										

											<div class="panel-body">
												<table
													class="table table-striped table-bordered table-hover"
													id="table-chuong">
													<thead>
														<tr>
															<th>Chương</th>
															<th>Tiêu đề</th>
															<th>Trạng Thái</th>
															
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listChuongOfTruyen}" var="us"
															varStatus="status">
															<tr class="odd gradeX">
																
																<td>
																	Chương ${status.index + 1}
																</td>
																<td>
																	<a title="Xem trước"
																		href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/${us.urlChuong}">
																		${us.tieuDe}
																	</a>
																</td>
																<td >
																	<c:if test="${us.trangThai == '1'}">
																		Enable
																	</c:if>
																	<c:if test="${us.trangThai == '0'}">
																		Disable
																	</c:if>
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										
									</div>
								</c:forEach>

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
								<form:form modelAttribute="truyenEditForm"
									enctype="multipart/form-data"
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/edit-truyen"
									method="POST">
									<div class="form-group">
										<label>Nhập lại tên truyện</label>
										<form:input path="tenTruyen" class="form-control"
											placeholder="Nhập lại tên truyện" />
									</div>
									<div class="form-group">
										<label>Chọn hình ảnh mới</label>
										<form:input path="hinhAnh" type="file" />
									</div>
									<div class="form-group">
										<label>Tác giả cũ: <i>${truyenById.tenTacGia }</i></label><br>
										<label>Chọn lại tác giả: </label>
										<form:select path="maTacGia" class="form-control">
											<form:option value="-1" label="-----" />
											<form:options items="${tacGia}" itemLabel="tenTacGia"
												itemValue="ID" />
										</form:select>
									</div>
									
									<div class="form-group">
										<label>Thể Loại cũ
										<c:forEach items="${temtl}" var="d" varStatus="status">
											<i><a>${d.tenTheLoai }</a>,</i>
										</c:forEach>
										</label> <br>
										<label>Chọn thể loại mới:</label>
										<form:select multiple="true" path="maTheLoai"
											class="form-control">
											<form:options items="${theLoai}" itemLabel="tenTheLoai"
												itemValue="id" />
										</form:select>
										(Nhấn Ctrl để chọn hơn một thể loại mới !)
									</div>
									<div class="form-group">
										<label>Nguồn cũ:  <i>"${truyenById.nguon }"</i>
										</label><br>
										<label>Nhập lại nguồn mới</label>
										<form:input path="nguon" class="form-control"
											placeholder="Nhập nguồn của truyện" />

									</div>
									<div class="form-group">
										<label>Giới thiệu chung
										</label>
										<form:textarea path="gioiThieu"  id ="gt" class="form-control"
											placeholder="${truyenById.gioiThieu }"/>
											 

									</div>
									<button type="submit" class="btn btn-success">Chỉnh sửa thông tin truyện</button>
									<button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
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
	<!-- DataTables JavaScript -->
       <script src="${pageContext.request.contextPath}/template/admin/js/dataTables/jquery.dataTables.min.js"></script>
       <script src="${pageContext.request.contextPath}/template/admin/js/dataTables/dataTables.bootstrap.min.js"></script>
       <!-- Page-Level Demo Scripts - Tables - Use for reference -->
       <script>
           $(document).ready(function() {
               $('#table-chuong').DataTable({
                      
               });
           });
       </script>
       
	</body>
</html>