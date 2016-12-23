<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="fresh Gray Bootstrap 3.0 Responsive Theme " />
<meta name="keywords"
	content="Template, Theme, web, html5, css3, Bootstrap,Bootstrap 3.0 Responsive Theme" />
<meta name="author" content="Mindfreakerstuff" />
<link rel="shortcut icon" href="favicon.png">

<title>翻桌唷登入</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value="/css_Tim/bootstrap.css"/>" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value="/css_Tim/login.css"/>" rel="stylesheet">
<link href=<c:url value="/css_Tim/animate-custom.css"/> rel="stylesheet">
<script src="<c:url value="/js_Tim/custom.js"/>" type="text/javascript"></script>
<style type="text/css">
.login-logo {
	text-align: center;
	height: 120px;
}
</style>
</head>
<body>
	<!-- start Login box -->
	<div class="container" id="login-block">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
				<h3 class="animated bounceInDown">Login</h3>
				<div class="login-box clearfix animated flipInY">
					<div class="login-logo">
						<a href="#"><img style="height: 100px; width: 100px"
							src="<c:url value="/image/icon/apple.png"/>" /></a>
					</div>
					<div class="col-sm-12 "
						style="font-family: Microsoft JhengHei; color: red; text-align: center;">${loginError}</div>
					<hr />
					<div class="login-form">
						<div class="alert alert-error hide">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<!-- 								  <h4>Error!</h4> -->
							<!-- 								   Your Error Message goes here -->
						</div>
						<form action="<c:out value="/FlipYouth/login/login.controller"/>"
							id="LoginForm" method="post">
							<input class="required" type="text" name="user"
								placeholder="請輸入帳號" required /> <input type="password"
								name="pass" placeholder="請輸入密碼" required />
							<button type="submit" id="loginBtn" class="btn btn-red">登入</button>
						</form>
						<div class="login-links">
							<a href="#"> 忘記密碼? </a> <br /> <a
								href="<c:url value="/index.jsp"/>"> 還沒有帳號?<strong>註冊</strong>
							</a>
						</div>
					</div>
				</div>
				<!-- 			       <div class="social-login row"> -->
				<!-- 			        		<div class="fb-login col-lg-6 col-md-12 animated flipInX"> -->
				<!-- 			        			<a href="#" class="btn btn-facebook btn-block">Connect with <strong>Facebook</strong></a> -->
				<!-- 			        		</div> -->
				<!-- 			        		<div class="twit-login col-lg-6 col-md-12 animated flipInX"> -->
				<!-- 			        			<a href="#" class="btn btn-twitter btn-block">Connect with <strong>Twitter</strong></a> -->
				<!-- 			        		</div> -->
				<!-- 			        </div> -->
			</div>
		</div>
	</div>

	<!-- End Login box -->
	<script src="<c:url value="/js_Tim/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/js_Tim/placeholder-shim.min.js"/>"></script>
	<script src="<c:url value="/js_Tim/custom.js"/>"></script>
	<script type="text/javascript">
		
	</script>
</html>