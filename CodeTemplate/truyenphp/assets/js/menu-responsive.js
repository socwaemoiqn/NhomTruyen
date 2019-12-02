var y = document.getElementById("user");
var z = document.getElementById("search"); 
var btnSearch = document.querySelector("#search button");
btnSearch.onclick = () => { 
    let value = document.querySelector("#search input[type=text]");
    
    location.href="search.html?id="+value.value;
}

window.onload = function(){
    resize();
};
window.onresize = function () {
    resize();
};
function resize()
{
    
    if(screen.width > 1131 && document.body.clientWidth > 1131)
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
// Xử lí phần slide Truyện đề cử
