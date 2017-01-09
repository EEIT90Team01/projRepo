<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	<!--  最新編譯和最佳化的Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!-- 	crossorigin="anonymous"> -->

	 <!--  選擇性佈景主題 Optional theme -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" -->
<!-- 	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" -->
<!-- 	crossorigin="anonymous"> -->

<script src="/Kelsey/js/nav_motion.js"></script>


<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'> 
  
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  
<link href="<c:url value="/Kelsey/css/index3.css"/>" rel="stylesheet">
<%-- <link href="<c:url value="/Kelsey/css/nav-group.css"/>" rel="stylesheet"> --%>

<link href="/Kelsey/css/nav_motion.css" rel="stylesheet">

</head>
<%@ include file="/chatRoom.jsp" %>
<body>
<%-- <span>Wellcome ${loginOK.nickName}</span> --%>
	<div class="hero">
 <img class="header_left_img" src="images/light_green/logo_06-02.png" />
 <img class="header_right_img" src="images/non_profile.png" />
<%--   <img class="header_right_img" src="data:image/png;base64,${user_photo}" /> --%>
 
<!-- <img class="header_right_img" src="images/non_profile.png"  width=80px hegiht=80px style="position:absolute;right:0px;top:50%;margin-top:-40px"> -->
		<h1>
			翻&nbsp桌&nbsp唷&nbsp<strong>Flip Youth</strong>
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
		<div id="nav-icon3">
			  <span></span>
			  <span></span>
			  <span></span>
			  <span></span>
		</div>
		<nav id="navContainer">
		<ul>
			<li ><a href="<c:url value="/Tim/login/login.jsp"/>">Sign In</a></li>
			<li><a 	href="<c:url value="/logout.controller"/>">Sign Up</a></li>
			<li ><a
				href="<c:url value='/pages/memberIndex.jsp'/>" >
					<img src="<c:url value='/Kelsey/images/basic_gray/settings.png'/>" class="navimg">&nbsp&nbsp會員中心&nbsp
					
			</a></li>

			<li ><a href="<c:url value="/Tim/page/FlipYouthStore.jsp"/>"> <img
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



	<div class="container">
		<figure> <img
			src="https://d13yacurqjgara.cloudfront.net/users/220419/screenshots/1714518/shot-codigo.jpg"
			alt="Thumb" width="400" height="300" /> <figcaption>
		<div>Thumbnail Caption</div>
		</figcation></figure>

		<figure> <img
			src="https://d13yacurqjgara.cloudfront.net/users/220419/screenshots/1678299/shot-7.jpg"
			alt="Thumb" width="400" height="300" /> <figcaption>
		<div>Thumbnail Caption</div>
		</figcation></figure>


		<figure> <img
			src="https://d13yacurqjgara.cloudfront.net/users/220419/screenshots/1664639/shot.png"
			alt="Thumb" width="400" height="300" /> <figcaption>
		<div>Thumbnail Caption</div>
		</figcation></figure>


		<figure> <img
			src="https://d13yacurqjgara.cloudfront.net/users/220419/screenshots/1644214/debut-shot.jpg"
			alt="Thumb" width="400" height="300" /> <figcaption>
		<div>Thumbnail Caption</div>
		</figcation></figure>
<img  class="container_bottom_img" src="images/background/work.png">

	</div>

    
    <!-- ********* container 結束 *******************************-->
	
	<div id="footer">
    
	<!--<img class="footer_left_img" src="images/light_green/logo_02-02.png">-->
	
    </div>

<!-- ************javascript 開始 ************************************************************************-->

<!--  最新編譯和最佳化的 Latest compiled and minified JavaScript -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" -->
<!-- 	crossorigin="anonymous"></script> -->

<!--  Bootstrap-jquery CDN  -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.js" -->
<!-- 	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- <script src="/Kelsey/js/easing/EasePack.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/plugins/CSSPlugin.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/TweenMax.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/nav_motion.js"></script> -->

<%-- <script type="text/javascript" src="<c:url value="/Kelsey/js/nav-group.js"/>"></script> --%>

</body>
</html>