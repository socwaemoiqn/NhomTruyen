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
			<h1 class="page-header">Quản Lý - Truyện</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<c:if test="${not empty sessionScope.name_truyen}">
						<div class="alert alert-success alert-dismissible">
	                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	                       <h4> Đã xóa truyện:</h4>
	                        <c:forEach var="ten" items="${sessionScope.name_truyen}">
	                        	<h4> ${ten }</h4>  <br>
	                        </c:forEach>
	                    </div>
					</c:if>
					<c:if test="${not empty sessionScope.name_truyen_add}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <c:forEach var="tr" items="${sessionScope.name_truyen_add}">
                                	 Đã thêm truyện:
                                	  <a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/xem-truyen?idtruyen=${tr.key}" class="alert-link">${tr.value}</a>.
                                </c:forEach>
                               
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.tenTacGia}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <c:forEach var="tr" items="${sessionScope.tenTacGia}">
                                	 Đã thêm tác giả:
                                	  <a href="" class="alert-link">${sessionScope.tenTacGia}</a>.
                                </c:forEach>
                               
                           </div>
					</c:if>
					<c:if test="${not empty sessionScope.tuKhoa}">
                    	<div class="alert alert-info alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <c:forEach var="tr" items="${sessionScope.tuKhoa}">
                                	 Kết quả tìm kiếm cho từ khóa
                                	  <a href="" class="alert-link">${sessionScope.tuKhoa}</a>.
                                </c:forEach>
                               
                           </div>
					</c:if>
					
					<%
					        request.getSession().removeAttribute("name_truyen");
							request.getSession().removeAttribute("name_truyen_add");
							request.getSession().removeAttribute("tenTacGia");
							request.getSession().removeAttribute("tuKhoa");
					%>
					
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover"
							border="0">

							<tbody>
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen"
											class="btn btn-warning" title="Trở lại"> 
											<i class="fa  fa-arrow-left fa-1x"></i>
										</a>
									</td>
									<td>
										<form action="${pageContext.request.contextPath}/quan-tri/ql-truyen/tim-kiem/">
										<div style="float:left">	
											<input class="form-control" type="text" name="tu-khoa" placeholder="Nhập nội dung tìm kiếm">
										</div>
										<div style=" margin-left: 5%;float:left" >
											<input class="btn btn-primary" type="submit" value="Tìm kiếm" >
										</div>
										
										</form>
									</td>


									<td><a href="" id="themTruyen" class="btn btn-primary" data-toggle="modal"
										data-target="#themtruyen">Thêm Mới</a></td>
									<td>
										<button type="submit" class="btn btn-primary" id="select_all">Chọn
											tất cả</button> 
										<button type="submit" class="btn btn-info" id="disable_select_all" style="display: none;">Hủy chọn</button>
										
									</td>
									
                                     <td>
                                         <button type="submit" class="btn btn-success" id="btn_update" disabled="disabled">Cập nhật</button>
                                            
									 	<button type="submit" class="btn btn-danger" id="btn-delete" disabled="disabled"  data-toggle="modal"
										data-target="#formXoaALlTruyen" >Delete</button>
									</td>
									
									
									<td><a href="" class="btn btn-danger disabled">Hiện có
											: ${slt } truyện</a></td>

								</tr>
							</tbody>

						</table>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-truyen">
							<thead>
								<tr>
									<th>
										<!-- <input type="checkbox" id="select_all"> /> all -->
									</th>
									<th>STT</th>
									<th>Hình Ảnh</th>
									<th>Tên Truyện</th>
									<th>Tên Tác Giả</th>
									<th>Thể loại</th>
									<th>Số Chương</th>
									<th>Lượt Xem</th>
									<th>Truyện Full</th>
									<th>Truyện Hot</th>
									<th>Truyện New</th>
									<th>Hiển thị</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeA">
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label> <input class="checkbox all" type="checkbox" name="check[]" id="${us.ID }">
												</label>
											</div> 
										</td>
										<td scope="row">${status.index + 1}</td>
										<td style="width: 13%; text-align: center;"><img heigth="100px" width="100px"
											src="${pageContext.request.contextPath}/truyen/img/${us.hinhAnh}" />
										</td>
										<td>${us.tenTruyen}</td>
										<td class="center">${us.tenTacGia }</td>
										<td><c:forEach items="${tenTheLoai}" var="tl" varStatus="status">

												<c:if test="${us.ID == tl.maTruyen}">
													${tl.tenTheLoai},
												</c:if>
											</c:forEach></td>
										<td style="text-align: center">${us.soChuong }</td>
										<td style="text-align: center">${us.luotXem }</td>
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label>						
													<c:if test="${us.full == true }">
														<input class="checkbox full" type="checkbox" name="check_full[]" id="${us.ID }" checked> 					
													</c:if>
													<c:if test="${us.full == false }">
														<input class="checkbox full" type="checkbox" name="check_full[]" id="${us.ID }">
													</c:if>	
													
												</label>
											</div>
											
										</td>
											
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label> 
													<c:if test="${us.hot == true }">
														<input class="checkbox hot" type="checkbox" name="check_full[]" id="${us.ID }" checked>					
													</c:if>	
													<c:if test="${us.hot == false }">
														<input class="checkbox hot" type="checkbox" name="check_full[]" id="${us.ID }">					
													</c:if>	
												</label>
											</div>
										</td>
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label> 
													<c:if test="${us.news == true }">
														<input class="checkbox new" type="checkbox" name="check_full[]" id="${us.ID }" checked>			
													</c:if>	
													<c:if test="${us.news == false }">
														<input class="checkbox new" type="checkbox" name="check_full[]" id="${us.ID }" >			
													</c:if>	
												</label>
											</div>
										</td>
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label>	
													<c:if test="${us.hienThi == true }">
														<input class="checkbox show" type="checkbox" name="check_full[]" id="${us.ID }" checked>						
													</c:if>	
													<c:if test="${us.hienThi == false }">
														<input class="checkbox show" type="checkbox" name="check_full[]" id="${us.ID }" >						
													</c:if>															
												</label>
											</div>
											
										</td>
										<c:forEach items="${url}" var="url">
											<c:if test="${url.value==us.ID }">
												<td style="width: 9%; text-align: center;"><a
													class="btn btn-warning btn-circle" title="Xem trước"
													href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key}">
														<i class="fa fa-eye"></i>
												</a> <a class="btn btn-danger btn-circle delete-truyen" title="Xóa truyện" data-toggle="modal"
												data-target="#formXoaTruyen" id="${us.ID }">
														<i class="fa fa-close"></i>
												</a></td>
											</c:if>
										
										</c:forEach>
										
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listTruyen.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listTruyen.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql-truyen?page=${page}" class="nav-item">${page}</a></li>
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
	<div class="modal fade" id="themtruyen" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close fa-fw" style="color: red;"></i></button>
						<h4 class="modal-title" >Thêm truyện mới</h4>
						
					</div>
					<div class="panel-body">
						<h4>Nhập thông tin về truyện</h4>
						<div class="row">
							<div class="col-lg-12">
								<form:form modelAttribute="truyenAddForm"
									enctype="multipart/form-data"
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/insert"
									method="POST">
									<div class="form-group">
										<label>Tên truyện</label>
										<form:input path="tenTruyen" class="form-control"
											placeholder="Nhập tên truyện" id="tenTruyen"/>
										<div id="mess-f" style="display: none;" > <i class="fa fa-close fa-fw" style="color: red;"></i> Tên truyện bị trùng, xin nhập tên truyện khác!</div>
										<div id="mess-ss"style="display: none;" > <i class="fa  fa-check fa-fw" style="color: #4ae808; "></i> Tên truyện hợp lệ. </div>
									</div>
									<div class="form-group">
										<label>Hình Ảnh Về Truyện</label>
										<form:input path="hinhAnh" type="file" />
									</div>
									<div class="form-group">
										<label>Tác giả</label>
										<form:select path="maTacGia" class="form-control">
											<form:options items="${tacGia}" itemLabel="tenTacGia"
												itemValue="ID" />
										</form:select>
										<br>
										Nhấn
                                        <button data-dismiss="modal" type="button" class="btn btn-outline btn-success btn-sm"
                                        data-toggle="modal" data-target="#themtacgiamoi">
                                        Thêm tác giả
                                    	</button> 
                                   		 để thêm một tác giả mới.                  
									</div>
									<div class="form-group">
										<label>Thể Loại</label> (Nhấn Ctrl để chọn hơn một mục !)
										<form:select multiple="true" path="maTheLoai"
											class="form-control">
											<form:options items="${theLoai}" itemLabel="tenTheLoai"
												itemValue="id" />
										</form:select>
										<form:errors path="maTheLoai"/>
									</div>
									<div class="form-group">
										<label>Nguồn</label>
										<form:input path="nguon" class="form-control"
											placeholder="Nhập nguồn của truyện" id="nguon"/>
									<div id="mess-nguon"style="display: none;" > <i class="fa fa-close fa-fw" style="color: red; "></i> Nguồn không được bỏ trống. </div>
										
									</div>
									<div class="form-group">
										<label>Giới thiệu chung</label>
										<form:textarea path="gioiThieu" id="gioiThieu" class="form-control"
											placeholder="Nhập giới thiệu về truyện"/>
										<div id="mess-gioiThieu"style="display: none;" > <i class="fa  fa-close fa-fw" style="color: red; "></i> Giới thiệu không được bỏ trống. </div>
											
									</div>
									<button type="submit" id="btn-them-truyen" class="btn btn-primary" >Thêm
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
	
	<div class="modal fade" id="themtacgiamoi" tabindex="-1" role="dialog" >
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title" id="myModalLabel">Thêm mới tác giả</h4>
                 </div>
                 <div class="modal-body">
                     <form
						action="${pageContext.request.contextPath}/quan-tri/ql-truyen/them-tac-gia"
						method="post">
						<div class="form-group">
							<label>Tên tác giả truyện</label> <input class="form-control"
								name="tenTacGia" placeholder="Nhập tên tác giả truyện">
						</div>
						<div class="form-group">
							<label>Giới thiệu</label> <input class="form-control"
								name="gioiThieu" placeholder="Nhập giới thiệu về tác giả">
						</div>
						<button type="submit" class="btn btn-danger">Đồng ý</button>
						<button type="button" class="btn btn-warning"
							data-dismiss="modal">Hủy</button>
					</form>
                 </div>
             </div>
             <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
     </div>
	
	<div class="modal fade" id="formXoaTruyen" tabindex="-1" role="dialog" style="text-align: center;">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-red">

					<div class="panel-heading">
						<h3>Xóa truyện</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql-truyen/delete"
									method="post">
									<div class="form-group">
										<label>Bạn có chắc muốn xóa bỏ truyện: </label>
										<h4 id="tenTruyen"></h4>
									</div><!-- background: transparent; -->
									<input type="text" name="idTruyen" id="idTruyen"
									 style="width: 0px; height: 0px; border: none; background: transparent;" 
									 />
									<div class="form-group">
										<label>Nhấn "Đồng ý" để xác nhận xóa truyện và tất cả các chương của truyện.<br>
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
		
	<div class="modal fade" id="formXoaALlTruyen" tabindex="-1" role="dialog" style="text-align: center;">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-red">

					<div class="panel-heading">
						<h3>Xóa truyện</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								
								<div class="form-group">
									<label>Bạn có chắc muốn xóa bỏ các truyện đã chọn? </label>
									<h4 id="tenTruyen"></h4>
								</div>
								<div class="form-group">
									<label>Nhấn "Đồng ý" để xác nhận xóa tất cả các truyện đã chọn và tất cả các chương của truyện.<br>
									 Bạn có chắc chắn đây là lựa chọn của bạn!</label>
								</div>
								<button type="submit" class="btn btn-danger"  id="btn-dongy-delete">Đồng ý</button>
								<button type="button" class="btn btn-warning"
									data-dismiss="modal">Hủy</button>
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
	
		$(document).ready(function(){
		  $("#themtruyen #tenTruyen").blur(function(){
			  let ten = $(this).val();
			  $.ajax({
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/kiem-tra-ten",
					type: 'post',
					dataType: 'text',
					data: {
						ten: ten
					},
					success: function(result){
						
						if(result=='false'){
							
							document.getElementById("mess-f").style.display = 'block'; 
							document.getElementById("mess-ss").style.display = 'none'; 
							document.getElementById("btn-them-truyen").disabled = true; 
						}	
						else{
							document.getElementById("mess-f").style.display = 'none'; 
							document.getElementById("mess-ss").style.display = 'block'; 
							document.getElementById("btn-them-truyen").disabled = false;
						}
					}
				});
		  });
		  
		  $("#themtruyen #nguon").blur(function(){
				let nguon = $(this).val();
				if(nguon==""){
					document.getElementById("mess-nguon").style.display = 'block'; 
					document.getElementById("btn-them-truyen").disabled = true;
				}
				else{
					document.getElementById("mess-nguon").style.display = 'none'; 
					document.getElementById("btn-them-truyen").disabled = false;
				}
			});
			$("#themtruyen #gioiThieu").blur(function(){
				let nguon = $(this).val();
				if(nguon==""){
					document.getElementById("mess-gioiThieu").style.display = 'block'; 
					document.getElementById("btn-them-truyen").disabled = true;
				}
				else{
					document.getElementById("mess-gioiThieu").style.display = 'none'; 
					document.getElementById("btn-them-truyen").disabled = false;
				}
			});
		});
		document.getElementById("themTruyen").onclick = function() {
			document.getElementById("btn-them-truyen").disabled = true;
		};
	
	</script>
	

	<script type="text/javascript">
		// Chức năng chọn hết
		var array_id = new Array();
		document.getElementById("select_all").onclick = function() {
			// hiện nút xóa
			document.getElementById("btn-delete").disabled = false;
			// Lấy danh sách checkbox
			let checkboxes = document.getElementsByName('check[]');

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
			//disabeld nút xóa
			document.getElementById("btn-delete").disabled = true;
			
			// Lấy danh sách checkbox
			var checkboxes = document.getElementsByName('check[]');

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
		
		 
		 
		 var array_id_full = new Array();
		 var array_id_full_no_check= new Array();
		 //
		 var array_id_hot = new Array();
		 var array_id_hot_no_check= new Array();
		 //
		 var array_id_new = new Array();
		 var array_id_new_no_check= new Array();
		 //
		 var array_id_show = new Array();
		 var array_id_show_no_check= new Array();
		 //
		 $(document).ready(function(){
			
			 //lấy id của cột all
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
					document.getElementById("btn-delete").disabled = false;
					//console.log(array_id.length);
				});
			 // lấy id của cột truyện full
			 $(document).on("click",'.full',function(){
				 document.getElementById("btn_update").disabled = false;
					let id = $(this).attr('id');
					
					if(this.checked)
						{
							array_id_full.push(id);
			
							let index = array_id_full_no_check.indexOf(id);
							if(index==-1){
								index+=2;
							}
							//alert(index);
							array_id_full_no_check.splice(index,1);
						
						}
					else
						{
							array_id_full_no_check.push(id);
							let index = array_id_full.indexOf(id);
							if(index==-1){
								index+=2;
							}
							
							array_id_full.splice(index,1);
							//alert("n"+index);
						}
					//console.log("No full " +array_id_full_no_check.length);
					//console.log("+"+array_id_full.length);
				});
			 // lấy id của cột truyện hot
				$(document).on("click",'.hot',function(){
					document.getElementById("btn_update").disabled = false;
					let id = $(this).attr('id');
					if($(this).is(":checked"))
						{
							//....
							let index = array_id_hot_no_check.indexOf(id);
							if(index==-1){
								index+=2;
							}
							array_id_hot_no_check.splice(index,1);
							//...
							array_id_hot.push(id);
						}
					else
						{	//..
							array_id_hot_no_check.push(id);
							//...
							let index = array_id_hot.indexOf(id);
							if(index==-1){
								index+=2;
							}
							array_id_hot.splice(index,1);
						}	
					//console.log("no hot "+array_id_hot_no_check.length);
					//console.log("+ "+array_id_hot.length);		
				});
			 //lấy id của cột truyện new
				$(document).on("click",'.new',function(){
					document.getElementById("btn_update").disabled = false;
					let id = $(this).attr('id');
					if($(this).is(":checked"))
						{
							//..
							let index = array_id_new_no_check.indexOf(id);
							if(index==-1){
								index+=2;
							}
							array_id_new_no_check.splice(index,1);
							//..
							array_id_new.push(id);
						}
					else
						{	
							//...
							array_id_new_no_check.push(id);
							//..
							let index = array_id_new.indexOf(id);
							if(index==-1){
								index+=2;
							}
							array_id_new.splice(index,1);
						}
					//console.log("No new "+array_id_new_no_check.length);
					//console.log("+ "+array_id_new.length);
				});
				
			}); 
		 //lấy id của cột truyện show
			$(document).on("click",'.show',function(){
				document.getElementById("btn_update").disabled = false;
				let id = $(this).attr('id');
				if($(this).is(":checked"))
					{
						//..
						let index = array_id_show_no_check.indexOf(id);
						if(index==-1){
							index+=2;
						}
						array_id_show_no_check.splice(index,1);
						//..
						array_id_show.push(id);
					}
				else
					{	
						//...
						array_id_show_no_check.push(id);
						//..
						let index = array_id_show.indexOf(id);
						if(index==-1){
							index+=2;
						}
						array_id_show.splice(index,1);
					}
				//console.log("No show "+array_id_show_no_check.length);
				//console.log("+ "+array_id_show.length);
			});
			
		 // button cập nhật
			 document.getElementById("btn_update").onclick = function() {
					// Lấy danh sách checkbox
					var full = JSON.stringify(array_id_full);
					var full_unchecked = JSON.stringify(array_id_full_no_check);
					//
					var hot=JSON.stringify(array_id_hot);
					var hot_unchecked=JSON.stringify(array_id_hot_no_check);
					//
					var news = JSON.stringify(array_id_new);
					var news_unchecked=JSON.stringify(array_id_new_no_check);
					//
					var show = JSON.stringify(array_id_show);
					var show_unchecked=JSON.stringify(array_id_show_no_check);
					//
					$.ajax({
						url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/update-ajax",
						type: 'post',
						dataType: 'text',
						data: {
							full: full,
							full_unchecked: full_unchecked,
							hot: hot,
							hot_unchecked: hot_unchecked,
							news: news,
							news_unchecked: news_unchecked,
							show: show,
							show_unchecked: show_unchecked
						},
						success: function(result){
							//alert(result);
							location.reload();
						}
					});
				};
		// button xóa, theo lựa chọn
			document.getElementById("btn-dongy-delete").onclick = function() {
				// Lấy danh sách checkbox
				var json = JSON.stringify(array_id);
				$.ajax({
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/delete-ajax",
					type: 'post',
					dataType: 'text',
					data: {
						json: json
					},
					success: function(result){
						//alert(result);
						location.reload();
					}
				});
			};

	</script>
	<script>	
		$(document).ready(function() 
		{
			$(document).on('click','.delete-truyen',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-truyen/ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tenTruyen = " "+ data.tenTruyen;
						$("#formXoaTruyen #tenTruyen").html(tenTruyen);
						$("#formXoaTruyen #idTruyen").val(data.id);
						
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