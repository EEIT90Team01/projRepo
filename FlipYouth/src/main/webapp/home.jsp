<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<html>
<head>
<meta charset="utf-8">
<title>home</title>
<style type="text/css">
/* div { */
/* 	border: 1px solid; */
/* } */
</style>
</head>


<body>
	<div style="text-align: center;">
	<font style="font-size :40px;font-family: Microsoft JhengHei; color:#00b707; text-align: center;"><h3></h3><c:out value="${empty loginOK.nickName ? '' : loginOK.nickName+='已登入'}" /></h3></div>
				</font>
	<div class="row">
		<div style="height: 50px;" class="col-xs-12">
			<a href="<c:url value="/Tim/login/login.jsp"/>">
				<h1 style="text-align: center;">登入</h1>
			</a>
		</div>
		<div style="height: 50px; style: text-align: center;"
			class="col-xs-12">
			<a href="<c:url value="/logout.controller"/>"><h1
					style="text-align: center;">登出</h1></a>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-2"></div>
					<div class="col-xs-2">
						<h5>碩延功能</h5>
						<!-- 已下加入 -->
						<a href="<c:url value="/index.jsp"/>">註冊</a><BR> <a
							href="<c:url value="/Shop.controller?ID=1"/>">商品留言板</a><BR>
					</div>
					<div class="col-xs-2">
						<h5>心惠功能</h5>
						<!-- 已下加入 -->
						<a href="<c:url value="pages/editMember.jsp"/>">修改會員</a>
					</div>
					<div class="col-xs-2">
						<h5>德樂功能</h5>
						<!-- 已下加入 -->

					</div>
					<div class="col-xs-2">
						<h5>冠霆功能</h5>
						<!-- 已下加入 -->
						<a href="<c:url value="/Tim/login/login.jsp"/>">登入</a><BR> <a
							href="<c:url value="/logout.controller"/>">登出</a><BR> <a
							href="<c:url value="/Tim/page/FlipYouthStore.jsp"/>">商城</a><BR> <BR>
						<a href="<c:url value="/Tim/page/order/orderDetal.jsp"/>">訂單明細</a><BR>
						<a href="<c:url value="/Shop.controller?ID=1"/>">單件商品</a><BR>
					</div>
					<div class="col-xs-2">
						<h5>巫迪功能</h5>
						<!-- 已下加入 -->
						<a href="<c:url value="/admin/index.jsp"/>">後台(方便測試用正式版前後台不會有連結)</a><br>
						<a href="<c:url value="/playGame.controller"/>">卡個位希望生得出遊戲</a><br>
						<h3 class="text-danger">${playGameError}</h3>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
