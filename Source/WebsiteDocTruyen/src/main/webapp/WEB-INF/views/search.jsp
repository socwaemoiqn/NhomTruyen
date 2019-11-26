<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=Utf8"
	pageEncoding="Utf8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/info-truyen.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/search.css">
<style>
		a:link {
		  text-decoration: none;
		}
		
		a:hover {
		  color: lightgreen;
		}</style>
</head>
<body>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i> Truyện <span class="path">/</span> <span
				class="path-search">Tìm kiếm </span> <span class="path"> </span> 
		</div>
		<div class="row">
			<div class="col-7" id="tim-kiem-truyen">
				<div class="title">
					<i class="fas fa-search"></i> TÌM TRUYỆN VỚI TỪ KHOÁ: ${tuKhoa}
				</div>
				<div class="content">
					<c:if test="${empty listTruyenSearch}">
						<div class="search-item">
								<div class="search-item-infor">
									<span class="search-item-infor-name"> 
										<b> 
											<a>
												<i class="fas fa-book"></i> Không tìm thấy truyện nào có tên: ${tuKhoa }  
											</a> 
										</b>
									</span>
								</div>
						</div>
					</c:if>
					<c:forEach items="${listTruyenSearch}" var="tr">
						<div class="search-item">
							<div class="search-item-picture">
								<img
									src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" />
							</div>
							<div class="search-item-infor">
								<span class="search-item-infor-name"> <b> <a href="#"><i
											class="fas fa-book"></i> ${tr.tenTruyen }</a> 
											<c:if test="${tr.full= true }">
												<span class="index-item-status" id="index-item-status-full">Full</span>
											</c:if>
											<c:if test="${tr.hot==true }">
												 <span class="index-item-status" id="index-item-status-hot">Hot</span>
											</c:if>
											<c:if test="${tr.news==true }">
												  <span class="index-item-status" id="index-item-status-new">New</span>
											</c:if>		
								</b> <br> <i class="fas fa-pencil-alt"></i> ${tr.tenTacGia }
								</span> <span class="search-item-infor-chuong"><a href="#">Chương
										${tr.soChuong }</a></span>
							</div>
						</div>
					</c:forEach>
					
					
				</div>
			</div>
			<div class="col-3" id="description-search">
				<div class="content">
					<table>
						<tr>
							<td>Danh sách truyện có liên quan tới từ khoá <span>${tuKhoa}</span></td>
						</tr>
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
								end="${(12*i)-1}" varStatus="status">
								<tr>
									<td><c:forEach items="${urlTheLoai }" var="url">
											<c:if test="${url.value==tl.id }">
												<a
													href="${pageContext.request.contextPath}/the-loai/${url.key }">
													<strong> <c:if
															test="${status.index == 0 || status.index== 12}">
															<i class="far fa-star"></i>
														</c:if> ${tl.tenTheLoai } <span
														data-placeholder="${tl.tenTheLoai }"></span>
												</strong>
												</a>
											</c:if>
										</c:forEach></td>
								</tr>
							</c:forEach>
						</table>
					</c:forEach>
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
								class="type-time type-time-unactive">Ngày</span> <span
								class="type-time type-time-unactive">Tháng</span> <span
								class="type-time type-time-active">Năm</span></td>
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
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/template/client/assets/js/info-truyen.js"></script>
</body>
</html>