<%@page import="java.util.Map"%>
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
			<h1 class="page-header">Quản lý Tác Giả</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				<% Map<String,String> mess = (Map<String,String>)request.getSession().getAttribute("mess"); %>			
							<c:if test="${not empty mess}">
							<div class="alert alert-success">
								<ul>
									<li>${mess.status }	</li>							
									<li>${mess.name }</li>
								</ul>				
							</div>
				<% request.getSession().removeAttribute("mess"); %>
							</c:if>
				</div> <!--  Hiển thị mess = ['status'=> 'value','name'='value'] -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<form action="${pageContext.request.contextPath}/quan-tri/ql-tacgia/search" method="get">
										<td><input class="form-control" type="text" name="key"
										placeholder="Nhập nội dung tìm kiếm"></td>
										<td><input class="btn btn-success" type="submit"
										value="Tìm kiếm"> 
										<a class="btn btn-default" href="${pageContext.request.contextPath}/quan-tri/ql-tacgia">Trở lại</a></td>
									</form>	
									
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
									<th>ID Tác Giả</th>
									<th>Tên Tác Giả</th>
									<th>Số lượng Truyện</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listTacGia.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td scope="row">${status.index + 1}</td>
										<td>${us.ID}</td>
										<td>${us.tenTacGia}</td>
										<td class="center">
											<c:forEach items="${listSL}" var="sl">
											 	<c:if test="${ sl.key == us.ID }">
											 		${sl.value }
											 	</c:if>
											</c:forEach>
										</td>
										<td class="center">${us.trangThai }</td>
										<td class="center"><a class="btn btn-primary btn-circle"
											title="Tất cả truyện"
											href="${pageContext.request.contextPath}/quan-tri/abcd?id=${us.ID}">
												<i class="fa fa-list-ul"></i>
										</a> <a data-toggle="modal" id="${us.ID}" data-target="#sua"
											class="btn btn-success btn-circle btn-sua" title="Chỉnh sửa danh mục">
												<i class="fa  fa-edit"></i>
										</a> <a class="btn btn-danger btn-circle" title="Xóa danh mục"
											href="${pageContext.request.contextPath}/quan-tri/ql_theloai_truyen/xoa?id=${us.ID}"><i
												class="fa fa-close"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listTacGia.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listTacGia.navigationPages}"
											var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql-tacgia?page=${page}"
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
	<div class="modal fade" id="themmoi" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-green">

					<div class="panel-heading">
						<h4>Thêm Thể Loại Truyện Mới</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về tác giả truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-tacgia/insert"
									method="post">
									<div class="form-group">
										<label>Tên tác giả truyện</label> <input class="form-control"
											name="tenTacGia" placeholder="Nhập tên tác giả truyện">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập giới thiệu về tác giả">
									</div>
									<button type="submit" class="btn btn-primary">Thêm
										tác giả</button>
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
				<div class="panel panel-success">

					<div class="panel-heading">
						<h4>Sửa tác giả truyện</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về tác giả truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form action="${pageContext.request.contextPath}/quan-tri/ql-tacgia/edit"
									method="post">
									<div class="form-group">
										<label>ID tác giả:</label> <input class="form-control"
											name="id" id="id" readonly>
									</div>
									<div class="form-group">
										<label>Tên Tác giả truyện</label> <input class="form-control"
											name="tenTacGia" id="tenTacGia" placeholder="Nhập tên danh mục truyện">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" id="gioiThieu" placeholder="Nhập giới thiệu về danh mục">
									</div>
									<div class="form-group">
                                                   
                                                    <label class="radio-inline">
                                                        <input type="radio" name="trangThai" id="trangThai1" value="1"> Enable
                                                    </label>
                                              
                                                    <label class="radio-inline">
                                                        <input type="radio" name="trangThai" id="trangThai0" value="0"> Disable
                                                    </label>
                                                   
                                                </div>
									<button type="submit" class="btn btn-success">Sửa
										thể loại</button>
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
	<c:url var="home" value="${pageContext.request.contextPath}/quan-tri/ql-tacgia/" scope="request" />
	<script>
		$(document).ready(function() {
			$(document).on('click','.btn-sua',function(){
				let id = $(this).attr("id");
				$.ajax({
					url: "${pageContext.request.contextPath}/quan-tri/ql-tacgia/ajax",
					type: "POST",
					dataType: "json",
					data: { id: id },
					success: function(data){
						$("#sua #id").val(id);
						$("#sua #tenTacGia").val(data.tenTacGia);
						$("#sua #gioiThieu").val(data.gioiThieu);
						if(data.trangThai == "1")
							{
								$("#sua #trangThai1").prop("checked","true");
							}
						else
							$("#sua #trangThai0").prop("checked","true");
					},
					error: function (error) {
						alert(error);
					}
				});
			});
		});
	</script>
</body>

</html>