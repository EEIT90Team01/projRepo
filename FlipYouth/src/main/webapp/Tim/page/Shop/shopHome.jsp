<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>翻桌商城</title>

<link href="<c:url value="/Tim/css_Tim/one-page-wonder.css"/>"
	rel="stylesheet">



<script type="text/javascript">
	$(document).ready(function() {
		console.log("ready!");
	});
</script>
<style type="text/css">
body{
font-family: 微軟正黑體;
}

.carousel-control {
	position: absolute;
	top: 40%;
	left: 15px;
	width: 40px;
	height: 40px;
	margin-top: -20px;
	font-size: 60px;
	font-weight: 100;
	line-height: 30px;
	color: #ffffff;
	text-align: center;
	background: #222222;
	border: 3px solid #ffffff;
	-webkit-border-radius: 23px;
	-moz-border-radius: 23px;
	border-radius: 23px;
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

.carousel-control.right {
	right: 15px;
	left: auto;
}

.carousel-caption {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 15px;
	background: #333333;
	background: rgba(0, 0, 0, 0.75);
}

.carousel-caption p {
	margin-bottom: 0;
}

@media screen and (max-width: 700px) {
	.carousel-caption p {
		font-size: 13px;
	}
	.carousel-caption {
		background: rgba(0, 0, 0, 0.55);
	}
	.carousel-control {
		top: 20%;
	}
}
/* .shopHome { */
/* 	height: 500px; */
/* 	background-image: url("/FlipYouth/Tim/image/big/background/f1.png"); */
/* } */
</style>
</head>

<body id="body" style="height: 1500px">

	<header class="shopHome">
	<div class="row">
		<div id="myCarousel" class="carousel slide"
			style="max-width: 1200px; max-height: 600px; margin: 0px auto;">
			<ol class="carousel-indicators hidden-xs hidden-sm"
				style="padding-bottom: 42px;">
				<li data-target="#carcousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carcousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carcousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="active item" align="center">
					<a href="javascript:void(0)"><img
						src="<c:url value="/Tim/image/big/background/f1.png"/>"
						class="img-rounded" alt="PS3 reparatie Haarlem"></a>

				</div>
				<div class="item" align="center">
					<a href="javascript:void(0)"><img
						src="<c:url value="/Tim/image/big/background/f3.jpg"/>"
						class="img-rounded" alt="Blu-ray Lens reparatie"></a>

				</div>
				<div class="item" align="center">
					<a href="javascript:void(0)"><img
						src="<c:url value="/Tim/image/big/background/f4.jpg"/>"
						class="img-rounded" alt="Yellow Light of Death"></a>

				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">›</a>
		</div>
	</div>











	</header>
	<div class="container">
		<hr class="featurette-divider">
		<!-- First Featurette -->
		<div class="featurette" id="about">
			<img style="width: 500px"
				class="featurette-image img-circle img-responsive pull-right"
				src="<c:url value="/Tim/image/big/logo_baby.png"/>">
			<h2 style="margin: 150px 50px 50px 50px" class="featurette-heading">
				"翻桌唷" <span style="color:#f11212;" class="text-muted">，為什麼要叫翻桌唷呢？</span>
			</h2>


			<p style="margin: 0 10px 0 50px;" class="lead">翻桌唷不只是賣桌遊 在歐美國家的家庭時間中，桌上遊戲是不可缺少的要素。
				不論是朋友聚會或是家人同樂，任何聯誼性質的活動都能馬上炒熱氣氛，</p>
		</div>

		<hr class="featurette-divider">

		<!-- Second Featurette -->
		<div class="featurette" id="services">
			<img style="height: 500px"
				class="featurette-image img-circle img-responsive pull-left"
				src="<c:url value="/Tim/image/big/right_baby_fllow.png"/>">
			<h2 style="margin: 150px 50px 50px 50px" class="featurette-heading">
				翻桌唷賣的<span  style="color:#f11212;class="text-muted">「不只是桌遊，還是快樂」。</span>
			</h2>
			<p style="margin: 0 10px 0 50px;" class="lead">全台巡迴推廣活動、大大小小的遊戲比賽、
				服務據點的增加，為了就是讓更多人親身體驗桌遊的魅力。</p>
		</div>


		<hr class="featurette-divider">
		<div class="featurette" id="contact">
			<img style="height: 500px"
				class="featurette-image img-circle img-responsive pull-right"
				src="<c:url value="/Tim/image/big/left_baby_yellow.png"/>">
			<h2 style="margin: 150px 50px 50px 50px" style=""
				class="featurette-heading">
				隨著年齡不同，桌遊的選項也多樣化。 <span class="text-muted"></span>
			</h2>
			<p style="margin: 0 10px 0 50px;" class="lead">這樣一個伴隨孩子成長的娛樂活動，能夠增進人際互動、不同主題的遊戲，
				也將多元學習融入之中、遊戲的成功與失敗引導孩子建立正確的態度， 甚至是單純的「快樂」，都是家長能給予孩子一生的禮物。</p>
		</div>



	</div>
	<!-- Third Featurette -->

	<hr class="featurette-divider">
	<script type="text/javascript">
		// 		$(document).ready(function() {
		// 			$(".carousel-inner").swiperight(function() {
		// 				$(this).parent().carousel('prev');
		// 			});
		// 			$(".carousel-inner").swipeleft(function() {
		// 				$(this).parent().carousel('next');
		// 			});
		// 		});
	</script>
</body>
</html>