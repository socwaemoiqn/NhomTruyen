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
			min-height: 1px;
			padding-right: 15px;
			padding-left: 15px;

		}
		.pagination {
			display: inline-block;
			padding-left: 0;
			margin: 0;
			border-radius: 4px
		}
		
.pagination li{
display: inline;}
		.pagination li a{
			border: 1px solid;
			display: inline-block;
			padding: 5px 10px;
		}
	</style>
		
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=969730360057516&autoLogAppEvents=1"></script>
	<div class="main">
			<div id="path">
			<i class="fa fa-home"></i><a href="${pageContext.request.contextPath}/">Truyện </a> <span class="path"> /</span> <span
				class="path-truyen"><a>${truyenById.tenTruyen }</a></span>
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
							<span>Tác giả</span>: <a href="${pageContext.request.contextPath}/tac-gia/${urlTacGia}"> ${truyenById.tenTacGia }</a> <br> 
							<span>Thể loại</span>: 
								<c:forEach items="${tenTheLoai}"
									var="tl">
									<c:if test="${truyenById.ID == tl.maTruyen}">
											${tl.tenTheLoai},
										</c:if>
								</c:forEach>
								<br> 
							<span>Nguồn</span>: ${truyenById.nguon } <br> 
							<span>Trạng thái</span>:
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
							<span>Nhóm dịch</span>: <span id="nhomdich">${truyenById.tenNhomDich }</span>
							<br> ${truyenById.gioiThieu }
						</div>
							<div class="col-10" id="danh-sach-chuong">
				<div class="title">
					Chương mới cập nhật
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
					</div>
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
									class="fas fa-book-reader"></i><span>${item["tenTruyen"] }</span> <br>
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
											<i class="fas fa-book-reader"></i> <span>${tr.tenTruyen} <br></span>
										
											</a>
											<span class="so-chuong">(Chương ${tr.soChuong })</span>
									</c:if>
								</c:forEach>
								
							</td>
						</tr>
					</c:forEach>
					</table>
				</div>
			</div>

			<div class="col-7" id="danh-sach-chuong">
				<div class="title">
					DANH SÁCH CHƯƠNG <i class="fas fa-arrow-circle-down"></i><span>Số chương: ${listChuong.totalRecords	 }</span>
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
										<c:if test="${listChuong.currentPage > 1}">
											<li><a href="${tenTruyen }?page=${listChuong.currentPage-1}">Trước</a></li>
										</c:if>	
										<c:forEach items="${listChuong.navigationPages}" var="page">
											<c:if test="${page == listChuong.currentPage }">
												<li><a>${page}</a></li>
											</c:if>
											<c:if test="${page != -1 && page != listChuong.currentPage}">
												<li><a href="${tenTruyen }?page=${page}" class="nav-item">${page}</a></li>
											</c:if>
											<c:if test="${page == -1 }">
												<li><a><span> ... </span></a></li>
											</c:if>
										</c:forEach>
										<c:if test="${listChuong.currentPage < listChuong.totalPages}">
											<li><a href="${tenTruyen }?page=${listChuong.currentPage+1}">Sau</a></li>
										</c:if>
										
									</ul>
								</nav>
							</div>
						</c:if>
			</div>
			
				<div class="col-3" id="truyen-dang-hot">
				<div class="title">
					TRUYỆN ĐANG HOT <i class="fas fa-arrow-circle-down"></i>
				</div>
				<div class="content">
					<table cellspacing="5">
					<thead>
						<tr>
							<td style="padding-left: 5%; padding-right: 5%;"><span
								class="type-time" id="day">Ngày</span>
								<span class="type-time" id="month">Tháng</span><span
								class="type-time" id="all">All</span></td>
						</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-7" id="binh-luan"
				style="background: #fff; text-align: center;">
				<div class="title">
					<i class="fas fa-comments"></i> BÌNH LUẬN
				</div>
				<div class="content" style="padding: 5px;">
					<div class="fb-comments"
						data-href="http://localhost:8080/WebsiteDocTruyen/${tenTruyen }"
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
	
	<script type="text/javascript">
	selectTop10Truyen("all");
	$(document).ready(function(){
		$(document).on("click","span.type-time",function(){
			let typeTime = $(this).attr("id");
			selectTop10Truyen(typeTime);
	});
	});
	function selectTop10Truyen(typeTime) 
	{
		$.ajax({
			url: "${pageContext.request.contextPath}/select-top-10",
			type: "post",
			dataType: "json",
			data:{
				typeTime: typeTime
			},
			success: function (result) 
			{
				let html = "";
				$.each(result,function(key,item) 
				{
				
					if(item.tenTruyen.length >= 32)
					{
						item.tenTruyen = item.tenTruyen.slice(0,28);
						item.tenTruyen =  item.tenTruyen + "...";
					}
					if(item.theLoaiTruyen.length >= 32)
					{
						item.theLoaiTruyen = item.theLoaiTruyen.slice(0,28);
						item.theLoaiTruyen =  item.theLoaiTruyen + "...";
					}
					switch(key)
					{
						case 0:
							html += '<tr><td><span class="index" id="one">'+(key+1)+'</span><span class="name"><a href="${pageContext.request.contextPath}/'+item.urlTruyen+'">';
							html += item.tenTruyen+'<br></a><span class="the-loai">'+item.theLoaiTruyen+'</span></span></td></tr>';
							break;
						case 1:
							html += '<tr><td><span class="index" id="two">'+(key+1)+'</span><span class="name"><a href="${pageContext.request.contextPath}/'+item.urlTruyen+'">';
							html += item.tenTruyen+'<br></a><span class="the-loai">'+item.theLoaiTruyen+'</span></span></td></tr>';
							break;
						case 2:
							html += '<tr><td><span class="index" id="three">'+(key+1)+'</span><span class="name"><a href="${pageContext.request.contextPath}/'+item.urlTruyen+'">';
							html += item.tenTruyen+'<br></a><span class="the-loai">'+item.theLoaiTruyen+'</span></span></td></tr>';
							break;
						default:
							html += '<tr><td><span class="index" id="all">'+(key+1)+'</span><span class="name"><a href="${pageContext.request.contextPath}/'+item.urlTruyen+'">';
							html += item.tenTruyen+'<br></a><span class="the-loai">'+item.theLoaiTruyen+'</span></span></td></tr>';
				
							break;
					}
					
				});
				$("#truyen-dang-hot table tbody").html(html);
			}
		});
	}
</script>
</body>
</html>