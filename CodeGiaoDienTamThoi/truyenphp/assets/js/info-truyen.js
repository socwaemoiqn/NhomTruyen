var icon_rate = document.querySelectorAll(".info-content .info-content-rate i");
icon_rate_default();
for(var i = 0; i < icon_rate.length;i++)
{
    icon_rate[i].setAttribute("onclick","clickIconRate(this)");
    icon_rate[i].setAttribute("onmouseover","hoverIconRate(this)");
    icon_rate[i].setAttribute("onmouseout","removeHoverIconRate(this)");
}
function clickIconRate(e)
{
    var id_element= e.getAttribute("id");  
    var index = id_element.split("-")[1];
    localStorage.setItem("click-icon-rate",index);
    console.log(localStorage.getItem("click-icon-rate"));
    for(var i = 0; i<index;i++)
    {
         icon_rate[i].style.color = "yellow";
    }
}
function hoverIconRate(e)
{
    var id_element= e.getAttribute("id");  
    var index = id_element.split("-")[1];
    localStorage.setItem("hover-icon-rate",index);
    if(index == 10)
        return false;
    for(var i = 0; i<index;i++)
    {
         icon_rate[i].style.color = "yellow";
    }
}
function removeHoverIconRate(e)
{
    var id_element= e.getAttribute("id");  
    var index = id_element.split("-")[1];
   
    var click_cookie_index = localStorage.getItem("click-icon-rate");
    var hover_cookie_index = localStorage.getItem("hover-icon-rate");
    console.log(index);
    console.log(click_cookie_index);
    console.log(hover_cookie_index);
    for(var i = click_cookie_index ; i < index ; i++)
    {
        icon_rate[i].style.color = "white";
    }   
}
function icon_rate_default()
{
    if(localStorage.getItem("click-icon-rate") == null)
        localStorage.setItem("click-icon-rate",0);
    let index = localStorage.getItem("click-icon-rate");
        for(var i = 0 ; i < index ; i++)
        {
            icon_rate[i].style.color = "yellow";
        }   
}

