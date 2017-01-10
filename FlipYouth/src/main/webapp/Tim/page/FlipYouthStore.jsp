
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>翻桌商城</title>

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


<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">

<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/dataTable.css"/>">

<%-- <link rel="stylesheet" href="<c:url value="/Tim/css_Tim/relation.css"/>"> --%>


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
<link href="<c:url value="/Tim/css_Tim/one-page-wonder.css"/>"
	rel="stylesheet">

<link href="<c:url value="/Tim/css_Tim/FlipYouthStore.css"/>"
	rel="stylesheet">
	
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'> 
  
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
  
<%-- <link href="<c:url value="/Kelsey/css/nav-group.css"/>" rel="stylesheet"> --%>


<%-- <link href="<c:url value="/Kelsey/css/relation.css"/>" rel="stylesheet"> --%>
<link href="<c:url value="/Kelsey/css/index3.css"/>" rel="stylesheet">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">


<style type="text/css">

#ui-datepicker-div{
display: none
}

.hero {
	margin-top: 0px;
	min-height: 150px;
	width: 100%;
	height: 22%;
	background: #63D7D4;
	box-shadow: 4px 4px 12px -2px rgba(204, 204, 204, 0.97);
	display: table;
	position: relative;
}
.container {
    width: 1024px;
    max-width: 100%;
    margin: auto;
    display: block;
     text-align: left; 
}
</style>
<script type="text/javascript">
	
</script>
</head>

<body style="margin: 0;padding: 0;">

	<div id="loadingIMG" style="display: none; z-index: 9999;">
		<nobr id="nobrtext" style="font-size:30px;color:red">訂單處理中</nobr>
		<img src="<c:url value="/Tim/image/icon/gears.svg"/>">
	</div>

<div class="hero">
 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />

 			<c:if test="${loginOK != null }">
				<img class="header_right_img" src="data:image/jpg;base64,${user_photo}" >
				<div class="memberContentIndex">
						<blockquote class="blockquote_k">
<!-- 							<p>翻桌唷 -- 會員專區</p> -->
							<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
						</blockquote>
				</div>
				
			</c:if>
		<h1>
			商&nbsp;城&nbsp;系&nbsp;統&nbsp;&nbsp;<strong>Flip Youth</strong>
		</h1>
		
	</div>

<!-- ********	導入導覽列   **************************************-->
<%-- <jsp:include page="<c:url value="/nav.jsp"/>"></jsp:include> --%>
	<jsp:include page="/nav.jsp"></jsp:include>



	<div class="menuIcon" style="display: none"></div>

	<div id="shopTopRow" style="padding: 0; width: 100%;" class="row">
		<!-- 	TopRow -->
		<nav id="navbar" class="navbar navbar-default shadow-navbar"
			role="navigation" style="margin:0">
		<div class="container">
			<div class="navbar-header" style="width: 100%;">
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

						<li role="presentation"><a href="#three"
							aria-controls="three" role="tab" data-toggle="tab"
							onclick="toggleTabcheck(this)">填寫聯絡人資料</a></li>
						<li role="presentation"><a href="#four" aria-controls="four"
							role="tab" data-toggle="tab" onclick="toggleTabcheckOver(this)">確認訂單</a></li>
						<li role="presentation"><a href="#five" aria-controls="five"
							role="tab" data-toggle="tab" onclick="openOrderDetail()">訂單明細</a></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
	</div>

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


			<div class="col-xs-12" style="margin-bottom: 20px">
				<label class="checkbox-inline"> <input
					onchange="toggledatatable()" type="checkbox" data-toggle="toggle">
					切換為日曆
				</label>
			</div>

			<script type="text/javascript">
				
			</script>
			<div style="width: 90%" id="dataTableTab" class="b container">
				<!-- dataTable---------------------------------------- -->
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


			<div style="display: none" id="datatable2" class="b row">
				<!-- fullcalendar.io---------------------------------------- -->
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

		</div>
	</div>
	
	
<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>

<!-- ************javascript 開始 ************************************************************************-->
	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>

	<script type="text/javascript">
	<!-- changetabCode -->
		function parentTab(thiss) {
			var myid = $(thiss).attr('myid');
			$('#' + myid).empty();
			$('#navbar-ex1-collapse').children().children().removeClass(
					'active')
			var a = $(thiss).attr('aria-controls');
			$("a[aria-controls='" + a + "']").parent().addClass('active');
			if (a == 'three') {
	<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
	<%}%>
		$('#three').empty();
				$('#three')
						.append(
								'<iframe marginheight="0" frameborder="0" style="width: 100% ;" name="frame1" src="/FlipYouth/Tim/page/order/check.jsp"></iframe>');
			} else if (a == 'two') {
				$('#two').empty();
				$('#two')

						.append(
								'<iframe marginheight="0" frameborder="0" style="width: 100% ;" name="frame1" src="/FlipYouth/Tim/page/Shop/shoppingCar.jsp"></iframe>');

			} else if (a == 'four') {
				$('#four').empty();
				$('#four')
						.append(
								'<iframe marginheight="0" frameborder="0" style="width: 100% ;" name="frame1" src="/FlipYouth/Tim/page/order/orderOver2.jsp"></iframe>');

			}
			$('#' + a).show();
		}
		function toggleTabcheckOver(thiss) {
	<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
	<%}%>
		$('#four').empty();
			$('#four')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;" name="frame1" src="/FlipYouth/Tim/page/order/orderOver2.jsp"></iframe>');
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
			changeCar();
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
	<script type="text/javascript">
	<!-- datatable -->
		var dt;

		function openOrderDetail() {
	<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
			return false;
	<%}%>
		if (typeof dt === "undefined") {
				getorderdata();
			} else {
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
			display = "";
			val = checkState(d);
			var image = "open2('data:image/png;base64," + d.image + "');";
			return '<button class="btn btn-danger" onclick="'+image+'">開啟明細</button>'
					+ '<button id='
					+ d.orderSN
					+ display
					+ ' class="btn btn-info" style="margin-left:3%" onclick="delectOrder('
					+ d.orderSN + ')">' + val + '</button>';
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
					$('#' + orderSN).hide();
					dt.ajax.reload();
				},
			})//endAjax
		}//endfunction
		function open2(a) {
			window.open(a, '訂單明細', "height=1515,width=1000");
		}
		function getorderdata() {
			dt = $('#example').DataTable({
				language : {
					searchPlaceholder : "查詢",
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
				"sScrollX" : "70%",
				"sScrollY" : "360px",
				"bScrollCollapse" : true,
				"processing" : true,
				"serverSide" : true,
				"aoColumnDefs" : [ {
					"sWidth" : "10%",
					"aTargets" : [ -1 ]
				} ],
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
			$('#example tbody').on('click', 'tr td.details-control',
					function() {
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
		function toggledatatable() {
			$('.b').toggle();
			$('#calendar').fullCalendar('gotoDate', new Date());
			$('#calendar').fullCalendar('removeEvents');
			$('#calendar').fullCalendar('refetchEvents');
			$('five').height($('.fc-content-skeleton').height() + 100);
		}
		function scrolltoTop() {
			$(window).scrollTop(0);
		}
		$('*[data-toggle="tab"]').click(function() {
			scrolltoTop(0)
		});
	</script>

	<!-- 	import  js -->
	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
	<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
	<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script>
	<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
	<script
		src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src='<c:url value="/Tim/js_Tim/fuck/moment.min.js"/>'></script>
	<script src='<c:url value="/Tim/js_Tim/fuck/fullcalendar.min.js"/>'></script>
	<script src='<c:url value="/Tim/js_Tim/fuck/locale-all.js"/>'></script>
	<script src='<c:url value="/Tim/js_Tim/fuck/zh-tw.js"/>'></script>
	<script
		src='<c:url value="/Tim/js_Tim/jquery.ui.datepicker-zh-TW.js"/>'></script>


	<script type="text/javascript"
		src="<c:url value="/Tim/js_Tim/FlipYouthStore.js"/>"></script>
		<%@ include file="/chatRoomWithoutUI.jsp" %>
		
</body>
</html>