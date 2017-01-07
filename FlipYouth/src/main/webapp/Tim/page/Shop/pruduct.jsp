<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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

<!-- Latest compiled and minified JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


<link rel="stylesheet" type="text/css" href="<c:url value="/Tim/css_Tim/Tim.css"/>">
<style type="text/css">
/* div {   */
/*   	border-style: solid;   */
/*   	border-width: 1px;   */
/*  }   */
p {
	text-overflow: ellipsis;
	overflow: hidden;
}

font {
	font-size: 18px;
	line-height: 1.7;
	font-weight: 600;
	font-family: Microsoft JhengHei;
}

body {
	width: 90%;
}

.max-h {
	height: 22px;
}

img {
	width: 96%;
	height: 100%;
	padding-top: 1%;
}

.col-md-1 {
	white-space: nowrap;
}

.col-md-3>font {
	float: right;
}

.col-md-9 {
	margin-left: 0px;
	padding-left: 0px;
}

h6 {
	font-family: Microsoft JhengHei;
}

col-md-10 {
	font-size: 30;
}

iframe {
	width: 100%;
	padding: 0px;
	margin: 0px;
}
.shoppingBox {
	display: block;
	width: 206px;
	height: 140px;
	background: url(/FlipYouth/Tim/image/shopping.png) no-repeat;
	position: absolute;
	top: 95px;
	right: 0px;
	z-index: 100;
	text-align: center;
	padding: 0 15px;
	box-sizing: border-box;
}
.shoppingBox h3 {
    position: relative;
    margin: 43px 0 6px 0;
    padding-bottom: 5px;
    color: #fff;
    font-size: 17px;
    font-weight: normal;
}
.shoppingBox p {
    font-size: 13px;
    color: #e9ee94;
    line-height: 1.8;
}
</style>
</head>
<body>

<%@ include file="/chatRoom.jsp" %>
<div class="shoppingBox">
<h3>購物清單</h3>
<span id="car">
<p>以選購<font style="color: white;">${count}</font>件
<p>總金額\$<font style="color: white;">${ALL}</font>
</span></div>

	<div style="padding: 0% 5% 0% 20%;">


		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div style="padding: 20px 0px 20px 0px" class="col-md-4">
							<div style="padding: auto 0px;" class="col-md-12">
								<img alt="Bootstrap Image Preview"
									src="<c:url value="/Tim${pruduct.bigImage}"/>"
									class="img-thumbnail" />
							</div>
						</div>
						<div class="col-md-8 ">
							<div style="height: 5px" class="col-md-8"></div>
							<div class="container-fluid">
								<div class="row">
									<div style="height: 300%" class="col-md-12">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-10">
												<h1>${pruduct.gameName}</h1>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10 ">
												<font>類別：${pruduct.gameclass}</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>遊戲適齡：${pruduct.ages}</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>遊戲主題：${pruduct.strGameTheme}</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>遊戲機制：${pruduct.strGameMechanics}</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>語言：${pruduct.strLanguage}</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>價格：${pruduct.price}元</font>
											</div>
										</div>
										<div class="row">
											<div class="col-md-10  ">
												<font>優惠價：${pruduct.discount}</font>
											</div>
										</div>
										<div class="row">

											<div class="col-md-9  ">
												<font> 運送方式：${pruduct.freight}</font>
											</div>
											<a style="color: #ffffff" class="btn btn-primary fluid"
												role="button" id="ShoppingCar"
												onclick="car(${pruduct.gameSN},${pruduct.price})">放入購物車</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">


						<div role="tabpanel">

							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#home"
									aria-controls="home" role="tab" data-toggle="tab">遊戲介紹</a></li>
								<li role="presentation"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab">碩延專區</a></li>

							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div style="width: 80%; padding: 0% 10% 0% 10%" role="tabpanel"
									class="tab-pane active" id="home">${pruduct.div1}</div>


								<div role="tabpanel" class="tab-pane" id="profile">
									<h1>${pruduct.gameSN},${loginOK.mbrSN}</h1>
									<!-- ================================================================================================================================ -->


									<c:if test="${not empty Comment}">
										<c:forEach var="element" items="${Comment}">

											<div class="container-fluid">
												<input type="hidden" id="${element.CommentBean.cmtSN }">
												<div class="row">
													<div class="col-md-1"></div>
													<div class="col-md-10">
														<div class="panel panel-default">
															<div class="panel-heading">
																<h3 class="panel-title">
																	<img style="width: 50px; height: 50px"
																		src='data:image/png;base64,${element.img}' /> <input
																		type="hidden" id="${element.CommentBean.mbrSN.mbrSN}"
																		value="${element.CommentBean.mbrSN.image}" /> <span
																		style="color: blue;">${element.CommentBean.mbrSN.nickName}</span><br>
																</h3>
															</div>
															<div class="panel-body">
																<span>${element.CommentBean.text}</span>
															</div>
															<div class="panel-footer">
																<div class="row">
																	<div class="col-md-11">
																		<span>${element.CommentBean.cmtTime }</span>
																	</div>
																	<div class="col-md-1">
																		<%-- 															<c:if test="${element.CommentBean.mbrSN.mbrSN == loginOK.mbrSN}"> --%>
																		<button class="btn btn-xs btn-link active"
																			type="submit"
																			onclick="deleteComment(${element.CommentBean.cmtSN })">delete</button>
																		<%-- 															</c:if> --%>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-1"></div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<div id="insertComment" class="container-fluid"></div>
									<%-- 								<c:if test="${not empty loginOK}"> --%>
									<input type="text" id="comment" size="70" />
									<button type="submit" id="button" class="btn"
										onclick="sendComment(1,${pruduct.gameSN})">送出</button>
									<!-- 									=============================================================1其實是${loginOK.mbrSN} -->
									<!-- 									===============================================================c -->
									<%-- 								</c:if> 	--%>

								</div>





								<!-- ================================================================================================================================ -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	function deleteSQLComment(cmtSN){
		console.log("留言板的刪除鍵onclick 進入deleteSQLComment, cmtSN = "+cmtSN);
		$.ajax({
			url:"/FlipYouth/CommentDelete.controller",
			type:"POST",
			data:"&cmtSN="+cmtSN,
			success:function(){
				var json =JSON.stringify({ "cmtSN":cmtSN,"action":"deleteComment"});
				webSocket.send(json);
			}
		});
	}
	
	
	function deleteComment(cmtSN){
		console.log("deleteComment方法的cmtSN = "+cmtSN);
		$('#'+cmtSN).parent().remove();
		
	}
	$(function(){
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			$('.shoppingBox').stop().animate({top:scrollTop+240},500);	
		});
		
	});
	
	function sendComment(mbrSN, gameSN){
		var comment = $('#comment').val();
		$.ajax({
			url:"/FlipYouth/CommentInsert.controller",
			type:'POST',
			data:"&comment="+comment+"&mbrSN="+mbrSN+"&gameSN="+gameSN,
			dataType:'json',
			success:function(data){
				sendWebsocket(data);		
			}
		})	
	}

	function sendWebsocket(data){
		var comment = $('#comment').val();
		var json =JSON.stringify({"mbrSN":data.mbrSN.mbrSN,"nickName":data.mbrSN.nickName,"comment":comment, "cmtSN":data.cmtSN,"cmtTime":data.cmtTime, "action":"sendComment"});
		webSocket.send(json);
		$('#comment').val("");
	}
	//**********************************************************************************************
	
	
	
	
	
	
	//**********************************************************************************************	
	function car(gameSN,price){
		var b = price;
		var a= gameSN;
		$.ajax({	
			url: "Shop.controller",
			type:"POST",
			data:{name:gameSN,price:price},
			async: false,
			xhrFields: {
				withCredentials: false },
			success:function(res) {
				$('#car').html(res);
			},
			 
		})
	}
		
	
	
	//******
// 	var wordarray = new Uint16Array(event.data);
// 	  for (var i = 0; i < wordarray.length; i++) 
// 	  {
// 	    console.log(wordarray[i]);
// 	    wordarray[i]=wordarray[i]+1;
// 	  }
// 	  console.log("End of binary message");  
// 	  console.log("sending changes");  
// 	  ws.send(wordarray.buffer);
// 	}
	//******
	
	
	
	

	</script>
</body>
</html>