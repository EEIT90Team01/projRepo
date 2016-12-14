<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />


<title>String Mapping Display</title>
</head>
<body>

	<h3>Select String Mapping Table Result : row(s) selected</h3>
	<c:if test="${not empty select}">
		<table>
			<thead>
				<tr>
					<th>String NO</th>
					<th>Text</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="element" items="${select}">
					<c:url value="/admin/pages/stringMapping.jsp" var="path">
						<c:param name="strNo" value="${element.strNo}" />
						<c:param name="mappedString" value="${element.mappedString}" />
					</c:url>
					<tr>
						<td><a href="${path}">${element.strNo}</a></td>
						<td>${element.mappedString}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<h3>
		<a href="<c:url value="/admin/pages/stringMapping.jsp" />">String Mapping Table</a>
	</h3>

</body>
</html>