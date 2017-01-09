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
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script>

<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/dataTable.css"/>">



<!------------------------------------------- fullcalendar.io------------------------------------->
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/cupertino/fullcalendar.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/cupertino/jquery-ui.min.css"/>">
<link
	href='<c:url value="/Tim/css_Tim/cupertino/fullcalendar.min.css"/>'
	rel='stylesheet' />
<link
	href='<c:url value="/Tim/css_Tim/cupertino/fullcalendar.print.min.css"/>'
	rel='stylesheet' media='print' />

<link rel="stylesheet" href="../css/pikaday.css">
<link rel="stylesheet" href="../css/site.css">
<script src="../pikaday.js"></script>

<%-- <script src='<c:url value="/Tim/js_Tim/fuck/jquery.min.js"/>'></script> --%>
<script src='<c:url value="/Tim/js_Tim/fuck/moment.min.js"/>'></script>
<script src='<c:url value="/Tim/js_Tim/fuck/fullcalendar.min.js"/>'></script>
<script src='<c:url value="/Tim/js_Tim/fuck/locale-all.js"/>'></script>
<script src='<c:url value="/Tim/js_Tim/fuck/zh-tw.js"/>'></script>
<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script src='<c:url value="/Tim/js_Tim/jquery.ui.datepicker-zh-TW.js"/>'></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" -->
<!-- 	crossorigin="anonymous"> -->
<link href='<c:url value="/Tim/css/datepicker.css"/>' rel='stylesheet' />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.css" />
<!------------------------------------------- fullcalendar.io------------------------------------->
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="<c:url value="/Tim/css_Tim/one-page-wonder.css"/>"
	rel="stylesheet">


<style type="text/css">

/* .nav>li>a:focus, .nav>li>a:hover { */
/* 	text-decoration: none; */
/* 	background-color: #3f51b5; */
/* } */

/* a:hover { */
/* 	font-family: Microsoft JhengHei; */
/* 	color: #fdfcfc; */
/* 	font-size: 900; */
/* 	font-weight: 900; */
/* } */

/* .active { */
/* 	background-color: #3f51b5; */
/* 	font-family: Microsoft JhengHei; */
/* 	color: #ffffff; */
/* 	font-size: 900; */
/* 	font-weight: 900; */
/* 	font: #ffffff; */
/* } */
/* .active>a{ */

/* } */
.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.open>a,
	.navbar-header a:hover {
	background-image: -o-linear-gradient(top, #3f51b5 0, #3f51b5 100%);
	background-image: linear-gradient(to bottom, #3f51b5 0, #3f51b5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdbdbdb',
		endColorstr='#ffe2e2e2', GradientType=0);
}

.navbar-collapse.collapse {
	display: block !important;
	height: auto !important;
	padding-bottom: 0;
	overflow: visible !important;
}

.navbar-default { /*長條背景*/
	background-image: -webkit-linear-gradient(top, #FFFFFF 0, #FFFFFF 100%);
	background-image: -o-linear-gradient(top, #FFFFFF 0, #FFFFFF 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#f8f8f8));
	background-image: linear-gradient(to bottom, #FFFFFF 0, #FFFFFF 100%);
}
.middle-header {
border-color: #FFFFFF;
}
.navbar {
	position: relative;
	min-height: 0px;
	margin-bottom: 20px;
	border: 1px solid transparent;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	/* font-size: 14px; */
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}

.title {
	font-size: 18px;
	line-height: 1;
	margin: 0 0 10px;
	padding: 0;
	font-family: malgun gothic;
}

a {
	font-family: "malgun gothic", simhei;
}

.title3 {
	font-family: "malgun gothic", simhei;
}

#loadingIMG {
	position: absolute;
	height: 150px;
	width: 150px;
}

td.details-control {
	background: url('/FlipYouth/Tim/image/icon/open.png') no-repeat center
		center;
	cursor: pointer;
}

tr.details td.details-control {
	background: url('/FlipYouth/Tim/image/icon/close.png') no-repeat center
		center;
}
</style>

<style>
td.details-control {
	background: url('/FlipYouth/Tim/image/icon/open.png') no-repeat center
		center;
	cursor: pointer;
}

tr.details td.details-control {
	background: url('/FlipYouth/Tim/image/icon/close.png') no-repeat center
		center;
}

.fc-time {
	display: none;
}

.ui-datepicker-month, .ui-datepicker-year {
	color: black
}

#ui-datepicker-div {
	width: 216px
}

/* div { */
/* 	border: 1px solid; */
/* } */
.colortitle {
	margin: 10px;
	height: 34px;
	opacity: 0.85 !important;
	font-size: 24px;
	color: white;
	padding: 0 29px;
}

.fc-today {
	opacity: 0;
	border: none;
}

/* Styling for each event from Schedule */
.fc-time-grid-event.fc-v-event.fc-event {
	border-radius: 4px;
	border: none;
	padding: 5px;
	opacity: .65;
	left: 5% !important;
	right: 5% !important;
}

/* Bolds the name of the event and inherits the font size */
.fc-event {
	font-size: inherit !important;
	font-weight: bold !important;
}

/* Remove the header border from Schedule */
.fc td, .fc th {
	border-style: none !important;
	border-width: 1px !important;
	padding: 0 !important;
	vertical-align: top !important;
}

/* Inherits background for each event from Schedule. */
.fc-event .fc-bg {
	z-index: 1 !important;
	background: inherit !important;
	opacity: .25 !important;
}

/* Normal font weight for the time in each event */
.fc-time-grid-event .fc-time {
	font-weight: normal !important;
}

/* Apply same opacity to all day events */
.fc-ltr .fc-h-event.fc-not-end, .fc-rtl .fc-h-event.fc-not-start {
	opacity: .65 !important;
	margin-left: 12px !important;
	padding: 5px ! important;
}

/* Apply same opacity to all day events */
.fc-day-grid-event.fc-h-event.fc-event.fc-not-start.fc-end {
	opacity: .65 !important;
	margin-left: 12px !important;
	padding: 5px ! important;
}
html, #header {
    margin: 0 !important;
    padding: 0 !important;
}
</style>


<script type="text/javascript">
$(function () {
    move_div();
    $(window).resize(move_div);
    $(window).scroll(move_div);
});


function move_div() {
//  window_width =window.parent.outerWidth;
//  window_height = window.parent.outerHeight;
 window_width =$(window).width();
 window_height = $(window).height();
	obj_width = $('#loadingIMG').width();
 obj_height = $('#loadingIMG').height();
 $('#loadingIMG').css({
     'top': ((window_height / 2) - (obj_height / 2) + document.body.scrollTop),
     'left': (window_width / 2) - (obj_width / 2)
 });
}
</script>
</head>
<body style="margin: 0;padding: 0;">
<%@ include file="/chatRoomWithoutUI.jsp" %>
	<div id="loadingIMG" style="display: none; z-index: 9999;">
		<nobr id="nobrtext" style="font-size:30px;color:red">訂單處理中</nobr>
		<img src="<c:url value="/Tim/image/icon/gears.svg"/>">
	</div>
	<!-- 	<div id="dateIMG" style="display: none; z-index: 9999;"> -->
	<!-- 		<nobr style="font-size:30px;color:red">轉換資料中</nobr> -->
	<%-- 		<img src="<c:url value="/Tim/image/icon/gears.svg"/>"> --%>
	<!-- 	</div> -->
	<!-- ------------------------------- -->

	<div class="row">
		<div class="middle-header">
			<div class="container">
				<div class="row">
					<div class="col-md-3 logo">
						<img alt="Logo" style="height: 113px; width: 259px;"
							src="<c:url value="/Tim/image/login/shoplogo.png"/>"
							class="img-responsive">
					</div>
					<div class="col-sm-8 col-md-6 search-box m-t-2">
						<div class="input-group">
							<input href="#one" aria-controls="one"
								style="width: 98%; margin: 30px 50px;" role="tab"
								data-toggle="tab" onchange="toggleTab(this)" type="text"
								class="form-control" id="search" placeholder="查詢字串">
							<div style="z-index: 99999" class="input-group-btn">

								<button type="button" class="btn btn-default btn-search">
									<img
										style="margin: 0px; padding: 0px; width: 20px; height: 20px;"
										src="<c:url  value="/Tim/image/icon/seach.png"/>">
								</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- ------------------------------- -->
	</div>
	<nav class="navbar navbar-default shadow-navbar" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<div onclick="" class="collapse navbar-collapse"
				id="navbar-ex1-collapse">

				<ul class="nav navbar-nav">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab"
						onclick="toggleTab(this)">商城首頁</a></li>
					<li role="presentation" id="list"><a href="#one"
						class="title3" aria-controls="one" role="tab" data-toggle="tab"
						onclick="toggleTab(this)">商城列表</a></li>
					<li role="presentation"><a href="#two" aria-controls="two"
						role="tab" data-toggle="tab" onclick="toggleTabCar(this)">購物車</a></li>

					<li role="presentation"><a href="#three" aria-controls="three"
						role="tab" data-toggle="tab" onclick="toggleTabcheck(this)">填寫聯絡人資料</a></li>
					<li role="presentation"><a href="#four" aria-controls="four"
						role="tab" data-toggle="tab" onclick="toggleTabcheckOver(this)">確認訂單</a></li>
					<li role="presentation"><a href="#five" aria-controls="five"
						role="tab" data-toggle="tab" onclick="openOrderDetail()">訂單明細</a></li>


				</ul>
			</div>
		</div>
	</div>
	</nav>
	<script type="text/javascript">
	
	</script>
	<script type="text/javascript">
		function parentTab(thiss) {
			var myid = $(thiss).attr('myid');
			$('#' + myid).empty();
			$('#navbar-ex1-collapse').children().children().removeClass('active')
			var a = $(thiss).attr('aria-controls');
			$("a[aria-controls='"+a+"']").parent().addClass('active');
			if(a=='three'){
				<%if (session.getAttribute("loginOK") == null) {%>
				window.location.href = "/FlipYouth/Tim/login/login.jsp"
			<%}%>
				$('#three').empty();
				$('#three')
				.append(
						'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/check.jsp"></iframe>');
			}else if(a=='two'){
				$('#two').empty();
				$('#two')
				.append(
				'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/Shop/shoppingCar.jsp"></iframe>');
				
			}else if(a=='four'){
				$('#four').empty();
				$('#four')
						.append(
								'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/orderOver2.jsp"></iframe>');
					
			}
			$('#' + a).show();
		}
		
		
		
		
		function toggleTabcheckOver(thiss){
			<%if (session.getAttribute("loginOK") == null) {%>
			window.location.href = "/FlipYouth/Tim/login/login.jsp"
		<%}%>
			$('#four').empty();
			$('#four')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/orderOver2.jsp"></iframe>');
			$('.a').hide();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
		function toggleTab(thiss) {
			$('#list').siblings().removeClass('active');
			$('#list').addClass('active');
			sendSelect();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')

			$('#' + a).show();
		}
		function toggleTabCar(thiss) {
			$('#two').empty();
			$('#two').append('<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/Shop/shoppingCar.jsp"></iframe>');
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
		function toggleTabcheck(thiss) {
	<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
	<%}%>
		$('#three').empty();
			$('#three')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/check.jsp"></iframe>');
			$('.a').hide();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
	</script>
	<!-- Tab panes -->
	<div style="display: block" role="tabpanel" class="a tab-pane active"
			id="home">
			<jsp:include page="/Tim/page/Shop/shopHome.jsp"></jsp:include>
		</div>
	<div class="container">
	
	
		

		<div style="display: none" role="tabpanel" class="tab-pane a" id="one">
			<jsp:include page="/Tim/page/Shop/list.jsp"></jsp:include>
		</div>
		<div style="display: none" role="tabpanel" class="tab-pane a" id="two">
			<%-- 			<iframe style="width: 100% ;height: 900px" name="frame1" src="<c:url value="/Tim/page/Shop/shoppingCar.jsp"/>"></iframe> --%>

		</div>
		<div style="display: none" role="tabpanel" class="tab-pane a"
			id="three"></div>

		<div style="display: none" role="tabpanel" class="tab-pane a"
			id="four"></div>

		<div style="display: none" role="tabpanel" class="tab-pane a"
			id="five">

			<!-- dataTable---------------------------------------- -->
			<div class="col-xs-12" style="margin-bottom: 20px">
				<label class="checkbox-inline"> <input
					onchange="toggledatatable()" type="checkbox" data-toggle="toggle">
					切換為日曆
				</label>
			</div>

			<script type="text/javascript">
			function toggledatatable() {
				$('.b').toggle();
				$('#calendar').fullCalendar('gotoDate', new Date());
			}
			
			</script>
			<div id="dataTableTab" class="b container">
				<div class="row">
					<div class="col-xs-12">
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th></th>
									<th>訂單編號</th>
									<th>下訂日</th>
									<th>價格</th>
									<th>狀態</th>
									<th>連絡人</th>
									<!-- 				<th></th> -->
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>

			<!-- dataTable---------------------------------------- -->
			<!-- fullcalendar.io---------------------------------------- -->

			<div style="display: none" id="datatable2" class="b row">
				<div class="container-fluid">
					<div class="col-xs-2">
						<div>
							<div class="flow-element">
								<label for="datepicker">選擇日期</label> <input type="text"
									id="datepicker" placeholder="選擇時間">
							</div>
							<div class="flow-element">
								<label>顏色</label>
								<div class="colortitle" style="background-color: #337ab7">出貨中</div>
								<div class="colortitle"
									style="padding: 0 23px; font-size: 23px; background-color: green">已到門市</div>
								<div class="colortitle" style="background-color: red">已取消</div>
								<div class="colortitle" style="background-color: #B94FFF">已完成</div>
							</div>
						</div>
					</div>
					<div class="col-xs-10">
						<div id="calendar"
							style="z-index: 1; width: 872px; margin: 0 auto;"></div>
					</div>
				</div>
			</div>
			<!-- fullcalendar.io---------------------------------------- -->

		</div>
	</div>


	<script type="text/javascript">
		
	</script>





	<script type="text/javascript">
	var dt;
	
	function openOrderDetail() {
		<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
		return false;
		<%}%>
		
		if(typeof dt==="undefined"){
			getorderdata();
		}else{
			dt.ajax.reload();
		}
		$('.a').hide();
		$('#five').show()
	}
	
	function checkState(d) {
		if (d.orderState == "出貨中") {
			return "取消訂單";
		} else {
			display = " style='display:none'";
			return " ";
		}
	}
	var val;
	var display = "";
	function format(d) {
		display="";
		val = checkState(d);
		var image = "open2('data:image/png;base64," + d.image + "');";
		return '<button class="btn btn-danger" onclick="'+image+'">開啟明細</button>'
				+ '<button id='
				+ d.orderSN
				+ display
				+ ' class="btn btn-info" style="margin-left:3%" onclick="delectOrder('
				+ d.orderSN
				+ ')">' + val + '</button>';
	}

	function delectOrder(orderSN) {
		if (val == '無法取消') {
			alert('無法取消此訂單請聯絡管理員');
			return false;
		}
		$.ajax({
			url : "/FlipYouth/delectOrder.controller",
			type : "post",
			data : {
				orderSN : orderSN,
			},
			success : function(res) {
				
// 				window.location.href = res;
				$('#'+orderSN).hide();
				dt.ajax.reload();
			},
		})//endAjax

	}//endfunction
	function open2(a) {
		window.open(a, '訂單明細', "height=1515,width=1000");
	}

		function getorderdata(){
			dt = $('#example').DataTable({
			language : {
				searchPlaceholder :  "查詢",
				loadingRecords : "載入中",
				info : "找到  _TOTAL_ 筆資料   目前顯示   _START_ 到 _END_  資料 ",
				search : "收尋 :",
				lengthMenu : "顯示 _MENU_ 資料",
				"paginate" : {
					first : "第一頁",
					last : "最後一頁",
					next : "下一頁",
					previous : "上一頁"
				},
				processing : "處理中",
				loadingRecords : "載入中...",
			},
			"sScrollX": "70%",
	        "sScrollY": "360px",
	        "bScrollCollapse": true,
			"processing" : true,
			"serverSide" : true,
	        "aoColumnDefs": [
	            { "sWidth": "10%", "aTargets": [ -1 ] }
	            ],
			"autoWidth" : true,
			"ajax" : "/FlipYouth/DataTable.controller",
			"columns" : [ {
				"class" : "details-control",
				"orderable" : false,
				"data" : null,
				"defaultContent" : ""
			}, {
				"data" : "orderSN"
			}, {
				"data" : "orderDate"
			}, {
				"data" : "orderAmount"
			}, {
				"data" : "orderState"
			}, {
				"data" : "name"
			},
			// 				{"data" : ""}
			],
			"order" : [ [ 1, 'asc' ] ]
		});

		// Array to track the ids of the details displayed rows
		var detailRows = [];

		$('#example tbody').on('click', 'tr td.details-control', function() {
			var tr = $(this).closest('tr');
			var row = dt.row(tr);
			var idx = $.inArray(tr.attr('id'), detailRows);

			if (row.child.isShown()) {
				$('#nobrtext').text("訂單處理中");
				tr.removeClass('details');
				row.child.hide();

				// Remove from the 'open' array
				detailRows.splice(idx, 1);
			} else {
				tr.addClass('details');
				row.child(format(row.data())).show();

				// Add to the 'open' array
				if (idx === -1) {
					detailRows.push(tr.attr('id'));
				}
			}
		});

		dt.on('draw', function() {
			$.each(detailRows, function(i, id) {
				$('#' + id + ' td.details-control').trigger('click');
			});
		});
		}
			
			
</script>
	<script><!-- fullcalendar -->
		$(document).ready(
				function() {
					var date = new Date();
					var d = date.getDate();
					var m = date.getMonth();
					var y = date.getFullYear();
					$('#datepicker').datepicker({
						changeYear : true,
						changeMonth : true,

						inline : true,
						onSelect : function(dateText, inst) {
							var d = new Date(dateText);
							$('#calendar').fullCalendar('gotoDate', d);
 						}
					});

					$('#calendar').fullCalendar(
							{	editable : false,

								header : {
									left : 'myCustomButton,prev,next today',
									center : 'title',
									right : 'month,agendaWeek,agendaDay'
								},

								events : {
									url : "/FlipYouth/fullcalendar.controller",

									error : function() {
									}

								},
								eventClick : function(event, jsEvent, view) {
									window.open("data:image/png;base64,"
											+ event.image, '訂單明細',
											config = 'height=700,width=700')

								},
								loading : function(bool) {
									$('#nobrtext').text("處理中...");
									$('#loadingIMG').toggle();
								},

							});

				});
	</script>
</body>
</html>