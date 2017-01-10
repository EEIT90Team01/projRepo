<%@page import="com.sun.prism.impl.Disposer.Target"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">

<!--*********** 下排按鈕x2個link  ********************************-->
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="<c:url value='/Kelsey/css/button.css' />" > 


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
</head>
<style>
*{
font-family:"微軟正黑體";
}
</style>

<body>

<%-- 					利用一個type="hidden" 隱藏需要抓取${loginOK.mbrSN}的標籤,並利用此標籤送出查詢 --%>
								<input type="hidden" value="${loginOK.mbrSN}" id="mbrSN"/>
								
																
						<div class="hero">
						
						<c:if test="${loginOK != null }">
							<img class="header_right_img" src="data:image/jpg;base64,${user_photo}" >
							<div class="memberContentIndexPage">
									<blockquote class="blockquote_k">
		<!-- 							<p>翻桌唷 -- 會員專區</p> -->
										<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
									</blockquote>
							</div>
							
						</c:if>
						
								 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
									<h1>
											封&nbsp鎖&nbsp名&nbsp單&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
		<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>				
						
								
	<div class="container">
		<div class="row">
			<div class="col-md-12">


				<!-- ********** 左邊下拉列表   開始  **********************************************-->
				<div class="row">
					<!-- ********** 搜尋會員   開始  **********************************************-->
					<div class="col-md-12">
						<nav class="navbar navbar-default" role="navigation">
						<div class="collapse navbar-collapse"	id="bs-example-navbar-collapse-1">
							
						<div class="navbar-header">
							<a class="navbar-brand" href="#">搜尋會員</a>
						</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="請輸入會員名稱" id="nickName" />
								</div>
								<button type="submit" class="btn btn-default" onclick="searchMember()" id="searchMemberButton" >搜尋</button>
						</div>
						</nav>
					</div>
					<!-- ********** 搜尋會員  結束 **********************************************-->
				</div>



				<div class="row">
					<div class="col-md-12">
						<div class="container">
						
						<!-- ********** 顯示搜尋會員  開始 **********************************************-->
												
						<div style="display:none;" id="searchMemberArea" class="searchMemberAreaClass">
								<figure> 
								<img  alt="Thumb" id="searchMemberImage" width=120	height=auto/>
								
								<figcaption>
								<div id="searchMemberNickname"></div>
								</figcation>
								
								</figure>
								

								<input type="button" value="加入好友" id="insertFriendButton" />
								<input type="button" value="刪除好友" id="deleteFriendButton" />
								<input type="button" value="封鎖會員" id="BlockadeMemberButton" />
						</div>
						
						<!-- ********** 顯示搜尋會員  結束 **********************************************-->
						
									<!--**************** 顯示出所有封鎖名單    開始*******************************-->
						<div class="showAllFriend">
									
							<c:forEach var="blockadeMember"
								items="${showBlockadeMemberMap.searchBlockadeMember}" varStatus="status">
								
								<!-- box start-->
								<div class="boxContainer">
								
								<figure  onclick="blockadeMemberArea('${showBlockadeMemberMap.searchBlockadeMemberSN[status.index] }')"> 
									<img src="data:image/jpg;base64,${showBlockadeMemberMap.searchBlockadeMemberImage[status.index]}"
									alt="Thumb"  width=160	height=auto />
									<figcaption>
									<div>${blockadeMember}</div>
									</figcation>
								</figure>
								
								<div  style="display:none;"  name="inputDiv"  id="${showBlockadeMemberMap.searchBlockadeMemberSN[status.index] }" class="searchMemberAreaClass ">						
									<input type="button" value="解除封鎖" id="unBlockadeMemberImageButton"  onclick="unBlockadeMemberImageButton ('${blockadeMember}')" />
								</div>
<!-- 								<div class="social-buttons"> -->
<!-- 								    <a class="social-button facebook" href="#"><i class="fa fa-facebook"></i></a> -->
<!-- 								    <a class="social-button twitter" href="#"><i class="fa fa-twitter"></i></a> -->
<!-- 								    <a class="social-button google" href="#"><i class="fa fa-google"></i></a> -->
<!-- 								    <a class="social-button dribbble" href="#"><i class="fa fa-dribbble"></i></a> -->
<!-- 								    <a class="social-button skype" href="#"><i class="fa fa-skype"></i></a> -->
<!-- 								</div> -->
								
								</div>
								<!-- box over-->
								
							</c:forEach>
						</div>

							<!--**************** 顯示出所有封鎖名單    結束*******************************-->
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>
	
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


	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>

<script type="text/javascript" src="<c:url value="/Kelsey/js/relation.js"/>"></script>

</body>
</html>