<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>位置明細</title>

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

<script src="http://maps.google.com/maps/api/js?key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<!-- 
<style type="text/css">
div{
border: 1px solid;
}
</style>
-->

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
			位&nbsp置&nbsp明&nbsp細&nbsp&nbsp<strong>Flip Youth</strong>
			</h1>
		</div>
		<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>	

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

<div class="container" style="text-align:center">
			<h2>
				&nbsp;位置明細&nbsp;
			</h2>
<table class="table">
	<tbody>
	
	<tr class="active">
		<td class="col-md-2">
			地址:
		</td>
		<td class="col-md-4">
			${locationDetail.locName}
		</td>
		<td class="col-md-6" rowspan="6">
			<div>
			<iframe width="630" height="380" frameborder="0" style="border:0"
								src="https://www.google.com/maps/embed/v1/search?q=${locationDetail.locName}&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>	
			</div>
			<input type="hidden" id="address" value="${locationDetail.locName}" />
		</td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td class="col-md-2"> -->
<!-- 			地址: -->
<!-- 		</td> -->
<!-- 		<td class="col-md-4"> -->
<!-- 			北市松山區XX路XX號 -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr class="info"> -->
<!-- 		<td class="col-md-2"> -->
<!-- 			地址: -->
<!-- 		</td> -->
<!-- 		<td class="col-md-4"> -->
<!-- 			北市松山區XX路XX號 -->
<!-- 		</td> -->
<!-- 	</tr> -->
	<tr class="danger">
		<td class="col-md-2">
			連絡電話:
		</td>
		<td class="col-md-4">
			<span>查無資料</span>
		</td>
	</tr>
	
	<tr class="warning">
		<td class="col-md-2">
			經度long:
		</td>
		<td class="col-md-4">
			<div id="long"></div>
			24.1374957
		</td>
	</tr>
	<tr class="success">
		<td class="col-md-2">
			緯度lat:
		</td>
		<td class="col-md-4">
			<div id="lat"></div>
			120.68659930000001
		</td>
	</tr>
	</tbody>
</table>
</div>
<!-- /////bottom//// -->
		<div class="row">
			<div class="col-md-4">
			
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-block btn-primary" style="font-size:22px" onclick="window.history.back()">
					返回
				</button>
			</div>
			<br />
		</div>
		<br />
<!-- ////////// -->

</div>
<script type="text/javascript">
// var geocoder = new google.maps.Geocoder();
// var addr = $("#address").val();
// geocoder.geocode({
//         'address': addr
//     }, function (results, status) {
//         if (status == google.maps.GeocoderStatus.OK) {
//             $('#lat').text(results[0].geometry.location.lat());
//             $('#lng').text(results[0].geometry.location.lng());
//     }
// });
/////////////////

</script>
<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>

	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>
</body>
</html>