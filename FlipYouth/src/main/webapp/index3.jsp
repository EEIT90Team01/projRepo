<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<%@ page import="model.MemberBean"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	//將存在資料庫的二進位檔轉成base64並輸出在網頁上
	WebApplicationContext context = (WebApplicationContext) WebApplicationContextUtils
			.getWebApplicationContext(application);
	MemberBean user = (MemberBean) session.getAttribute("loginOK");
	String user_photo = null;
	if (user != null) {
		user_photo = Base64.getEncoder().encodeToString(user.getImage());
	}
	session.setAttribute("user_photo", user_photo);
%>
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




<link href='http://fonts.googleapis.com/css?family=Raleway:400,200'
	rel='stylesheet' type='text/css'>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<%-- <link href="<c:url value="/Kelsey/css/nav-group.css"/>" rel="stylesheet"> --%>

<link href="<c:url value="/Kelsey/css/index3.css"/>" rel="stylesheet">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>"
	rel="stylesheet">

</head>
<body>
	<div class="hero">
		<img class="header_left_img"
			src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />

		<c:if test="${loginOK != null }">
			<img class="header_right_img"
				src="data:image/jpg;base64,${user_photo}">
			<div class="memberContentIndex">
				<blockquote class="blockquote_k">
					<!-- 							<p>翻桌唷 -- 會員專區</p> -->
					<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
				</blockquote>
			</div>

		</c:if>
		<h1>
			翻&nbsp桌&nbsp唷&nbsp<strong>Flip Youth</strong>
		</h1>

	</div>

	<!-- ********	導入導覽列   **************************************-->
	<%-- <jsp:include page="<c:url value="/nav.jsp"/>"></jsp:include> --%>
	<jsp:include page="/nav.jsp"></jsp:include>




	<!-- ********* container 開始 *******************************-->

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
		<img class="container_bottom_img"
			src="<c:url value="/Kelsey/images/background/work.png"/>">

	</div>


	<!-- ********* container 結束 *******************************-->


	<!--****** 	導入footer  *****************************-->
	<jsp:include page="/footer.jsp"></jsp:include>

	<!-- ************javascript 開始 ************************************************************************-->

	<!--  最新編譯和最佳化的 Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>

	<!--  Bootstrap-jquery CDN  -->
	<script src="https://code.jquery.com/jquery-3.1.1.js"
		integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
		crossorigin="anonymous"></script>

	<!-- <script src="/Kelsey/js/easing/EasePack.min.js"></script> -->
	<!-- 	<script src="/Kelsey/js/plugins/CSSPlugin.min.js"></script> -->
	<!-- 	<script src="/Kelsey/js/TweenMax.min.js"></script> -->
	<!-- 	<script src="/Kelsey/js/nav_motion.js"></script> -->
	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>

	<%-- <script type="text/javascript" src="<c:url value="/Kelsey/js/nav-group.js"/>"></script> --%>
	<%@ include file="/chatRoom.jsp" %>

</body>
</html>