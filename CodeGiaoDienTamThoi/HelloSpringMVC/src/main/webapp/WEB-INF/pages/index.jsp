<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
 <link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
 <link href="<c:url value="/resources/icon/css/all.css" />" rel="stylesheet">
</head>
<body>
<div class="topnav" id="myTopnav">
    <a href="home" id="home">
            <span class="fa-stack">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-book-open fa-spin fa-stack-1x fa-inverse" style="color: black;"></i>
            </span>
    TRUYỆN PHP</a>
    <div class="dropdown">
        <button class="dropbtn">Danh mục
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#"><b>Truyện full
                    <span data-placeholder="Truyện full"></span>
            </b></a>
            <a href="#"><strong>Truyện hot
                    <span data-placeholder="Truyện hot"></span>
            </strong></a>
            <a href="#"><strong>Truyện mới cập nhật
                    <span data-placeholder="Truyện mới cập nhập"></span>
            </strong></a>
        </div>
    </div>
    
    <div class="dropdown">
        <button class="dropbtn">Thể loại
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <table width="100%" >
                <tr>
                    <td  >
                        <strong>Tiên hiệp
                            <span data-placeholder="Tiên hiệp" ></span></strong>
                    </td>
                    <td>
                        <strong>Kiếm hiệp
                                <span data-placeholder="Kiếm hiệp"></span>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Huyền huyễn
                                <span data-placeholder="Huyền huyễn"></span>
                        </strong>
                      
                    </td>
                    <td>
                        <strong>Tu chân
                            <span data-placeholder="Tu chân"></span></strong>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Đô thị
                                <span data-placeholder="Đô thị"></span></strong>
                        </strong>
                    </td>
                    <td>
                        <strong>Tình yêu<span data-placeholder="Tình yêu"></span></strong>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <a id="search" style="position: absolute;right: 25%;top:0;width: 300px;padding: 10px;">
        <input type="text" placeholder="Search.." name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
    </a>
   
    <div class="dropdown"  id="user" style="right: 10%;">
            <button class="dropbtn">Đăng nhập
                <i class="fa fa-caret-down"></i>
            </button>
    </div>
    <a style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>

</div>

<div class="main" >
This is index page. Hello ${name}
</div>

<script>
    var y = document.getElementById("user");
    var z = document.getElementById("search");
    window.onload = function(){
        resize();
    };
    window.onresize = function () {
        resize();
    };
    function resize()
    {
        
        if(screen.width > 1039 && document.body.clientWidth > 1039)
        {
            y.style.position = "absolute";
        }
        else
        {
            y.style.position = "static";
        }
        if(screen.width <= 351 && document.body.clientWidth <= 351)
        {
            z.style.width = "250px";
        }
        else
        {
            z.style.width = "300px";
        }
    }
    function myFunction() {

        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";

        } else {
            x.className = "topnav";

        }
    }
</script>

</body>
</html>