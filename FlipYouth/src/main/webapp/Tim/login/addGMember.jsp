<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
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

#radioBtn .notActive {
	color: #3276b1;
	background-color: #fff;
}

.input {
	display: block;
	margin: 0 auto 15px;
	width: 75%;
	background: #d6d6d6;
	border: 1px solid #bfbfbf;
	color: #6c6c6c;
	padding: 8px;
}

video {
	position: fixed;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	transform: translateX(-50%) translateY(-50%);
	background: url('//demosthenes.info/assets/images/polina.jpg') no-repeat;
	background-size: cover;
	transition: 1s opacity;
}

.stopfade {
	opacity: .5;
}

#polina {
	font-family: Agenda-Light, Agenda Light, Agenda, Arial Narrow,
		sans-serif;
	font-weight: 100;
	color: white;
	padding: 2rem;
	width: 33%;
	margin: 2rem;
	float: right;
	font-size: 1.2rem;
}

h1 {
	font-size: 3rem;
	text-transform: uppercase;
	margin-top: 0;
	letter-spacing: .3rem;
}

#polina button {
	display: block;
	width: 80%;
	padding: .4rem;
	border: none;
	margin: 1rem auto;
	font-size: 1.3rem;
	background: rgba(255, 255, 255, 0.23);
	color: #fff;
	border-radius: 3px;
	cursor: pointer;
	transition: .3s background;
}

a {
	display: inline-block;
	color: #fff;
	text-decoration: none;
	padding: .5rem;
	transition: .6s background;
}
</style>
</head>
<body>

	<video poster="" id="bgvid" playsinline autoplay muted loop> <!-- WCAG general accessibility recommendation is that media such as background video play through only once. Loop turned on for the purposes of illustration; if removed, the end of the video will fade in the same way created by pressing the "Pause" button  -->
	<!-- <source src="http://thenewcode.com/assets/videos/polina.webm" type="video/webm"> -->
	<source src="/FlipYouth/Tim/video/Underground-Traffic.mp4"
		type="video/mp4"></video>
	<!-- start Login box -->
	<div class="container" id="login-block">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
				<h3 class="animated bounceInDown">完善基本資料</h3>
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
						<form action="<c:out value="/FlipYouth/addGMember.controller"/>"
							id="LoginForm" method="post">
							<div class="col-xs-12 " style="">
								<input class="input" type="text" name="nickName"
									style="width: 75%" placeholder="請輸入暱稱" required>
							</div>
							<div class="col-xs-12">
								<input class="input" type="text" name="phone" style="width: 75%"
									placeholder="請輸入手機" required>
							</div>
							<div class="col-xs-12">
								<input class="input" type="text" name="address"
									style="width: 75%" placeholder="請輸入地址" required>
							</div>

							<div class="row">
								<div
									style="text-align: right; padding-left: 20%; padding-right: 0px; margin-top: 3px;"
									class="col-xs-6">
									<div class="input-group">
										<div id="radioBtn" class="btn-group">
											<a class="btn btn-primary btn-sm active" data-toggle="gender"
												data-title="男">男</a> <a
												class="btn btn-primary btn-sm notActive"
												data-toggle="gender" data-title="女">女</a>
										</div>
										<input type="hidden" name="gender" value="男" id="gender">
									</div>
								</div>
								<div class="col-xs-6 " style="padding-left: 0;">
									<button type="submit" id="loginBtn"
										style="margin: 0; width: 70%;" class="btn btn-red">完成送出</button>
								</div>
							</div>
						</form>

					</div>
				</div>
				<div class="social-login row">
					<div class="fb-login col-lg-6 col-md-12 animated flipInX">
						<a href="#" class="btn btn-facebook btn-block">Connect with <strong>Facebook</strong></a>
					</div>
					<div class="twit-login col-lg-6 col-md-12 animated flipInX">
						<a class="btn btn-twitter btn-block" onclick="googleLogin()">Connect
							with <strong>Google</strong>
						</a>
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
			var googleURL = 'https://accounts.google.com/o/oauth2/auth?';
			var client_id = 'client_id=451639246634-4m1oh7enkiqquk8hje60mfm9ve47onfs.apps.googleusercontent.com&'
			var response_type = 'response_type=code&'
			var redirect_uri = 'redirect_uri=https://flipyouth.azurewebsites.net/FlipYouth/googleLogin.controller&'
			var scope = 'scope=email%20profile'
			var url = googleURL + client_id + response_type + redirect_uri
					+ scope;
			window.open(url);
		}

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

		$('#radioBtn a').on(
				'click',
				function() {
					var sel = $(this).data('title');
					var tog = $(this).data('toggle');
					$('#' + tog).prop('value', sel);

					$('a[data-toggle="' + tog + '"]').not(
							'[data-title="' + sel + '"]').removeClass('active')
							.addClass('notActive');
					$('a[data-toggle="' + tog + '"][data-title="' + sel + '"]')
							.removeClass('notActive').addClass('active');
				})
	</script>
</html>