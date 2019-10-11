var user = document.getElementById("user");
var input = document.querySelectorAll(".txtb input");
var container_login = document.getElementById("container-login");
var exit_login = document.querySelector("#container-login i");
var cover_login = document.querySelector("div.cover-login");    
exit_login.onclick = function(){
    container_login.classList.add("hide-login");
    container_login.classList.remove("show-login");
    cover_login.classList.remove("cover-login-show");
};
input[0].onfocus = function(){
    this.classList.add("focus");
};
input[0].onblur = function(){
    if(this.value == "")
   this.classList.remove("focus");
};
input[1].onfocus = function(){
    this.classList.add("focus");
};
input[1].onblur = function(){
    if(this.value == "")
   this.classList.remove("focus");
};
user.onclick = function(){
    container_login.classList.add("show-login");
    container_login.classList.remove("hide-login");
    cover_login.classList.add("cover-login-show");
};