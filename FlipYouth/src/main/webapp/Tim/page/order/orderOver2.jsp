<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@page import="java.util.*"%> --%>
<%-- <%@page import="javax.servlet.*"%> --%>
<%-- <%@page import="javax.servlet.http.HttpSession"%> --%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城系統</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/producHome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/bootstrap-select.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/nouislider.css"/>">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="css/Tim.css"> -->
<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript"
	src="<c:url value="/Tim/js_Tim/html2canvas.js"/>"></script>
<script type="text/javascript"
	src=" <c:url value="/Tim/js_Tim/canvas2image.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
/*  div {  */
/*  	border-style: solid;  */
/*  	border-width: 1px;  */
/*  }  */
/* .center { */
/* 	text-align: center; */
/* 	color: white; */
/* 	font-family: Microsoft JhengHei; */
/* 	/* 	font-weight: 600; */
/* 	line-height: 1.5; */
/* 	font-size: 17px; */
/* } */

/* /* .center1 { */
/* /* 	font-family: Microsoft JhengHei; */
/* /* 	font-weight: 600; */
/* /* 	line-height: 1.5; */
/* /* 	font-size: 15px; */
/* /* } */
/* a { */
/* 	font-size: 14px; */
/* 	line-height: 1.3; */
/* 	/* 	font-family: Microsoft JhengHei; */
/* 	color: BLACK; */
/* } */

/* .color1 { */
/* 	color: #de9227; */
/* } */

/* .color2 { */
/* 	line-height: 2.0; */
/* 	font-weight: 600; */
/* 	font-size: 19px; */
/* 	background-color: #c7000b; */
/* 	color: white; */
/* } */

/* b { */
/* 	font-size: 16px; */
/* 	color: #cd1f14; */
/* } */

/* .btn-danger { */
/* 	background-image: linear-gradient(to bottom, #c7000b 0, #c12e2a 100%); */
/* } */

/* em { */
/* 	font-family: 'Gloria Hallelujah', cursive; */
/* 	font-size: 41px; */
/* 	color: #000; */
/* 	display: inline-block; */
/* } */
strong {
	display: block;
	padding: 0 0 0 13px;
	font-weight: normal;
	font-family: 'Noto Sans TC', sans-serif;
	font-size: 15px;
	color: #a51516;
	margin-top: -5px;
}

.orderStatus {
	margin-bottom: 30px;
	font-size: 15px;
	color: #000;
	line-height: 1.8;
}

/* .px-100 { */
/* 	height: 62px; */
/* 	vertical-align: middle; */
/* 	padding: 20px 5px; */
/* 	text-align: center; */
/* 	margin-top: 0px; */
/* } */

/* .whoOrder { */
/* 	padding: 20px; */
/* 	display: block; */
/* } */

/* .OrderTop { */
/* 	display: block; */
/* 	margin-bottom: 5px; */
/* 	font-size: 14px; */
/* 	color: #222; */
/* 	height: 20px; */
/* } */

/* .Ordertotal { */
/* 	font-size: 18px; */
/* 	font-weight: normal; */
/* 	color: #9e5f4d; */
/* 	border-bottom: 1px solid #d9d9d9; */
/* } */

/* .center1 { */
/* 	font-family: 'Noto Sans TC', sans-serif; */
/* 	font-weight: normal; */
/* 	line-height: 1.5; */
/* 	font-size: 16px; */
/* 	color: #ffffff; */
/* } */

/* .right { */
/* 	padding-left: 0px; */
/* } */

/* .title { */
/* 	padding: 5px 0px; */
/* } */
</style>
</head>

<script type="text/javascript">
	
</script>
<body>
	<div id="orderOK" style="display: none;">
		<div class="col-xs-12">
			<h2 class="orderStatus">
				<em>Complete</em><strong>訂購完成</strong>
			</h2>
			
			<div class="col-xs-12" style="height: 30px"></div>
			<div class="col-xs-12 orderStatus">
				親愛的 ${loginOK.mbrName}先生，感謝您於本商店購物。您的訂單明細已同步發送至您的信箱。 <br>
				歡迎使用「訂單查詢」功能查詢目前訂單狀態，謝謝。 <br>狀態：<b style="color:red">新單
				</b><br>
			</div>

		</div>
	</div>




	<!-- ------------------------------------------------- -->
	<div id="orderdate" class="container-fluid m-t-3">
		<div class="row">

			<!-- Shopping Cart List -->
			<div class="col-md-9">
				<div style="background-color: white;" id="sendpictur">
					<div class="title">
						<span>聯絡人資料</span><img style="display: none" id="loadingIMG"
							class="loader" alt="" src="<c:url value=""/>">
					</div>
					<form role="form">
						<div class="row">
							<div class="form-group col-md-6">

								<label> 訂購人姓名 : ${order.name}</label>
							</div>
							<div class="form-group col-md-6">

								<label>連絡電話 : ${order.tel}</label>
							</div>
							<div class="form-group col-md-6">

								<label> 行動電話 : ${order.phone}</label>
							</div>

							<div class="form-group col-md-6">

								<label> 聯絡地址 : ${order.address}</label> <label> </label>
							</div>
							<div style="height: 50px" class="form-group col-md-12">

								<label><b style="color: red">※<b>※訂單明細收件信箱 :<br>
									</b></b> 電子信箱 ${order.email}</label>
							</div>
						</div>
					</form>











					<!-- 以下購物車-------------------------------------------------------------------- -->
					<div class="title">
						<span>購物車</span>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered table-cart">



							<thead>
								<tr>
									<th>商品</th>
									<th>描述</th>
									<th>數量</th>
									<th>單價</th>
									<th>小計</th>
									<!-- 								<th>操作</th> -->
								</tr>
							</thead>



							<c:forEach items="${cars}" var="data">
								<tbody class="${data.value.PK.gameSN.gameSN}">
									<tr>
										<td class="img-cart"><a href=""> <img
												style="width: 50px" alt="Product"
												src="<c:url value="/Tim${data.value.PK.gameSN.smallImage}"/>"
												class="img-thumbnail">
										</a></td>
										<td>
											<p>
												<a
													href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>"
													class="d-block">${data.value.PK.gameSN.gameName}</a>
											</p> <small>${data.value.PK.gameSN.introduction}</small>
										</td>
										<td class="input-qty">
											<div class="input-group bootstrap-touchspin">
												<span class="input-group-addon bootstrap-touchspin-prefix">qty
												</span> <input onchange="inputCangeCar(this)"
													id="${data.value.PK.gameSN.gameSN}" type="text"
													value="${data.value.quantity}"
													class="form-control text-center" style="display: block;"
													readonly><span
													class="input-group-addon bootstrap-touchspin-postfix"
													style="display: none;"></span><span
													class="input-group-btn-vertical"> </span>
											</div>
										</td>
										<td class="unit">\$${data.value.PK.gameSN.price}</td>
										<td class="sub"><span>$</span><span>${data.value.PK.gameSN.price*data.value.quantity}</span></td>
										<!-- 									<td class="action"><a href="javascript:void(0)" -->
										<!-- 										data-toggle="tooltip" -->
										<%-- 										onclick="CShopCar(${data.value.PK.gameSN.gameSN},${data.value.PK.gameSN.price},${data.value.quantity},this)" --%>
										<!-- 										data-placement="top" data-original-title="Update"> <i -->
										<!-- 											class="fa fa-refresh"><img data-original-title="Update" -->
										<!-- 												data-toggle="tooltip" style="width: 25px" -->
										<!-- 												data-placement="top" -->
										<%-- 												src="<c:url value="/Tim/image/icon/update.png"/>" --%>
										<!-- 												class="img-thumbnail"></i></a>&nbsp; <a -->
										<%-- 										onclick="delectCar(${data.value.PK.gameSN.gameSN},this)" --%>
										<!-- 										href="javascript:void(0)" class="text-danger" -->
										<!-- 										data-toggle="tooltip" data-placement="top" -->
										<!-- 										data-original-title="Remove"><i class="fa fa-trash-o"> -->
										<!-- 												<img style="width: 25px" -->
										<%-- 												src="<c:url value="/Tim/image/icon/delete.png"/>" --%>
										<!-- 												class="img-thumbnail"> -->
										<!-- 										</i></a></td> -->
									</tr>
								</tbody>
							</c:forEach>
							<tbody>
								<tr>
									<td colspan="4" class="text-right">運費與商品總和</td>
									<td id="totalShop" style="font-family: fantasy; font: red"
										colspan="2">\$${order.orderAmount}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<nav aria-label="Shopping Cart Next Navigation">
				<ul class="pager">
					<li role="presentation" class="previous"><a href="javascript:void(0)"
						onclick="parentHome(this)" aria-controls="three" myid="four" role="tab" data-toggle="tab"><span
							aria-hidden="true">←</span>填寫聯絡人資料</a></li>
					<li class="next"><a
						onclick="ajax('${order.name}','${order.email}')"
						href="javascript:void(0)">送出訂單<span aria-hidden="true">→</span>
					</a></li>
				</ul>
				</nav>
			</div>
			<script type="text/javascript">
			function parentHome(me) {
				parent.parentTab(me)
			}
			</script>
			<!-- End Shopping Cart List -->

			<!-- New Arrivals -->
			<div class="col-md-3 hidden-sm hidden-xs"></div>
		</div>
	</div>


</body>

<script type="text/javascript">
	var img = 0;
	var dataURL = 0;
	var setDiv = document.getElementById("sendpictur");
	var width = setDiv.offsetWidth;
	var height = setDiv.offsetHeight;
	var canvas = document.createElement("canvas");
	var scale = 1.2;
	canvas.width = width * scale;
	canvas.height = height * 2;
	canvas.getContext("2d").scale(scale, scale);
	var opts = {
		scale : scale,
		canvas : canvas,
		width : width,
		height : height
	};

	function toImage() {
		html2canvas(setDiv, opts).then(
				function(canvas) {

					$('html, body').scrollTop(10000);
					// 		     Canvas2Image.saveAsPNG(canvas, canvas.width, canvas.height);
					img = Canvas2Image.convertToJPEG(canvas, canvas.width,
							canvas.height);
					dataURL = canvas.toDataURL(img);
					// 											window.open(dataURL);
					//						console.log(img);
					//						console.log(dataURL);
					// 					sessionStorage.setItem("image", dataURL);
					// 				console.log(sessionStorage.getItem("image"));
					//						window.open(dataURL, '訂單',
					//								config = 'height=750,width=1000');

				})
	}

	function ajax(name, email) {
		$.ajax({
			type : "POST",
			url : "/FlipYouth/writeOrder.controller",
			data : {
				name : name,
				email : email,
				image : dataURL
			},
			async : false,
			xhrFields : {
				withCredentials : false
			},
			success : function(res) {
				$('#orderdate').empty();
				$('#orderOK').show();
			},
			error : function() {

				alert('訂單出錯');
			},
			beforeSend : function() {
				
				parent.move_div();
				window.parent.$('#loadingIMG').show();
			},
			complete : function() {
				setTimeout(function() {
					window.parent.$('#loadingIMG').hide();
				}, 500)
				
			},

		})//end ajax
	};
	window.onload = function() {
		toImage();
	};

	function print() {
		window.open(dataURL, '訂單', config = 'height=750,width=1000');
	}
</script>
</html>