<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị - Quản lý nhóm dịch </title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý nhóm dịch</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
				<!-- mess -->
					<c:if test="${not empty sessionScope.add}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Thêm nhóm dich ${sessionScope.add}  thành công.                              
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.update}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Cập nhật nhóm dich ${sessionScope.update}  thành công.                              
                           </div>
					</c:if>
					
					<c:if test="${not empty sessionScope.delete}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Xóa nhóm dich ${sessionScope.delete}  thành công.                              
                           </div>
					</c:if>
					
					<%
					        request.getSession().removeAttribute("add");
							 request.getSession().removeAttribute("update");
							 request.getSession().removeAttribute("delete");
					%>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich"
										class="btn btn-warning" title="Trở lại"> <i
											class="fa  fa-arrow-left fa-1x"></i>
									</a></td>
									<td>
										<form
											action="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich">
											<div style="float: left">
												<input class="form-control" type="text" name="tu-khoa"
													placeholder="Nhập nội dung tìm kiếm">
											</div>
											<div style="margin-left: 5%; float: left">
												<input class="btn btn-primary" type="submit"
													value="Tìm kiếm">
											</div>

										</form>
									</td>


									<td><a href="" id="them" class="btn btn-primary"
										data-toggle="modal" data-target="#themNhomDich">Thêm Mới</a></td>
									<td>
										<button type="submit" class="btn btn-primary" id="select_all">Chọn
											tất cả</button>
										<button type="submit" class="btn btn-info"
											id="disable_select_all" style="display: none;">Hủy
											chọn</button>

									</td>

									<td>
										<form
											action="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/tac-vu"
											method="Post">
											<input type="hidden" name="array_id" value="">
											<select
												id="select-tacvu" class="form-control" disabled>
												<option value="">Tùy chọn</option>
												<option value="enable">Kích hoạt</option>
												<option value="disable">Vô hiệu</option>
												<option value="delete">Xoá</option>
											</select>
										</form>
									</td>


									<td>
										<button class="btn btn-danger disabled">Hiện có :
											${danhMucTruyen.totalRecords } Danh mục.</button>
									</td>

								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th></th>
									<th>STT</th>
									<th>Nhóm dịch</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listNhomDich.list}" var="nd"
									varStatus="status">
									<tr class="odd gradeX">
										<td scope="row">
										<div class="checkbox">
												<label> <input class="checkbox all" type="checkbox"
													name="check[]" id="${nd.maNhomDich }">
												</label>
											</div>
										
										</td>
										<td style=" padding-top:2%;">${status.index + 1}</td>
										<td style=" padding-top:2%;">${nd.tenNhomDich}</td>
										<td style=" padding-top:2%;">
											<c:if test="${nd.trangThai == '1'}">
												Enable
											</c:if>
											<c:if test="${nd.trangThai == '0'}">
												Disable
											</c:if>
										</td>
										<td style="width: 10%; text-align: center;">
											<a class="btn btn-primary btn-circle" title="Tất cả truyên nhóm Dịch"
											href="${pageContext.request.contextPath}/quan-tri/....=${nd.maNhomDich}">
												<i class="fa fa-list-ul"></i>
											</a> 
											<a data-toggle="modal" data-target="#formSuaNhomDich"
												 class="btn btn-success btn-circle cap-nhat-nhom-dich" title="Chỉnh sửa nhóm dich"
											 	id="${nd.maNhomDich}">
												<i class="fa  fa-edit"></i>
											</a>
											<a class="btn btn-danger btn-circle xoa-nhom-dich" title="Xóa Nhóm Dịch" id="${nd.maNhomDich}"
												data-toggle="modal" data-target="#formXoaNhomDich">
												<i class="fa fa-close"></i>
											</a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listNhomDich.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listNhomDich.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql-nhom-dich?page=${page}"
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
	<div class="modal fade" id="themNhomDich" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-green">

					<div class="panel-heading">
						<h4>Thêm nhóm dịch mới</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về nhóm dịch</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/them-nhom-dich"
									method="post">
									<div class="form-group">
										<label>Tên nhóm dịch</label> 
										<input class="form-control"
											name="tenNhomDich" placeholder="Nhập tên nhóm dịch">
									</div>
									<button type="submit" class="btn btn-primary">Thêm
										nhóm dịch</button>
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
	<div class="modal fade" id="formSuaNhomDich" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-success">

					<div class="panel-heading">
						<h4>Chỉnh Sửa Thông Tin Danh Mục Truyện</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập lại thông tin về danh mục Truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/sua-nhom-dich"
									method="post">
									<div class="form-group">
										<label>Mã Nhóm Dich:</label> <input class="form-control"
											name="maNhomDich" id="maNhomDich" readonly>
									</div>
									<div class="form-group">
										<label>Tên nhóm dịch</label> <input class="form-control"
											name="tenNhomDich" id="tenNhomDich" placeholder="Nhập lại nhóm dịch">
									</div>
									
									<div class="form-group">

										<label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai1" value="1"> Enable
										</label> <label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai0" value="0"> Disable
										</label>

									</div>
									<button type="submit" class="btn btn-success">Đồng ý</button>
									<button type="button" class="btn btn-warning" data-dismiss="modal">Hủy</button>
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
	<div class="modal fade" id="formXoaNhomDich" tabindex="-1" role="dialog" style="text-align: center;">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-red">

					<div class="panel-heading">
						<h3>Xóa Nhóm Dịch</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/xoa-nhom-dich"
									method="post">
									<div class="form-group">
										<label>Bạn có chắc muốn xóa bỏ nhóm dịch: </label>
										<h4 id="tenNhomDich"></h4>
									</div><!-- background: transparent; -->
									<input type="text" name="tenNhomDich" id="tenNhomDich"
									style="width: 0px; height: 0px; border: none; background: transparent;"
									 />
									<input type="text" name="maNhomDich" id="maNhomDich"
									 style="width: 0px; height: 0px; border: none; background: transparent;" 
									 />
									<div class="form-group">
										<label>Nhấn "Đồng ý" để xác nhận xóa nhóm dịch và tất cả các truyện của nhóm dịch.<br>
										 Bạn có chắc chắn đây là lựa chọn của bạn!</label>
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
	<script type="text/javascript">
		// Chức năng chọn hết
		var array_id = new Array();
		document.getElementById("select_all").onclick = function() {
			// Lấy danh sách checkbox
			let checkboxes = document.getElementsByName('check[]');
			document.getElementById("select-tacvu").disabled = false;
			// Lặp và thiết lập checked
			for (let i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = true;
				let id = $(checkboxes[i]).attr("id");
				array_id.push(id);
				console.log(array_id[i]);
			}
			
			document.getElementById("select_all").style.display = 'none';
			document.getElementById("disable_select_all").style.display = 'block';
			
		};

		// Chức năng bỏ chọn hết
		document.getElementById("disable_select_all").onclick = function() {
			
			// Lấy danh sách checkbox
			var checkboxes = document.getElementsByName('check[]');
			
			document.getElementById("select-tacvu").disabled = true;
			
			// Lặp và thiết lập Uncheck
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = false;
				let id = $(this).attr('id');
				let index = array_id.indexOf(id);
				array_id.splice(index,1);
			}
			console.log(array_id.length);
			document.getElementById("select_all").style.display = 'block';
			document.getElementById("disable_select_all").style.display = 'none';
		};
		
		$(document).ready(function() {
			$(document).on("click",'.all',function(){
				let id = $(this).attr('id');
				if($(this).is(":checked"))
					{
						array_id.push(id);
					}
				else
					{
						let index = array_id.indexOf(id);
						array_id.splice(index,1);
					}	
				document.getElementById("select-tacvu").disabled = false;
				if(array_id.length==0){
					document.getElementById("select-tacvu").disabled = true;
				}
				//console.log(array_id.length);
			});
			
		$("#select-tacvu").change(()=>{
            let value = $('#select-tacvu').val();
            $.confirm({
            title: 'Thông báo!',
            content: 'Bạn chắc chắn thực hiện thao tác này?',
            buttons: {
                        confirm: {
                        text: 'Xác nhận',
                        btnClass: 'btn-blue',
                        keys: ['enter'],
                        action: function(){
                            if(value == "delete")
                            {
                                $.confirm({
                                title: 'Cảnh báo!',
                                content: 'Đây là hành động xóa dữ liệu. Dữ liệu sẽ mất vĩnh viễn. Bạn chắc chắn muốn xóa?',
                                buttons: {
                                            confirm: {
                                            text: 'Xác nhận',
                                            btnClass: 'btn-red',
                                            keys: ['enter'],
                                            action: function(){
                                                let url = $("#select-tacvu").parent().attr('action')+"/"+value;
                                                var json = JSON.stringify(array_id);
                                                $("input[name=array_id]").val(json);
                                                $("#select-tacvu").parent().attr("action",url);
                                                $("#select-tacvu").parent().submit();
                                            }
                                            },
                                            cancel: {
                                                text: 'Trở lại',
                                                keys: ['esc'],
                                                action: function(){
                                                    $("#select-tacvu").val("");
                                                }
                                            }
                                            }
                                        });
                            }
                            else
                            {
                                let url = $("#select-tacvu").parent().attr('action')+"/"+value;
                                var json = JSON.stringify(array_id);
                                $("input[name=array_id]").val(json);
                                $("#select-tacvu").parent().attr("action",url);
                                $("#select-tacvu").parent().submit();
                            }
                           
                        }
                        },
                        cancel: {
                            text: 'Trở lại',
                            keys: ['esc'],
                            action: function(){
                                $("#select-tacvu").val("");
                            }
                        }
                        }
                    });
       		 });
		
		
		//Xoa từng thể loại
		$(document).on('click','.xoa-nhom-dich',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tenNhomDich = " "+ data.tenNhomDich;
						$("#formXoaNhomDich #tenNhomDich").html(tenNhomDich);
						$("#formXoaNhomDich #maNhomDich").val(data.maNhomDich);
						$("#formXoaNhomDich #tenNhomDich").val(data.tenNhomDich);
						
					},
					error : function(error)
					{
						alert(error);
					}
				});
		});
		$(document).on('click','.cap-nhat-nhom-dich',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-nhom-dich/ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						$("#formSuaNhomDich #maNhomDich").val(data.maNhomDich);
						$("#formSuaNhomDich #tenNhomDich").val(data.tenNhomDich);
									
						if (data.trangThai == "1") {
							$("#formSuaNhomDich #trangThai1").prop("checked","true");
						} else
							$("#formSuaNhomDich #trangThai0").prop("checked","true");
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