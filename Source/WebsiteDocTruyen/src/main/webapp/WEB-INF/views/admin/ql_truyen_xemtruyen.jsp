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
			<h2 class="page-header">Thông tin Truyện : ${truyenById.tenTruyen }</h2>
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
                                	  <a href="" class="alert-link">${sessionScope.themChuong}</a>.<i> Nhấn tab <a href="#chuong" data-toggle="tab">Chương</a> để xem chi tiết.</i> 
                               
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

							<h3>${truyenById.tenTruyen }</h3>
							<div style="float: right;">
								<a href="" class="btn btn-success" data-toggle="modal"
									data-target="#editThongTinTruyen">Chỉnh Sửa Thông Tin</a>
							</div>
							<p>
								Danh Mục:
								<c:forEach items="${dmById}" var="d" varStatus="status">
									<a>${d.tenDanhMuc }</a>,
								</c:forEach>
							</p>
							<p>
								Thể loại:
								 <c:forEach items="${temtl}" var="d" varStatus="status">
									<a>${d.tenTheLoai }</a>,
								</c:forEach> 
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
								<a href="#" data-toggle="modal" data-target="#addChuong"
									class="btn btn-primary">Thêm Chương Mới</a>
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
										<div id="collapse${i}" class="panel-collapse ${in } ">

											<div class="panel-body">
												<table
													class="table table-striped table-bordered table-hover"
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
														<c:forEach items="${listChuongOfTruyen}" var="us"
															begin="${25*(i-1)}" end="${(25*i)-1}" varStatus="status">
															<tr class="odd gradeX">
																<td scope="row">${status.index + 1}</td>
																<td>${us.tieuDe}</td>
																<td class="center">dùng check</td>
																<c:forEach items="${urlChuong}" var="ch">
																	
																	<c:if test="${ch.value==us.id }">
																	
																		<td class="center"><a
																			class="btn btn-primary btn-circle" title="Xem trước"
																			href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/${ch.key}">
																				<i class="fa fa-eye"></i>
																		</a> <a class="btn btn-danger btn-circle btn-xoa"
																			title="Xóa chương" id="${us.id}" data-toggle="modal"
																			data-target="#xoaChuong" href=""><i
																			class="fa fa-close"></i></a></td>
																	</c:if>
																</c:forEach>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</c:forEach>
								<div class="grid_3 grid_5 agileits">
									<div class="col-md-6">
										<nav>
											<ul class="pagination pagination-lg">
												<c:forEach var="i" begin="1" end="${(slChuong/25)+1}">
													<li><a data-toggle="collapse" data-parent="#accordion"
														href="#collapse${i}">${i}</a></li>
												</c:forEach>
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
						<h4>Chỉnh sửa thông tin Truyện</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập lại thông tin về Truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form:form modelAttribute="truyenEditForm"
									enctype="multipart/form-data"
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/edit-truyen"
									method="POST">
									<div class="form-group">
										<label>Nhập lại tên Truyện</label>
										<form:input path="tenTruyen" class="form-control"
											placeholder="Nhập lại tên Truyện" />
									</div>
									<div class="form-group">
										<label>Chọn hình ảnh mới</label>
										<form:input path="hinhAnh" type="file" />
									</div>
									<div class="form-group">
										<label>Tác giả cũ: <i>${truyenById.tenTacGia }</i></label><br>
										<label>Chọn lại tác giả: </label>
										<form:select path="maTacGia" class="form-control">
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
											placeholder="Nhập nguồn của Truyện" />

									</div>
									<div class="form-group">
										<label>Giới thiệu chung
										</label>
										<form:textarea path="gioiThieu" class="form-control"
											placeholder="${truyenById.gioiThieu }"/>

									</div>
									<button type="submit" class="btn btn-primary">Thêm
										Truyện Mới</button>
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

	<div class="modal fade" id="addChuong" tabindex="-1" role="dialog">
		<div class="modal-dialog-editchuong">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<h3>Thêm chương mới</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/addChuong"
									method="post">
									<div class="form-group">
										<label>Nhập lại tên chương</label> <input class="form-control"
											type="text" name="ten" placeholder="Nhập tên chương">
									</div>
									<div class="form-group">
										<label>Nhập nội dung của chương</label>
										<textarea name="noiDung" id="noidung"></textarea>
										<script>
											CKEDITOR.replace('noidung');
											CKEDITOR.addCss('form-control')
										</script>
									</div>
									<button type="submit" class="btn panel-primary">Đồng ý</button>
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
	<div class="modal fade" id="xoaChuong" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-red">

					<div class="panel-heading">
						<h3>Xóa chương</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/${tenTruyen}/xoachuong"
									method="post">
									<div class="form-group">
										<label>Bạn muốn xóa bỏ chương: </label>
										<h4 id="tenChuong"></h4>
									</div>
									<input type="text" name="idChuong" id="idChuong" value=""
										style="width: 0px; height: 0px; border: none; background: transparent;" />
									<div class="form-group">
										<label>Nhấn "Đồng ý" để xác nhận xóa chương!</label>

									</div>
									<button type="submit" class="btn btn-danger">Đồng ý</button>
									<button type="button" class="btn btn-warning"
										data-dismiss="modal">Hủy</button>
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
	<script>	
		$(document).ready(function() 
		{
			$(document).on('click','.btn-xoa',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/get-chuong-ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tieuDe = " "+ data.tieuDe;
						$("#xoaChuong #tenChuong").html(tieuDe);
						$("#xoaChuong #idChuong").val(data.id);
					},
					error : function(error)
					{
						alert(error);
					}
				});
		});
	});
	</script>
</body>
</html>