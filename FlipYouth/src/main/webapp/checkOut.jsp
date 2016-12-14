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

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
/*   div {   */
/*   	border-style: solid;   */
/*   	border-width: 1px;   */
/*   }   */

.px-100 {
	text-align: center;
	height: 100px;
	padding: 20px;
	margin-top: 50px;
}
.center{
text-align: center;
}
</style>
</head>
<body>
	<font size="99">${loginOK.mbrName}你好歡迎來到翻桌唷商城</font>
	<div style="border-bottom: 1px solid;" class="container">
		<div class="row">
			<div class="col-md-12">
				<div style="border-bottom: 1px solid;class="row">
				<div class="col-md-2 center">商品名稱</div>
					<div class="col-md-2 center">圖片</div>
					<div class="col-md-3 center">商品描述</div>
					<div class="col-md-1 center">價格</div>
					<div class="col-md-1 center">數量</div>
					<div class="col-md-1 center">庫存</div>
					<div class="col-md-1 center">小計</div>
					<div class="col-md-1 center">變更明細</div>
				</div>


				<c:forEach items="${cars}" var="data">
					<div  class="row">      <hr>	 
					<div class="col-md-2" style="margin-top: 20px"><a  target="_blank" href="<c:url value="/Shop.controllor?ID=${data.value.PK.shopBean.gameSN}"/>">${data.value.PK.shopBean.gameName}</a></div>
						<div style="margin-top: 5px" class="col-md-2 px-100"><a  target="_blank" href="<c:url value="/Shop.controllor?ID=${data.value.PK.shopBean.gameSN}"/>">
							<img  style="height: 120px; width: 110px"
								src="<c:url value="${data.value.PK.shopBean.smallImage}"/>" class="img-rounded" /></a>
							
						</div>
						<div  style="height: 200px margin-top: 20px ;" class="col-md-3 "><a  target="_blank" href="<c:url value="/Shop.controllor?ID=${data.value.PK.shopBean.gameSN}"/>">${data.value.PK.shopBean.introduction}
						</a></div>
						<div class="col-md-1 px-100">${data.value.PK.shopBean.price}</div>
						<div class="col-md-1 px-100"><input onchange="changeCar(${data.value.PK.shopBean.gameSN},this.value)" type="text" size="1" value="${data.value.quantity}"></div>
						<div class="col-md-1 px-100">${data.value.PK.shopBean.stockQuantity}</div>
						<div class="col-md-1 px-100">${data.value.PK.shopBean.price*data.value.quantity}</div>
						<div  class="col-md-1" ><input style="margin-top: 60px" class="btn btn-primary" type="button" value="取消"></div>
						
					</div>
				</c:forEach>


				<div class="row px-100">
					<div class="col-md-12"><font style="color:red"><h3>總金額${ALL}</h3></font></div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function changeCar(gameSN,value){
		$.ajax({
			url: "order.controllor?change=1",
			type:"POST",
			data:{value:value,GameSN:gameSN},
			async: true,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				if(res==""){
					alert('庫存不足');
				}else{
				$('body').html(res);
				}
				},
			
		})
	}
	
	
	</script>
</body>
</html>