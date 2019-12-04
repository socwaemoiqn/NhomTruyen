<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản trị - Quản lý chương của truyện: ${tenTruyen }</title>

<script
	src="${pageContext.request.contextPath}/template/admin/ckeditor_4/ckeditor.js"></script>
	
	
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý chương của truyện ${tenTruyen }</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<c:if test="${not empty sessionScope.capNhatChuong}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Cập nhật thông tin chương ${sessionScope.capNhatChuong} thành công !                              
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.xoaChuong}">
                    	<div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                Đã xóa: 
                                	  ${sessionScope.xoaChuong} thành công.
                           </div>
					</c:if>
					
					<c:if test="${sessionScope.mess == false}"> 
                    	<div class="alert alert-warning alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Cập nhật thông tin thành công !  <br>
                                	Xin kiểm tra lại thông tin của thể loại muốn sửa.                            
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.tacVu}">
							
						<div class="alert ${sessionScope.tacVu.css} alert-dismissible">
                         	  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                           	${sessionScope.tacVu.trangThai}                     
                   		</div>
					</c:if>
					<c:if test="${not empty sl}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
                                	Tìm thấy: ${sl} thể loại truyện .                              
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.themChuong}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>  
  
                                	 Thêm chương ${sessionScope.themChuong }thành công !                   
                                	                             
                           </div>
					</c:if>
					
					<c:if test="${not empty sessionScope.tuKhoa}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>  
   									Kết quả tìm kiếm cho từ khóa
                                	  <a href="" class="alert-link">${sessionScope.tuKhoa}</a>.
                           </div>
					</c:if>
					<%
					        request.getSession().removeAttribute("capNhatChuong");
						 	request.getSession().removeAttribute("xoaChuong");
							request.getSession().removeAttribute("tenTheLoaiMoi");
							request.getSession().removeAttribute("tacVu");
							request.getSession().removeAttribute("themChuong");
							request.getSession().removeAttribute("tuKhoa");
					%>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">
							<tbody>
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}"
										class="btn btn-warning" title="Trở lại"> <i
											class="fa  fa-arrow-left fa-1x"></i>
									</a></td>
									<td>
										<form
											action="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}">
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
										data-toggle="modal" data-target="#formThemChuong">Thêm Mới</a></td>
									<td>
										<button type="submit" class="btn btn-primary" id="select_all">Chọn
											tất cả</button>
										<button type="submit" class="btn btn-info"
											id="disable_select_all" style="display: none;">Hủy
											chọn</button>

									</td>

									<td>
										<form
											action="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}/tac-vu"
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
											${listChuongOfTruyen.totalRecords } Thể loại</button>
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
									<th>Chương</th>
									<th>Tiêu đề</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listChuongOfTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label> <input class="checkbox all" type="checkbox"
													name="check[]" id="${us.id }">
												</label>
											</div>
										</td>
										<td style=" padding-top:2%;">${status.index + 1}</td>
										<td style=" padding-top:2%;">
											<c:forEach items="${soChuong}" var="sc">
												<c:if test="${sc.key==us.id }">
													Chương ${sc.value }
												</c:if>
											</c:forEach>
										</td>
										<td style=" padding-top:2%;">${us.tieuDe}</td>
										
										<td style=" padding-top:2%;">
											<c:if test="${us.trangThai == '1'}">
												Enable
											</c:if>
											<c:if test="${us.trangThai == '0'}">
												Disable
											</c:if>
										</td>
										<td style="width: 15%; text-align: center; padding-top:1%;">
											
											<c:forEach items="${soChuong}" var="sc">
												<c:if test="${sc.key==us.id }">
													
													<a	class="btn btn-primary btn-circle" title="Xem trước"
													href="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}/chuong-${sc.value}">
														<i class="fa fa-eye"></i>
													</a>
													<a data-toggle="modal" data-target="#formSuaChuong"
														class="btn btn-success btn-circle cap-nhat-chuong" title="Chỉnh sửa thể loại"
														id="${us.id}">
															<i class="fa fa-edit"></i>
													</a> 
													<a class="btn btn-danger btn-circle xoa-chuong" title="Xóa thể loại"  id="${us.id }"
													data-toggle="modal" data-target="#formXoaChuong">
														<i	class="fa fa-close"></i>
													</a>
												</c:if>
											</c:forEach>
											
										</td>
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
										<c:forEach items="${listChuongOfTruyen.navigationPages}"
											var="page">
											<c:if test="${page != -1 }">
												<li><a href="${pathTenTruyen }?page=${page}"
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
	
	<div class="modal fade" id="formThemChuong" tabindex="-1" role="dialog">
		<div class="modal-dialog-editchuong">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close fa-fw" style="color: red;"></i></button>
						<h4 class="modal-title" >Thêm chương mới</h4>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}/them-chuong"
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
	<div class="modal fade" id="formSuaChuong" tabindex="-1" role="dialog">
		<div class="modal-dialog-editchuong">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-success">

					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close fa-fw" style="color: red;"></i></button>
						<h4>Chỉnh sửa thông tin chương: 
							<i id="tieuDe"></i>
						</h4>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen }/sua-chuong"
									method="post">
									<input type="text" name="idChuong" id="idChuong"
									style="width: 0px; height: 0px; border: none; background: transparent;">
									<div class="form-group">
										<label>Nhập lại tên chương</label>
										<input class="form-control" type="text" name="tieuDe" id="tieuDe"
											placeholder="Nhập tên chương">
									</div>
									<div class="form-group">
										<label>Nhập lại nội dung của chương</label> 
										<textarea name="noiDungSua" id="noiDungSua" rows="10" cols="80"  > 
										</textarea>
										<script>
											CKEDITOR.replace('noiDungSua');
										</script>
									</div>
									<div class="form-group">

										<label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai1" value="1"> Enable
										</label> <label class="radio-inline"> <input type="radio"
											name="trangThai" id="trangThai0" value="0"> Disable
										</label>

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
	
	<div class="modal fade" id="formXoaChuong" tabindex="-1" role="dialog" style="text-align: center;">
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
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}/xoa-chuong"
									method="post">
									<div class="form-group">
										<label>Bạn muốn xóa bỏ chương: </label>
										<h4 id="tieuDe"></h4>
									</div>
									<input type="text" name="idChuong" id="idChuong"
										style="width: 0px; height: 0px; border: none; background: transparent;" />
									<input type="text" name="tieuDe" id="tieuDe"
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
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/get-chuong-ajax",
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
		$(document).on('click','.xoa-chuong',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/get-chuong-ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tieuDe = " "+ data.tieuDe;
						$("#formXoaChuong #tieuDe").html(tieuDe);
						$("#formXoaChuong #idChuong").val(data.id);
						$("#formXoaChuong #tieuDe").val(data.tieuDe);
					},
					error : function(error)
					{
						alert(error);
					}
				});
		});
		$(document).on('click','.cap-nhat-chuong',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/get-chuong-ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tieuDe= " "+data.tieuDe;
						var noiDung= " "+data.noiDung;
						$("#formSuaChuong #tieuDe").html(tieuDe);
						$("#formSuaChuong #idChuong").val(data.id);
						$("#formSuaChuong #tieuDe").val(data.tieuDe);
						
						CKEDITOR.instances['noiDungSua'].setData(noiDung);
						
									
						if (data.trangThai == "1") {
							$("#formSuaChuong #trangThai1").prop("checked","true");
						} else
							$("#formSuaChuong #trangThai0").prop("checked","true");
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