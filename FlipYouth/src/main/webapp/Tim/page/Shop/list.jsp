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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/producHome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/bootstrap-select.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/nouislider.css"/>">
<link rel="stylesheet" href="<c:url value="/Tim/css_Tim/checkBox.css"/>">

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
/* div { */
/* 	border-style: solid; */
/* 	border-width: 1px; */
/* } */
p, h3 {
	text-overflow: ellipsis;
	overflow: hidden;
}

body {
	width: 100%;
}

.max-h {
	height: 22px;
}

a:link {
	color: black;
	font-family: Microsoft JhengHei;;
	　font-weight: 900;
	//
	設定還沒瀏覽過的連結樣式
}

a:visited {
	font-family: Microsoft JhengHei;;
	color: black;
	font-size: 900;
	font-weight: 900;
	//
	設定已經瀏覽過的連結樣式
}

a:hover {
	font-family: Microsoft JhengHei;;
	color: black;
	font-size: 900;
	font-weight: 900;
	//
	設定滑鼠移到連結上的樣式
}

a:active {
	font-family: Microsoft JhengHei;;
	font-weight: 900;
	//
	設定正在被點選的連結樣式
	color
	:
	black;
}

.border_bottom {
	border-bottom: solid 1px;
	border-bottom-color: #dcd5d5;
}

.mart {
	font-size: 50px;
	font-family: Microsoft JhengHei;
}

a {
	font-size: 17px;
	line-height: 2.0;
	font-weight: 600;
	font-family: Microsoft JhengHei;
}

.ffff {
	background-color: black;
}

.Carousel {
	width: 100%;
}

#cars, #span {
	font-size: 17px;
	line-height: 2.0;
	font-weight: 600;
	font-family: Microsoft JhengHei;
}

.overfont {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.title {
	border-bottom: 3px solid #9fa8da;
}

.select {
	border-color: #1036d0;
	outline: 0 !important;
	background-color: #eee;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.noUi-horizontal {
	height: 13px;
}

.list-group-item {
	position: relative;
	display: block;
	padding: 10px 15px;
	margin-bottom: -1px;
	background-color: #fff;
}
</style>
</head>
<script type="text/javascript">
	
<%if (session.getAttribute("shopBean") == null) {%>
	$.ajax({
		url : "/FlipYouth/Shop.controller?gameClass=1",
		type : "POST",
		async : false,
		xhrFields : {
			withCredentials : false
		},
		success : function(res) {
			window.location.href = "/FlipYouth/Shop.controller"
		},
	})
<%}%>
	
</script>
<body id="body">
	<span id="wdth"></span>
	<c:set var="ShopUrl" scope="session"
		value="'/FlipYouth/Shop.controller'" />
	<!-- 	<div> -->
	<%-- 		style="background-image: url(<c:url value="/Tim/image/big/bg.png"/>); background-repeat: repeat;"> --%>



	<div class="container">
		<div class="col-xs-12" style="height: 300px"></div>
		<div class="row">
			<div class="col-xs-12">
				<div class="col-md-3">
					<!-- =============================左側查詢 以下 =============================-->

					<div class="filter-sidebar">
						<div class="title">
							<span><font>啟用的篩選</font></span>
						</div>
						<ul>
							<!-- 								<li><font>分類：T卹 </font><a href="" -->
							<!-- 									class="remove-filter" data-toggle="tooltip" title="" -->
							<!-- 									data-original-title="Remove"><i class="fa fa-remove"></i></a></li> -->
							<!-- 								<li><font>庫存量：有貨 </font><a href="" -->
							<!-- 									class="remove-filter" data-toggle="tooltip" title="" -->
							<!-- 									data-original-title="Remove"><i class="fa fa-remove"></i></a></li> -->
							<!-- 								<li><font>品牌：品牌名稱1 </font><a href="" -->
							<!-- 									class="remove-filter" data-toggle="tooltip" title="" -->
							<!-- 									data-original-title="Remove"><i class="fa fa-remove"></i></a></li> -->
						</ul>
					</div>

					<!-- ======================================================= -->
					<div class="filter-sidebar">
						<div class="title">
							<span><font>語言</font></span>
						</div>
						<div class="checkbox checkbox-primary">
							<label><input class="checkbox" type="checkbox" value="繁中"
								checked="checked"><span><font>繁中</font></span></label>
						</div>
						<div class="checkbox checkbox-primary">
							<label><input class="checkbox" value="簡中" type="checkbox"><span><font>簡中</font></span></label>
						</div>
						<div class="checkbox checkbox-primary">
							<label><input class="checkbox" value="英文" type="checkbox"><span><font>英文</font></span></label>
						</div>
					</div>







					<!-- ==========================================================  -->
					<div class="filter-sidebar">
						<div class="title">
							<span><font>遊戲類型</font></span>
						</div>

						<select id="shopClass"
							class="btn-group bootstrap-select selectpicker select">
							<option value="0"><font>全部</font></option>
							<option value="1"><font>自有商品</font></option>
							<option value="2"><font>派對遊戲</font></option>
							<option value="4"><font>親子桌遊</font></option>
							<option value="5"><font>輕度策略</font></option>
							<option value="6"><font>重度策略</font></option>
							<option value="7"><font>台灣原創</font></option>
							<option value="8"><font>麥卡貝推</font></option>
							<option value="9"><font>卡套</font></option>
						</select>


					</div>




					<div class="filter-sidebar">
						<div class="title">
							<span><font>遊戲主題</font></span>
						</div>

						<select id="theme" multiple title="可複選" data-live-search="true"
							class="btn-group bootstrap-select selectpicker select">
							<option value="0"><font>全部</font></option>
							<option value="1"><font>動物</font></option>
							<option value="2"><font>抽象</font></option>
							<option value="4"><font>驚悚</font></option>
							<option value="5"><font>諜報</font></option>
							<option value="6"><font>海盜</font></option>
							<option value="7"><font>尋寶</font></option>
							<option value="8"><font>抽象</font></option>
							<option value="9"><font>中世紀</font></option>
							<option value="10"><font>可愛</font></option>
							<option value="11"><font>積木</font></option>
							<option value="12"><font>卡套商品</font></option>
							<option value="13"><font>黑幫</font></option>
							<option value="14"><font>冒險</font></option>
							<option value="15"><font>股票</font></option>
						</select>


					</div>










					<div class="filter-sidebar">
						<div class="title">
							<span><font><font>價格範圍</font></font></span>
						</div>
						<div id="range-value">
							<font><font>範圍：</font></font><span id="min-price"><font>
									<font></font>
							</font> </span><font><font> - </font></font><span id="max-price"><span>
									$</span><font><font></font></font></span>
						</div>

						<input type="hidden" name="min-price" value=""></input><input
							type="hidden" name="max-price" value=""></input>
						<div class="price-range">
							<div id="price" class="noUi-target noUi-ltr noUi-horizontal">
							</div>
						</div>
					</div>




					<div class="filter-sidebar">
						<div class="title">
							<span><font><font>確認送出</font></font></span>
						</div>
						<button onclick="sendSelect()">送出查詢</button>
					</div>

					<script type="text/javascript">
						var checkbox = [];//複選框
						var GameClass = $('#shopClass').find("option:selected")
								.text();
						var theme = $('#theme').find("option:selected").text();
						function sendSelect() {
							checkbox = [];
							var check = $('input:checked');

							for (i = 0; i < check.length; i++) {

								if (check[i].checked == true) {
									checkbox.push(check[i].value)
								}

							}
					
							alert();
							alert(document.getElementById('price').noUiSlider
									.get());

							alert(checkbox);
							alert(GameClass);
						}
					</script>

				</div>
				<!-- end  col-md-3 -->
				<!-- ===============================左側查詢 以上==========================================-->
				<div class="col-md-9">
					<div class="title">
						<span>商品類型</span>
					</div>
					<c:forEach items="${shopBean.shopBean}" var="data">
						<div class="col-sm-6 col-md-4">
							<div class="img-responsive">
								<div class="box-product-outer"
									style="height: 400px; padding: 10px">
									<div class="box-product">
										<div class="img-wrapper">
											<a href="<c:url value="/Shop.controller?ID=${data.gameSN}"/>">
												<img class="img-rounded" style="height: 200px"
												src="<c:url value="/Tim${data.bigImage}"/>">
											</a>
										</div>
										<h6>
											<a style=""
												href="<c:url value="/Shop.controller?ID=${data.gameSN}"/>">${data.gameName}</a>
										</h6>
										<p style="height: 60px">${data.introduction}</p>
										<div class="price">
											<span class="btm-30px"
												style="position: absolute; bottom: 50px; margin: 0px auto;">NT\$${data.price}元</span>
										</div>
										<!--               <div class="rating"> -->
										<!--                 <a href="#">查看詳情</a> -->
										<!--               </div> -->
										<!--                <div class="rating"> -->
										<!--                 <a href="#">放入購物車</a> -->
										<!--               </div> -->
									</div>
									<!-- 									</div> -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			wdth = $(window).width();
			if (wdth < 975) {
				$('#shop-left').hide();
			} else {
				$('#shop-left').show();
			}
			$(window).resize(function() {
				wdth = $(window).width();
				if (wdth < 975) {
					$('#shop-left').hide();
				} else {
					$('#shop-left').show();
				}
			});
		});
	</script>

	<script type="text/javascript">
		// 	window.onload = refreshParent;
		function refreshParent() {
			$.ajax({
				url : window.location.href,
				type : "POST",
				async : false,
				xhrFields : {
					withCredentials : false
				},
				success : function(res) {
					$('body').html(res);
				},
			})

		}
		function clearCar() {
			$.ajax({
				url : "Shop.controller",
				type : "POST",
				data : {
					clearCar : 1
				},
				async : false,
				xhrFields : {
					withCredentials : false
				},
				success : function(res) {
					window.location = window.location.href;
				},
			})
		}
		function car(gameSN, price, href) {
			var b = price;
			var a = gameSN;
			$.ajax({
				url : href,
				type : "POST",
				data : {
					name : gameSN,
					price : price
				},
				async : false,
				xhrFields : {
					withCredentials : false
				},
				success : function(res) {
					$('#span').html(res);
				},
			})
		}

		$(document).ready(function() {
			var price = document.getElementById('price');
			noUiSlider.create(price, {
				start : [ 300, 2000 ],
				connect : true,
				range : {
					'min' : 0,
					'max' : 3000
				}
			});
			price.noUiSlider.on('update', function(values, handle) {
				var value = values[handle];
				if (handle) {
					$('#max-price').text(Math.round(value));
					$('input[name="max-price"]').text(Math.round(value));
				} else {
					$('#min-price').text(Math.round(value));
					$('input[name="min-price"]').text(Math.round(value));
				}
			});
		});
	</script>
</body>
</html>