<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm truyện</title>
</head>
<body>

	${loi}
	<div class="main">
	<div id="path">
			<i class="fa fa-home"></i> <span>Đọc truyện online, đọc truyện chữ, truyện full, truyện hay. Tổng hợp đầy đủ và cập nhật liên tục.
		</span></div>
		<div class="row">
			<div class="col-7" id="truyen-de-cu" style="overflow: hidden;">
				<div class="title">
					TRUYỆN ĐỀ CỬ <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<i class="fas fa-chevron-left fa-4x"></i>
					<c:forEach var="i" begin="1" end="2">
						<c:if test="${i == 1 }">
							<div id="content-item">
								<c:forEach items="${truyen}" var="tr" begin="0" end="2">
									<div class="item">
										<div class="item-status">
											<i class="fab fa-hotjar"></i> 
											<c:choose>
												<c:when test="${tr.full== true }">Full</c:when>
												<c:otherwise>Chương :${tr.soChuong }</c:otherwise>
											</c:choose>
											
										</div>
										<div class="item-title">
											<c:forEach items="${urlTruyen }" var="url">
												<c:if test="${url.value==tr.ID }">
													<a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }
												</c:if>
											</c:forEach>
											
										</div>
										<img
											src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" /></a>
									</div>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${i == 2 }">
						<div id="content-item2">
							<c:forEach items="${truyen}" var="tr" begin="3" end="5">			
									<div class="item">
										<div class="item-status">
											<i class="fab fa-hotjar"></i> 
											<c:choose>
												<c:when test="${tr.full==true }">Full</c:when>
												<c:otherwise>Chương :${tr.soChuong }</c:otherwise>
											</c:choose>
										</div>
										<div class="item-title">
											<c:forEach items="${urlTruyen }" var="url">
												<c:if test="${url.value==tr.ID }">
													<a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }</a>
												</c:if>
											</c:forEach>
										</div>
										<img
											src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" />
									</div>					
							</c:forEach>
							</div>
						</c:if>
					</c:forEach>
					<i class="fas fa-chevron-right fa-4x"></i>
				</div>
			</div>
			<div class="col-3" id="truyen-vua-doc">
				<div class="title">
					TRUYỆN VỪA ĐỌC <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table>

					<c:if test="${not empty array_readed }">
						<c:forEach items="${array_readed }" var="item">
							<tr>
							<td><a href="${pageContext.request.contextPath}/${item.urlTruyen}"><i
									class="fas fa-book-reader"></i> <span>${item["tenTruyen"] }</span><br>
									(Chương ${item["chuongHienTai"]})
								</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty array_readed }">
					<tr>
							<td style="padding: 14px 16px;text-align:center;height: 351px;"> Bạn chưa đọc truyện nào cả</td>
							</tr>
					</c:if>

					</table>
				</div>

			</div>
			<div class="col-7" id="truyen-moi-cap-nhat">
				<div class="title">
					TRUYỆN MỚI CẬP NHẬT <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table>
						<c:forEach items="${truyen}" var="tr" varStatus="status"  begin="0" end="15">

							<tr>
								<td><i class="fas fa-chevron-right"></i> 
									<c:forEach
										items="${urlTruyen}" var="url">
										<c:if test="${url.value==tr.ID }">
											<a href="${pageContext.request.contextPath}/${url.key}">
												${tr.tenTruyen }</a>
											<c:if test="${tr.full == true }">
												<span class="index-item-status" id="index-item-status-full">Full</span>
											</c:if>
											<c:if test="${tr.hot ==true }">
												 <span class="index-item-status" id="index-item-status-hot">Hot</span>
											</c:if>
											<c:if test="${tr.news ==true }">
												  <span class="index-item-status" id="index-item-status-new">New</span>
											</c:if>											
										</c:if>
									</c:forEach></td>
								<td>
									<a>${tr.theLoaiTruyen }</a>
								</td>
								<td>
								<c:forEach items="${urlTruyen}" var="url">
									<c:if test="${url.value==tr.ID }">
										<a href="${pageContext.request.contextPath}/${url.key}/chuong-${tr.soChuong}">
											Chương ${tr.soChuong }</a>
									</c:if>
								</c:forEach>
								
								</td>

								<td><c:set var="maTruyen" value="${tr.ID}" /> <c:forEach
										var="t" items="${truoc}">
										<c:if test="${t.key == tr.ID}">
											${t.value }
										</c:if>
									</c:forEach></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-3" id="the-loai-truyen">
				<div class="title">
					THỂ LOẠI TRUYỆN <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<c:forEach var="i" begin="1" end="${(sltl/12)+1}">
						<table class="list">
							<c:forEach items="${theLoaiTruyen}" var="tl" begin="${12*(i-1)}"
								end="${(12*i)-1}" varStatus="status" >
								<tr>
									<td>
									<c:forEach items="${urlTheLoai }" var="url">
										<c:if test="${url.value==tl.id }">
											<a href="${pageContext.request.contextPath}/the-loai/${url.key }">
												<strong>
												<c:if test="${status.index == 0 || status.index== 12}">
													<i class="far fa-star"></i>
												</c:if> 
												${tl.tenTheLoai }
												<span data-placeholder="${tl.tenTheLoai }"></span>
												</strong>
											</a>
										</c:if>
									</c:forEach>
										
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:forEach>
				</div>

			</div>
			<div class="col-10" id="truyen-da-hoan-thanh">
				<div class="title">
					TRUYỆN ĐÃ HOÀN THÀNH <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<c:forEach items="${truyenFull}" var="tr" begin="0" end="9">
						<div class="item">
							<div class="item-status">
								<i class="fab fa-hotjar"></i> Full
							</div>
							<div class="item-title">
								<c:forEach items="${urlTruyen }" var="url">
									<c:if test="${url.value== tr.ID }">
										<a href="${pageContext.request.contextPath}/${url.key}">${tr.tenTruyen }
									</c:if>
								</c:forEach>
								
							</div>
							<img src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" /></a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<!-- JS phần menu và responsive -->
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/menu-responsive.js"></script>
	<!-- JS phần menu và responsive -->
	<!-- JS phần index -->
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/index.js"></script>
	<!-- JS phần index -->
</body>
</html>