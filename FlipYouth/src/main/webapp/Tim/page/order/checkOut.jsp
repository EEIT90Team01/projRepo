<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城系統</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
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
<!-- <link rel="stylesheet" type="text/css" href="css/Tim.css"> -->
<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript" src="../../js_Tim/html2canvas.js"></script>
<script type="text/javascript" src="../../js_Tim/canvas2image.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
/* div { */
/* 	border-style: solid; */
/* 	border-width: 1px; */
/* } */
.px-100 {
	text-align: center;
	height: 100px;
	padding: 20px;
	margin-top: 50px;
}

.center {
	text-align: center;
	color: white;
	font-family: Microsoft JhengHei;
	font-weight: 600;
	line-height: 1.5;
	font-size: 17px;
}

.center1 {
	font-family: Microsoft JhengHei;
	font-weight: 600;
	line-height: 1.5;
	font-size: 15px;
}

a {
	font-size: 17px;
	line-height: 2.0;
	font-weight: 600;
	font-family: Microsoft JhengHei;
	color: BLACK;
}

.color1 {
	color: #de9227;
}

.color2 {
	line-height: 2.0;
	font-weight: 600;
	font-size: 19px;
	background-color: #c7000b;
	color: white;
}

b {
	font-weight: normal;
	font-size: 12px;
	color: #D07474;
	padding-left: 5px;
}

.btn-danger {
	background-image: linear-gradient(to bottom, #c7000b 0, #c12e2a 100%);
}
</style>
</head>
<script type="text/javascript">


</script>
<body>
	<font size="99">${loginOK.mbrName}你好歡迎來到翻桌唷商城</font>



	<div style="border-bottom: 1px solid;" class="container">
		<div class="col-xs-12">

			<div class="row container">
				<div class="col-xs-6">
					<img style="float: right;" alt="Bootstrap Image Preview"
						src="<c:url value="/Tim/image/icon/step01_c.png"/>" />
				</div>
				<div class="col-xs-6">
					<img alt="Bootstrap Image Preview" src="<c:url value="/Tim/image/icon/step02.png"/>" />
				</div>
			</div>
		</div>
		<div class="col-xs-12" style="height: 30px"></div>


		<div class="row">
			<div class="col-xs-12">
				<div style="border-bottom: 1px solid; background: #c7000b;"
					class="row">
					<div class="col-xs-2 center">商品名稱</div>
					<div class="col-xs-2 center">圖片</div>
					<div class="col-xs-3 center">商品描述</div>
					<div class="col-xs-1 center">價格</div>
					<div class="col-xs-1 center">數量</div>
					<div class="col-xs-1 center">庫存</div>
					<div class="col-xs-1 center">小計</div>
					<div class="col-xs-1 center">取消</div>
				</div>


				<c:forEach items="${cars}" var="data">
					<div class="row">
						<hr>
						<div class="col-xs-2" style="margin-top: 20px">
							<a target="_blank"
								href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>">${data.value.PK.gameSN.gameName}</a>
						</div>
						<div style="margin-top: 5px" class="col-xs-2 px-100">
							<a target="_blank"
								href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>">
								<img style="height: 120px; width: 110px"
								src="<c:url value="/Tim${data.value.PK.gameSN.smallImage}"/>"
								class="img-rounded" />
							</a>

						</div>
						<div style="height: 200px margin-top: 20px;" class="col-xs-3 ">
							<a target="_blank"
								href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>">${data.value.PK.gameSN.introduction}
							</a>
						</div>
						<div class="col-xs-1 px-100">${data.value.PK.gameSN.price}</div>
						<div class="col-xs-1 px-100">
							<input class="car" id="${data.value.PK.gameSN.gameSN}"
								onchange="changeCar(${data.value.PK.gameSN.gameSN},this.value)"
								type="text" size="1" value="${data.value.quantity}">
						</div>
						<div class="col-xs-1 px-100">${data.value.PK.gameSN.stockQuantity}</div>
						<div class="col-xs-1 px-100">${data.value.PK.gameSN.price*data.value.quantity}</div>
						<div class="col-xs-1">
							<a onclick="delectCar(${data.value.PK.gameSN.gameSN})"> <input
								style="margin-top: 60px" class="btn btn-primary" type="button"
								value="取消"></a>
						</div>

					</div>
				</c:forEach>

				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12">
								<div class="row">

									<div class="col-xs-11">
										<H3 style="color: #C10211; border-bottom: 2px #C10211;">訂單總計</H3>
									</div>
									<div class="col-xs-1"></div>
								</div>
								<div class="row">
									<div class="col-xs-10 ">
										<h6 class="color1 center1">購物總計</h6>
									</div>
									<div class="col-xs-2">
										<h5 class="color1 center">${ALL}</h5>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-10 ">
										<h6 class="color1 center1">物流費</h6>
									</div>
									<div class="col-xs-2">
										<h5 class="color1 center">100</h5>
									</div>
								</div>
								<div class="row color2">
									<div class="col-xs-10">
										<h6 style="font-size: 19px">訂單總額</h6>
									</div>
									<div class="col-xs-2 center ">
										<h5>${ALL+100}</h5>
									</div>
								</div>
							</div>

							<div class="col-xs-12" style="height: 30px"></div>
							<div class="container-fluid">

								<div class="row">
									<div style="background-color: #c7000b" class="col-xs-12">
										<h6 style="font-size: 19px; color: white;">訂購人資料</h6>
									</div>
								</div>


								<div class="row">
									<div class="col-md-12">
										<form role="form">
											<div class="form-group">

												<label><b style="color: red">※</b> 訂購人姓名 </label> <input
													type="text" class="form-control" id="name"
													value="${loginOK.mbrName}" />
											</div>
											<div class="form-group">

												<label>連絡電話 </label><input type="text"
													value="${loginOK.phone}" class="form-control" id="tel" />
											</div>
											<div class="form-group">

												<label><b style="color: red">※</b> 行動電話<b>
														※查詢訂單必須輸入的欄位</b> </label> <input value="${loginOK.phone}" type="text"
													class="form-control" id="phone" />
											</div>
											<div class="form-group">

												<label><b style="color: red">※</b> 電子信箱 <b>※訂單明細收件信箱
												</b></label> <input type="email" value="${loginOK.mbrEmail}"
													class="form-control" id="email" />
											</div>
											<div class="form-group">

												<label> 聯絡地址 </label> <input value="${loginOK.address}"
													type="text" class="form-control" id="address" />
												<div class="checkbox">
													<label> <input type="checkbox" /> 同意運費規則
													</label>
												</div>
											</div>

											<div class="center">


												<a class="btn btn-danger"
													href='<c:url value="/Shop.controller"/>'>繼續購物</a> <a
													onclick="submit_btn(${loginOK.mbrSN},${ALL+100},'orderOver.jsp')"
													class="btn btn-danger" style="cursor: pointer"
													href="javascript: void(0)">訂單送出</a>
											</div>
										</form>
									</div>
								</div>
								<div class="col-xs-12" style="height: 100px"></div>
							</div>



						</div>
					</div>
				</div>



			</div>
		</div>
	</div>






	<script type="text/javascript">
	var a;
// 	function changeCar(gameSN,value){
// 		$.ajax({
// 			url: "/FlipYouth/order.controller?change=1",
// 			type:"POST", 
// 			data:{value:value,
// 				  GameSN:gameSN,
// 			},			
// 			async: true,
// 			xhrFields: {
// 				withCredentials: false },
// 			success:function(res) {
// 				if(res==""){
// 					alert('庫存不足');
// 					document.getElementById(gameSN).value=a;
// 				}else{
// 				$('body').html(res);
// 				}
// 				},
// 		})
// 	}
	
	$(document).ready(
		function(){
			$('.car').on('focus',function(){
				a=$(this).val();
				console.log($(this))
	 		})
		})
	
	
	
	
	function submit_btn(mbrSN,orderAmount,link_name) {
		 sessionStorage.setItem("name",$('#name').val());
		 sessionStorage.setItem("tel",$('#tel').val());
		 sessionStorage.setItem("phone",$('#phone').val());
		 sessionStorage.setItem("email",$('#email').val());
		 sessionStorage.setItem("address",$('#address').val());
		 sessionStorage.setItem("orderAmount",orderAmount);
		 sessionStorage.setItem("mbrSN",mbrSN);
		 sessionStorage.setItem("link_name",link_name);
		 
		 
		 
		 $.ajax({
				type:"POST",
				url:"/FlipYouth/writeOrder.controller?insert=1",
				data:{
				url:link_name,
				mbrSN:mbrSN,
				orderAmount:orderAmount,
				name:$('#name').val(),
				tel:$('#tel').val(),     
				phone:$('#phone').val(),
				email:$('#email').val(),
				address:$('#address').val(),
				},
				async: false,
				xhrFields: {
					withCredentials: false },
				success:function(res) {
					window.location="orderOver.jsp";
				},
			})//end ajax
		 
		 
			
	}
<%-- 		<%if (session.getAttribute("loginOK") != null) {%> --%>
//		$('body').fadeOut(4000, function(){});
<%-- 		<%}%> --%>
		    
	</script>


</body>

</html>




