<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


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
	font-size: 900;
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

#cars, #span {
	font-size: 17px;
	line-height: 2.0;
	font-weight: 600;
	font-family: Microsoft JhengHei;
}
</style>
</head>
<script type="text/javascript">
<%if (session.getAttribute("shopBean") == null) {%>
$.ajax({	
	url: "/FlipYouth/Shop.controller?gameClass=1",
	type:"POST",
	async: false,
	xhrFields: {
		withCredentials: false },
	success:function(res) {
		window.location.href="/FlipYouth/Shop.controller"
	},
})

<%}%>

</script>
<body id="body">
	<span id="wdth"></span>
	<c:set var="ShopUrl" scope="session"
		value="'/FlipYouth/Shop.controller'" />
	<div>
		<%-- 		style="background-image: url(<c:url value="/Tim/image/big/bg.png"/>); background-repeat: repeat;"> --%>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="row">
						<div id="shop-left" class="col-md-3">
							<div class="row">
								<div class="col-md-2" style="margin-left: 20px; width: 150px">
									<div class="row ">
										<div style="font-family: PMingLiU" class="col-md-12 ">
											<font class="mart">遊戲商城</font>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/1.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=1"/>">全部</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/2.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=2"/>">自有商品</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/3.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=3"/>">派對遊戲</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/4.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=4"/>">親子桌遊</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/5.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=5"/>">輕度策略</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/6.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=6"/>">重度策略</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/7.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=7"/>">台灣原創</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/8.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=8"/>">麥卡貝推</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img src="<c:url value="/Tim/image/icon/9.png" />"> <a
												href="<c:url value="/Shop.controller?gameClass=9"/>">卡套</a>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 border_bottom">
											<img style="height: 40px; width: 40px"
												src="<c:url value="/Tim/image/icon/buy.jpg" />"><span
												id="cars">購物車</span><br> <span id="span"><font
												style="color: red">目前金額${ALL}<br>目前件數${count}
											</font></span> </a><br>
											<!-- 											 -->
											<a style="color: #ffffff" name="checkOut.jsp"
												href="<c:url value="/order.controller?goOrder=1"/>"
												class="btn btn-primary fluid login" role="button">前往結帳</a> <a
												onclick="clearCar()" style="color: #ffffff"
												class="btn btn-primary fluid" role="button">清除購物車</a>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="col-md-9">
							<c:forEach items="${shopBean.shopBean}" var="data">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail ">
										<a href="<c:url value="/Shop.controller?ID=${data.gameSN}"/>"><img
											class="img-rounded" style="height: 200px"
											src="<c:url value="/Tim${data.smallImage}"/>"></a>
										<div style="height: 200px;" class="caption">
											<h3 style="text-overflow: ellipsis;">
												<a style="line-height: 1.5;"
													href="<c:url value="/Shop.controller?ID=${data.gameSN}"/>"><nobr>${data.gameName}</nobr></a>
											</h3>
											<p style="height: 60px">${data.introduction}</p>
											<h4 style="float: right; position: absolute; bottom: 70px;">
												價格: <font style="color: red">NT\$${data.price}元</font>
											</h4>
											<p
												style="position: absolute; bottom: 30px; margin: 0px auto;">
												<a style="color: #ffffff" class="btn btn-primary fluid"
													role="button" id="ShoppingCar"
													onclick="car(${data.gameSN},${data.price},${ShopUrl})">放入購物車</a>
												<a
													href="<c:url value="/Shop.controller?ID=${data.gameSN}"/>"
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
	$(document).ready(function(){
		wdth=$(window).width();
        if(wdth<975){
        	$('#shop-left').hide();
        }else{
        	$('#shop-left').show();
        }
	    $(window).resize(function() {
	        wdth=$(window).width();
	        if(wdth<975){
	        	$('#shop-left').hide();
	        }else{
	        	$('#shop-left').show();
	        }
	    });
	});
	</script>

	<script type="text/javascript">
// 	window.onload = refreshParent;
    function refreshParent() {
    	$.ajax({	
			url: window.location.href,
			type:"POST",
			async: false,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				$('body').html(res);
			},
		})
    	
    }
    function clearCar(){
    			$.ajax({	
    				url: "Shop.controller",
    				type:"POST",
    				data:{clearCar:1},
    				async: false,
    				xhrFields: {
    					withCredentials: false },
    				success:function(res) {
    					window.location=window.location.href;
    				},
    			})
    		}
    function car(gameSN,price,href){
    	var b = price;
		var a= gameSN;
		$.ajax({	
			url: href,
			type:"POST",
			data:{
				name:gameSN,
				price:price
			},
			async: false,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				$('#span').html(res);
			},
		})
	}
	</script>
</body>
</html>