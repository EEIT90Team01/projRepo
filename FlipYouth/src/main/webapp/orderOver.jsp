<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城系統</title>
<jsp:include page="LoginCheck.jsp"></jsp:include>
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
<!-- <link rel="stylesheet" type="text/css" href="css/Tim.css"> -->
<!-- Latest compiled and minified JavaScript -->
<script type="text/javascript" src="js_Tim/html2canvas.js"></script>
<script type="text/javascript" src="js_Tim/canvas2image.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
/*  div {  */
/*  	border-style: solid;  */
/*  	border-width: 1px;  */
/*  }  */
.center {
	text-align: center;
	color: white;
	font-family: Microsoft JhengHei;
	/* 	font-weight: 600; */
	line-height: 1.5;
	font-size: 17px;
}

/* .center1 { */
/* 	font-family: Microsoft JhengHei; */
/* 	font-weight: 600; */
/* 	line-height: 1.5; */
/* 	font-size: 15px; */
/* } */
a {
	font-size: 14px;
	line-height: 1.3;
	/* 	font-family: Microsoft JhengHei; */
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
	font-size: 16px;
	color: #cd1f14;
}

.btn-danger {
	background-image: linear-gradient(to bottom, #c7000b 0, #c12e2a 100%);
}

em {
	font-family: 'Gloria Hallelujah', cursive;
	font-size: 41px;
	color: #000;
	display: inline-block;
}

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

.px-100 {
	height: 62px;
	vertical-align: middle;
	padding: 20px 5px;
	text-align: center;
	margin-top: 0px;
}

.whoOrder {
	padding: 20px;
	display: block;
}

.OrderTop {
	display: block;
	margin-bottom: 5px;
	font-size: 14px;
	color: #222;
	height: 20px;
}

.Ordertotal {
	font-size: 18px;
	font-weight: normal;
	color: #9e5f4d;
	border-bottom: 1px solid #d9d9d9;
}

.center1 {
	font-family: 'Noto Sans TC', sans-serif;
	font-weight: normal;
	line-height: 1.5;
	font-size: 16px;
	color: #ffffff;
}

.right {
	padding-left: 0px;
}

.title {
	padding: 5px 0px;
}
</style>
</head>

<script type="text/javascript">
	
<%if (session.getAttribute("loginOK") != null) {%>
	// alert('準備做動畫');
<%} else {%>
	alert('連線已過期請從登入');
	$('body').empty();
	$.ajax({
		type : 'POST',
		url : "order.controller",
		data : {
			url : 'list.jsp'
		},
		success : function(res) {
<%if (session.getAttribute("loginOK") == null) {%>
	$(res).appendTo('body');
<%}%>
	},
		async : true,
	});
<%}%>
	
</script>
<body>
	<font size="99">${loginOK.mbrName}購買成功</font>
	<div id="setDiv" style="background-color: white;">
		<div style="border-bottom: 1px solid;" class="container">
			<!-- container -->
			<div class="col-xs-12">
				<h2 class="orderStatus">
					<em>Complete</em><strong>訂購完成</strong>
				</h2>
				<div class="row container">
					<div class="col-xs-6">
						<img style="float: right;" alt="Bootstrap Image Preview"
							src="image/icon/step01.png" />
					</div>
					<div class="col-xs-6">
						<img alt="Bootstrap Image Preview" src="image/icon/step02_c.png" />
					</div>
				</div>
				<div class="col-xs-12" style="height: 30px"></div>
				<div class="col-xs-12 orderStatus">
					親愛的 ${loginOK.mbrName}先生，感謝您於本商店購物。您的訂單明細已同步發送至您的信箱。 <br>
					歡迎使用「訂單查詢」功能查詢目前訂單狀態，謝謝。 <br> 訂單編號：<b>${order.orderSN}</b> 狀態：<b>新單
					</b><br>
				</div>

			</div>

			<div class="col-xs-12">
				<h3 class="Ordertotal">選購清單</h3>
			</div>

			<div style="border-bottom: 1px solid; background: #c7000b;"
				class="col-xs-12 title">
				<div class="col-xs-4 center">商品</div>
				<div class="col-xs-4 center">描述</div>
				<div class="col-xs-1 center">價格</div>
				<div class="col-xs-1 center">數量</div>
				<div class="col-xs-2 center">小計</div>
			</div>

			<div class="col-xs-12">
			
			
				<c:forEach items="${cars}" var="data">
					<div class="col-xs-12" style="border-bottom: solid 1px #d9cdcd;">
						<div class="col-xs-4" style="padding: 10px">
							<a target="_blank"
								href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>">
								<img style="margin-left: 20px; height: 40px; width: 50px"
								src="<c:url value="${data.value.PK.gameSN.smallImage}"/>"
								class="img-rounded" /><font>${data.value.PK.gameSN.gameName}</font>
							</a>

						</div>
						<div
							style="height: 200px margin-top: 20px; text-overflow: ellipsis; overflow: hidden; /* 超過範圍隱藏 */ white-space: nowrap;"
							class="col-xs-4 px-100">
							<a target="_blank"
								href="<c:url value="/Shop.controller?ID=${data.value.PK.gameSN.gameSN}"/>">${data.value.PK.gameSN.introduction}
							</a>
						</div>
						<div class="col-xs-1 px-100">NT
							\$${data.value.PK.gameSN.price}</div>
						<div class="col-xs-1 px-100">${data.value.quantity}</div>
						<div class="col-xs-2 px-100">NT
							\$${data.value.PK.gameSN.price*data.value.quantity}</div>
					</div>
				</c:forEach>
				
				
				
				
			</div>
			<div class="col-md-12" style="height: 50px"></div>
			<div class="col-xs-12"
				style="border-bottom: 1px solid; background: #c7000b;"
				class="col-xs-12">
				<div class="col-xs-3 center1 title">收件人資料</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6 whoOrder">
								<div class="row">
									<div class="col-md-12 OrderTop ">收件人姓名</div>
								</div>
								<div class="row">
									<div class="col-md-12">${order.name}</div>
								</div>
							</div>
							<div class="col-md-6 whoOrder">
								<div class="row">
									<div class="col-md-12 OrderTop">電子信箱</div>
								</div>
								<div class="row">
									<div class="col-md-12">${order.email}</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 whoOrder">
								<div class="row">
									<div class="col-md-12 OrderTop">送貨地址</div>
								</div>
								<div class="row">
									<div class="col-md-12">${order.address}</div>
								</div>
							</div>
							<div class="col-md-6 whoOrder">
								<div class="row">
									<div class="col-md-12 OrderTop">連絡電話</div>
								</div>
								<div class="row">
									<div class="col-md-12">${order.tel}</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 whoOrder">
								<div class="row">
									<div class="col-md-12">行動電話</div>
								</div>
								<div class="row">
									<div class="col-md-12">${order.phone}</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12" style="height: 50px"></div>
			<div class="col-md-12">
				<h3 class="Ordertotal">訂單總計</h3>


				<div class="row">
					<div class="col-md-12">
						<div class="col-md-11 title">購物總計</div>
						<div class="col-md-1 right title">NT
							\$${order.orderAmount-100}</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="col-md-11 title">物流費</div>
						<div class="col-md-1 right title">NT \$100</div>
					</div>
				</div>
				<div class="row"
					style="border-bottom: 1px solid; background: #c7000b;">
					<div class="col-md-12">
						<div class="col-md-11 center1 title">總計</div>
						<div class="col-md-1 center1 right title">NT
							\$${order.orderAmount}</div>
					</div>
				</div>

				
			</div>
		</div>
		<!-- end setDiv -->
	</div>
	<div class="col-md-12" style="height: 30px"></div>
	<!-- 	<div class="col-md-12" style="height: 2000px"></div> -->
	<div class="center col-md-12">
		<div class="col-md-12" style="height: 50px">
			<a class="btn btn-danger" href='<c:url value="/Shop.controller"/>'>繼續購物</a>
			<a style="cursor: pointer;" class="btn btn-danger" onclick="print()">列印訂單</a>
		</div>
		
	</div>
</body>

<script type="text/javascript">
	var img = 0;
	var dataURL = 0;
	var name=sessionStorage.getItem("name");
	var tel=sessionStorage.getItem("tel");
	var phone=sessionStorage.getItem("phone");
	var email=sessionStorage.getItem("email");
	var address=sessionStorage.getItem("address");
	var orderAmount=sessionStorage.getItem("orderAmount");
	var mbrSN=sessionStorage.getItem("mbrSN");
	var link_name=sessionStorage.getItem("link_name");
	var setDiv = document.getElementById("setDiv");
	var width = setDiv.offsetWidth;
	var height = setDiv.offsetHeight;
	var canvas = document.createElement("canvas");
	var scale = 1.2;
	canvas.width = width * scale;
	canvas.height = height * scale;
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
					// 		     Canvas2Image.saveAsPNG(canvas, canvas.width, canvas.height);
					img = Canvas2Image.convertToJPEG(canvas,canvas.width, canvas.height);
					
					dataURL = canvas.toDataURL(img);
//						window.open(dataURL);
//						console.log(img);
//						console.log(dataURL);
// 					sessionStorage.setItem("image", dataURL);
					// 				console.log(sessionStorage.getItem("image"));
//						window.open(dataURL, '訂單',
//								config = 'height=750,width=1000');
					ajax();
				})
	}
	function ajax(){
		$.ajax({
			type:"POST",
			url:"writeOrder.controller",
			data:{
			url:link_name,
			mbrSN:mbrSN,
			orderAmount:orderAmount,
			name:name,
			tel:tel,     
			phone:phone,
			email:email,
			address:address,
			image:dataURL,
			},
			async: false,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
			<%if (session.getAttribute("loginOK") != null) {%>
			alert('訂單新增成功');
			<%} else {%>
			alert('請登入');
			window.location='list.jsp';
			<%}%>
			},
		})//end ajax
	};
	window.onload=function() {
		toImage();
	};
	
	
	function print() {
		window.open(dataURL, '訂單', config = 'height=750,width=1000');
	}
</script>
</html>