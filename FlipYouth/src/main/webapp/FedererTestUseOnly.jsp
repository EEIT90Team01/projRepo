<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Print Form Backing Bean</title>
</head>
<body style="background-color:#FFBD45;">

	<h3>Success ${eventGo}</h3><br/>
		userAddAddress to locSN= 	${eventGo.userAddAddress}<br/>
		startDateTime= 				${eventGo.startDateTime}<br/>
		endDateTime= 				${eventGo.endDateTime}<br/>
		closeDateTime= 				${eventGo.closeDateTime}<br/>
		userAddUpLimit= 			${eventGo.userAddUpLimit}<br/>
		userAddDownLimit= 			${eventGo.userAddDownLimit}<br/>
		
	<h3><button><a href="<c:url value='/events/eventing.controller'/>">進入1Eventing 揪團!!!</a></button></h3>

</body>
</html>