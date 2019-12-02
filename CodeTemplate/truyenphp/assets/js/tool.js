var tool_item_top = document.getElementById("tool-item-top");
var btnGoTop = document.querySelector(".tool-item .fa-arrow-alt-circle-up");
var content_PhanHoi = "";
/// Chạy cấu hình giao diện khi lần đầu load trang

/// Chạy cấu hình giao diện khi lần đầu load trang
btnGoTop.onclick = function(){
    window.scrollTo({
        top: 0,
        behavior: 'smooth',
    });
};
window.onload = function(){
    showBtnPhanHoi();
};
window.onscroll = function(){
    showBtnPhanHoi();
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


