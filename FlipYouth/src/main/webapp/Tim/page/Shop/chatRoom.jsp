<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link type="text/css" href="<c:url value="/Samuel/css/chatbox/online_userList.css"/>"	rel="stylesheet" />


<link rel="stylesheet" href="<c:url value="/Samuel/css/chatbox/jquery-ui-1.8.2.custom.css"/>" type="text/css" media="screen" />

<link type="text/css" href="<c:url value="/Samuel/css/chatbox/jquery.ui.chatbox.css"/>" rel="stylesheet" />
<c:if test="${not empty Comment}">
<body>
	<div class="chat_room_box">
		<input type="hidden" id="websocketUserNickName" value="${loginOK.nickName}">
		<input type="hidden" id="websocketUserSN" value="${loginOK.mbrSN}">		
		<div class="chat_room_head">Chat Room</div>
		<div class="chat_room_body">			
		</div>
	</div>

</body>

<script type="text/javascript"	src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="<c:url value="/Samuel/js/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Samuel/js/jquery-ui-1.8.2.custom.min.js"/>"></script>

<script type="text/javascript" src="<c:url value="/Samuel/js/chatboxManager.js"/>"></script>

<script type="text/javascript" src="<c:url value="/Samuel/js/jquery.ui.chatbox.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Samuel/js/chatRoom.js"/>"></script>
</c:if>
</html>