<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản trị - Quản lý quyền người dùng</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý quyền người dùng</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<c:if test="${not empty mess}">
						<div class="alert alert-success">
							<ul>
								<li>${mess.status }</li>
								<li>${mess.name }</li>
							</ul>
						</div>
						<%
							request.getSession().removeAttribute("mess");
						%>
					</c:if>
				</div>
				<!--  Hiển thị mess = ['status'=> 'value','name'='value'] -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<form action="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro"
										method="get">
										<td><a
											href="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro"
											class="btn btn-warning" title="Trở lại"> <i
												class="fa  fa-arrow-left fa-1x"></i></a></td>
										<td><input class="form-control" type="text" name="search"
											placeholder="Nhập nội dung tìm kiếm"></td>
										<td><input class="btn btn-success" type="submit"
											value="Tìm kiếm">
									</form>

									<td><a href="" class="btn btn-primary" data-toggle="modal"
										data-target="#themmoi">Thêm Mới</a></td>
										<td><label
                                    class="btn btn-primary" id="btn-all">Chọn tất cả </label>        
                                </td>
									<td>
										<form action="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/select-all"
											method="Post">
											<input type="hidden" name="array_id" value=""> <select
												id="select-all" class="form-control" disabled>
												<option value="">Tùy chọn</option>
												<option value="enable">Kích hoạt</option>
												<option value="disable">Vô hiệu</option>
												<option value="delete">Xoá</option>
											</select>
										</form>

									</td>
									<td><label class="btn btn-danger" disabled>Hiện
											có: ${listRole.totalRecords} quyền người dùng </label></td>

								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
								  <th class="text-center">Chọn</th>
									<th>STT</th>
									<th>ID quyền người dùng</th>
									<th>Tên quyền người dùng</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listRole.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
									 <td class="text-center"><input type="checkbox" name="" id="${us.maRole}"></td>
										<td scope="row">${status.index + 1}</td>
										<td>${us.maRole}</td>
										<td>${us.tenRole}</td>
										<td class="center">
										<c:if test="${us.trangThai == true}">
											Enable
										</c:if>
										<c:if test="${us.trangThai == false}">
											Disable
										</c:if>
										</td>
										<td class="center">
										<form id="form${us.maRole}" action="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/xoa/${us.maRole}" method="post">
										 <a data-toggle="modal" id="${us.maRole}" data-target="#sua"
											class="btn btn-success btn-circle btn-sua"
											title="Chỉnh sửa vai trò"> <i class="fa  fa-edit"></i>
										</a>
										
										<a id="${us.maRole }"class="btn btn-danger btn-circle btn-xoa" title="Xóa vai trò"
										><i
												class="fa fa-close"></i></a>
										</form> 
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits ">
						<c:if test="${listRole.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listRole.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="?page=${page}" class="nav-item">${page}</a></li>
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
						<h4>Thêm quyền người dùng</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về quyền người dùng</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/insert"
									method="post">
									<div class="form-group">
										<label>Tên vai trò:</label> <input class="form-control"
											name="tenRole" placeholder="Nhập tên vai trò">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" placeholder="Nhập giới thiệu về vai trò">
									</div>
									<button type="submit" class="btn btn-primary">Thêm vai trò
									</button>
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
						<h4>Sửa quyền người dùng</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về quyền người dùng</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/edit"
									method="post">
									<div class="form-group">
										<label>Mã vai trò:</label> <input class="form-control"
											name="id" id="id" readonly>
									</div>
									<div class="form-group">
										<label>Tên vai trò: </label> <input class="form-control"
											name="tenRole" id="tenRole"
											placeholder="Nhập tên quyền người dùng">
									</div>
									<div class="form-group">
										<label>Giới thiệu</label> <input class="form-control"
											name="gioiThieu" id="gioiThieu"
											placeholder="Nhập giới thiệu quyền người dùngc">
									</div>
									<div class="form-group">

										<label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai1" value="1"> Enable
										</label> <label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai0" value="0"> Disable
										</label>

									</div>
									<button type="submit" class="btn btn-success">Sửa vai trò</button>
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
	<c:url var="home"
		value="${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/"
		scope="request" />
	<script>
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'.btn-sua',
											function() {
												let id = $(this).attr("id");
												$
														.ajax({
															url : "${pageContext.request.contextPath}/quan-tri/tai-khoan/vai-tro/ajax",
															type : "POST",
															dataType : "json",
															data : {
																id : id
															},
															success : function(
																	data) {
																$("#sua #id")
																		.val(id);
																$(
																		"#sua #tenRole")
																		.val(
																				data.tenRole);
																$(
																		"#sua #gioiThieu")
																		.val(
																				data.gioiThieu);
																if (data.trangThai == "1") {
																	$(
																			"#sua #trangThai1")
																			.prop(
																					"checked",
																					"true");
																} else
																	$(
																			"#sua #trangThai0")
																			.prop(
																					"checked",
																					"true");
															},
															error : function(
																	error) {
																alert(error);
															}
														});
											});
							 // Sự kiện xóa dữ liệu
					        $(document).on('click','a.btn-xoa',function(){
					            let id = $(this).attr('id');
					            $.confirm({
					            title: 'Cảnh báo!',
					            content: 'Xác nhận xóa quyền người dùng này?',
					            buttons: {
					                        confirm: {
					                        text: 'Xác nhận',
					                        btnClass: 'btn-blue',
					                        keys: ['enter'],
					                        action: function(){
					                           $('#form'+id).submit();
					                     
					                        }
					                        },
					                        cancel: {
					                            text: 'Trở lại',
					                            keys: ['esc'],
					                            action: function(){
					                            }
					                        }
					                        }
					                    });
					        });  
					        
					        // Var checkbox
					        var array_checkbox = $("input[type=checkbox]"); // Mảng các control checkbox
					        var array_value_checkbox = new Array(); // Mảng các id của quyền người dùng
					        var array_button = ['select-all']; // Mảng các control button
					        // Xử lí sự kiện khi click vào 1 checkbox
					        $(document).on('click','input[type=checkbox]',function(){
					            let id = $(this).attr('id');   // Lấy id của tac giả được  check
					            if(ClickCheckbox(this,array_checkbox,array_value_checkbox,array_button)) // Nếu checkbox được check
					            {
					                array_value_checkbox.push(id); // Thêm id của quyền người dùng vào arrray
					                
					            }
					            else
					            {
					                var index_checkbox_unchecked = array_value_checkbox.indexOf(id); // Tìm index của id quyền người dùng trong array
					                array_value_checkbox.splice(index_checkbox_unchecked,1); // Xóa id của quyền người dùng trong arrray theo index
					            } 

					        });
					        // Xử lí sự kiên khi click vào Button Chọn tất cả 
					        $("#btn-all").click(()=>{
					            CheckAll(array_checkbox,array_value_checkbox,array_button); // Check all checkbox
					           
					        });

					        // Xử lí sự kiện khi chọn 1 action trong select box
					        $("#select-all").change(()=>{
					            let value = $('#select-all').val();
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
					                                                let url = $("#select-all").parent().attr('action')+"/"+value;
					                                                var json = JSON.stringify(array_value_checkbox);
					                                                $("input[name=array_id]").val(json);
					                                                $("#select-all").parent().attr("action",url);
					                                                $("#select-all").parent().submit();
					                                            }
					                                            },
					                                            cancel: {
					                                                text: 'Trở lại',
					                                                keys: ['esc'],
					                                                action: function(){
					                                                    $("#select-all").val("");
					                                                }
					                                            }
					                                            }
					                                        });
					                            }
					                            else
					                            {
					                                let url = $("#select-all").parent().attr('action')+"/"+value;
					                                var json = JSON.stringify(array_value_checkbox);
					                                $("input[name=array_id]").val(json);
					                                $("#select-all").parent().attr("action",url);
					                                $("#select-all").parent().submit();
					                            }
					                           
					                            
					                        }
					                        },
					                        cancel: {
					                            text: 'Trở lại',
					                            keys: ['esc'],
					                            action: function(){
					                                $("#select-all").val("");
					                            }
					                        }
					                        }
					                    });




					            
					            
					        });

						});
		  ClickCheckbox = (e,array_checkbox,array_value_checkbox,array_button) =>{
		        if(e.checked) // Nếu checkbox được checked
		        {
		            EnableButton(array_button); // Enable các button
		            $("#btn-all").html('Hủy');// Đổi tên hiển thị của button
		            return true; 
		        }
		        else // Nếu checkbox được unchecked
		        {
		            if(!CheckArrayChecked(array_checkbox)) // Kiểm tra xem nếu tất cả checkbox đã được uncheck
		            {   
		                DisableButton(array_button); // Disable các button
		                $("#btn-all").html('Chọn tất cả');// Đổi tên hiển thị của button
		            }
		            return false;              
		        }
		    }
		    CheckArrayChecked = (array_checkbox) => {
		       for(let i = 0; i < array_checkbox.length; i++) // Duyệt mảng các control checkbox
		       {
		           if(array_checkbox[i].checked) return true; // Nếu có 1 checkbox được chọn thì trả về true
		       }
		        return false; // Nếu ko có checkbox nào ddc chọn hết thì về false   
		    }    
		    CheckAll = (array_checkbox,array_value_checkbox,array_button) => {
		        if(array_value_checkbox.length > 0) // Nếu mảng khác rỗng, tức là đã chọn tất cả 
		        {
		            for(let i = 0; i < array_checkbox.length; i++) // Duyệt mảng các control checkbox
		            {
		                array_checkbox[i].checked = false; // Gán về false (Gỡ check)
		                var index_checkbox_unchecked = array_value_checkbox.indexOf(array_checkbox[i].getAttribute("id")); // Tìm index của id quyền người dùng trong array 
		                array_value_checkbox.splice(index_checkbox_unchecked,1); // Xóa id của quyền người dùng trong arrray theo index
		                $("#btn-all").html('Chọn tất cả'); // Đổi tên hiển thị của button 
		            }
		            DisableButton(array_button);
		        }
		        else // Nếu mảng rỗng , tức là chưa chọn gì hết
		        {
		            for(let i = 0; i < array_checkbox.length; i++)// Duyệt mảng các control checkbox
		            {
		                array_value_checkbox.push(array_checkbox[i].getAttribute("id")); // Thêm id của quyền người dùng vào arrray
		                
		                array_checkbox[i].checked = true;  // Gán về true (check)
		            }
		            EnableButton(array_button);
		            $("#btn-all").html('Hủy');// Đổi tên hiển thị của button
		        }
		    }
		    DisableButton = (array_button) => {
		        for (let index = 0; index < array_button.length; index++) { // Duyệt mảng các button
		            $("#"+array_button[index]).attr('disabled','true'); // Enable button
		        }
		    }
		    EnableButton = (array_button) => {
		        for (let index = 0; index < array_button.length; index++) { // Duyệt mảng các button
		            $("#"+array_button[index]).removeAttr('disabled'); // Disable button
		        }
		    } 
		    ShowArray = (array) => {
		        for (let index = 0; index < array.length; index++) {
		            console.log(array[index]);    
		        }
		    }
	</script>
</body>

</html>