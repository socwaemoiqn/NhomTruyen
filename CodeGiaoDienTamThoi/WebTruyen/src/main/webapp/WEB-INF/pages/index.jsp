<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Spring MVC</title>
</head>
<body>
	<h1>Hello Việt</h1>
	${list[0]}
	<form action="login" method="POST">
		<div>Username:</div>
		<input type="text" name="username"/>
		<div>Password:</div>
		<input type="password" name="password"/>
		<br>
		<button>Login</button>
	</form>
</body>
</html>