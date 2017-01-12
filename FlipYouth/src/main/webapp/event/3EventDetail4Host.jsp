<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>揪團中</title>

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
      body{
        font-family: 'cwTeXYen';
        font-size: 22px;
        font: bold;
        text-align: left;
      }
</style>

<!-- <style type="text/css">  -->
<!-- /* 	div{ */ -->
<!-- /* 		border: 1px solid; */ -->
<!-- /* 	} */ -->
<!-- </style> -->

</head>
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
			揪&nbsp團&nbsp中&nbsp&nbsp<strong>Flip Youth</strong>
			</h1>
		</div>
		<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>	
<%@ include file="/chatRoom.jsp"%>
<body>
	<div class="container-fluid">
		<!-- /////跑馬燈///// -->
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
		<!-- /////////////// -->

<div class="row col-md-12">
		<div class="container" style="text-align:center">
			<h2>
				&nbsp;揪團中&nbsp;
			</h2>
		</div>
			<div>
		<!-- 			////FbBean沒有Address -->
<%-- 		Address= 					${eventGo.Address}<br/> --%>
		<!-- 			////FbBean沒有Address -->
<%-- 		mbrName=					${listNameImg.hostName}<br/> --%>
<%-- 		mbrimg=						${listNameImg.image}<br/> --%>
<%-- 		userInputAddress= 			${eventGo.userInputAddress}<br/> --%>
<%-- 		userSN=						${eventGo.userSN}<br/> --%>
<%-- 		userAddAddress to locSN= 	${eventGo.userAddAddress}<br/> --%>
<%-- 		startDateTime= 				${eventGo.startDateTime}<br/> --%>
<%-- 		endDateTime= 				${eventGo.endDateTime}<br/> --%>
<%-- 		closeDateTime= 				${eventGo.closeDateTime}<br/> --%>
<%-- 		userAddUpLimit= 			${eventGo.userAddUpLimit}<br/> --%>
<%-- 		userAddDownLimit= 			${eventGo.userAddDownLimit}<br/> --%>
			</div>
			
			<table class="table">
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th> -->
<!-- 							建立時間: -->
<!-- 						</th> -->
<!-- 						<th> -->
							
<!-- 						</th> -->
<!-- 						<th> -->
							
<!-- 						</th> -->
<!-- 						<th> -->
							
<!-- 						</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
				<tbody>
				
<!-- 					<tr class="active"> -->
<!-- 						<td class="col-md-2"> -->
<!-- 							揪團流水號: -->
<!-- 						</td> -->
<!-- 						<td class="col-md-5"> -->
<%-- 							# <p>${eventSN}</p> --%>
<!-- 						從資料庫拉一個流水號出來 -->
<!-- 						</td> -->
<!-- 						<td class="col-md-3"> -->
<!-- 							<div class="col-md-7"> -->
<!-- 								<button type="button" class="btn btn-primary btn-block"> -->
<!-- 									&gt;&gt;&gt;揪團明細&lt;&lt;&lt; -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 						<td  class="col-md-3"> -->
							
<!-- 						</td> -->
<!-- 					</tr> -->
				
					<tr  class="info">
						<td class="col-md-2">
							房主:
						</td>
						<td class="col-md-5">
							<span>
								<img width="50" height="50"
														alt="Bootstrap Image Preview"
														src="data:image/png;base64,${listNameImg.image} "
														class="img-circle" />
							</span>
							<span>${listNameImg.hostName}</span>
						</td>
						<td class="col-md-3">
							<div class="col-md-7">
<!-- 								<button type="submit" class="btn btn-primary btn-block"> -->
<!-- 									&gt;&gt;&gt;房主資料&lt;&lt;&lt; -->
<!-- 								</button> -->
<!-- 									連結到碩言的會員資料名稱跟大頭貼 -->
							</div>
						</td>
						<td class="col-md-3" rowspan="6">
							<iframe width="350" height="350" frameborder="0" style="border:0"
								src="https://www.google.com/maps/embed/v1/search?q=${eventGo.userInputAddress}&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>	
						</td>
					</tr>
					
					<tr class="active">
						<td class="col-md-2">
							位置:
						</td>
						<td class="col-md-5">
							${eventGo.userInputAddress}
						</td>
						<td class="col-md-3">
							<div>
							<a href="<c:url value="/events/locationDetail.controller"/>?locName=${eventGo.userInputAddress}&locLat=${eventGo.locLat}&locLong=${eventGo.locLong}">
								<button type="button" class="btn btn-primary btn-block">
									&gt;&gt;&gt;位置明細&lt;&lt;&lt;
								</button>
							</a>
							</div>
						</td>
					
					</tr>
					
<!-- 					<tr class="success"> -->
<!-- 						<td> -->
<!-- 							成員: -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<img width="50" height="50" alt="Bootstrap Image Preview"  -->
<!-- 							src="http://lorempixel.com/140/140/" class="img-circle" /> -->
<!-- 							<img width="50" height="50" alt="Bootstrap Image Preview"  -->
<!-- 							src="http://lorempixel.com/140/140/" class="img-circle" /> -->
<!-- 							<img width="50" height="50" alt="Bootstrap Image Preview"  -->
<!-- 							src="http://lorempixel.com/140/140/" class="img-circle" /> -->
<!-- 							<img width="50" height="50" alt="Bootstrap Image Preview"  -->
<!-- 							src="http://lorempixel.com/140/140/" class="img-circle" /> -->
<!-- 							<img width="50" height="50" alt="Bootstrap Image Preview"  -->
<!-- 							src="http://lorempixel.com/140/140/" class="img-circle" /> -->
<!-- 						</td> -->
<!-- 						<td> -->
<!-- 							<div class="col-md-7"> -->
<!-- 								<button type="button" class="btn btn-primary btn-block"> -->
<!-- 									&gt;&gt;&gt;揪團明細&lt;&lt;&lt; -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
					
					<tr class="warning">
						<td>
							人數:
						</td>
						<td>
							<c:if test="${eventGo.userAddDownLimit=='0'}">
								無人數下限 
							</c:if>
							<c:if test="${eventGo.userAddDownLimit!='0'}">
								${eventGo.userAddDownLimit}
							</c:if>
								<span> ~ </span>
							<c:if test="${eventGo.userAddUpLimit=='9999'}">
								無人數上限 
							</c:if>
							<c:if test="${eventGo.userAddUpLimit!='9999'}">
								${eventGo.userAddUpLimit} 人
							</c:if>
						</td>
						<td>
								<span>
									目前人數: 1人
								</span>
								<div class="progress active progress-striped">
									<div class="progress-bar progress-success" role="progressbar"
											aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
											style="width:10%">
									</div>
								</div>
						</td>
					</tr>
					
					<tr class="danger">
						<td>
							開戰時間:
						</td>
						<td>
							<fmt:formatDate value="${eventGo.startDateTime}" pattern=" yyyy年  MM月  dd日  HH:mm " />
							~
							<fmt:formatDate value="${eventGo.endDateTime}" pattern=" HH:mm" />
						</td>
						<td>
<!-- 							狀態:XXX中 -->
						</td>
					</tr>
					
					<tr bgcolor="pink">
						<td>
							揪團截止時間:
						</td>
						<td>
							<fmt:formatDate value="${eventGo.closeDateTime}" pattern=" yyyy年  MM月  dd日  HH:mm " />
						</td>
						<td>
<!-- 							狀態:XXX中 -->
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>

		<!-- /////bottom//// -->
		<div class="row">
			<div class="col-md-6">
				<a href="<c:url value='/events/myEvent.controller'/>?mbrSN=${eventGo.userSN}">
				<button type="submit" class="btn btn-primary btn-block" style="font-size:22px" name="buttonState" value="Insert">
					確定無誤
				</button>
				</a>
			</div>

<!-- 			<div class="col-md-4"> -->
<!-- 				<button type="submit" class="btn btn-primary btn-block" style="font-size:22px" name="buttonState" value="Delete"> -->
<!-- 					取消揪團 -->
<!-- 				</button> -->
<!-- 			</div> -->

			<div class="col-md-6">
				<button type="button" class="btn btn-block btn-primary" style="font-size:22px" onclick="window.history.back()">
					返回
				</button>
			</div>
			<br />
		</div>
		<br />
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