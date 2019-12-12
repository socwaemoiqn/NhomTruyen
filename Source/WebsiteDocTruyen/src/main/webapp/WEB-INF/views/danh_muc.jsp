<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/template/client/assets/css/info-truyen.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/template/client/assets/css/search.css">

<style>
		a:link {
		  text-decoration: none;
		}
		
		a:hover {
		  color: lightgreen;
		}
</style>
<title>Nhóm truyện - ${tenDanhMuc }</title>
</head>
<body>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i> <a href="${pageContext.request.contextPath}/">Truyện </a> <span class="path">/</span> <span
				class="path-search">${tenDanhMuc }</span>
		</div>
		<div class="row">
			<div class="col-7" id="tim-kiem-truyen">
				<div class="title">
					<i class="fas fa-list"></i> ${tenDanhMuc }
				</div>
				<div class="content">
					<c:forEach items="${danhMucTruyen}" var="tr">		
						<div class="search-item">
							<div class="search-item-picture">
								<img src="${pageContext.request.contextPath}/truyen/img/${tr.hinhAnh}" />
							</div>
							<div class="search-item-infor">
								<span class="search-item-infor-name"> <b> 
								<c:forEach items="${urlTruyen}" var="url">
									<c:if test="${url.value==tr.ID }">
										<a href="${pageContext.request.contextPath}/${url.key}"><i class="fas fa-book"></i> ${tr.tenTruyen }</a>
									</c:if>
								</c:forEach> 
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
								</span> <span class="search-item-infor-chuong"><a href="#">Chương ${tr.soChuong }</a></span>
							</div>
						</div>
					</c:forEach>
				
				</div>
			</div>
			<div class="col-3" id="description-search">
				<div class="content">
					<table>
						<tr>
							<td>${gioiThieu }</td>
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
		</div>
	</div>
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