<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhóm Truyện</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/icon/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/index.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/path.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/tool.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/template/client/assets/css/login.css">

<dec:head />
</head>
<body>
	<div class="topnav" id="myTopnav">
    <a href="index.html" id="home">
            <span class="fa-stack">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-book-open fa-spin fa-stack-1x fa-inverse" style="color: black;"></i>
            </span>
    TRUYỆN PHP</a>
    <div class="dropdown" id="danhMuc">
        <button class="dropbtn"><i class="fas fa-list"></i> Danh mục
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content" id="dropdown-content">
            <a href="danhmuc.html?id=full"><strong style="color: #86ad86;">Truyện full
                    <span data-placeholder="Truyện full"></strong></span>
            </b></a>
            <a href="danhmuc.html?id=hot"><strong style="color: #fd8383;">Truyện hot
                    <span data-placeholder="Truyện hot"></span>
            </strong></a>
            <a href="#"><strong style="color: #8eb3fd;">Truyện New
                    <span data-placeholder="Truyện new"></span>
            </strong></a>
            <a href="#"><strong>Truyện mới cập nhật
                    <span data-placeholder="Truyện mới cập nhập"></span>
            </strong></a>
        </div>
    </div>
    <div class="dropdown" id="theLoai">
        <button class="dropbtn"><i class="fa fa-sort"></i> Thể loại
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <table width="100%" >
                <tr>
                    <td  >
                        <a href="theloai.html?id=tien-hiep"><strong>Tiên hiệp
                                <span data-placeholder="Tiên hiệp" ></span></strong></a>
                    </td>
                    <td>
                        <a href="theloai.html?id=tien-hiep"><strong>Kiếm hiệp
                                <span data-placeholder="Kiếm hiệp" ></span></strong></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="theloai.html?id=tien-hiep"><strong>Huyền huyễn
                                <span data-placeholder="Huyền huyễn" ></span></strong></a>
                      
                    </td>
                    <td>
                            <a href="theloai.html?id=tien-hiep"><strong>Tu chân
                                    <span data-placeholder="Tu chân" ></span></strong></a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <a id="search" style=" position: absolute;right: 25%;top:0;width: 300px;padding: 10px;">
        <input type="text" placeholder="Search.." name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
    </a>
    <!-- Nút đăng nhập-->
    <div class="dropdown"  id="user">
            <button class="dropbtn" style="cursor:pointer;font-weight: bold"><i class="fa fa-user"></i> Đăng nhập
               
            </button>
    </div>
    <a style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
	<dec:body />
	<div class="tool">
        <span class="tool-item" id="tool-item-top"><span class="tool-mota">Về đầu trang</span><i class="far fa-arrow-alt-circle-up"></i></span>
        <span class="tool-item"><span class="tool-mota">Liên hệ Facebook</span><a target="_blank" href="https://facebook.com"><i class="fab fa-facebook-f"></i></a></span>
        <span class="tool-item"><span class="tool-mota">Phản hồi</span><i class="far fa-envelope"></i></span>
    </div>
<div class="footer">
    <div class="footer-left">
            <a href="#home" id="home">
                    <span class="fa-stack">
                        <i class="fa fa-circle fa-stack-2x"></i>
                        <i class="fa fa-book-open fa-spin fa-stack-1x fa-inverse" style="color: black;"></i>
                    </span>
            TRUYỆN PHP</a>
    </div>
    <div class="footer-mid">
        <table>
            <thead>
                <tr>
                    <td>Truyện full</td>
                    <td>Truyện mới cập nhật</td>
                    <td>Truyện hot</td>
                </tr>
            </thead>
           <tbody>
                <tr>
                    <td><a href="#">Thiên hạ vô song</a></td>
                    <td><a href="#">Duy ngã độc tôn</a></td>
                    <td><a href="#">Vô địch thiên hạ</a></td>
                </tr> 
                <tr>
                        <td><a href="#">Thiên hạ vô song</a></td>
                        <td><a href="#">Duy ngã độc tôn</a></td>
                        <td><a href="#">Vô địch thiên hạ</a></td>
                    </tr> 
                    <tr>
                            <td><a href="#">Thiên hạ vô song</a></td>
                            <td><a href="#">Duy ngã độc tôn</a></td>
                            <td><a href="#">Vô địch thiên hạ</a></td>
                        </tr> 
                        <tr>
                                <td><a href="#">Thiên hạ vô song</a></td>
                                <td><a href="#">Duy ngã độc tôn</a></td>
                                <td><a href="#">Vô địch thiên hạ</a></td>
                            </tr> 
           </tbody>
        </table>
    </div>
    <div class="footer-right">
        <span>Đề tài:</span> Xây dựng ứng dụng web đọc truyện online <br>
        <span>Môn:</span> Phát triển phần mềm chuyên nghiệp <br>
        Thành viên: <br>
         - Võ Văn Việt <br>
         - Nguyễn Công Toàn <br>
         - Phạm Ngọc Văn
    </div>
</div>
<div id="container-login">
    <i class="fas fa-times-circle fa-lg"></i>
    <form action="#" method="post">
        <h1 id="abac">Đăng nhập</h1>
        <div class="txtb">
            <input type="text">
            <span data-placeholder="Tài khoản"></span>
        </div>
        <div class="txtb">
            <input type="password">
            <span data-placeholder="Mật khẩu"></span>
        </div>
        <input type="button" value="Đăng nhập">
        <div class="bottom-text">
           Chưa có tài khoản? <a HREF="#" id="btn-logup">Đăng ký</a>
        </div>
 </form>
</div>
<div id="container-logup">
    <i class="fas fa-times-circle fa-lg"></i>
    <form action="#" method="post">
        <h1 id="abac">Đăng ký</h1>
        <div class="txtb">
            <input type="text">
            <span data-placeholder="Tài khoản"></span>
        </div>
        <div class="txtb">
            <input type="password">
            <span data-placeholder="Mật khẩu"></span>
        </div>
        <div class="txtb">
            <input type="password">
            <span data-placeholder="Xác nhận mật khẩu"></span>
        </div>
        <div class="txtb">
            <input type="text">
            <span data-placeholder="Email"></span>
        </div>
        <input type="button" value="Đăng ký">
        <div class="bottom-text">
           Đã có tài khoản? <a HREF="#" id="btn-login">Quay lại</a>
        </div>
 </form>
</div>
 <div class="cover-login"></div>
<!-- JS phần login -->

<script src="${pageContext.request.contextPath}/template/client/assets/js/login.js">
</script>
<!-- JS phần login -->
<!-- JS phần menu và responsive -->
<script src="${pageContext.request.contextPath}/template/client/assets/js/menu-responsive.js"></script>
<!-- JS phần menu và responsive -->
<!-- JS phần index -->
<script src="${pageContext.request.contextPath}/template/client/assets/js/index.js"></script>
<script src="${pageContext.request.contextPath}/template/client/assets/js/tool.js"></script>
<!-- JS phần index -->
</body>
</html>