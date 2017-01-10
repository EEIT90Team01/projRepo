<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/dataTable.css"/>">

<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->
<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->
<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->
<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->
<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->
<!-- 以上datatable  以上datatable  以上datatable  以上datatable  以上datatable  以上datatable -->

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

<!-- <link rel="stylesheet" href="../css/pikaday.css"> -->
<!-- <link rel="stylesheet" href="../css/site.css"> -->
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

<!-- 以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen-->
<!-- 以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen-->
<!-- 以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen-->
<!-- 以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen-->
<!-- 以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen以上fullcen-->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>



<style type="text/css">
tr, th, thead {
	border-style: solid;
	border-width: 1px;
}
</style>
</head>
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
</style>

<!-- datatable -->
<body>
<script type="text/javascript">
	var lang = {
		"decimal" : "",
		"emptyTable" : "No data available in table",
		"info" : "顯示 _START_ 到 _END_ 的 _TOTAL_ entries",
		"infoEmpty" : "Showing 0 to 0 of 0 entries",
		"infoFiltered" : "(filtered from _MAX_ total entries)",
		"infoPostFix" : "",
		"thousands" : ",",
		"lengthMenu" : "Show _MENU_ entries",
		"loadingRecords" : "Loading...",
		"processing" : "Processing...",
		"search" : "查詢:",
		"zeroRecords" : "No matching records found",
		"paginate" : {
			"first" : "First",
			"last" : "Last",
			"next" : "Next",
			"previous" : "Previous"
		},
		"aria" : {
			"sortAscending" : ": activate to sort column ascending",
			"sortDescending" : ": activate to sort column descending"
		}
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
				window.location.href = res;
			},
		})//endAjax

	}//endfunction
	function open2(a) {
		window.open(a, '訂單明細', "height=1515,width=1000");
	}

	$(document).ready(function() {
		var dt = $('#example').DataTable({
			language : {
				searchPlaceholder : "查詢",
				loadingRecords : "載入中",
				info : "找到  _TOTAL_ 比資料   目前顯示   _START_ 到 _END_  資料 ",
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
			// 	        "aoColumnDefs": [
			// 	            { "sWidth": "10%", "aTargets": [ 1 ] }
			// 	            ],
			columnDefs : [ {
				orderable : false,
				targets : -1
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

		$('#example tbody').on('click', 'tr td.details-control', function() {
			var tr = $(this).closest('tr');
			var row = dt.row(tr);
			var idx = $.inArray(tr.attr('id'), detailRows);

			if (row.child.isShown()) {
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
	});
</script>


<!-- fullcalendar.io -->
	<script>
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
							{
								editable : false,

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
	<label class="checkbox-inline">
  <input type="checkbox" data-toggle="toggle"> 圖示
</label>


<!-- datatable.io -->
<div class="container">
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

<!-- fullcalendar.io -->
<style type="text/css">
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
</style>
<!-- fullcalendar.io -->
<div class="row">
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
			<div id="calendar" style="z-index: 1; width: 872px; margin: 0 auto;"></div>
		</div>
	</div>
</div>

</body>
</html>