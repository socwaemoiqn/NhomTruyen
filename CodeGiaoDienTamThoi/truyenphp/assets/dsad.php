<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/icon/css/all.css">
    <link rel="stylesheet" href="assets/css/index.css">
</head>
<body>

<div class="topnav" id="myTopnav">
    <a href="#home" class="active"><i class="fas fa-book-open"></i> TRUYỆN PHP</a>
    <div class="dropdown">
        <button class="dropbtn">Danh mục
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#"><b>Truyện full</b></a>
            <a href="#"><strong>Truyện hot</strong></a>
            <a href="#"><strong>Truyện mới cập nhật</strong></a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Thể loại
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <table width="100%">
                <tr>
                    <td>
                        <strong>Tiên hiệp</strong>
                    </td>
                    <td>
                        <strong>Kiếm hiệp</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Huyền huyễn</strong>
                    </td>
                    <td>
                        <strong>Tu chân</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Đô thị</strong>
                    </td>
                    <td>
                        <strong>Tình yêu</strong>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <a id="search" style="position: absolute;right: 25%;top:0;width: 300px;padding: 10px;">
        <input type="text" placeholder="Search.." name="search">
        <button type="submit"><i class="fa fa-search"></i></button>
    </a>
    <a  id="user" style="position: absolute;right: 10%;">
        <i class="far fa-user" style="color:green"></i> Đăng nhập
    </a>
    <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<div class="main" style="">
    dsad
</div>

<script>
    window.onresize = function () {
        var y = document.getElementById("user");
        var z = document.getElementById("search");
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
    };
    function myFunction() {
        var y = document.getElementById("user");
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
