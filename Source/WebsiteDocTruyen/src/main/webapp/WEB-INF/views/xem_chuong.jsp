<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${tenTR}-${tieuDe}</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/read.css">
<style>
		a:link {
		  text-decoration: none;
		}
		a.disabled {
		  pointer-events: none;
		  cursor: default;
		}
		
	</style>

</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v5.0&appId=969730360057516&autoLogAppEvents=1"></script>
	<div class="main">
		<div id="path">
			<i class="fa fa-home"></i><a href="${pageContext.request.contextPath}/">Truyện </a> <span class="path"> /</span> <span
				class="path-truyen"><a href="${pageContext.request.contextPath}/${tenUrlTruyen}">${tenTR}<a></a></span> / <span
				class="path-chuong">Chương ${chuongHienTai}: ${tieuDe}</span>
		</div>
		<div class="row">
			<div class="col-10" id="chuong" style="position: relative;">
				<span id="btnHideMenuPath"><i class="fas fa-chevron-up"></i></span>
				<div class="title" id="title-chuong">
					${tenTR}<br> 
					Chương ${chuongHienTai }:${tieuDe } <br> 
					<i	class="fas fa-bezier-curve"></i><br> 
					<c:choose>
						<c:when test="${chuongTruoc == 0}">
							<a href="" class="disabled">
								<span class="chuong-redirect" id="redirect-pre">
									<i class="fas fa-chevron-left"></i> Chương trước
								</span> 
							</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-${chuongTruoc}">
								<span class="chuong-redirect" id="redirect-pre">
									<i class="fas fa-chevron-left"></i> Chương trước
								</span> 
							</a>
						</c:otherwise>
					</c:choose>
					
					<select class="chuong-list" id="chuongLists"> 
						<option value="">Chương ${chuongHienTai}</option>
						<c:forEach items="${listChuong }" var="ch" varStatus="stt"> 
							<option value="${stt.index+1 }" >Chương ${stt.index+1}</option>
						</c:forEach>
					</select> 
					<c:choose>
						<c:when test="${chuongSau>listChuong.size() }">
							<a href="" class="disabled" >
								<span class="chuong-redirect" id="redirect-next">Chương sau
									<i class="fas fa-chevron-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-${chuongSau}">
								<span class="chuong-redirect" id="redirect-next">Chương sau
									<i class="fas fa-chevron-right"></i>
								</span>
							</a>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class="content" id="content-chuong">
					<p>${noiDung}</p>
				</div>
				<div class="title" id="title-chuong">
					<c:choose>
						<c:when test="${chuongTruoc == 0}">
							<a href="" class="disabled">
								<span class="chuong-redirect" id="redirect-pre">
									<i class="fas fa-chevron-left"></i> Chương trước
								</span> 
							</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-${chuongTruoc}">
								<span class="chuong-redirect" id="redirect-pre">
									<i class="fas fa-chevron-left"></i> Chương trước
								</span> 
							</a>
						</c:otherwise>
					</c:choose>
					
					<select
						class="chuong-list" id="chuongListss">
						<option value="">Chương ${chuongHienTai}</option>
						<c:forEach items="${listChuong }" var="ch" varStatus="stt"> 
							<option value="${stt.index+1}">Chương ${stt.index+1}</option>
						</c:forEach>
					</select> 
					<c:choose>
						<c:when test="${chuongSau>listChuong.size() }">
							<a href="" class="disabled" >
								<span class="chuong-redirect" id="redirect-next">Chương sau
									<i class="fas fa-chevron-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-${chuongSau}">
								<span class="chuong-redirect" id="redirect-next">Chương sau
									<i class="fas fa-chevron-right"></i>
								</span>
							</a>
						</c:otherwise>
					</c:choose>
					<br>
					<a  href="${pageContext.request.contextPath}/contact" target="_blank"><span class="chuong-phanhoi">Phản hồi</span></a>
					<span class="chuong-binhluan">Bình luận</span>
					<br>
					<i class="fas fa-bezier-curve"></i>
					<br>
					<span class="chuong-tips">Bạn có thể dùng phím mũi tên hoặc WASD để lùi/sang chương.</span>
				</div>
			</div>
			<div class="col-10" id="binh-luan"
				style="background: #fff; border-radius: 10px; display: none;">
				<div class="title">
					<i class="fas fa-comments"></i> BÌNH LUẬN
				</div>
				<div class="content" style="padding: 5px; text-align: center;">
					<div class="fb-comments"
						data-href="http://localhost:8080/WebsiteDocTruyen/${tenUrlTruyen }"
						style="border: none; visibility: visible; width: 100%;"
						data-colorscheme="" data-width="" data-numposts="5"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="tool">
		<span class="tool-item" id="tool-item-top"><span
			class="tool-mota">Về đầu trang</span><i
			class="far fa-arrow-alt-circle-up"></i></span> <span class="tool-item">
			<span class="tool-config">
				<table border="1">
					<tr>
						<td>Màu nền</td>
						<td><select name="" id="config-background-color">
								<option value="#ffffff-#000000">Màu trắng</option>
								<option value="#f4f4f4-#4e4e4e">Xám nhạt</option>
								<option value="#f4f4e4-#4e4e4e">Vàng nhạt</option>
								<option value="#eae4d3-#4e4e4e">Màu sepia</option>
								<option value="#d5d8dc-#4e4e4e">Xanh đậm</option>
								<option value="#efefab-#2b2b2b">Vàng ố</option>
								<option value="#c2b49b-#4e4e4e">Sách cũ</option>
								<option value="#232323-#DDDDDD">Màu tối</option>
						</select></td>
					</tr>
					<tr>
						<td>Font chữ</td>
						<td><select name="" id="config-font">
								<option value="Time New Roman">Time New Roman</option>
								<option value="Tahoma">Tahoma</option>
								<option value="Arial">Arial</option>
								<option value="Roboto Cendensed">Roboto Condensed</option>
								<option value="Verdana, Geneva, Tahoma, sans-serif">Verdana</option>
						</select></td>
					</tr>
					<tr>
						<td>Size chữ</td>
						<td><select name="" id="config-text-size">
								<option value="16">16</option>
								<option value="18">18</option>
								<option value="20">20</option>
								<option value="22">22</option>
								<option value="24">24</option>
								<option value="26">26</option>
								<option value="28">28</option>
								<option value="30">30</option>
						</select></td>
					</tr>
					<tr>
						<td>Full khung</td>
						<td><input type="radio" name="config-khung"
							id="config-khung-full" value="Có"> Có <input type="radio"
							name="config-khung" id="config-khung-notfull" value="Không"
							checked> Không</td>
					</tr>
				</table>
		</span> <i class="fas fa-tools"></i>
		</span> <span class="tool-item"><span class="tool-mota">Liên hệ
				Facebook</span><a target="_blank" href="https://facebook.com"><i
				class="fab fa-facebook-f"></i></a></span> <span class="tool-item"><span
			class="tool-mota">Phản hồi</span><i class="far fa-envelope"></i></span>
	</div>
	<script >

	</script>
	<script type="text/javascript">
		document.getElementById('chuongLists').onchange = function() {
		    var value =  this.value;
		    location.href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-"+value;
		    //alert(value)
		};
		document.getElementById('chuongListss').onchange = function() {
		    var value =  this.value;
		    location.href="${pageContext.request.contextPath}/${tenUrlTruyen}/chuong-"+value;
		    //alert(value)
		};
		function SetHistoryReaded(maTruyen) {
			alert(maTruyen);
		}
	</script>
		<script
		src="${pageContext.request.contextPath}/template/client/assets/js/read.js">
		
	</script>
	<script src="${pageContext.request.contextPath}/template/client/assets/js/tool-read.js"></script>
</body>
</html>