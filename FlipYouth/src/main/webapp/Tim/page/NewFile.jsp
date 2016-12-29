<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/producHome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/bootstrap-select.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/nouislider.css"/>">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous"> --%>

<style type="text/css">
.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: #fff;
	border: 1px solid #3949ab;
	border-bottom-color: transparent;
}
</style>
</head>
<body>
	<div class="nav nav-pills " id="navbar-ex1-collapse"
		aria-expanded="false" style="height: 1px;">
		<ul class="nav navbar-nav" role="tablist">
			<li role="presentation" class="active"><a href="#home"
				id="hihihih" aria-controls="home" role="tab" data-toggle="tab"
				onclick="toggleTab(this)">商城首頁</a></li>
			<li role="presentation"><a href="#one" aria-controls="one"
				role="tab" data-toggle="tab" onclick="toggleTab(this)">商城列表</a></li>
			<li role="presentation"><a href="#two" aria-controls="two"
				role="tab" data-toggle="tab" onclick="toggleTabCar(this)">購物車</a></li>
			<li role="presentation"><a href="#three" aria-controls="three"
				role="tab" data-toggle="tab" onclick="toggleTab(this)">確認訂單</a></li>
			<li role="presentation">
		</ul>
	</div>

	<!-- 	<div class="container"> -->

	<!--            -->
	<!--             <ul class="nav navbar-nav"> -->
	<!--               <li><a href="index.html">商城首頁</a></li> -->
	<!--               <li class="active"><a href="products.html">商品列表</a></li> -->
	<!--               <li><a href="cart.html">購物車</a></li> -->
	<!--               <li><a href="checkout.html">確認訂單</a></li> -->
	<!--              </ul> -->
	<!--           </div> -->
	<!--        -->






	<script type="text/javascript">
		function toggleTab(thiss) {
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')

			$('#' + a).show();
		}
		function toggleTabCar(thiss) {
			$('#two').empty();
			$('#two')
					.append(
							'<iframe style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/Shop/shoppingCar.jsp"></iframe>');
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
	</script>
	<!-- Tab panes -->
	<div class="tab-content">
		<div style="display: none" role="tabpanel" class="a tab-pane active"
			id="home">
			<jsp:include page="/Tim/page/Shop/shopHome.jsp"></jsp:include>
		</div>

		<div class="a" style="display: none" role="tabpanel" class="tab-pane"
			id="one">
			<jsp:include page="/Tim/page/Shop/list.jsp"></jsp:include>
		</div>
		<div class="a" style="display: none" role="tabpanel" class="tab-pane"
			id="two">
			<%-- 			<iframe style="width: 100% ;height: 900px" name="frame1" src="<c:url value="/Tim/page/Shop/shoppingCar.jsp"/>"></iframe> --%>
			<%-- 			<jsp:include page="/Tim/page/Shop/shoppingCar.jsp"></jsp:include> --%>
		</div>
		<div class="a" style="display: none" role="tabpanel" class="tab-pane"
			id="three">
			<jsp:include page="/Tim/page/order/checkOut.jsp"></jsp:include>
		</div>


	</div>


	<script type="text/javascript">
		
	</script>




	<!-- 		<div id="list" style="display: none"></div> -->
	<!-- 		<!-- 		<div id="orderOver" style="display: none"> -->
	<%-- 		<%-- 			<jsp:include page="/Tim/page/order/orderOver.jsp"></jsp:include> --%>
	<!-- 		<!-- 		</div> -->
	<!-- 		<div id="shoppingCar" style="display: none"> -->
	<%-- 			<jsp:include page="/Tim/page/Shop/shoppingCar.jsp"></jsp:include> --%>
	<!-- 		</div> -->
	<!-- 		<div id="shopHome" style="display: none"></div> -->

	<%-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script> --%>
</body>
</html>