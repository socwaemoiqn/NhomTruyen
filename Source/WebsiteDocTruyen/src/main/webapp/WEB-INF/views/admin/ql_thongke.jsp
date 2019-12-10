<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
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
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>                            
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
											action="${pageContext.request.contextPath}/quan-tri/thong-ke/truyen/loc-thong-tin" method="get">
											<div style="float: left">
												<select
													id="select-tacvu" name="thong-ke" class="form-control" >
													<option value="">Thống kê</option>
													<option value="full" >Số lượng truyện Full</option>
													<option value="hot">Số lượng truyện Hot</option>
													<option value="news">Số lượng truyện News</option>
													<option value="search">Số lượng tìm kiếm truyện</option>
													<option value="#">Số lượng .</option>
												</select>
											</div>
											<div style="float: left; margin-left: 3%;">
												<select
													id="select-tacvu" name="thoi-gian" class="form-control" >
													<option value="">Thời gian</option>
													<option value="days">Ngày</option>
													<option value="weeks">Tuần</option>
													<option value="months">Tháng</option>
												</select>
											</div>
											<div style="float: left;margin-left: 1%; margin-top: 1%">
												or
											</div>
											<div style="float: left; margin-left: 1%;">
												<input class="form-control" name="begin" type="date" >		
											</div>
											<div style="float: left;margin-left: 1%; margin-top: 1%">
												to
											</div> 
											<div style="float: left; margin-left: 1%;">
												<input class="form-control" name="end" type="date" >
											</div>
											<div style="margin-left: 5%; float: left">
												<input class="btn btn-primary" type="submit"
													value="Lọc thông tin">
											</div>

										</form>
									</td>


									<td>
										<a href="" class="btn btn-danger">In báo cáo</a>
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
									<th>Tên Thể Loại</th>
									<th>Số lượng Truyện</th>
									<th>Trạng Thái</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listTheLoaiTruyen.list}" var="us"
									varStatus="status">
									<tr class="odd gradeX">
										<td>BÁO CÁO</td>
									</tr>
									<tr class="odd gradeX">
										<td style="width: 5%; text-align: center;">
											<div class="checkbox">
												<label> <input class="checkbox all" type="checkbox"
													name="check[]" id="${us.id }">
												</label>
											</div>
										</td>
										<td style=" padding-top:2%;">${status.index + 1}</td>
										<td style=" padding-top:2%;">${us.tenTheLoai}</td>
										<td style=" padding-top:2%;">
											<c:forEach items="${slTruyen}" var="sl">
												<c:if test="${sl.key==us.id }">
													${sl.value }
												</c:if>
											</c:forEach>
										</td>
										<td style=" padding-top:2%;">
											<c:if test="${us.trangThai == '1'}">
												Enable
											</c:if>
											<c:if test="${us.trangThai == '0'}">
												Disable
											</c:if>
										</td>
										<td style="width: 15%; text-align: center; padding-top:1%;">
											<a class="btn btn-primary btn-circle"
												title="Tất cả Truyện"
												href="${pageContext.request.contextPath}/quan-tri/abcd?id=${us.id}">
													<i class="fa fa-list-ul"></i>
											</a> 
											<a data-toggle="modal" data-target="#formSuaTheLoai"
												class="btn btn-success btn-circle cap-nhat-the-loai" title="Chỉnh sửa thể loại"
												id="${us.id}">
													<i class="fa  fa-edit"></i>
											</a> 
											<a class="btn btn-danger btn-circle xoa-the-loai" title="Xóa thể loại"  id="${us.id }"
											data-toggle="modal" data-target="#formXoaTheLoai">
												<i	class="fa fa-close"></i>
											</a>
										</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="grid_3 grid_5 agileits">
						<c:if test="${listTheLoaiTruyen.totalPages >1}">
							<div class="col-md-6">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listTheLoaiTruyen.navigationPages}"
											var="page">
											<c:if test="${page != -1 }">
												<li><a href="ql-the-loai-truyen?page=${page}"
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
	
	
	
	<script type="text/javascript">
		
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
		$(document).on('click','.xoa-the-loai',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-the-loai-truyen/ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						var tenTheLoai = " "+ data.tenTheLoai;
						$("#formXoaTheLoai #tenTheLoai").html(tenTheLoai);
						$("#formXoaTheLoai #idTheLoai").val(data.id);
						$("#formXoaTheLoai #tenTheLoai").val(data.tenTheLoai);
						
					},
					error : function(error)
					{
						alert(error);
					}
				});
		});
		$(document).on('click','.cap-nhat-the-loai',function() {
			let id = $(this).attr("id");
			$.ajax(
				{
					url : "${pageContext.request.contextPath}/quan-tri/ql-the-loai-truyen/ajax",
					type : "POST",
					dataType : "json",
					data : {id : id},
					success : function(data)
					{
						$("#formSuaTheLoai #idTheLoai").val(data.id);
						$("#formSuaTheLoai #tenTheLoai").val(data.tenTheLoai);
						$("#formSuaTheLoai #gioiThieu").val(data.gioiThieu);
									
						if (data.trangThai == "1") {
							$("#formSuaTheLoai #trangThai1").prop("checked","true");
						} else
							$("#formSuaTheLoai #trangThai0").prop("checked","true");
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