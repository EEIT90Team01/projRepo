<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>揪團!!!</title>

<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- 	Web fonts -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css">
	
<link rel="stylesheet" href="<c:url value='/Kelsey/css/relation.css'/>">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">
	
<style>
body {
	font-family: 'cwTeXYen';
	font-size: 22px;
	font: bold;
	text-align: left;
}
</style>

<!--
<style type="text/css">
div{
border: 1px solid;
}
</style>
-->

</head>
<%@ include file="/chatRoom.jsp"%>
<div class="hero">
						
		<c:if test="${loginOK != null }">
			<img class="header_right_img" src="data:image/jpg;base64,${user_photo}" >
			<div class="memberContentIndexPage">
					<blockquote class="blockquote_k">
			<!-- 			<p>翻桌唷 -- 會員專區</p> -->
						<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
						</blockquote>
			</div>
							
		</c:if>
						
		 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
			<h1>
			揪&nbsp團&nbsp!&nbsp!&nbsp&nbsp<strong>Flip Youth</strong>
			</h1>
		</div>
		<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>	

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-429587">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-429587"></li>
						<li data-slide-to="1" data-target="#carousel-429587"></li>
						<li data-slide-to="2" data-target="#carousel-429587"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="Carousel Bootstrap First"
								src='<c:url value="/image/Carousel1.jpg" />' />
							<div class="carousel-caption">
								<h4>創建你的揪團</h4>
								<p>根據你的喜好，創建一個獨一無二的揪團!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Second"
								src='<c:url value="/image/Carousel2.jpg" />' />
							<div class="carousel-caption">
								<h4>加入揪團</h4>
								<p>加入任何你所看到的團，瘋狂桌遊吧!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Third"
								src='<c:url value="/image/Carousel3.jpg" />' />
							<div class="carousel-caption">
								<h4>隨選隨戰</h4>
								<p>馬上加入，就缺你一個了!!</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-429587"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-429587"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="container" style="text-align: center">
				<h2>揪團!!!</h2>
			</div>
			<!-- //////資料庫生成揪團表///// -->
			<!-- 			<div> -->
			<%-- 				<c:forEach var="a" items="${eventing}"> --%>
			<%-- 					<h1>地址流水號:${a.EventBean.locSN}</h1> --%>
			<%-- 					<h1>MemberBean:${a.EventBean}</h1> --%>
			<%-- 					<h1>姓名:${a.EventBean.hostMbrSN.mbrName}</h1> --%>
			<%-- 					<h1>最小人數${a.EventBean.minMember}</h1> --%>
			<%-- 					<h1>開始時間${a.EventBean.beginTime}</h1> --%>
			<%-- 					<h1>結束時間${a.EventBean.endTime}</h1> --%>
			<%-- 					<h1>揪團狀態${a.EventBean.eventState}</h1> --%>
			<%-- 					<h1>最大人數${a.EventBean.maxMember}</h1> --%>
			<%-- 				</c:forEach> --%>
			<!-- 			</div> -->
			<!-- //////資料庫生成揪團表///// -->
			<div class="col-md-12">
				<c:forEach var="element" items="${eventing}" varStatus="theCount">
				<c:if test="${element.EventBean.eventState=='1'}">
					<!-- /////第一個TABLE///// -->
						<div class="row">
							<div class="col-md-12">
								<table class="table">
									<tbody>

										<tr class="danger">
											<td class="col-md-1" rowspan="3">
											<span> 
												
											</span>
											</td>
											<td colspan="3">
												<div style="float: left" class="col-md-3">
													<span>揪團流水號:</span> <span> #
														${element.EventBean.eventSN} </span>
												</div>
												<div style="float: right">
													<a
														href="<c:url value="/events/eventDetail4Mbr.controller"/>?eventSN=${element.EventBean.eventSN}&locName=${element.Location.locName}&hostName=${element.EventBean.hostMbrSN.mbrName}"><button
															class="btn btn-lg btn-primary btn-block" type="button">&gt;&gt;&gt;加入此團&lt;&lt;&lt;</button></a>
												</div>
											</td>
											<td class="col-md-1" rowspan="3"></td>
										</tr>

										<tr class="danger">
											<td class="col-md-5">
												<div style="float: left">
													<span>房主:</span> <img width="50" height="50"
														alt="Bootstrap Image Preview"
														src="data:image/png;base64,${element.image} "
														class="img-circle" /> <span>${element.EventBean.hostMbrSN.mbrName}</span>
												</div>
											</td>
											<td class="col-md-5">
												<div style="float: left">
													<span>位置:&nbsp;&nbsp;</span><span>${element.Location.locName}</span>
												</div>
											</td>
										</tr>
										<tr class="danger">
											<td class="col-md-5">
												<div style="float: left">
													<span>日期:&nbsp;</span> <span> <fmt:formatDate
															value="${element.EventBean.beginTime}"
															pattern=" yyyy年  MM月  dd日" />
													</span>
													<%-- 													<span>${element.EventBean.beginTime}</span> --%>
												</div>
												<div style="float: left">
													<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span>時間:&nbsp;</span>
													<span><fmt:formatDate
															value="${element.EventBean.beginTime}" pattern="HH:mm" /></span>
													<span>&nbsp;~&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.endTime}" pattern="HH:mm" /></span>
												</div>
											</td>
											<td class="col-md-5">
												<div style="float: left">
													<span>參與人數:&nbsp;</span> <span>${element.mbrSNCount}</span>
												</div>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					<!-- //////////////////// -->
					</c:if>
				</c:forEach>
				
			</div>

			<!-- 			///////////////////////////// -->
			<!-- 						<div class="col-md-6"> -->
			<!-- 							<form class="form-horizontal" role="form"> -->
			<!-- 								<div class="form-group"> -->
			<!-- 									<label for="time" class="col-sm-4 control-label"> 位置: </label> -->
			<!-- 									<div class="col-sm-8"> -->
			<!-- 										<input type="text" class="form-control" id="time" /> -->
			<!-- 									</div> -->
			<!-- 								</div> -->
			<!-- 							</form> -->
			<!-- 						</div> -->

			<!-- 						<div class="col-md-2"> -->
			<!-- 							<form class="form-horizontal" role="form"> -->
			<!-- 								<div class="form-group"> -->
			<!-- 									<label for="time" class="col-sm-4 control-label"> 人數: </label> -->
			<!-- 									<div class="col-sm-8"> -->
			<!-- 										<input type="text" class="form-control" id="time" /> -->
			<!-- 									</div> -->
			<!-- 								</div> -->
			<!-- 							</form> -->
			<!-- 						</div> -->

			<!-- 						<div class="col-md-2"> -->
			<!-- 							<form class="form-horizontal" role="form"> -->
			<!-- 								<div class="form-group"> -->
			<!-- 									<label for="time" class="col-sm-4 control-label"> 時間: </label> -->
			<!-- 									<div class="col-sm-8"> -->
			<!-- 										<input type="text" class="form-control" id="time" /> -->
			<!-- 									</div> -->
			<!-- 								</div> -->
			<!-- 							</form> -->
			<!-- 						</div> -->

			<!-- 						<div class="col-md-2"> -->
			<!-- 							<button type="submit" class="btn btn-block btn-primary"> -->
			<!-- 								加入GO!</button> -->
			<!-- 						</div> -->
			<!-- 			///////////////////////////// -->

		</div>
		<!-- /////bottom//// -->
		<div class="row">
			<div class="col-md-4"
				onclick="window.location.href='<c:url value='/event/2EventGo.jsp' />'">
				<button type="button" class="btn btn-primary btn-block">
					創建揪團啦</button>
			</div>
			<div class="col-md-4">
<!--TODO 這裡有會員登入的話要把11改掉 1Eventing.jsp EventGoController.java!!!!!!!!!!!!!! -->
				<a href="<c:url value="/events/myEvent.controller"/>?mbrSN=${loginOK.mbrSN}&eventSN=null">
<!--TODO 這裡有會員登入的話要把11改掉 1Eventing.jsp EventGoController.java!!!!!!!!!!!!!! -->
					<button type="button" class="btn btn-primary btn-block">我的揪團</button>
				</a>
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-block btn-primary"
					onclick="window.history.back()">返回上一頁</button>
			</div>
			<br />
			<br />
		</div>
		<!-- ////////// -->
	</div>
	<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>

	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>
	
</body>
</html>