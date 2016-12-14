<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FlipYouth Content Management System</title>
</head>
<body>
	<h2>Welcome to FlipYouth Content Management System</h2>
	<p />
	<c:if test="${empty admin}">
		<a href="<c:url value='/admin/secure/login.jsp'/>">Login</a>
	</c:if>
	<c:if test="${!empty admin}">
		<h3>Hi! ${admin.admId}</h3>
		<a href="<c:url value='/admin/pages/stringMapping.jsp'/>">StringMapping</a>
		<a href="<c:url value='/admin/secure/login.jsp'/>">Logout</a>
	</c:if>
</body>
</html>

