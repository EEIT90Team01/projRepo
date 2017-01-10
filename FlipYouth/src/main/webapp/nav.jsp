<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
			<c:if test="${loginOK == null}">
				<li ><a href="<c:url value="/Tim/login/login.jsp"/>">Sign In</a></li>
			</c:if>
			<c:if test="${loginOK != null}">
				<li><a href="<c:url value="/logout.controller"/>">Sign Out</a></li>
			</c:if>
			<li ><a href="<c:url value="/index3.jsp"/>">Home</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="MemberSelect"><img src="<c:url value='/Kelsey/images/basic_gray/settings.png'/>" >&nbsp&nbspMember<strong class="caret"></strong></a>
				<div class="MemberDIV">
				<ul id="MemberUL" class="MemberOpenSelect">
					<li ><a	href="<c:url value='/pages/memberIndex.jsp'/>" >
					&nbsp&nbsp會員中心&nbsp</a></li>
					<li ><a href="<c:url value='/pages/editMember.jsp'/>" >&nbsp&nbsp修改個人資料&nbsp</a></li>
				</ul>
				</div>
			</li>
			
			
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="ShopSelect"><img
					src="<c:url value='/Kelsey/images/basic_gray/shopping-cart.png'/>">&nbsp&nbspShop<strong class="caret"></strong></a>
				<div class="ShopDIV">
				<ul id="ShopUL" class="ShopOpenSelect">
					<li ><a href="<c:url value='/Tim/page/FlipYouthStore.jsp'/>"> &nbsp&nbsp翻桌唷&nbsp商城&nbsp	</a></li>
				</ul>
				</div>
			</li>

			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="TeamSelect"><img src="<c:url value='/Kelsey/images/basic_gray/megaphone.png'/>" >&nbsp&nbspTeam<strong class="caret"></strong></a>
				<div class="TeamDIV">
				<ul id="TeamUL" class="TeamOpenSelect">
					<li ><a href="" >&nbsp&nbsp我的揪團&nbsp</a></li>
				</ul>
				</div>
			</li>
						
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="FriendSelect"><img src="<c:url value='/Kelsey/images/basic_gray/stick-man.png'/>" >&nbsp&nbspFriend<strong class="caret"></strong></a>
				<div class="FriendSelectDIV">
				<ul id="FriendSelectUL" class="openSelect">
					<li ><a	href="<c:url value='/searchRelation.controller' />">&nbsp&nbsp我的好友&nbsp</a></li>
					<li ><a href="<c:url value="/showBlockadeMember.controller"/>">封鎖名單</a></li>
					<li><a href="<c:url value="/searchRelation.controller"/>">好友列表</a></li>
				</ul>
				</div>
			</li>

<!-- 			<li ><a href="" > <img -->
<%-- 					src="<c:url value='/Kelsey/images/basic_gray/time.png'/>" class="navimg">&nbsp&nbsp我的月曆&nbsp --%>
<!-- 			</a></li> -->
		</ul>
		</nav>

	</div>
    



	<!-- ***************	導覽列   結束  ******************************-->

