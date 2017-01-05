<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="<c:url value="/Tim/css_Tim/one-page-wonder.css"/>"
	rel="stylesheet">



<script type="text/javascript">
	$(document).ready(function() {
		console.log("ready!");
	});
</script>
<style type="text/css">
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
    filter: alpha(opacity=50);
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

@media screen and (max-width: 700px){
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
		<div id="myCarousel" class="carousel slide" style="max-width: 1200px; max-height:600px; margin: 0px auto;">
            <ol class="carousel-indicators hidden-xs hidden-sm" style="padding-bottom: 42px;">
                <li data-target="#carcousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carcousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carcousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="active item" align="center"><a href="javascript:void(0)"><img src="<c:url value="/Tim/image/big/background/f1.png"/>" class="img-rounded" alt="PS3 reparatie Haarlem"></a>
                   
                </div>
                <div class="item" align="center"><a href="javascript:void(0)"><img src="<c:url value="/Tim/image/big/background/f3.jpg"/>" class="img-rounded" alt="Blu-ray Lens reparatie"></a>
                    
                </div>
                <div class="item" align="center"><a href="javascript:void(0)"><img src="<c:url value="/Tim/image/big/background/f4.jpg"/>" class="img-rounded" alt="Yellow Light of Death"></a>
                    
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
        </div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	</header>
	<div class="container">
		<hr class="featurette-divider">
		<!-- First Featurette -->
		<div class="featurette" id="about">
			<img class="featurette-image img-circle img-responsive pull-right"
				src="<c:url value="/Tim/image/big/2.jpg"/>">
			<h2 class="featurette-heading">
				This First Heading <span class="text-muted">Will Catch Your
					Eye</span>
			</h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor
				fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
				commodo cursus magna, vel scelerisque nisl consectetur. Fusce
				dapibus, tellus ac cursus commodo.</p>
		</div>

		<hr class="featurette-divider">

		<!-- Second Featurette -->
		<div class="featurette" id="services">
			<img class="featurette-image img-circle img-responsive pull-left"
				src="<c:url value="/Tim/image/big/2.jpg"/>">
			<h2 class="featurette-heading">
				The Second Heading <span class="text-muted">Is Pretty Cool
					Too.</span>
			</h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor
				fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
				commodo cursus magna, vel scelerisque nisl consectetur. Fusce
				dapibus, tellus ac cursus commodo.</p>
		</div>

		<hr class="featurette-divider">
		<div class="featurette" id="contact">
			<img class="featurette-image img-circle img-responsive pull-right"
				src="<c:url value="/Tim/image/big/2.jpg"/>">
			<h2 class="featurette-heading">
				The Third Heading <span class="text-muted">Will Seal the
					Deal.</span>
			</h2>
			<p class="lead">Donec ullamcorper nulla non metus auctor
				fringilla. Vestibulum id ligula porta felis euismod semper. Praesent
				commodo cursus magna, vel scelerisque nisl consectetur. Fusce
				dapibus, tellus ac cursus commodo.</p>
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