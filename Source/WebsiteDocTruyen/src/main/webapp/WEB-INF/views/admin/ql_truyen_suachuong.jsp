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
				<div class="panel-heading">Sửa Chương ${tieuDe }</div>
				<div class="panel-body">
					<div class="table-responsive">

						<form action="${pageContext.request.contextPath}/quan-tri/ql_truyen/ql_chuong/editChuong?idChuong=${id}" method="Post">
							<table class="table table-striped table-bordered table-hover"
								border="0">
								<tbody>
									<tr >
										<td><input class="form-control" type="text"
											placeholder="Nhập tên chương"></td>


									</tr>
									<tr>
										<td><textarea name="noidung" id="noidung" >${noiDung}</textarea>
										 <script>
											CKEDITOR.replace('noidung');
											CKEDITOR.addCss('form-control')
										</script></td>
									</tr>
									
									<tr>
										<td><button type="submit" class="btn btn-primary">Sửa
										chương</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>