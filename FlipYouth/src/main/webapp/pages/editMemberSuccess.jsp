<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Member Success</title>
<style type="text/css">
.member {width =500px;
	
}

.st1 {
	border-bottom: 1.5px solid pink;
	margin: 10px;
	padding: 10px;
}

fieldset {
	margin: 15px;
	border: 5px solid #FFC8B4;
	border-radius: 10px;
	width: 400px;
	min-height: 350px;
	padding: 20px;
}

.st2 {
	margin: 20px;
	text-align: center;
}

.title {
	text-align: right;
	width: 80px;
	padding-right: 5px;
}

p {
	font-size: 0.5em;
	color: #beaeae;
}
</style>
</head>
<body>
<%@ page import="model.MemberBean"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
WebApplicationContext context = (WebApplicationContext) WebApplicationContextUtils.getWebApplicationContext(application);
MemberBean user = (MemberBean)session.getAttribute("user");
String user_photo = null;
if(user != null){
	user_photo = Base64.getEncoder().encodeToString(user.getImage());
}
session.setAttribute("user_photo", user_photo);
%>

	<form action="<c:url value='/member.controller'/>" method="post" enctype="multipart/form-data">
		<fieldset>

			<legend>個人資料</legend>
						<div class="st1">
				<label class="title">暱稱：</label><span>${editSuccess.nickName}</span></div>
			<div class="st1">
				<label class="title">密碼：</label> ${editSuccess.mbrPassword}</div>
			<div class="st1">
				<label class="title">地址：</label> ${editSuccess.address}</div>
				
			<div class="st1">
				<label class="title">手機號碼：</label> ${editSuccess.phone}</div>
			<div class="st1">
				<label class="title">Email：</label>${editSuccess.mbrEmail}</div>
			<div class="st1">
				<label class="title">大頭貼：</label> 
				<img src='/showPicture.controller?image=${image}'/>
			</div>

		</fieldset>
	</form>

</body>
</html>