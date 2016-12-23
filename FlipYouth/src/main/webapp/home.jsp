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
	<div style="text-align: center;"><h3 >${loginOK.mbrName}</h3></div>
	<div class="row" >
	<div style="height: 50px ;" class="col-md-12">
		<a href="<c:url value="login/login.jsp"/>" data-toggle="modal"
			data-target="login.jsp#login-modal"><h1 style="text-align: center;">登入</h1></a>
	</div>
	<div style="height: 50px;style:text-align: center;" class="col-md-12">
		<a href="<c:url value="/logout.controller"/>"><h1 style="text-align: center;">登出</h1></a>
	</div></div>

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-2"></div>
					<div class="col-md-2">
						<h5>碩延功能</h5>
						<!-- 已下加入 -->

					</div>
					<div class="col-md-2">
						<h5>心惠功能</h5>
						<!-- 已下加入 -->

						<a href="<c:url value="pages/editMember.jsp"/>">修改會員</a>

					</div>
					<div class="col-md-2">
						<h5>德樂功能</h5>
						<!-- 已下加入 -->

					</div>
					<div class="col-md-2">
						<h5>冠霆功能</h5>
						<!-- 已下加入 -->

						<a href="<c:url value="/Shop.controller"/>">商品列表</a>
					</div>
					<div class="col-md-2">
						<h5>巫迪功能</h5>
						<!-- 已下加入 -->

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
