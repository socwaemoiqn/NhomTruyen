var btnBinhLuan = document.querySelector(".chuong-binhluan");
var divBinhLuan = document.getElementById("binh-luan");
var btnHideMenuPath = document.getElementById("btnHideMenuPath");
btnBinhLuan.onclick = function(){
   if(divBinhLuan.style.display == "none")
        divBinhLuan.style.display = "block";
   else
        divBinhLuan.style.display = "none";
};
btnHideMenuPath.onclick = function(){
     let icon_hideMenuPath = document.querySelector("#btnHideMenuPath i");
     let topMenu = document.getElementById("myTopnav");
     let path = document.getElementById("path");
     if(icon_hideMenuPath.classList.contains("fa-chevron-up"))
     {
          icon_hideMenuPath.classList.remove("fa-chevron-up");
          icon_hideMenuPath.classList.add("fa-chevron-down");
          topMenu.style.display = "none";
          path.style.display = "none";
     }
     else
     {
          icon_hideMenuPath.classList.remove("fa-chevron-down");
          icon_hideMenuPath.classList.add("fa-chevron-up");
          topMenu.style.display = "block";
          path.style.display = "block";
     }
};


