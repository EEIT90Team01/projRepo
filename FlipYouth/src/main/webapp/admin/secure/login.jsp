<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../css/table.css" />

<title>Content Management System Login</title>
</head>
<body>
<c:if test="${!empty admin}">
		<h4>Bye~ ${admin.admId}</h4>
		<c:remove var="admin"/>
</c:if>
<h3>Login</h3>

<form action="<c:url value="/admin/secure/adminLogin.controller" />" method="get">
<table>
	<tr>
		<td>ID : </td>
		<td><input type="text" name="admId" value="${param.admId}"></td>
		<td>${errors.admId}</td>
	</tr>
	<tr>
		<td>PWD : </td>
		<td><input type="text" name="admPassword" value="${param.admPassword}"></td>
		<td>${errors.admPassword}</td>
	</tr>
	<tr>
		<td>　</td>
		<td align="right"><input type="submit" value="Login"></td>
	</tr>
</table>
</form>
<hr>
<a href="<c:url value='/admin/index.jsp'/>">back</a>
</body>
</html>