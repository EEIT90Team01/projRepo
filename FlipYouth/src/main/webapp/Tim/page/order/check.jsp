<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/producHome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/bootstrap-select.css"/>">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script>
<style type="text/css">
.overfont {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.title {
	border-bottom: 3px solid #9fa8da;
}

.title {
	font-size: 18px;
	line-height: 1;
	margin: 0 0 10px;
	padding: 0;
	font-family: "malgun gothic", simhei;
	font-weight: 300;
}
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

.bootstrap-select .dropdown-toggle {
	border-color: #ccc;
	border-radius: 0;
}

.title2 {
	font-size: 15px;
	line-height: 1;
	margin: 0 0 10px;
	padding: 0;
	font-family: "malgun gothic", simhei;
	font-weight: 300;
}
.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    width: 150px;
}
font{font-family: 
Meiryo, "微軟正黑體", "Microsoft JhengHei"}
</style>
<script type="text/javascript">

function loadaa() {
	window.parent.$('#three iframe').css("height",$('body').height()+50);
	var c =0;
	var b=$('.sub').children().next();
	console.log(b.length)
	for(var i=0 ;i<b.length;i++){
	var d = $(b[i]).text();
		c+=parseInt(d);
	}
	c+=100;
	$('#totalShop').text("$"+c);
	changeData();
}
</script>


</head>







<body onload="loadaa()">
	<script type="text/javascript">
function changeData(){
	$.ajax({
		type:"POST",
		url:"/FlipYouth/writeOrder.controller?insert=1",
		data:{
		orderAmount:$('#totalShop').text(),
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
// 			window.location="orderOver.jsp";
		},
	})
	
	
}
</script>
	<div onchange="changeData()" ; class="container-fluid m-t-3">
		<div class="row">

			<!-- Shopping Cart List -->
			<div class="col-md-12">
				<div class="title">
					<span>聯絡人資料</span>
				</div>
				<form role="form">
					<div class="row">
						<label></label>
						<div class="form-group col-md-6">

							<label><b style="color: red">※</b> 訂購人姓名 </label> <input
								type="text" class="form-control" id="name" value="${order.name}" />
						</div>
						<div class="form-group col-md-6">

							<label>連絡電話 </label><input type="text" value="${order.tel}"
								class="form-control" id="tel" />
						</div>
						<div class="form-group col-md-6">

							<label><b style="color: red">※</b> 行動電話 </label> <input
								value="${order.phone}" type="text" class="form-control"
								id="phone" />
						</div>
						<div class="form-group col-md-6">

							<label><b style="color: red">※</b> 電子信箱 <b>※訂單明細收件信箱
							</b></label> <input type="email" value="${order.email}" class="form-control"
								id="email" />
						</div>
						<div class="form-group col-md-6">

							<label> 聯絡地址 </label> <input value="${order.address}" type="text"
								class="form-control col-md-6" id="address" />
							<!-- 							<div class="checkbox"> -->
							<!-- 								<label> <input type="checkbox" required /> 同意運費規則 -->
							<!-- 								</label> -->
							<!-- 							</div> -->
						</div>
						<div class="form-group col-md-6">
							<input id="putMemberDataCount"
								onclick="putMemberData('${loginOK.mbrName}','${loginOK.phone}','${loginOK.phone}','${loginOK.mbrEmail}','${loginOK.address}')"
								type="checkbox"><label> 同會員資料 </label>
						</div>
					</div>
				</form>
				<script type="text/javascript">
				function putMemberData(name,tel,phone,email,address){
					if($('#putMemberDataCount').prop( "checked" )){
					$('#name').val(name);
					$('#tel').val(tel);
					$('#phone').val(phone);
					$('#email').val(email);
					$('#address').val(address);
					return false;
					}else{
						$('#name').val("");
						$('#tel').val("");
						$('#phone').val("");
						$('#email').val("");
						$('#address').val("");
					}
				}
				</script>










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
								<th>操作</th>
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
												class="form-control text-center" style="display: block;"><span
												class="input-group-addon bootstrap-touchspin-postfix"
												style="display: none;"></span><span
												class="input-group-btn-vertical">
												<button onclick="ShopCarUp(${data.value.PK.gameSN.gameSN})"
													class="btn btn-default bootstrap-touchspin-up"
													type="button">
													<i class="glyphicon glyphicon-chevron-up"></i>
												</button>
												<button
													onclick="ShopCarDown(${data.value.PK.gameSN.gameSN})"
													class="btn btn-default bootstrap-touchspin-down"
													type="button">
													<i class="glyphicon glyphicon-chevron-down"></i>
												</button>
											</span>
										</div>
									</td>
									<td class="unit">\$${data.value.PK.gameSN.price}</td>
									<td class="sub"><span>$</span><span>${data.value.PK.gameSN.price*data.value.quantity}</span></td>
									<td class="action"><a href="javascript:void(0)"
										data-toggle="tooltip"
										onclick="CShopCar(${data.value.PK.gameSN.gameSN},${data.value.PK.gameSN.price},${data.value.quantity},this)"
										data-placement="top" data-original-title="Update"> <i
											class="fa fa-refresh"><img data-original-title="Update"
												data-toggle="tooltip" style="width: 25px"
												data-placement="top"
												src="<c:url value="/Tim/image/icon/update.png"/>"
												class="img-thumbnail"></i></a>&nbsp; <a
										onclick="delectCar(${data.value.PK.gameSN.gameSN},this)"
										href="javascript:void(0)" class="text-danger"
										data-toggle="tooltip" data-placement="top"
										data-original-title="Remove"><i class="fa fa-trash-o">
												<img style="width: 25px"
												src="<c:url value="/Tim/image/icon/delete.png"/>"
												class="img-thumbnail">
										</i></a></td>
								</tr>
							</tbody>
						</c:forEach>
						<tbody>
							<tr>
								<td colspan="4" class="text-right">運費與商品總和</td>
								<td id="totalShop" style="font-family: fantasy; font-color: red" colspan="2"><b></b></td>
							</tr>
						</tbody>
					</table>
				</div>
				<nav aria-label="Shopping Cart Next Navigation">
				<ul class="pager">
					<li role="presentation" class="previous"><a onclick="parentHome(this)" href="javascript:void(0)"
						aria-controls="two" myid="three" role="tab" data-toggle="tab"><span
							aria-hidden="true">←</span>查看購物車</a></li>
					<li class="next"><a aria-controls="four" myid="three" onclick="parentHome(this)"
						href="javascript:void(0)">檢查訂單<span aria-hidden="true">→</span>
					</a></li>
				</ul>
				</nav>
			</div>
			<!-- End Shopping Cart List -->

			<!-- New Arrivals -->
			<div class="col-md-3 hidden-sm hidden-xs"></div>
		</div>
	</div>

	<script type="text/javascript">
	function parentHome(me) {
		parent.parentTab(me)
	}
	
</script>
	<script type="text/javascript">



	var gameCount;
	
	function ShopCarUp(SN){
		var GameVal= $('#'+SN).val();
		GameVal = parseInt(GameVal)+1;
		gameCount = GameVal;
		$('#'+SN).val(gameCount);
	}
	function ShopCarDown(SN){
		var GameVal= $('#'+SN).val();
		GameVal = parseInt(GameVal)-1;
		gameCount = GameVal;
		$('#'+SN).val(gameCount);
	}
	
	function CShopCar(gameSN,price,count,thiss) {
		var a =$(thiss).parent().prev();
		a.children().next().empty();
		var b = $('#'+gameSN).val()
		a.children().next().text(price*b)
		$.ajax({
			url : "/FlipYouth/order.controller?change=1",
			type : "POST",
			data : {
				value : gameCount,
				GameSN : gameSN,
			},
			async : false,
			xhrFields : {
				withCredentials : false
			},
			success : function(res) {
				if (res == "") {
					alert('庫存不足');
//					$(gameValue).val(Quantity);
				} else {
					alert('更新購物車成功')
					loadaa();
				}
			},
		})
		
		
		
		
	}
	function inputCangeCar(me){
		gameCount =$(me).val();			
	}
	function delectCar(gameSN,row){
		
		$.ajax({
			url:"/FlipYouth/order.controller?delectCar="+gameSN,
			type:"POST",
			async: true,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				alert('刪除成功');
				$('.'+gameSN).empty();
				loadaa();

				},
		})
	}
	
	
	
	</script>




</body>
</html>