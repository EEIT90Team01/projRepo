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
	href="<c:url value="/Tim/css_Tim/nouislider.css"/>">

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

.dropdown-menu { !important;
	
}
</style>








</head>
<body id="body">
	<span id="wdth"></span>
	<c:set var="ShopUrl" scope="session"
		value="'/FlipYouth/Shop.controller'" />
	<!-- 	<div> -->
	<%-- 		style="background-image: url(<c:url value="/Tim/image/big/bg.png"/>); background-repeat: repeat;"> --%>



	<div class="container">
		<div class="col-xs-12" style="height: 300px"></div>
		<!-- 選單  以下 -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">商城首頁</a></li>
						<li><a href="">商品列表</a></li>
						<li><a href="">購物車</a></li>
						<li><a onclick="" href="<c:url value="/Tim/page/order/checkOut.jsp"/>">確認訂單</a></li>
						<li><a href="">訂單明細</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 選單  以上 -->

















		<div class="row">
			<div class="col-xs-12">
				<div class="col-md-3">
					<!-- =============================左側查詢 以下 =============================-->

					<div class="filter-sidebar">
						<div class="title">
							<span><font>啟用的篩選</font></span>
						</div>
						<ul>
							<li><font id="left_checkbox"></font><a href=""
								class="remove-filter" data-toggle="tooltip" title=""
								data-original-title="Remove"><i class="fa fa-remove"></i></a></li>
							<li><font id="left_Class"></font><a href=""
								class="remove-filter" data-toggle="tooltip" title=""
								data-original-title="Remove"><i class="fa fa-remove"></i></a></li>
							<li><font id="left_theme"></font><a href=""
								class="remove-filter" data-toggle="tooltip" title=""
								data-original-title="Remove"><i class="fa fa-remove"></i></a></li>
							<li><font id="left_price"></font><a href=""
								class="remove-filter" data-toggle="tooltip" title=""
								data-original-title="Remove"><i class="fa fa-remove"></i></a></li>
						</ul>
					</div>

					<!-- ======================================================= -->
					<div class="filter-sidebar">
						<div class="title">
							<span><font>語言</font></span>
						</div>
						<div onchange="sendSelect()" class="checkbox checkbox-primary">
							<label><input class="checkbox" type="checkbox" value="繁中"
								checked="checked"><span><font>繁中</font></span></label>
						</div>
						<div onchange="sendSelect()" class="checkbox checkbox-primary">
							<label><input class="checkbox" value="簡中" type="checkbox"><span><font>簡中</font></span></label>
						</div>
						<div onchange="sendSelect()" class="checkbox checkbox-primary">
							<label><input class="checkbox" value="英文" type="checkbox"><span><font>英文</font></span></label>
						</div>
					</div>







					<!-- ==========================================================  -->
					<div class="filter-sidebar">
						<div class="title">
							<span><font>遊戲類型</font></span>
						</div>

						<select onchange="sendSelect()" id="shopClass"
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

						<select onchange="sendSelect()" id="theme" multiple title="可複選"
							data-live-search="true"
							class="btn-group bootstrap-select selectpicker select">
							<option value="0"><font>全部 </font></option>
							<option value="1"><font>動物 </font></option>
							<option value="2"><font>抽象 </font></option>
							<option value="4"><font>驚悚 </font></option>
							<option value="5"><font>諜報 </font></option>
							<option value="6"><font>海盜 </font></option>
							<option value="7"><font>尋寶 </font></option>
							<option value="8"><font>抽象 </font></option>
							<option value="9"><font>中世紀 </font></option>
							<option value="10"><font>可愛 </font></option>
							<option value="11"><font>積木 </font></option>
							<option value="12"><font>卡套商品 </font></option>
							<option value="13"><font>黑幫 </font></option>
							<option value="14"><font>冒險 </font></option>
							<option value="15"><font>股票 </font></option>
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
					<span id="span"></span>


				</div>
				<!-- end  col-md-3 -->
				<!-- ===============================左側查詢 以上==========================================-->
				<div class="col-md-9">
					<div class="title">
						<span>商品類型</span>
					</div>
					<!--==========================================================  -->


					<div class="filter-sidebar">
						<div class="col-md-12">
							<div id="orderBy" class="col-md-4">
								排序 <select onchange="sendSelect()" style="width: 50%;"
									class="btn-group bootstrap-select selectpicker select">
									<option value="DESC"><font>價錢高到低</font></option>
									<option value="ASC"><font>價錢低到高</font></option>
								</select>
							</div>


							<div id="select-page" class="col-md-4">
								每頁頁數<select onchange="changePageCount()" style="width: 50%;"
									class="btn-group bootstrap-select selectpicker select ">
									<option value="6"><font>6</font></option>
									<option value="9"><font>9</font></option>
									<option value="12"><font>12</font></option>
								</select>
							</div>
							<div class="col-md-4">
								<font id="page-count"></font> <input onchange="sendSelect()"
									type="text" class="form-control" id="search" placeholder="查詢字串">
							</div>
						</div>
					</div>
					<!--===========================================  -->
					<div id="forEach"></div>
					<div class="row">
						<div class="col-md-12">
							<nav style="text-align: center;" aria-label="Page navigation">
							<ul id="ul" class="pagination" max-size="3"></ul>
							</nav>
						</div>
					</div>

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
		function car(gameSN, price) {
			// 			var b = price;
			// 			var a = gameSN;
			$.ajax({
				url : "/FlipYouth/Shop.controller",
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
					
				},
			})
		}

		$(document).ready(
				function() {
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
						sendSelect();

						if (handle) {
							$('#max-price').text(Math.round(value));
							$('input[name="max-price"]')
									.text(Math.round(value));
						} else {
							$('#min-price').text(Math.round(value));
							$('input[name="min-price"]')
									.text(Math.round(value));
						}
						$('#left_price').text(
								"價格範圍 :" + $('#min-price').text() + "-"
										+ $('#max-price').text())
					});
					sendSelect()
				});
	</script>
	<script type="text/javascript">
		var pageCount;
		var nowpage = "1";
		function setNow(page) {
			nowpage = page;
			sendSelect();
		}
		function changePageCount() {
			nowpage = "1";
			sendSelect();
		}
		function sendSelect() {
			var checkbox = [];//複選框
			var GameClass = $('#shopClass').find("option:selected").text();
			var orderBy = $('#orderBy').find("option:selected").val();
			var theme = $('#theme').find("option:selected").text();
			var mix = document.getElementById('price').noUiSlider.get()[0];
			var max = document.getElementById('price').noUiSlider.get()[1];
			var selectpage = $('#select-page').find("option:selected").val();
			checkbox = [];
			var check = $('input:checked');
			var search = $('#search').val();
			var che = ""
			for (i = 0; i < check.length; i++) {
				if (check[i].checked == true) {
					checkbox.push(check[i].value)
					che += check[i].value
					if (i != check.length - 1) {
						che += ',';
					}
				}
				$('#left_checkbox').text("語言:" + che)
			}

			$('#left_Class').text(
					"遊戲類別:" + $('#shopClass').find("option:selected").text());
			if (theme != "") {
				$('#left_theme').text(
						"遊戲主題:" + $('#theme').find("option:selected").text());
			}

			ajax(search, selectpage, checkbox, GameClass, orderBy, theme, mix,
					max)
		}
		function Previous() {
			if (nowpage != "1") {
				nowpage--
			} else {
				return false;

			}

			sendSelect();

		}
		function Next() {
			if (nowpage != pageCount) {
				nowpage++
			} else {
				return false;
			}
			sendSelect();

		}
		function ajax(search, selectpage, checkbox, GameClass, orderBy, theme,
				mix, max) {
			$
					.ajax({
						type : "POST",
						url : "/FlipYouth/Game.controller",
						dataType : "json",
						data : {
							search : search,
							nowpage : nowpage,
							selectpage : selectpage,
							checkbox : checkbox,
							GameClass : GameClass,
							orderBy : orderBy,
							theme : theme,
							mix : mix,
							max : max

						},
						async : false,
						xhrFields : {
							withCredentials : false
						},

						success : function(res) {
							$('#page-count')
									.text(
											'有'
													+ res.total
													+ '項商品 目前顯示第'
													+ ((selectpage * nowpage) - (selectpage - 1))
													+ "項-第" + selectpage
													* nowpage + "項")
							console.log(res.total);
							console.log(res.page);
							pageCount = res.page;
							$('#forEach').empty();
							var a = "";
							$('#ul').empty();
							$('#ul')
									.append(
											'<li ><a href="javascript:void(0)" onclick="Previous()"><span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span></a></li>');
							for (var i = 1; i <= res.page; i++) {
								$('#ul')
										.append(
												'<li class="page-item"><a href="javascript:void(0)" onclick="setNow(this.text)">'
														+ i + '</a></li>')
							}
							$('#ul')
									.append(
											'<li><a href="javascript:void(0)" onclick="Next()"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>');
							$
									.each(
											res.data,
											function(key, data) {

												var a = '<div class="col-sm-6 col-md-4">';
												var b = '<div class="img-responsive">';
												var c = '<div class="box-product-outer"style="height: 400px; padding: 20px">';
												var d = '<div class="box-product">';
												var e = '<div class="img-wrapper">';
												var f = '<a href="<c:url value="/Shop.controller?ID='
														+ data.gameSN
														+ '"/>"><img class="img-rounded" style="height: 200px"src="<c:url value="/Tim'+data.bigImage+'"/>"></a></div>';
												var g = '<h6> <a style="" href="<c:url value="/Shop.controller?ID='
														+ data.gameSN
														+ '"/>">'
														+ data.gameName
														+ '</a> </h6>';
												var h = '<p style="height: 60px">'
														+ data.introduction
														+ '</p>'
												var i = '<div class="price"> <span class="btm-30px" style="position: absolute; bottom: 40px; margin: 0px auto;">NT\$'
														+ data.price
														+ '元</span> </div>'
												var j = '<div class="rating"><a href=""><img style="width:30px;float:right" src="<c:url value="/Tim/image/icon/look.png"/>"></a> <a href="javascript:void(0)"  onclick="car('
														+ data.gameSN
														+ ','
														+ data.price
														+ ')"><img style="width:30px;float:right" src="<c:url value="/Tim/image/icon/car.png"/>"></a> </div>'

												var div = "</div></div></div></div></div>"

												$('#forEach').append(
														a + b + c + d + e + f
																+ g + h + i + j
																+ div);
											})

						},
					})//end ajax

		}
	</script>
</body>
</html>