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
/* 	background: #d6d6d6; */
	border: 1px solid #bfbfbf;
	color: #6c6c6c;
	padding: 8px;
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
  font-family: Agenda-Light, Agenda Light, Agenda, Arial Narrow, sans-serif;
  font-weight:100; 
  color: white;
  padding: 2rem;
  width: 33%;
  margin:2rem;
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
  background: rgba(255,255,255,0.23);
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
<link href="<c:url value="/Tim/css_Tim/login.css"/>" rel="stylesheet">
</head>
<body>
<video poster="" id="bgvid" playsinline autoplay muted loop>
  <!-- WCAG general accessibility recommendation is that media such as background video play through only once. Loop turned on for the purposes of illustration; if removed, the end of the video will fade in the same way created by pressing the "Pause" button  -->
<!-- <source src="http://thenewcode.com/assets/videos/polina.webm" type="video/webm"> -->
<source src="/FlipYouth/Tim/video/Underground-Traffic.mp4" type="video/mp4">
</video>
	<!-- start Login box -->
	<div class="container" id="login-block">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
				<h3
					class="animated bhttp://localhost:8080/FlipYouth/login/login.controller#ounceInDown">Login</h3>
				<div class="login-box clearfix animated flipInY">
					<div class="login-logo">
						<a href="#"><img style="height: 157px; width: 172px"
							src="<c:url value="/Tim/image/logo/logo05.png"/>" /></a>
					</div>

					<hr />
					<div class="login-form">
						<div class="row">
<!-- 							<div class="col-sm-12 " -->
<!-- 								style="font-family: Microsoft JhengHei; color: red; text-align: center;"> -->
								
<%-- 								<c:out --%>
<%-- 									value="${empty loginOK.nickName ? '' : loginOK.nickName+='已登入'}" /> --%>
<!-- 								</div> -->
							<div class="col-sm-12 "
								style="font-family: Microsoft JhengHei; color: red; text-align: center;">
								<c:out
									value="${empty loginOK.nickName ? loginError : loginOK.nickName+='已登入'}" />
							</div>
						</div>


						<form action="<c:out value="/FlipYouth/login/login.controller"/>"
							id="LoginForm" method="post">
							<div class="row">
								<div class="col-xs-12">
									<input class="input" type="text" name="user"
										placeholder="請輸入帳號" required />
								</div>
								<div class="col-xs-12">
									<input type="password" class="input" name="pass"
										placeholder="請輸入密碼" required />
								</div>
							</div>

							<div class="row">
								<div class="col-xs-6">
									<img src="<c:url value="/Image.controller"/>" id="kaptchaImage"
										style="margin-bottom: -3px; float: right;" />
								</div>
								<div class="col-xs-6" style="padding-left: 0px">
									<label style="padding: 0px"><input
										class="input imagefocus" data-toggle="tooltip"
										data-placement="left" style="margin: 0px; width: 69%"
										placeholder="請輸入驗證碼" name="kaptcha" type="text" id="kaptcha"
										maxlength="4" required class="required" /></label>
								</div>
							</div>
							<!-- 					</div> -->
							<button type="submit" id="loginBtn" class="btn btn-red">登入</button>
						</form>

						<!-- 驗證碼 -->


						<div class="login-links">
							<a href="#"> 忘記密碼? </a> <br /> <a
								href="<c:url value="/index.jsp"/>"> 還沒有帳號?<strong>註冊</strong>
							</a>
						</div>
					</div>
				</div>

				<div class="social-login">
					<div class="row">
						<div class="col-md-6">
							<div class="fb-login animated flipInX">
								<a onClick="fb_login()" class="btn btn-facebook btn-block">Connect
									with <strong>Facebook</strong>
								</a>
							</div>
						</div>
						<div class="col-md-6">
							<div class="twit-login animated flipInX">
								<a class="btn btn-twitter btn-block" onclick="googleLogin()">Connect
									with <strong>Google</strong>
								</a>
							</div>
						</div>
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
		//google登入+驗證碼
		function googleLogin() {
			var googleURL = 'https://accounts.google.com/o/oauth2/auth?';
			var client_id = 'client_id=451639246634-4m1oh7enkiqquk8hje60mfm9ve47onfs.apps.googleusercontent.com&'
			var response_type = 'response_type=code&'
			var redirect_uri = 'redirect_uri=http://localhost:8080/FlipYouth/googleLogin.controller&'
			var scope = 'scope=email%20profile'
			var url = googleURL + client_id + response_type + redirect_uri
					+ scope;
			window.location.href = url;
		}

		$(function() {
			$('#kaptchaImage').click(
					function() {
						$('#kaptchaImage').hide().attr(
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
	<script type="text/javascript">
		//fb登入

		function FBlogin(accessToken) {
			$.ajax({
				url : "/FlipYouth/FBLogin.controller",
				type : "POST",
				data : {
					code : accessToken,
				},
				async : false,
				xhrFields : {
					withCredentials : false
				},
				success : function(res) {
					window.location.href = res
				},

			})

		}

		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				FBlogin(response.authResponse.accessToken);
			} else if (response.status === 'not_authorized') {
				// The person is logged into Facebook, but not your app.
				console
						.log('The person is logged into Facebook, but not your app');
			} else {
				// The person is not logged into Facebook, so we're not sure if
				// they are logged into this app or not.
				console.log("The person is not logged into Facebook");
			}
		}
		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		window.fbAsyncInit = function() {
			FB.init({
				appId : "138627046628205",
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.2' // use version 2.2
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, "script", "facebook-jssdk"));
		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		function loginNEMI(token) {
			// 把 access_token 傳至後端再做資料拿取
			console.log("Welcome!  Fetching your information.... ");
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "/login", true);
			xhr
					.setRequestHeader("Content-type:application/json ;charset=utf-8");
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					if (JSON.parse(xhr.responseText).status === "ok")
						location.href = "/index";
					else
						alert("something wrong!");
				}
			};
			xhr.send("token=" + token);
		}
		function fb_login() {
			// FB 第三方登入，要求公開資料與email
			FB.login(function(response) {
				statusChangeCallback(response);
				console.log(response);
			}, {
				scope : 'public_profile,email'
			});
		}
	</script>
</html>