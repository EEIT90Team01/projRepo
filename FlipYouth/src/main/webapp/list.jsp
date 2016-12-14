<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城系統</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
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
<!-- <link rel="stylesheet" type="text/css" href="css/Tim.css"> -->
<!-- Latest compiled and minified JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
	padding: 30px;
	max-width: 350px;
	width: 100% !important;
	background-color: #F7F7F7;
	margin: 0 auto;
	border-radius: 2px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	font-family: roboto;
}

.loginmodal-container h1 {
	text-align: center;
	font-size: 1.8em;
	font-family: roboto;
}

.loginmodal-container input[type=submit] {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
	height: 44px;
	font-size: 16px;
	width: 100%;
	margin-bottom: 10px;
	-webkit-appearance: none;
	background: #fff;
	border: 1px solid #d9d9d9;
	border-top: 1px solid #c0c0c0;
	/* border-radius: 2px; */
	padding: 0 8px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover
	{
	border: 1px solid #b9b9b9;
	border-top: 1px solid #a0a0a0;
	-moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

.loginmodal {
	text-align: center;
	font-size: 14px;
	font-family: 'Arial', sans-serif;
	font-weight: 700;
	height: 36px;
	padding: 0 8px;
	/* border-radius: 3px; */
	/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
	/* border: 1px solid #3079ed; */
	border: 0px;
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.1);
	background-color: #4d90fe;
	padding: 17px 0px;
	font-family: roboto;
	font-size: 14px;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
	/* border: 1px solid #2f5bb7; */
	border: 0px;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	background-color: #357ae8;
	/* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
	text-decoration: none;
	color: #666;
	font-weight: 400;
	text-align: center;
	display: inline-block;
	opacity: 0.6;
	transition: opacity ease 0.5s;
}

.login-help {
	font-size: 12px;
}
</style>
<style type="text/css">
/* div { */
/* 	border-style: solid; */
/* 	border-width: 1px; */
/* } */
p, h3 {
	text-overflow: ellipsis;
	overflow: hidden;
}

body {
	height: 1900px;
	width: 100%;
}

.max-h {
	height: 22px;
}

a:link {
	color: black;
	font-family: Microsoft JhengHei;;
	　font-weight: 900;
	//
	設定還沒瀏覽過的連結樣式
}

a:visited {
	font-family: Microsoft JhengHei;;
	color: black;
	　font-weight: 900;
	//
	設定已經瀏覽過的連結樣式
}

a:hover {
	font-family: Microsoft JhengHei;;
	color: black;
	font-size: 900;
	font-weight: 900;
	//
	設定滑鼠移到連結上的樣式
}

a:active {
	font-family: Microsoft JhengHei;;
	font-weight: 900;
	//
	設定正在被點選的連結樣式
	color
	:
	black;
}

.border_bottom {
	border-bottom: solid 1px;
	border-bottom-color: #dcd5d5;
}

.mart {
	font-size: 50px;
	font-family: Microsoft JhengHei;
}

a {
	font-size: 17px;
	line-height: 2.0;
	font-weight: 600;
	font-family: Microsoft JhengHei;
}

.ffff {
	background-color: black;
}

.Carousel {
	width: 100%;
}

</style>
</head>

<body id="body">



	<div
		style="background-image: url(image/big/bg.png); background-repeat: repeat;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-2"
									style="position: fixed; margin-left: 20px; width: 300px">
									<div class="row ">
										<div style="font-family: PMingLiU" class="col-md-12 ">
											<font class="mart">遊戲商城</font>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/1.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=1"/>">全部</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/2.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=2"/>">自有商品</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/3.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=3"/>">派對遊戲</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/4.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=4"/>">親子桌遊</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/5.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=5"/>">輕度策略</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/6.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=6"/>">重度策略</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/7.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=7"/>">台灣原創</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/8.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=8"/>">麥卡貝推</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="image/icon/9.png"> <a
												href="<c:url value="/Shop.controllor?gameClass=9"/>">卡套</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img style="height: 40px; width: 40px"
												src="image/icon/buy.jpg"><a id="cars"
												href="<c:url value="/Shop.controllor?gameClass=9"/>">購物車<br>
												<span id="span"><font style="color: red">目前金額${ALL}<br>目前件數${count}
												</font></span>
											</a><br>
											<!-- 											 -->
											<a style="color: #ffffff"
												href="<c:url value="/order.controllor?goOrder=1&url=checkOut"/>"
												id="checkout" class="btn btn-primary fluid" role="button">前往結帳</a>
											<a href="<c:url value="/Shop.controllor?clearCar=1"/>"
												style="color: #ffffff" class="btn btn-primary fluid"
												role="button">清除購物車</a>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-md-9">




							<div class="container-fluid">
								<!-- image -->
								<div class="row">
									<div class="col-md-12">
										<div class="carousel slide" id="carousel-124157">
											<ol class="carousel-indicators">
												<li data-slide-to="0" data-target="#carousel-124157"></li>
												<li data-slide-to="1" data-target="#carousel-124157"
													class="active"></li>
												<li data-slide-to="2" data-target="#carousel-124157"></li>
											</ol>
											<div class="carousel-inner">
												<div class="item">
													<img alt="Carousel Bootstrap First"
														src="image/big/background/3.JPG" />
													<div class="carousel-caption">
														<h4>我是廣告</h4>
														<p>有一種活動，既可以跟一群朋友培養感情默契，又可以動動頭腦為生活增添樂趣，簡直就是室內活動的霸主！沒錯，就是桌上遊戲啦！</p>
													</div>
												</div>
												<div class="item active">
													<img alt="Carousel Bootstrap Second"
														src="image/big/background/2.jpg" />
													<div class="carousel-caption">
														<h4>我是廣告</h4>
														<p>桌遊其實在國外相當風行，尤其是德國，桌上遊戲風氣很盛，而台灣大約在七、八年前開始漸漸流行，一開始都是學生圈子互相揪團，後來也漸漸吸引到各個年齡層的玩家！</p>
													</div>
												</div>
												<div class="item">
													<img alt="Carousel Bootstrap Third"
														src="image/big/background/1.jpg" />
													<div class="carousel-caption">
														<h4>我是廣告</h4>
														<p>近年來桌遊也越做越精緻，主題越來越多元，包括電影、戲劇、歷史甚至時事的題材都紛紛被製作成桌上遊戲，DailyView網路溫度計今天就來調查網路上討論最熱門</p>
													</div>
												</div>
											</div>
											<a class="left carousel-control" href="#carousel-124157"
												data-slide="prev"><span
												class="glyphicon glyphicon-chevron-left"></span></a> <a
												class="right carousel-control" href="#carousel-124157"
												data-slide="next"><span
												class="glyphicon glyphicon-chevron-right"></span></a>
										</div>
									</div>
								</div>
							</div>



















							<c:forEach items="${shopBean}" var="data">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail ">
										<a href="<c:url value="/Shop.controllor?ID=${data.gameSN}"/>"><img
											class="img-rounded" style="height: 200px"
											src="<c:url value="${data.smallImage}"/>"></a>
										<div style="height: 200px;" class="caption">
											<h3 style="text-overflow: ellipsis;">
												<a style="line-height: 1.5;"
													href="<c:url value="/Shop.controllor?ID=${data.gameSN}"/>"><nobr>${data.gameName}</nobr></a>
											</h3>
											<p style="height: 60px">${data.introduction}</p>
											<h4 style="float: right; position: absolute; bottom: 70px;">
												價格: <font style="color: red">NT\$${data.price}元</font>
											</h4>
											<p
												style="position: absolute; bottom: 30px; margin: 0px auto;">
												<a style="color: #ffffff" class="btn btn-primary fluid"
													role="button" id="ShoppingCar"
													onclick="car(${data.gameSN},${data.price})">放入購物車</a> <a
													href="<c:url value="/Shop.controllor?ID=${data.gameSN}"/>"
													class="btn btn-default fluid" role="button">查看詳情 </a>
											</p>
										</div>




									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function car(gameSN,price){
		var b = price;
		var a= gameSN;
		$.ajax({	
			url: "Shop.controllor",
			type:"POST",
			data:{name:gameSN,price:price},
			async: false,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				$('#span').html(res);
			},
			 
		})
	}
	
	$('#checkout').click(function(event) {
		event.preventDefault();
		$.post(this.href, function(html) {
			<%if (session.getAttribute("loginOK") != null) {%>
			$('body').html(html);
			<%} else {%>
			$(html).appendTo('#body');
			<%}%>
		})
	})
	</script>
</body>
</html>