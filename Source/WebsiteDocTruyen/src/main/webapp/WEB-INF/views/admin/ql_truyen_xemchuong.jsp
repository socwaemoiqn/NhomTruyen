<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Quản lý</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h3>Chương: ${tieuDe }</h3> </div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#home"> Nội
								dung</a></li>

						<p style="float: right;">
							<a href="" class="btn btn-success" data-toggle="modal"
								data-target="#editChuong">Chỉnh Sửa Nội Dung Chương</a>
						</p>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">


							<h3>${noiDung}</h3>

						</div>
					</div>

					<div class="tab-content">
						<div class="tab-pane fade" id="home"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="editChuong" tabindex="-1" role="dialog">
		<div class="modal-dialog-editchuong">
			<!-- Modal content-->
			<div class="col-lg-12">
				<div class="panel panel-success">

					<div class="panel-heading">
						<h3>Chỉnh sửa thông tin chương: ${tieuDe }</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form
									action="${pageContext.request.contextPath}/quan-tri/ql_truyen/xem_chuong/editChuong?idChuong=${id}"
									method="post">
									<div class="form-group">
										<label>Nhập lại tên chương</label>
										<input class="form-control" type="text" name="ten"
											placeholder="Nhập tên chương">
									</div>
									<div class="form-group">
										<label>Nhập lại nội dung của chương</label> <textarea name="noidung" id="noidung" >${noiDung}</textarea>
										 <script>
											CKEDITOR.replace('noidung');
											CKEDITOR.addCss('form-control')
										</script>
									</div>
									<button type="submit" class="btn btn-success">Đồng ý</button>
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
</body>
</html>


