var slideLeft = document.querySelector("#truyen-de-cu .fa-chevron-left");
var slideRight = document.querySelector("#truyen-de-cu .fa-chevron-right");
var itemSlide = document.querySelectorAll("#truyen-de-cu .content .item");
var danhMuc = document.getElementById("danhMuc");
var theLoai =  document.getElementById("theLoai");
var topnav = document.getElementById("myTopnav");
danhMuc.onmouseover = function(){
    ScrollToTop();
};
theLoai.onmouseover = function(){
    ScrollToTop();
};
function ScrollToTop()
{
    if(topnav.classList.length == 1)
    window.scrollTo(0,0);
}
window.onscroll = function(){
    if (document.body.scrollTop  > 0  || document.documentElement.scrollTop > 0) {
        topnav.style.position = "fixed";
    } else {
        topnav.style.position = "static";  
    }
};
slideLeft.onclick = function(){
    for(var i = 0;i<itemSlide.length;i++)
    {
        itemSlide[i].classList.add("hide-slide-right-to-left");    
    }
    setTimeout(function(){},2000);
    for(var i = 0;i<itemSlide.length;i++)
    {
        itemSlide[i].style.float = "right"; 
        itemSlide[i].classList.add("hien-slide-right-to-left");     
    }    
 };
slideRight.onclick = function(){
    for(var i = 0;i<itemSlide.length;i++)
    {
        itemSlide[i].style.float = "right";
        itemSlide[i].classList.add("hide-slide-left-to-right");
        itemSlide[i].classList.remove("hide-slide-left-to-right");
        
    }    
    setTimeout(function(){},2000);
   for(var i = 0;i<itemSlide.length;i++)
    {
        itemSlide[i].style.float = "left"; 
        itemSlide[i].classList.add("hien-slide-right-to-left");  
        itemSlide[i].classList.remove("hien-slide-right-to-left");   
    } 
       
};