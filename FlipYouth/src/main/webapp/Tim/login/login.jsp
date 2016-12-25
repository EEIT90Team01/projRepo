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

<title>翻桌唷登入</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value="/Tim/css_Tim/bootstrap.css"/>"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value="/Tim/css_Tim/login.css"/>" rel="stylesheet">
<link href=<c:url value="/Tim/css_Tim/animate-custom.css"/>
	rel="stylesheet">
<script src="<c:url value="/Tim/js_Tim/custom.js"/>"
	type="text/javascript"></script>
<style type="text/css">
.login-logo {
	text-align: center;
	height: 120px;
}

.imagefocus {
	display: block;
	/*     margin: 0 auto 15px; */
	width: 50%;
	background: #d6d6d6;
	border: 1px solid #bfbfbf;
	color: #6c6c6c;
	padding: 8px;
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
							src="<c:url value="/Tim/image/icon/apple.png"/>" /></a>
					</div>
					<div class="col-sm-12 "
						style="font-family: Microsoft JhengHei; color: red; text-align: center;">${loginError}</div>
					<div class="col-sm-12 "
						style="font-family: Microsoft JhengHei; color: #00b707; text-align: center;">
						<c:out
							value="${empty loginOK.nickName ? '' : loginOK.nickName+='已登入'}" />
					</div>
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
							<!-- 驗證碼 -->
							<div class="row">
								<div class="col-xs-6">
									<img src="<c:url value="/Image.controller"/>" id="kaptchaImage"
										style="margin-bottom: -3px; float: right;" />
								</div>
								<div class="col-xs-6" style="padding-left: 0px">
									<label style="padding: 0px"><input class="imagefocus"
										data-toggle="tooltip" data-placement="left"
										style="margin: 0px" placeholder="請輸入驗證碼" name="kaptcha"
										type="text" id="kaptcha" maxlength="4" required
										class="required" /></label>
								</div>
							</div>
					</div>


					<!-- 驗證碼 -->
					<button type="submit" id="loginBtn" class="btn btn-red">登入</button>
					</form>
					<div class="login-links">
						<a href="#"> 忘記密碼? </a> <br /> <a
							href="<c:url value="/index.jsp"/>"> 還沒有帳號?<strong>註冊</strong>
						</a>
					</div>
				</div>
			</div>
			<div class="social-login row">
				<div class="fb-login col-lg-6 col-md-12 animated flipInX">
					<a href="#" class="btn btn-facebook btn-block">Connect with <strong>Facebook</strong></a>
				</div>
				<div class="twit-login col-lg-6 col-md-12 animated flipInX">
					<a  class="btn btn-twitter btn-block" onclick="googleLogin()">Connect with <strong>Google</strong></a>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- End Login box -->
	<script src="<c:url value="/Tim/js_Tim/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/Tim/js_Tim/placeholder-shim.min.js"/>"></script>
	<script src="<c:url value="/Tim/js_Tim/custom.js"/>"></script>
	<script type="text/javascript">
	
	
	function googleLogin() {
		var googleURL='https://accounts.google.com/o/oauth2/auth?';
		var client_id='client_id=451639246634-4m1oh7enkiqquk8hje60mfm9ve47onfs.apps.googleusercontent.com&'
		var response_type='response_type=code&'
		var redirect_uri='redirect_uri=http://localhost:8080/FlipYouth/googleLogin.controller&'
		var scope='scope=email%20profile'
		var url=googleURL+client_id+response_type+redirect_uri+scope;
		window.open(url);
	}
	
	
	
	
	
	
	
	
	
		$(function() {
			$('#kaptchaImage').click(
					function() {
						$(this).hide().attr(
								'src',
								'/FlipYouth/Image.controller?'
										+ Math.floor(Math.random() * 100))
								.fadeIn();
						event.cancelBubble = true;
					});
		});

		window.onbeforeunload = function() {
			if (event.clientX > 360 && event.clientY < 0 || event.altKey) {
				alert(parent.document.location);
			}
		};

		function changeCode() {
			$('#kaptchaImage').hide().attr(
					'src',
					'/FlipYouth/Image.controller?'
							+ Math.floor(Math.random() * 100)).fadeIn();
			event.cancelBubble = true;
		}
	</script>
</html>