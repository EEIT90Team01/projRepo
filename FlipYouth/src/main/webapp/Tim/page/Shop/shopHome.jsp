<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
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
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script>

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

.overfont {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.title {
	border-bottom: 3px solid #9fa8da;
}

.select {
	border-color: #1036d0;
	outline: 0 !important;
	background-color: #eee;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.noUi-horizontal {
	height: 13px;
}

.list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
}

.dropdown-menu { !important;
	
}
</style>








</head>
<body id="body">
	<span id="wdth"></span>
	<c:set var="ShopUrl" scope="session"
		value="'/FlipYouth/Shop.controller'" />
	<!-- 	<div> -->
	<%-- 		style="background-image: url(<c:url value="/Tim/image/big/bg.png"/>); background-repeat: repeat;"> --%>



	<div class="container">
		<div class="col-xs-12" style="height: 300px"></div>
		<!-- 選單  以下 -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">商城首頁</a></li>
						<li><a href="<c:url value="/Tim/page/Shop/list.jsp"/>">商品列表</a></li>
						<li><a href="">購物車</a></li>
						<li><a onclick=""
							href="<c:url value="/Tim/page/order/checkOut.jsp"/>">確認訂單</a></li>
						<li><a href="">訂單明細</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 選單  以上 -->
		<div id="">
		<div id="list.jsp"><jsp:include page="<c:url value="/Tim/page/Shop/list.jsp"/>"></div>
		<div id="checkOut.jsp"><jsp:include page="<c:url value="/Tim/page/order/checkOut.jsp"/>"></div>
		<div id=""><jsp:include page="<c:url value="/Tim/page/Shop/list.jsp"/>"></div>
		<div id=""><jsp:include page="<c:url value="/Tim/page/Shop/list.jsp"/>"></div>
		<div id=""><jsp:include page="<c:url value="/Tim/page/Shop/list.jsp"/>"></div>
		</div>
		


</body>
</html>