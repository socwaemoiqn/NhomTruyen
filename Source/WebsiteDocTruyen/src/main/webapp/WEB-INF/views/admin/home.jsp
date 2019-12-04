<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Trị</title>
</head>
<body>
	<div class="col-lg-12">
		<h1 class="page-header">Nhóm truyên</h1>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-blue">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-book fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${slt}</div>
							<div>Truyện</div>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen">
					<div class="panel-footer">
						<span class="pull-left">Xem chi tiết</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-green">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-users fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">---</div>
							<div>Nhóm dịch</div>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/#">
					<div class="panel-footer">
						<span class="pull-left">Xem chi tiết</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-yellow">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-tachometer fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${slNoFull }</div>
							<div>Truyện đang viết</div>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/ql-truyen/trangthai">
					<div class="panel-footer">
						<span class="pull-left">Xem chi tiết</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-6">
			<div class="panel panel-red">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="fa fa-comments-o fa-5x"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">${slPH }</div>
							<div>Phản hồi</div>
						</div>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/quan-tri/phan-hoi">
					<div class="panel-footer">
						<span class="pull-left">Xem chi tiết</span> <span
							class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">Top truyện có lượt xem trong ngày</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div id="morris-area-chart">

						<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>Truyện</th>
									<th>Tác giả</th>
									<th>Thể loại</th>
									<th>Lượt xem</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="tr" items="${topTruyen }" begin="0" end="9" varStatus="index">
									<tr>
										<td>${index.index+1 }</td>
										<td>
											<c:forEach items="${listUrl}" var="url">
												<c:if test="${url.value==tr.ID }">
													<a
														title="Xem trước"
														href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key}">
															${tr.tenTruyen}
													</a> 
												</c:if>
											</c:forEach>
										</td>
										<td>
											${tr.tenTacGia }
										</td>
										<td>
											<c:forEach items="${tenTheLoai}" var="tl" varStatus="status">

												<c:if test="${tr.ID == tl.maTruyen}">
													${tl.tenTheLoai},
												</c:if>
											</c:forEach>
										</td>
										<td>${tr.luotXem }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Top truyện mới trong ngày</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				<table class="table">
							<thead>
								<tr>
									<th></th>
									<th>Truyện</th>
									<th>Tác giả</th>
									<th>Thể loại</th>
									<th>Lượt xem</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="tr" items="${listNewsTruyen }" begin="0" end="9" varStatus="index">
									<tr>
										<td>${index.index+1 }</td>
										<td>
											<c:forEach items="${listUrl}" var="url">
												<c:if test="${url.value==tr.ID }">
													<a
														title="Xem trước"
														href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key}">
															${tr.tenTruyen}
													</a> 
												</c:if>
											</c:forEach>
										</td>
										<td>
											${tr.tenTacGia }
										</td>
										<td>
											<c:forEach items="${tenTheLoai}" var="tl" varStatus="status">

												<c:if test="${tr.ID == tl.maTruyen}">
													${tl.tenTheLoai},
												</c:if>
											</c:forEach>
										</td>
										<td>
											${tr.luotXem }
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-clock-o fa-fw"></i> Truyện Full trong tuần
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="timeline">
					
					<c:forEach var="tr" begin="0" end="9" items="${listFullTruyen}" varStatus="i" >
						<c:choose>
							<c:when test="${i.index % 2 == 0 }">
								<li>
									<div class="timeline-badge warning">
										${i.index+1}
										
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h4 class="timeline-title">
												<c:forEach items="${listUrl }" var="url">
													<c:if test="${url.value== tr.ID }">
														<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key }">${tr.tenTruyen }</a>
													</c:if>
												</c:forEach>
												
											</h4>
		
											<p>
												<small class="text-muted"><i class="fa fa-clock-o"></i>
													<c:forEach items="${ngayTruoc }" var="nt">
														<c:if test="${nt.key == tr.ID }">
															${nt.value }
														</c:if>
													</c:forEach>
												 </small>
											</p>
										</div>
										<div class="timeline-body">
											<p style="float:left; margin-right: 10px;">
												<img height="120px" width="90px" src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" />
											</p>
											<p>
												${tr.gioiThieu }
											</p>
											<h4>
												<c:forEach items="${listUrl }" var="url">
													<c:if test="${url.value== tr.ID }">
														<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key }">Xem chi tiết...</a>
													</c:if>
												</c:forEach>
											</h4>
										</div>
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<li class="timeline-inverted">
									<div class="timeline-badge info">
										${i.index+1}
									</div>
									<div class="timeline-panel">
										<div class="timeline-heading">
											<h4 class="timeline-title">
												<c:forEach items="${listUrl }" var="url">
													<c:if test="${url.value== tr.ID }">
														<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key }">${tr.tenTruyen }</a>
													</c:if>
												</c:forEach>
											</h4>
		
											<p>
												<small class="text-muted"><i class="fa fa-clock-o"></i>
													<c:forEach items="${ngayTruoc }" var="nt">
														<c:if test="${nt.key == tr.ID }">
															${nt.value } by ${tr.tenTacGia }
														</c:if>
													</c:forEach>
												</small>
											</p>
										</div>
										<div class="timeline-body">
											<p style="float:left; margin-right: 10px;">
												<img height="120px" width="90px" src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" />
											</p>
											<p>
												${tr.gioiThieu }
											</p>
											<h4>
												<c:forEach items="${listUrl }" var="url">
													<c:if test="${url.value== tr.ID }">
														<a href="${pageContext.request.contextPath}/quan-tri/ql-truyen/${url.key }">Xem chi tiết...</a>
													</c:if>
												</c:forEach>
											</h4>
										</div>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
					</ul>
				</div>
				<!-- /.panel-body -->
			</div>
		</div>

		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bell fa-fw"></i>Thông báo

				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="list-group">
						<a href="#" class="list-group-item"> <i
							class="fa fa-comment fa-fw"></i>Tin Nhắn Phản Hồi Mới <span
							class="pull-right text-muted small">4</span>
						</a>
						 <a href="#" class="list-group-item"> <i
							class="fa fa-envelope fa-fw"></i>Tin Nhắn Mới <span
							class="pull-right text-muted small">2</span>
						</a>
						 <a href="#" class="list-group-item"> <i
							class="fa fa-tasks fa-fw"></i>Công Việc <span
							class="pull-right text-muted small">abcd</span>
						</a>
						 <a href="#" class="list-group-item"> 
						 	<i	class="fa fa-upload fa-fw"></i>Server Rebooted <span
							class="pull-right text-muted small"><em>11:32 AM</em> </span>
						</a>
						 <a href="#" class="list-group-item"> <i
							class="fa fa-bolt fa-fw"></i>Server Crashed! <span
							class="pull-right text-muted small">11h</span>
						</a> 
						<a href="#" class="list-group-item"> <i
							class="fa fa-warning fa-fw"></i>Server Not Responding <span
							class="pull-right text-muted small">10h </span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>