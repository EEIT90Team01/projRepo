<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<!--  最新編譯和最佳化的Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!--  選擇性佈景主題 Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">


<link rel="stylesheet" href="<c:url value='/Kelsey/css/relation.css'/>">
<%-- <link href="<c:url value="/Kelsey/css/index3.css"/>" rel="stylesheet"> --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Index</title>

<style type="text/css">
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

</style>
</head>
<body>
<%@ page import="model.MemberBean"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
//將存在資料庫的二進位檔轉成base64並輸出在網頁上
WebApplicationContext context = (WebApplicationContext) WebApplicationContextUtils.getWebApplicationContext(application);
MemberBean user = (MemberBean)session.getAttribute("loginOK");
String user_photo = null;
if(user != null){
	user_photo = Base64.getEncoder().encodeToString(user.getImage());
}
session.setAttribute("user_photo", user_photo);
%>

												
						<div class="hero">
								 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
									<h1>
											會&nbsp員&nbsp資&nbsp料&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
						
	<!-- ***************	導覽列   開始  ******************************-->
<!-- 	<a href="#menu" id="toggle"><span></span></a> -->

<!--   <div id="menu"> -->
<!--     <ul> -->
<!--       <li><a href="#home">Home</a></li> -->
<!--       <li><a href="#about">About</a></li> -->
<!--       <li><a href="#contact">Contact</a></li> -->
<!--     </ul> -->
<!--   </div> -->
<!-- </div> -->
	
<!-- <a href="#menu" id="toggle"><span></span></a> -->
<!-- 	<div id='menu' class="list-group-k"> -->
	<div id='nav-group' class="list-group-k">
		<nav>
		<ul>
			<li ><a href="login.jsp#login-modal"
				data-toggle="modal" data-target="login.jsp#login-modal">Login</a></li>
			<li ><a
				href="<c:url value='/pages/editMember.jsp'/>" >
					<img src="<c:url value='/Kelsey/images/basic_gray/settings.png'/>" class="navimg">&nbsp&nbsp修改個人資料&nbsp
					
			</a></li>

			<li ><a href="<c:url value='/Shop.controller'/>"> <img
					src="<c:url value='/Kelsey/images/basic_gray/shopping-cart.png'/>" class="navimg">&nbsp&nbsp翻桌唷&nbsp商城&nbsp
			</a></li>

			<li ><a href="" > <img
					src="<c:url value='/Kelsey/images/basic_gray/megaphone.png'/>" class="navimg">&nbsp&nbsp我的揪團&nbsp
			</a></li>

			<li ><a
				href="<c:url value='/searchRelation.controller' />"> <img
					src="<c:url value='/Kelsey/images/basic_gray/stick-man.png'/>" class="navimg">&nbsp&nbsp我的好友&nbsp
			</a></li>

			<li ><a href="" > <img
					src="<c:url value='/Kelsey/images/basic_gray/time.png'/>" class="navimg">&nbsp&nbsp我的月曆&nbsp
			</a></li>
		</ul>
		</nav>

	</div>
    



	<!-- ***************	導覽列   結束  ******************************-->

		<fieldset>

			<legend>個人資料</legend>
						<div class="st1">
				<label class="title">暱稱：</label><span>${loginOK.nickName}</span></div>
			<div class="st1">
				<label class="title">密碼：</label> ${loginOK.mbrPassword}</div>
			<div class="st1">
				<label class="title">地址：</label> ${loginOK.address}</div>
				
			<div class="st1">
				<label class="title">手機號碼：</label> ${loginOK.phone}</div>
			<div class="st1">
				<label class="title">Email：</label>${loginOK.mbrEmail}</div>
			<div class="st1">
				<label class="title">大頭貼：</label> 
				<img src='data:image/png;base64,${user_photo}' width=150	height=auto/>
<%-- 				<img src='/showPicture.controller?mbrSN=${loginOK.mbrSN}'/> --%>
			</div>

		</fieldset>
		    <!-- ********* container 結束 *******************************-->
	
	<div id="footer">
    
	<!--<img class="footer_left_img" src="images/light_green/logo_02-02.png">-->
	
    </div>
	

<!-- ************javascript 開始 ************************************************************************-->

<!-- Bootstrap-jquery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>


<!-- 最新編譯和最佳化的 Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</body>
</html>