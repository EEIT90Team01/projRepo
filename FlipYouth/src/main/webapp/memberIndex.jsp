<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>MemberIndex</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- <link href="css/style.css" rel="stylesheet"> -->


<!-- Latest compiled and minified JavaScript -->

<style>
*{
font-family: Microsoft JhengHei;
margin,padding:0;
}

/*按鈕清單*/
li {
	display: inline;
	float: right;
	min-height: 55px;
	text-align: center;
	padding: 5px 5px 5px 5px;
	font-family: Microsoft JhengHei;
	font-size: 1.2em;
}


/*按鈕圖片*/
.navimg{
padding-right:5px;
}

/*搜尋好友*/
.col-lg-10{
width:300px;
}

.st1 {
	margin: 10px;
	padding: 10px;
}

.st2 {
	text-align: center;
}
</style>

<title>Member Index</title>
</head>

<body>
	<div>
		<form >
			<ul id='nav' class="list-group">
				<li><a href="<c:url value="pages/editMember.jsp"/>"  class="list-group-item"><img src="images/basic_green/settings.png" class="navimg">個人資料</a></li>
				<li><a href=""  class="list-group-item"><img src="images/basic_green/shopping-cart.png" class="navimg">我的訂單</a></li>
				<li><a href=""  class="list-group-item"><img src="images/basic_green/megaphone.png" class="navimg">我的揪團</a></li>
				<li><a href=""  class="list-group-item"><img src="images/basic_green/stick-man.png" class="navimg">我的好友</a></li>
				<li><a href=""  class="list-group-item"><img src="images/basic_green/time.png" class="navimg">我的月曆</a></li>
			</ul>
			
			
			<!-- 			<div class="st1"> -->
			<input type="text" id="idname" name="Name" placeholder="請輸入好友名稱" />
			<input type="submit" id="idsubmit" value="搜尋好友"
				class="btn btn-default" />
			<!-- 			</div> -->
			
				<div class="col-lg-10">
					<div class="input-group">
						<span class="glyphicon glyphicon-user input-group-addon"></span> <input
							type="text" id="username" name="name" class="form-control"
							placeholder="請輸入姓名">
						<div id="span1" class="input-group-addon">
							<span class="glyphicon glyphicon-question-sign"></span>
						</div>
					</div>
				</div>
			
		</form>
	</div>
<!-- <div class="list-group"> -->
<!--   <a href="#" class="list-group-item active"> -->
<!--     Cras justo odio -->
<!--   </a> -->
<!--   <a href="#" class="list-group-item">Dapibus ac facilisis in</a> -->
<!--   <a href="#" class="list-group-item">Morbi leo risus</a> -->
<!--   <a href="#" class="list-group-item">Porta ac consectetur ac</a> -->
<!--   <a href="#" class="list-group-item">Vestibulum at eros</a> -->
<!-- </div> -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
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
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
				</div>

				</nav>
			</div>
		</div>
	</div>

</body>
</html>