<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chương ${chuong.tieuDe} của truyện ${tenTruyen }</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Chương ${chuong.tieuDe}</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					
						<a style="float: left; margin-right: 10px"
							href="${pageContext.request.contextPath}/quan-tri/ql-truyen/ql-chuong/${pathTenTruyen}"
							class="btn btn-warning" title="Trở lại"> <i
							class="fa  fa-arrow-left fa-1x"></i>
						</a>
					
					<h4>
						Chương: ${chuong.tieuDe }
						</h3>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="active"><a href="#home"> Nội dung</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">


							<h3>${chuong.noiDung}</h3>

						</div>
					</div>

					<div class="tab-content">
						<div class="tab-pane fade" id="home"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


