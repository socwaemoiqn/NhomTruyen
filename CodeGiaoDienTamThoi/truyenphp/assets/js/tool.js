var tool_item_top = document.getElementById("tool-item-top");
var btnGoTop = document.querySelector(".tool-item .fa-arrow-alt-circle-up");
var btnPhanHoi = document.querySelector(".tool-item .fa-envelope");
var content_PhanHoi = "";
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