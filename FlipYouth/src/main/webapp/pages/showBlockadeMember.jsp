<%@page import="com.sun.prism.impl.Disposer.Target"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-Hant-TW">
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
<body>

<%-- 					利用一個type="hidden" 隱藏需要抓取${loginOK.mbrSN}的標籤,並利用此標籤送出查詢 --%>
								<input type="hidden" value="${loginOK.mbrSN}" id="mbrSN"/>
								
																
						<div class="hero">
								 <img class="header_left_img" src="images/light_green/logo_06-02.png" />
									<h1>
											封&nbsp鎖&nbsp名&nbsp單&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
						
								
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12">
						<h3>封鎖名單</h3>
					</div>
				</div>


				<div class="row">
					<div class="col-md-8">
						<blockquote>
							<p>翻桌唷 會員專區</p>
							<footer>xxxxx，使用者：<cite title="Source Title">${loginOK.nickName}</cite></footer>
						</blockquote>
					</div>
					<div class="col-md-4">
						<img alt="Bootstrap Image Preview"
							src="data:image/png;base64,${user_photo}" class="img-rounded"   width=150	height=auto/>
					</div>
				</div>



				<!-- ********** 左邊下拉列表   開始  **********************************************-->
				<div class="row">
					<div class="col-md-6">
						<div class="panel-group" id="panel-734557">
							<div class="panel panel-default">
								<div class="panel-heading">
									<a class="panel-title collapsed" data-toggle="collapse"
										data-parent="#panel-734557" href="#panel-element-705642">Collapsible
										Group Item #1</a>
								</div>
								<div id="panel-element-705642" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche...</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a class="panel-title collapsed" data-toggle="collapse"
										data-parent="#panel-734557" href="#panel-element-572918">Collapsible
										Group Item #2</a>
								</div>
								<div id="panel-element-572918" class="panel-collapse collapse">
									<div class="panel-body">Anim pariatur cliche...</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ********** 搜尋會員   開始  **********************************************-->
					<div class="col-md-6">
						<nav class="navbar navbar-default" role="navigation">
						<div class="navbar-header">

							<button type="button" class="navbar-toggle"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#">功能選單</a>
						</div>
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li ><a href="<c:url value="index3.jsp"/>">回首頁</a></li>
								<li ><a href="<c:url value="/showBlockadeMember.controller"/>">封鎖名單</a></li>
								<li><a href="<c:url value="/searchRelation.controller"/>">好友列表</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li class="divider"></li>
										<li><a href="#">Separated link</a></li>
										<li class="divider"></li>
										<li><a href="#">One more separated link</a></li>
									</ul></li>
							</ul>
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
								<img  alt="Thumb" id="searchMemberImage"/>
								
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

							<c:forEach var="blockadeMember"
								items="${showBlockadeMemberMap.searchBlockadeMember}" varStatus="status">
								<figure  onclick="blockadeMemberArea('${showBlockadeMemberMap.searchBlockadeMemberSN[status.index] }')"> 
									<img src="data:image/jpg;base64,${showBlockadeMemberMap.searchBlockadeMemberImage[status.index]}"
									alt="Thumb"  width=120	height=auto />
									<figcaption>
									<div>${blockadeMember}</div>
									</figcation>
								</figure>
								
								<div style="display:none;" id="${showBlockadeMemberMap.searchBlockadeMemberSN[status.index] }" class="searchMemberAreaClass">						
									<input type="button" value="解除封鎖" id="unBlockadeMemberImageButton"  onclick="unBlockadeMemberImageButton ('${blockadeMember}')"/>
								</div>
								
							</c:forEach>

							<!--**************** 顯示出所有封鎖名單    結束*******************************-->
						</div>

						<ul class="pagination">
							<li><a href="#">Prev</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				</div>



				<div class="row">
					<div class="col-md-12">
						<blockquote>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<small>Someone famous <cite>Source Title</cite></small>
						</blockquote>
					</div>
				</div>



			</div>
		</div>
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


<script type="text/javascript" src="<c:url value="/Kelsey/js/relation.js"/>"></script>

</body>
</html>