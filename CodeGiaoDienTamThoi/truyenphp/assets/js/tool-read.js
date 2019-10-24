var tool_item_top = document.getElementById("tool-item-top");
var btnGoTop = document.querySelector(".tool-item .fa-arrow-alt-circle-up");
var btnPhanHoi = document.querySelector(".tool-item .fa-envelope");
var content_PhanHoi = "";   
var btnKhung_Full = document.getElementById("config-khung-full");
var btnKhung_NotFull = document.getElementById("config-khung-notfull");
var btnConfigTextSize = document.getElementById("config-text-size");
var btnConfigFont = document.getElementById("config-font");
var btnConfigBackgroundAndColor = document.getElementById("config-background-color");
var AllSpanOfContentChuong = document.querySelectorAll("#content-chuong p span");
/// Chạy cấu hình giao diện khi lần đầu load trang
config_Tool_default();
/// Chạy cấu hình giao diện khi lần đầu load trang
btnGoTop.onclick = function(){
    window.scrollTo({
        top: 0,
        behavior: 'smooth',
    });
};
btnPhanHoi.onclick = function(){
     content_PhanHoi = prompt("Vui lòng mô tả nội dung cần phản hồi:");
};
window.onload = function(){
    showBtnPhanHoi();
};
window.onscroll = function(){
    showBtnPhanHoi();
};
btnKhung_Full.onclick = function(){
    let row_khung = document.querySelector(".main .row");
    localStorage.setItem("khung","10px 0%");
    row_khung.style.padding = localStorage.getItem("khung");
};
btnKhung_NotFull.onclick = function(){  
    let row_khung = document.querySelector(".main .row");
    localStorage.setItem("khung","10px 8%");
    row_khung.style.padding = localStorage.getItem("khung");
};
btnConfigTextSize.onchange = function(){
    localStorage.setItem("fontSize",this.value);
    AllSpanOfContentChuong[0].style.fontSize = ""+this.value+"px";
};
btnConfigFont.onchange = function(){
    localStorage.setItem("fontFamily",this.value);
    AllSpanOfContentChuong[1].style.fontFamily = ""+this.value;
};
btnConfigBackgroundAndColor.onchange = function(){
    let obj = ConvertValueBackgroundColorToObject(this.value);
    let json = JSON.stringify(obj);
    localStorage.setItem("backgroundColor",json);
    let contentChuong = document.querySelector(".content#content-chuong");
    contentChuong.style.background = obj.background;
    for(var i = 0; i < AllSpanOfContentChuong.length; i++)
    {
        AllSpanOfContentChuong[i].style.background = obj.background;
        AllSpanOfContentChuong[i].style.color = obj.color;
     }
};
function showBtnPhanHoi()
{
    if(document.body.scrollTop > 0 || document.documentElement.scrollTop > 0)
    {
  
        tool_item_top.style.display = "block";
        tool_item_top.classList.add("show-tool-item-top");

    }
    else
    {
         tool_item_top.style.display = "none";
    }
}
function config_Tool_default(){
    // Cấu hình khung 
    let row_khung = document.querySelector(".main .row");
    if(localStorage.getItem("khung") == null)
    {
        localStorage.setItem("khung","10px 8%");
    }
    row_khung.style.padding = ""+localStorage.getItem("khung");
    if(localStorage.getItem("khung") == "10px 8%")
        btnKhung_NotFull.checked = true;
    else
        btnKhung_Full.checked = true;   
    ///////////////////////////////
    // Cấu hình text size
    if(localStorage.getItem("fontSize") == null)
    {
        localStorage.setItem("fontSize","22")
    }
    AllSpanOfContentChuong[0].style.fontSize = ""+localStorage.getItem("fontSize")+"px";
    btnConfigTextSize.value = localStorage.getItem("fontSize");
    ///////////////////////////////
     // Cấu hình font family
     if(localStorage.getItem("fontFamily") == null)
     {
        localStorage.setItem("fontFamily","Time New Roman");
     }
     AllSpanOfContentChuong[1].style.fontFamily = ""+localStorage.getItem("fontFamily");
     btnConfigFont.value = localStorage.getItem("fontFamily");
     ///////////////////////////////
     if(localStorage.getItem("backgroundColor")==null)
     {
         let obj = {background:"#f4f4f4",color:"#4e4e4e"};
        localStorage.setItem("backgroundColor",JSON.stringify(obj));
     }
     var obj = JSON.parse(localStorage.getItem("backgroundColor"));
     let contentChuong = document.querySelector(".content#content-chuong");
     contentChuong.style.background = obj.background;
     for(var i = 0; i < AllSpanOfContentChuong.length; i++)
     {
         AllSpanOfContentChuong[i].style.background = obj.background;
         AllSpanOfContentChuong[i].style.color = obj.color;
     }
     btnConfigBackgroundAndColor.value = obj.background+"-"+obj.color;
}
function ConvertValueBackgroundColorToObject(value)
{
        let array = value.split("-");
        var obj = {background:array[0],color:array[1]};
        return obj;
}

