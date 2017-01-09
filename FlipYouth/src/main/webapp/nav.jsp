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
				<li><a href="<c:url value="/logout.controller"/>">Sign Up</a></li>
			</c:if>
			<li ><a
				href="<c:url value='/pages/memberIndex.jsp'/>" >
					<img src="<c:url value='/Kelsey/images/basic_gray/settings.png'/>" class="navimg">&nbsp&nbsp會員中心&nbsp
					
			</a></li>

			<li ><a href="<c:url value='/Tim/page/FlipYouthStore.jsp'/>"> <img
					src="<c:url value='/Kelsey/images/basic_gray/shopping-cart.png'/>" class="navimg">&nbsp&nbsp翻桌唷&nbsp商城&nbsp
			</a></li>

			<li ><a href="" > <img
					src="<c:url value='/Kelsey/images/basic_gray/megaphone.png'/>" class="navimg">&nbsp&nbsp我的揪團&nbsp
			</a></li>

			<li ><a
				href="<c:url value='/searchRelation.controller' />"> <img
					src="<c:url value='/Kelsey/images/basic_gray/stick-man.png'/>" class="navimg">&nbsp&nbsp我的好友&nbsp
			</a></li>
			
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="FriendSelect">Friend<strong class="caret"></strong></a>
				<ul id="FriendSelectUL" class="openSelect">
					<li ><a	href="<c:url value='/searchRelation.controller' />"> 
						<img src="<c:url value='/Kelsey/images/basic_gray/stick-man.png'/>" class="navimg">&nbsp&nbsp我的好友&nbsp</a></li>
					<li ><a href="<c:url value="/showBlockadeMember.controller"/>">封鎖名單</a></li>
					<li><a href="<c:url value="/searchRelation.controller"/>">好友列表</a></li>
				</ul>
			</li>

<!-- 			<li ><a href="" > <img -->
<%-- 					src="<c:url value='/Kelsey/images/basic_gray/time.png'/>" class="navimg">&nbsp&nbsp我的月曆&nbsp --%>
<!-- 			</a></li> -->
		</ul>
		</nav>

	</div>
    



	<!-- ***************	導覽列   結束  ******************************-->

