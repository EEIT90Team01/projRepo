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
<link rel="stylesheet" href="<c:url value='/Kelsey/css/member.css'/>">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Member Success</title>

</head>
<body>
								
						<div class="hero">
						<c:if test="${loginOK != null }">
							<img class="header_right_img" src="data:image/jpg;base64,${editSuccessImage.image}" >
							<div class="memberContentIndexPage">
									<blockquote class="blockquote_k">
		<!-- 							<p>翻桌唷 -- 會員專區</p> -->
										<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
									</blockquote>
							</div>
							
						</c:if>
						
								 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
									<h1>
											會&nbsp員&nbsp資&nbsp料&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
					
					
<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>
						
		<fieldset>

			<legend  class= "legend_k" >個人資料</legend>
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
				<img src='data:image/jpg;base64,${editSuccessImage.image}' width=150	height=auto/>
<%-- 				<img src='/showPicture.controller?mbrSN=${loginOK.mbrSN}'/> --%>
			</div>

		</fieldset>
		
		
 
		    
    <!-- ********* container 結束 *******************************-->
	
<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>


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

<!-- <script src="/Kelsey/js/easing/EasePack.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/plugins/CSSPlugin.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/TweenMax.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/nav_motion.js"></script> -->
	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>	

</body>
</html>