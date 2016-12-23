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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<script
	src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

<style type="text/css">
tr, th, thead {
	border-style: solid;
	border-width: 1px;
}
</style>
</head>
<style>
td.details-control {
	background: url('/FlipYouth/image/icon/open.png') no-repeat center
		center;
	cursor: pointer;
}

tr.details td.details-control {
	background: url('/FlipYouth/image/icon/close.png') no-repeat center
		center;
}
</style>
<script type="text/javascript">
	function format(d) {
		var image = "open2('data:image/png;base64," + d.image + "');";
		return '<button class="btn btn-danger" onclick="'+image+'">開啟明細</button><br>'
				+ '<button class="btn btn-info" onclick="delectOrder('
				+ d.orderSN +d.mbrSN +')">取消訂單</button>';
	}
	function delectOrder(orderSN,mbrSN) {
		$.ajax({
			url : ,
			type : "post",
			data : {
				orderSN : orderSN,
				mbrSN:mbrSN
			},
			success : function(res) {
				alert('removeOK');
			},
		})//endAjax

	}//endfunction
	function open2(a) {
		window.open(a, '訂單明細', "height=1515,width=1000");
	}

	$(document).ready(function() {
		var dt = $('#example').DataTable({
			"processing" : true,
			"serverSide" : true,
			"autoWidth" : true,
			"ajax" : "../DataTable.controller",
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

<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th></th>
						<th>訂單編號</th>
						<th>下訂日期</th>
						<th>訂單金額</th>
						<th>訂單狀態</th>
						<th>連絡人</th>
						<!-- 				<th></th> -->
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>




</body>
</html>