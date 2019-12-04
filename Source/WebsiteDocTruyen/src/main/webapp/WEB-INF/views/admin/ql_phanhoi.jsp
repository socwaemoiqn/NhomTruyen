
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
			<h1 class="page-header">Quản lý Phản Hồi</h1>
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
						<%-- 		 <li>${mess.status }</li> --%>
								<li>${mess }</li>
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
									
										<td rowspan="2" style="vertical-align: middle;" class="text-center"><a
											href="${pageContext.request.contextPath}/quan-tri/phan-hoi"
											class="btn btn-warning" title="Trở lại"> <i
													class="fa  fa-arrow-left fa-1x"></i></a></td>
								
									
								
									<td><form id="form-search" action="${pageContext.request.contextPath}/quan-tri/phan-hoi"
										method="get">	<div class="form-group input-group ">
									
                                             <input class="form-control" type="text" name="search"
											placeholder="Nhập nội dung tìm kiếm">   
                                                    <span class="input-group-btn">
                                                         <input class="btn btn-success" type="submit"
											value="Tìm kiếm">
                                                    </span>
                                                </div>	</td>
										<td><label
                                    class="btn btn-primary pull-right">Hiển thị theo: </label></td>
									<td>		<select id="select-type" name="type"
												 class="form-control">
												<option value="new">Mới nhất</option>
												<option value="readed">Đã đọc</option>
												<option value="unread">Chưa đọc</option>
											</select> </td>
									<td>
									<select id="select-subject" name="subject"
											 class="form-control">
												<option value="all">Tất cả</option>
												<option value="ads">Quảng cáo</option>
												<option value="error">Báo lỗi</option>
												<option value="feedback">Góp ý</option>
												<option value="other">Khác</option>
											</select>
										</td></form>
								</tr>
								<tr style="background-color:#f9f9f9;">
										<td></td>
									<td><span
                                    class="btn btn-primary pull-right" id="btn-all">Chọn tất cả </span>        
                                </td>
									<td>
										<form action="${pageContext.request.contextPath}/quan-tri/phan-hoi/select-all"
											method="Post">
											<input type="hidden" name="array_id" value=""> <select
												id="select-all" class="form-control" disabled>
												<option value="">Tùy chọn</option>
												<option value="delete">Xoá</option>
											</select>
										</form>

									</td>
								
										<td class="text-center" style="vertical-align: middle;"><label class="btn btn-danger" disabled>Hiện
											có: ${listPhanHoi.totalRecords} Phản Hồi </label></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
								  <th class="text-center">Chọn</th>
									<th>STT</th>
									<th>Thời gian</th>
									<th>Chủ đề</th>
									<th>Tên người gửi</th>
									<th>Email</th>
									<th>Tình trạng</th>
									<th></th>	
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listPhanHoi.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
									 <td class="text-center"><input type="checkbox" name="" id="${us.maPhanHoi}"></td>
										<td scope="row">${status.index + 1}</td>
										<td>${us.ngayTao}</td>
										<td>${us.chuDe}</td>
										<td class="center">${us.tenNguoiGui}</td>
										<td class="center">${us.email }
										</td>
										<td><label id="daXem${us.maPhanHoi }">	<c:if test="${us.daXem == true}">
										<span class="badge badge-success" style="background-color: #5cb85c;">Đã xem</span>
										</c:if>
										<c:if test="${us.daXem == false }">
											<span class="badge badge-secondary">Chưa xem</span>
										</c:if></label>
										</td>
										<td class="center">
										<form id="form${us.maPhanHoi}" action="${pageContext.request.contextPath}/quan-tri/phan-hoi/xoa/${us.maPhanHoi}" method="post">
										<a class="btn btn-success btn-circle btn-xem"
											title="Xem"
											href="" data-toggle="modal" id="${us.maPhanHoi}" data-target="#xem">
												<i class="fa fa-eye"></i>
										</a>
										
										<a id="${us.maPhanHoi }"class="btn btn-danger btn-circle btn-xoa" title="Xóa danh mục"
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
						<c:if test="${listPhanHoi.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listPhanHoi.navigationPages}" var="page">
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

	<div class="modal fade" id="xem" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4>Nội dung phản hồi</h4>
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về Phản Hồi Truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/phan-hoi/edit"
									method="post">
									<div class="form-group">
										<label>Mã Phản Hồi:</label> <input class="form-control"
											name="maPhanHoi" id="id" readonly>
									</div>
									<div class="form-group">
										<label>Chủ đề:</label> <input class="form-control"
											name="chuDe" id="chuDe"
											placeholder="Chủ đề" readonly>
									</div>
									<div class="form-group">
										<label>Nội dung</label>
										 <textarea style="pointer-events:none;" class="form-control" name="noiDung" id="noiDung" rows="10" placeholde="Nội dung phản hồi">
										 </textarea>
									</div>
									<a class="btn btn-danger pull-right btn-xoa">Xóa</a>
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
		value="${pageContext.request.contextPath}/quan-tri/phan-hoi/"
		scope="request" />
	<script>
	window.onload = () => {
		let select_type = localStorage.getItem("select-type") != null ? localStorage.getItem("select-type") : "new";
		let select_subject = localStorage.getItem("select-subject") != null ? localStorage.getItem("select-subject") : "all";
		SetValueToSelect("select-type",select_type);
		SetValueToSelect("select-subject",select_subject);
	}
		$(document)
				.ready(
						function() {
							$(document)
									.on(
											'click',
											'.btn-xem',
											function() {
												let id = $(this).attr("id");
												$
														.ajax({
															url : "${pageContext.request.contextPath}/quan-tri/phan-hoi/ajax",
															type : "POST",
															dataType : "json",
															data : {
																id : id
															},
															success : function(
																	data) {
																$("#xem #id")
																		.val(id);
																$(
																		"#xem #chuDe")
																		.val(
																				data.chuDe);
																$(
																		"#xem #noiDung")
																		.val(
																				data.noiDung	);
																$("#daXem"+id+" span").css("background-color","#5cb85c"); 
																$("#daXem"+id+" span").text("Đã xem");
															}
														});
											});
							 // Sự kiện xóa dữ liệu
					        $(document).on('click','a.btn-xoa',function(){
					            let id = $(this).attr('id') != null ? $(this).attr('id') : $("#xem #id").val();
					            $.confirm({
					            title: 'Cảnh báo!',
					            content: 'Xác nhận xóa Phản Hồi này?',
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
					        var array_value_checkbox = new Array(); // Mảng các id của Phản Hồi
					        var array_button = ['select-all']; // Mảng các control button
					        // Xử lí sự kiện khi click vào 1 checkbox
					        $(document).on('click','input[type=checkbox]',function(){
					            let id = $(this).attr('id');   // Lấy id của tac giả được  check
					            if(ClickCheckbox(this,array_checkbox,array_value_checkbox,array_button)) // Nếu checkbox được check
					            {
					                array_value_checkbox.push(id); // Thêm id của Phản Hồi vào arrray
					                
					            }
					            else
					            {
					                var index_checkbox_unchecked = array_value_checkbox.indexOf(id); // Tìm index của id Phản Hồi trong array
					                array_value_checkbox.splice(index_checkbox_unchecked,1); // Xóa id của Phản Hồi trong arrray theo index
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
					        $("#select-type").change(()=>{
					        	localStorage.setItem("select-type",$("#select-type").val());
					        	 ShowBy("type",$("#select-type").val());
					        });
					        $("#select-subject").change(()=>{
					        	localStorage.setItem("select-subject",$("#select-subject").val());
					        	 ShowBy("subject",$("#select-subject").val());
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
		                var index_checkbox_unchecked = array_value_checkbox.indexOf(array_checkbox[i].getAttribute("id")); // Tìm index của id Phản Hồi trong array 
		                array_value_checkbox.splice(index_checkbox_unchecked,1); // Xóa id của Phản Hồi trong arrray theo index
		                $("#btn-all").html('Chọn tất cả'); // Đổi tên hiển thị của button 
		            }
		            DisableButton(array_button);
		        }
		        else // Nếu mảng rỗng , tức là chưa chọn gì hết
		        {
		            for(let i = 0; i < array_checkbox.length; i++)// Duyệt mảng các control checkbox
		            {
		                array_value_checkbox.push(array_checkbox[i].getAttribute("id")); // Thêm id của Phản Hồi vào arrray
		                
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
		    ShowBy = (key,value) => {
		    	let url = location.href; 
		    	if(!url.includes("/search"))
		    	{
		    		if(url.charAt(url.length-1) == "/")
		    			url += "search";
		    		else
		    			url += "/search";
		    	}
		    	if(!url.includes(key))
		    	{
		    		if(url.includes("key"))
		    			location.href = url+"&"+key+"="+value;
		    		else
		    			location.href = url+"?key=&"+key+"="+value;
		    	}
		    	else
		    		{
		    			let array = url.split("&");
		    			for(let i = 0; i < array.length ; i++)
		    			{
		    				if(array[i].includes(key))
		    					{
		    						array.splice(i,1);
		    						url = "";
		    						for(let j = 0; j < array.length ; j++)
		    		    			{
		    							url += array[j]+"&";
		    		    			}
		    						url += key+"="+value;
		    						break;
		    					}	
		    			}
		    			location.href = url; 
		    			
		    		}
		    		
		    			
		    }
		    SetValueToSelect = (idSelect,value) => {
		    	$("#"+idSelect).val(value);
		    }
	</script>
</body>

</html>