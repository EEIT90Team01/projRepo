<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta charset="utf-8">
		<title>home</title>
	</head> 
	<body>
		<a href="<c:url value="/Shop.controller"/>">商品列表</a>
		<a href="login.jsp" data-toggle="modal" data-target="login.jsp#login-modal">Login</a>
		<a href="<c:url value="pages/editMember.jsp"/>">修改會員</a>
		<a href="<c:url value="/logout.controller"/>">登出</a>
	</body>
</html>
