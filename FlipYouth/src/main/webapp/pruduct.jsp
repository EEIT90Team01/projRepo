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


<link rel="stylesheet" type="text/css" href="css_Tim/Tim.css">
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
</style>
</head>
<body>
	<div style="padding: 0% 5% 0% 20%;">
		

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div style="padding: 20px 0px 20px 0px" class="col-md-4">
							<div style="padding: auto 0px;" class="col-md-12">
								<img alt="Bootstrap Image Preview"
									src="<c:url value="${pruduct.bigImage}"/>"
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


								<div role="tabpanel" class="tab-pane" id="profile"><h1>${pruduct.gameSN},${loginOK.mbrSN}</h1>
<!-- ================================================================================================================================ -->

								
								<c:if test="${not empty Comment}">
									<c:forEach var="element" items="${Comment}" >
										<div style="width: 600px; background-color:#D1E9E9; margin: 10px">
											<img style="width:50px;height:50px" src='data:image/png;base64,${element.img}'/>
											<input type="hidden" id="${element.CommentBean.mbrSN.mbrSN}" value="${element.CommentBean.mbrSN.image}" />
											<span style="color: blue;">${element.CommentBean.mbrSN.nickName}</span><br>
											<span >${element.CommentBean.text}</span> <span>${element.CommentBean.cmtTime }</span>
											<c:if test="${element.CommentBean.mbrSN.mbrSN == loginOK.mbrSN}">
												<button class="btn" type="submit">delete</button>
											</c:if>
											<input type="hidden" name="cmtSN" value="${element.CommentBean.cmtSN }">		
										</div>
									</c:forEach>
								</c:if>
								
								<div id="insertComment">
								
								</div>
								<c:if test="${not empty loginOK}">
									<input type="text"  id = "comment" size="70"/>
									<button type="submit" id="submit" class="btn" onclick="sendComment(${loginOK.mbrSN},${pruduct.gameSN})" >送出</button>
								</c:if>
								</div>


							</div>

						</div>




					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
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
				$('#span').html(res);
			},
			 
		})
	}
	</script>
</body>
</html>