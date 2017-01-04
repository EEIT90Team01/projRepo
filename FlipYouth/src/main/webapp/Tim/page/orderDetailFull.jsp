<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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
<link href='<c:url value="/Tim/css/datepicker.css"/>'rel='stylesheet' />

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.css" />


<style type="text/css">
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
</head>
<body>
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
