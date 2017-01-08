<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Login</title>

<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<body>

<!-- ////////////// -->
	<div class="container">

		<form class="form-signin">
		
			<h2 class="form-signin-heading" style="text-align: center">登入</h2>
			
			<label for="inputEmail" class="sr-only">Email address</label> 
				<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus /> 
				
			<label for="inputPassword" class="sr-only">Password</label> 
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required />
			
			<div class="checkbox">
				<label><input type="checkbox" value="remember-me" />
					記住我的帳號密碼
				</label>
			</div>
			
<!-- 			////////// -->
			<div class="row">
			<div class="col-md-4">
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				登入
			</button>
			</div>
			<div class="col-md-4">
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				註冊
			</button>
			</div>
			<div class="col-md-4">
			<button class="btn btn-lg btn-primary btn-block" type="submit">
				取消
			</button>
			</div>
			</div>
<!-- 			////////// -->
			
		</form>

	</div>
	<!-- /container -->

</body>
</html>