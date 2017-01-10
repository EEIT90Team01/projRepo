<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>我的揪團</title>

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
<body style="background-color:#FFBD45;">

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

		<div class="col-md-12">
			<h1 style="text-align: center">&nbsp;我的揪團&nbsp;</h1>
		</div>
<!-- /////////////// -->
<%-- 		<c:forEach items="${myEventData}" var="eventDetail"> --%>
<%-- 			${eventDetail.EventDetailBean}<br> --%>
<%-- 			${eventDetail.EventDetailBean}<br> --%>
<%-- 			${eventDetail.EventBean}<br> --%>
<%-- 			${eventDetail.locName}<br> --%>
<%-- 			${eventDetail.image}<br> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:remove var="myEventData"></c:remove> --%>
<!-- /////////////// -->
	<div>
		<c:forEach items="${myEventData}" var="element" varStatus="theCount">
		<c:if test="${element.EventBean.eventState=='1'}">
<%-- 		${element.EventDetailBean.eventDetailPK.mbrSN.mbrSN} --%>
		<!-- /////TABLE///// -->
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<tbody>

						<tr class="info">
							<td class="col-md-1" rowspan="3">
								<span> 第 ${theCount.count} 團 </span>
							</td>
							<td colspan="3">
								<div style="float: left" class="col-md-3">
									揪團流水號: <span> # ${element.EventBean.eventSN} </span>
								</div>
								<div style="float: left">
									<a href="<c:url value="/events/myEvent2.controller"/>?eventSN=${element.EventBean.eventSN}&mbrSN=${element.EventDetailBean.eventDetailPK.mbrSN.mbrSN}">
									<button class="btn btn-lg btn-primary btn-block" type="button">
										&gt;&gt;&gt;退出此團&lt;&lt;&lt;</button>
									</a>
								</div>
								<div style="float: left; margin-left: 30px">
									<a href="<c:url value="/events/eventSNDetail.controller"/>?eventSN=${element.EventBean.eventSN}&locName=${element.locName}">
									<button class="btn btn-lg btn-primary btn-block" type="submit">
										&gt;&gt;&gt;揪團明細&lt;&lt;&lt;</button>
									</a>
								</div>
							</td>
							<td class="col-md-1" rowspan="3"></td>
						</tr>

						<tr class="info">
							<td class="col-md-5">
								<div style="float: left">
									<span>房主:</span> 
									<img width="50" height="50"
														alt="Bootstrap Image Preview"
														src="data:image/png;base64,${element.image} "
														class="img-circle" /> 
										<span>${element.EventBean.hostMbrSN.mbrName}</span>
								</div>
							</td>
							<td class="col-md-5">
								<div style="float: left">
									<span>位置:</span> 
									<span>${element.locName}</span>
								</div>
							</td>
						</tr>
						<tr class="info">
							<td class="col-md-5">
								<div style="float: left">
									<span>日期:&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.beginTime}"
															pattern=" yyyy年  MM月  dd日" /></span>
								</div>
								<div style="float: left">
									<span>&nbsp;&nbsp;</span> <span>時間:&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.beginTime}"
															pattern=" HH:mm" /></span>
									<span>&nbsp;~&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.endTime}"
															pattern=" HH:mm" /></span>
								</div>
							</td>
							<td class="col-md-5">
								<div style="float: left">
									<span>狀態:&nbsp;</span> 
									<span>
<%-- 										<c:if test="${element.EventBean.eventState=='1'}"> --%>
											開團中
<%-- 										</c:if> --%>
									</span>
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

		<div class="col-md-12">
			<h1 style="text-align: center">&nbsp;歷史揪團&nbsp;</h1>
		</div>

		<div>
		<c:forEach items="${myEventData}" var="element">
		<c:if test="${element.EventBean.eventState=='0'}">
<%-- 		${element.EventDetailBean.eventDetailPK.mbrSN.mbrSN} --%>
		<!-- /////TABLE///// -->
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<tbody>

						<tr class="active">
							<td class="col-md-1" rowspan="3">
<%-- 								<span>第 ${theCount1.count} 團</span> --%>
							</td>
							<td colspan="3">
								<div style="float: left" class="col-md-3">
									揪團流水號: <span> # ${element.EventBean.eventSN} </span>
								</div>
								<div style="float: left">
									<a href="<c:url value="/events/myEvent2.controller"/>?eventSN=${element.EventBean.eventSN}&mbrSN=${element.EventDetailBean.eventDetailPK.mbrSN.mbrSN}">
									<button class="btn btn-lg btn-primary btn-block" type="button">
										&gt;&gt;&gt;刪除紀錄&lt;&lt;&lt;</button>
									</a>
								</div>
							</td>
							<td class="col-md-1" rowspan="3"></td>
						</tr>

						<tr class="active">
							<td class="col-md-5">
								<div style="float: left">
									<span>房主:</span> 
									<img width="50" height="50"
														alt="Bootstrap Image Preview"
														src="data:image/png;base64,${element.image} "
														class="img-circle" /> 
										<span>${element.EventBean.hostMbrSN.mbrName}</span>
								</div>
							</td>
							<td class="col-md-5">
								<div style="float: left">
									<span>位置:</span> 
									<span>${element.locName}</span>
								</div>
							</td>
						</tr>
						<tr class="active">
							<td class="col-md-5">
								<div style="float: left">
									<span>日期:&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.beginTime}"
															pattern=" yyyy年  MM月  dd日" /></span>
								</div>
								<div style="float: left">
									<span>&nbsp;&nbsp;</span> <span>時間:&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.beginTime}"
															pattern=" HH:mm" /></span>
									<span>&nbsp;~&nbsp;</span> <span><fmt:formatDate
															value="${element.EventBean.endTime}"
															pattern=" HH:mm" /></span>
								</div>
							</td>
							<td class="col-md-5">
								<div style="float: left">
									<span>狀態:&nbsp;</span> 
									<span>
											已結束
									</span>
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
		<c:remove var="myEventData"></c:remove>
	</div>

		<!-- /////bottom//// -->
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<button type="button" class="btn btn-block btn-primary"
					style="font-size: 22px" onclick="window.history.back()">
					返回</button>
			</div>
			<br />
		</div>
		<br />
		<!-- ////////// -->
	</div>
</body>
</html>