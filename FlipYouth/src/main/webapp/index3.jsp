<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css_Kelsey/index3.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'> 
  
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div class="hero">
 <img class="header_left_img" src="images/light_green/logo_06-02.png" />
 <img class="header_right_img" src="images/non_profile.png" />
<!-- <img class="header_right_img" src="images/non_profile.png"  width=80px hegiht=80px style="position:absolute;right:0px;top:50%;margin-top:-40px"> -->
		<h1>
			翻&nbsp桌&nbsp唷&nbsp<strong>Flip Youth</strong>
		</h1>
	</div>

	<!-- ***************	導覽列   開始  ******************************-->

	<div id='nav-group' class="list-group-k">
		<nav>
		<ul>
			<li ><a href="login.jsp#login-modal"
				data-toggle="modal" data-target="login.jsp#login-modal"
				class="list-group-item">Login</a></li>

			<li ><a
				href="<c:url value='pages/editMember.jsp'/>" class="list-group-item">
					<img src="images/basic_gray/settings.png" class="navimg">&nbsp個人資料&nbsp&nbsp
			</a></li>

			<li ><a href="<c:url value='/Shop.controller'/>"
				class="list-group-item"> <img
					src="images/basic_gray/shopping-cart.png" class="navimg">&nbsp翻桌唷&nbsp商城&nbsp&nbsp
			</a></li>

			<li ><a href="" class="list-group-item"> <img
					src="images/basic_gray/megaphone.png" class="navimg">&nbsp我的揪團&nbsp&nbsp
			</a></li>

			<li ><a
				href="<c:url value='searchRelation.controller' />"
				class="list-group-item"> <img
					src="images/basic_gray/stick-man.png" class="navimg">&nbsp我的好友&nbsp&nbsp
			</a></li>

			<li ><a href="" class="list-group-item"> <img
					src="images/basic_gray/time.png" class="navimg">&nbsp我的月曆&nbsp&nbsp
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


</body>
</html>