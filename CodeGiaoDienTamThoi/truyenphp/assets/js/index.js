var slideRight = document.querySelector("#truyen-de-cu .fa-chevron-right");
var slideLeft = document.querySelector("#truyen-de-cu .fa-chevron-left");
var content_item1 = document.getElementById("content-item"); 
var content_item2 = document.getElementById("content-item2"); 
var danhMuc = document.getElementById("danhMuc");
var theLoai =  document.getElementById("theLoai");
var content_item_current = 1;
slideRight.onclick = function(){
    slideRight.classList.add("disable-click");
    if(content_item_current == 1)
    {
        content_item1.classList.remove("hien-slide-right-to-left");
        content_item1.classList.remove("hide-slide-right-to-left");
        content_item2.classList.remove("hien-slide-right-to-left");
        content_item2.classList.remove("hide-slide-right-to-left");
        content_item2.classList.remove("hien-slide-left-to-right");
        content_item2.classList.remove("hide-slide-left-to-right");
        content_item1.classList.remove("hien-slide-left-to-right");
        content_item1.classList.add("hide-slide-left-to-right");
        setTimeout(function(){
            content_item_current = 2;
            content_item1.style.display = "none";
            content_item2.style.display = "block";
            content_item2.classList.add("hien-slide-left-to-right");
        },400);
    }
    else if(content_item_current == 2)
    {
        content_item1.classList.remove("hien-slide-right-to-left");
        content_item1.classList.remove("hide-slide-right-to-left");
        content_item2.classList.remove("hien-slide-right-to-left");
        content_item2.classList.remove("hide-slide-right-to-left"); 
        content_item1.classList.remove("hien-slide-left-to-right");
        content_item1.classList.remove("hide-slide-left-to-right");
        content_item2.classList.remove("hien-slide-left-to-right");
        content_item2.classList.add("hide-slide-left-to-right");
        setTimeout(function(){
            content_item_current = 1;
            content_item2.style.display = "none";
            content_item1.style.display = "block";
            content_item1.classList.add("hien-slide-left-to-right");
            
        },400);
      
    }
    setTimeout(function(){
        slideRight.classList.remove("disable-click");
    },1400);
    
};
slideLeft.onclick = function(){  
    slideLeft.classList.add("disable-click");
    if(content_item_current == 1)
    {
        content_item2.classList.remove("hide-slide-right-to-left");
        content_item2.classList.remove("hien-slide-right-to-left");
        content_item1.classList.remove("hien-slide-right-to-left");
        content_item1.classList.add("hide-slide-right-to-left");
        setTimeout(function(){
            content_item_current = 2;
            content_item1.style.display = "none";
            content_item2.style.display = "block";
            content_item2.classList.add("hien-slide-right-to-left");
        },400);
    }
    else if(content_item_current == 2)
    {
        content_item1.classList.remove("hide-slide-right-to-left");
        content_item1.classList.remove("hien-slide-right-to-left");
        content_item2.classList.remove("hien-slide-right-to-left");
        content_item2.classList.add("hide-slide-right-to-left");
        setTimeout(function(){
            content_item_current = 1;
            content_item2.style.display = "none";
            content_item1.style.display = "block";
            content_item1.classList.add("hien-slide-right-to-left");
        },400);
    }
    setTimeout(function(){
        slideLeft.classList.remove("disable-click");
    },1400);
};
