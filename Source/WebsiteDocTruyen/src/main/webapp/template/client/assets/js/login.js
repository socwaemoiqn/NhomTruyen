var user = document.getElementById("user");
var input = document.querySelectorAll(".txtb input");
var container_login = document.getElementById("container-login");
var btn_logup = document.querySelector("#container-login .bottom-text a#btn-logup");
var btn_login = document.querySelector("#container-logup .bottom-text a#btn-login");
var container_logup = document.getElementById("container-logup");
var exit_login = document.querySelector("#container-login i");
var exit_logup = document.querySelector("#container-logup i");
var cover_login = document.querySelector("div.cover-login");
var btn_logup_submit = document.querySelector("#container-logup form button[type=submit]");
// Nút quay lại form đăng ký
btn_login.onclick = function(){
    container_login.classList.add("show-login");
    container_login.classList.remove("hide-login");
    container_logup.classList.add("hide-login");
    container_logup.classList.remove("show-login");
};
// Nút đăng ký form đăng nhập
btn_logup.onclick = function(){
    container_logup.classList.add("show-login");
    container_logup.classList.remove("hide-login");
    container_login.classList.add("hide-login");
    container_login.classList.remove("show-login");
};
// Nút thoát form đăng ký
exit_logup.onclick = function(){
    container_logup.classList.add("hide-login");
    container_logup.classList.remove("show-login");
    cover_login.classList.remove("cover-login-show");
};
// Nút thoát form đăg nhập
exit_login.onclick = function(){
    container_login.classList.add("hide-login");
    container_login.classList.remove("show-login");
    cover_login.classList.remove("cover-login-show");
};
for(var i = 0; i < input.length; i++)
{
    input[i].setAttribute("onfocus","AddClassFocus(this)");
    input[i].setAttribute("onblur","RemoveClassFocus(this)");
}
user.onclick = function(){
    container_login.classList.add("show-login");
    container_login.classList.remove("hide-login");
    cover_login.classList.add("cover-login-show");
};
// Click đăng ký
btn_logup_submit.onclick = function(e){
	let username = document.querySelector("#container-logup form input[name=username]");
	let password = document.querySelector("#container-logup form input[name=password]");
	let repassword = document.querySelector("#container-logup form input[name=repassword]");
	let email = document.querySelector("#container-logup form input[name=email]");
	let username_login =  document.querySelector("#container-login form input[name=username]");
	let password_login =  document.querySelector("#container-login form input[name=password]");
		$.ajax({
			url: "logup",
			type: "post",
			dataType: "text",
			data: {
				username: username.value,
				password: password.value,
				repassword: repassword.value,
				email: email.value
			},
			success: function(result){
			
				switch (result) {
				case "empty":
					alert("Chưa nhập đủ thông tin");
					break;
				case "password":
					alert("2 mật khẩu chưa trùng khớp");
					break;
				case "exist":
					alert("Tên tài khoản đã tồn tại");
					break;
				default:
					alert("Đăng ký thành công!");
					AddClassFocus(username_login);
					AddClassFocus(password_login);
					username_login.value = username.value;
					password_login.value = password.value;
					username.value = "";
					password.value = "";
					repassword.value = "";
					email.value = "";
					container_login.classList.add("show-login");
					container_login.classList.remove("hide-login");
					container_logup.classList.add("hide-login");
					container_logup.classList.remove("show-login");					   
					break;
				}
			}
		});
		e.preventDefault();
	
};
function AddClassFocus(e)
{
    e.classList.add("focus");
}
function RemoveClassFocus(e)
{
    if(e.value == "")
    e.classList.remove("focus");
}