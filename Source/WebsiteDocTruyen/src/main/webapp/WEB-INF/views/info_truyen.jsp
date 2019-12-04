<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${truyenById.tenTruyen }</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/client/assets/css/info-truyen.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/client/assets/css/tool.css">
	<style>
		a:link {
		  text-decoration: none;
		}
		
		a:hover {
		  color: lightgreen;
		}
	.phan-trang{
			text-align:center;
			position: relative;
			min-height: 1px;
			padding-right: 15px;
			padding-left: 15px
		}
		.pagination {
			display: inline-block;
			padding-left: 0;
			margin: 20px 0;
			border-radius: 4px
		}
		
		.pagination>li {
			display: inline
		}
	</style>
		
</head>
<body>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i> Truyện <span class="path"> /</span> <span
				class="path-truyen">${truyenById.tenTruyen }</span>
		</div>
		<div class="row">
			<div class="col-7" id="thong-tin-truyen">
				<div class="title">
					<i class="fas fa-info-circle"></i> THÔNG TIN TRUYỆN
				</div>
				<div class="content">
					<div class="info-picture">
						<img src="${pageContext.request.contextPath}/truyen/img/${truyenById.hinhAnh}" />
						<div class="info-picture-content">
							Tác giả: <a href="${pageContext.request.contextPath}/tac-gia/${urlTacGia}"> ${truyenById.tenTacGia }</a> <br> 
							Thể loại: 
								<c:forEach items="${tenTheLoai}"
									var="tl">
									<c:if test="${truyenById.ID == tl.maTruyen}">
											${tl.tenTheLoai},
										</c:if>
								</c:forEach>
								<br> 
							Nguồn: ${truyenById.nguon } 
							<br> Trạng thái:
							<c:choose>
								<c:when test="${truyenById.full == true }"> Đã Full</c:when>
								<c:otherwise>Đang cập nhật</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="info-content">
						<div class="info-content-title">${truyenById.tenTruyen }</div>
						<hr>
						<div class="info-content-rate">
							<!-- <i class="fas fa-star"></i> -->
							<i id="icon-1" class="fas fa-star"></i> <i id="icon-2"
								class="fas fa-star"></i> <i id="icon-3" class="fas fa-star"></i>
							<i id="icon-4" class="fas fa-star"></i> <i id="icon-5"
								class="fas fa-star"></i> <i id="icon-6" class="fas fa-star"></i>
							<i id="icon-7" class="fas fa-star"></i> <i id="icon-8"
								class="fas fa-star"></i> <i id="icon-9" class="fas fa-star"></i>
							<i id="icon-10" class="fas fa-star"></i> <br> <span>Đánh
								giá: <b>6.4</b>/10 từ <b>${truyenById.luotXem} lượt</b>
							</span>

						</div>
						<div class="info-content-content">
							Nhóm dịch: <span id="nhomdich">${truyenById.tenNhomDich }</span>
							<br> ${truyenById.gioiThieu }
						</div>
					</div>
				</div>
			</div>
			<div class="col-3" id="truyen-vua-doc">
				<div class="title">
					TRUYỆN VỪA ĐỌC <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table>
						
							
							
						
						<tr>
							<td><a href="#"><i class="fas fa-book-reader"></i> Đế
									tôn <br> (Chương 203)</a></a></td>
						</tr>
						
					</table>
				</div>
			</div>
			<div class="col-3" id="truyen-cung-tac-gia">
				<div class="title">
					TRUYỆN CÙNG TÁC GIẢ <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					
					<table>
					<c:forEach items="${truyenCungTacGia}" var="tr" begin="0" end="2" >
						<tr>
							<td>
								<c:forEach items="${urlTruyen }" var="url">
									<c:if test="${url.value==tr.ID }">
										<a href="${pageContext.request.contextPath}/${url.key}">
											<i class="fas fa-book-reader"></i> ${tr.tenTruyen} <br>
											(Chương 1998)
										</a>
									</c:if>
								</c:forEach>
								
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-3" id="truyen-dang-hot">
				<div class="title">
					TRUYỆN ĐANG HOT <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table cellspacing="5">
						<tr>
							<td style="padding-left: 5%; padding-right: 5%;"><span
								class="type-time">Ngày</span><span class="type-time">Tháng</span><span
								class="type-time">Năm</span></td>
						</tr>
						<tr>
							<td><span class="index" id="one">1</span><span class="name"><a>Chọc
										tức vợ yêu - Mua tặng ...</a></span></td>
						</tr>
						<tr>
							<td><span class="index" id="two">2</span><span class="name"><a>Chọc
										tức vợ yêu - Mua tặng ...</a></span></td>
						</tr>
						<tr>
							<td><span class="index" id="three">3</span><span
								class="name">Chọc tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">4</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">5</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">6</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">7</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">8</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">9</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
						<tr>
							<td><span class="index" id="all">10</span><span class="name">Chọc
									tức vợ yêu - Mua tặng ...</span></td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="col-7" id="danh-sach-chuong">
				<div class="title">
					Chương mới cập nhật....
				</div>
				<div class="content">
					<div class="list-chuong" style="width: 100%">
						<table>
							<c:forEach items="${chuongMoi}" var="ch" varStatus="status" begin="0" end="4">
								<tr>
									<td><i class="fas fa-certificate"></i> 
										<c:forEach items="${urlChuong}" var="url">
											<c:if test="${url.key==ch.id}">
												<a href="${pageContext.request.contextPath}/${tenTruyen }/chuong-${url.value}">
													Chương ${url.value }:
													 ${ch.tieuDe }</a>
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>			
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-7" id="danh-sach-chuong">
				<div class="title">
					DANH SÁCH CHƯƠNG <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<div class="list-chuong">
						<table>


							<c:forEach items="${listChuong.list}" var="ch" varStatus="status" begin="0" end="4">
								<tr>
								<td><i class="fas fa-certificate"></i> 
									<c:forEach items="${urlChuong}" var="url">
										<c:if test="${url.key==ch.id}">
											<a href="${pageContext.request.contextPath}/${tenTruyen }/chuong-${url.value}">
												Chương ${url.value }:
												 ${ch.tieuDe }</a>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							</c:forEach>
							
							
						</table>
					</div>
					<div class="list-chuong">
						<table>
							<c:forEach items="${listChuong.list}" var="ch" varStatus="status" begin="5" end="9">
								<tr>
								<td><i class="fas fa-certificate"></i> 
									<c:forEach items="${urlChuong}" var="url">
										<c:if test="${url.key==ch.id}">
											<a href="${pageContext.request.contextPath}/${tenTruyen }/chuong-${url.value}">
												Chương ${url.value}:
												 ${ch.tieuDe }</a>
										</c:if>
									</c:forEach>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<c:if test="${listChuong.totalPages >1}">
							<div class="phan-trang">
								<nav>
									<ul class="pagination pagination-lg">
										<c:forEach items="${listChuong.navigationPages}" var="page">
											<c:if test="${page != -1 }">
												<li><a href="${tenTruyen }?page=${page}" class="nav-item">${page}</a></li>
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
			<div class="col-7" id="binh-luan"
				style="background: #fff; text-align: center;">
				<div class="title">
					<i class="fas fa-comments"></i> BÌNH LUẬN
				</div>
				<div class="content" style="padding: 5px;">
					<div class="fb-comments"
						data-href="http://localhost:5500/info-truyen.html"
						style="border: none; visibility: visible; width: 100%;"
						data-colorscheme="" data-width="" data-numposts="5"></div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/menu-responsive.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/info-truyen.js"></script>
	<!-- JS phần menu và responsive -->
</body>
</html>