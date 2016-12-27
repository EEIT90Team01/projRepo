<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FlipYouth後台管理系統</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs/dt-1.10.13/cr-1.3.2/se-1.2.0/datatables.css" />


<style>
/* div{
	border:1px solid;
} */
body {
	min-height: 2000px;
	padding-top: 70px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">FlipYouth 後台管理系統</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav nav-tabs" role="tablist">

					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
					<c:forEach var="tab" items="${access}">
						<li role="presentation"><a id="${tab.accessName}"
							href="#tables" aria-controls="tables" role="tab"
							data-toggle="tab"><c:out value="${tab.accessString}" /></a></li>
					</c:forEach>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a
						href="<c:url value='/admin/secure/adminLogout.servlet'/>">Logout</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container tab-content">
		<!-- Main component for a primary marketing message or call to action -->
		<div role="tabpanel" class="tab-pane active" id="home">
			<div class="jumbotron">
				<h1>FlipYouth Content Management</h1>
				<h3>Hi! ${admin.admId}</h3>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="tables">
			<table id="dataTable" class="table table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>權限編號</th>
						<th>權限名稱</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>權限編號</th>
						<th>權限名稱</th>
					</tr>
				</tfoot>
			</table>
		</div>

	</div>
	<!-- js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs/dt-1.10.13/cr-1.3.2/se-1.2.0/datatables.js"></script>
	<script>
		var tabColumns = [];
		$(document).ready(function() {
			$('a').click(function(ev) {
				if ($.fn.dataTable.isDataTable('#dataTable')) {
					$('#dataTable').DataTable().destroy();
				}
				if (ev.id != '') {
					$.ajax({
						url : "columns.controller",
						data : {
							tableName : this.id
						},
						success : function(result) {
							var dtable = $('#dataTable').empty();
							var theadtr = $('<tr/>').appendTo($('<thead/>').appendTo(dtable));
							var tfoottr = $('<tr/>').appendTo($('<tfoot/>').appendTo(dtable));
							for ( var idx in result.colStrings) {
								jQuery('<th/>', {
									text : result.colStrings[idx]
								}).appendTo(theadtr);
								jQuery('<th/>', {
									text : result.colStrings[idx]
								}).appendTo(tfoottr);
							}
							tabColumns = result.cols;
							tableGo();
						}
					});
				}
			});
		});
		var tableGo = function() {
			$('#dataTable').DataTable({
				"processing" : true,
				"serverSide" : true,
				"ajax" : "datatables.controller",
				"columns" : tabColumns,
				"language" : {
					"zeroRecords" : "沒有符合資料",
					"emptyTable" : "表格為空",
					"info" : "顯示第 _START_ 筆至第 _END_ 筆資料，共 _TOTAL_ 筆",
					"infoEmpty" : "顯示第 0 筆至第 0 筆資料",
					"infoFiltered" : "(篩選前共有 _MAX_ 筆資料)",
					"thousands" : ",",
					"lengthMenu" : "一頁顯示 _MENU_ 筆資料",
					"loadingRecords" : "讀取中...",
					"processing" : "處理資料中...",
					"search" : "搜尋",
					"paginate" : {
						"first" : "第一頁",
						"last" : "最後一頁",
						"next" : "向後一頁",
						"previous" : "向前一頁"
					},
					"aria" : {
						"sortAscending" : ": 由小到大排序",
						"sortDescending" : ": 由大到小排序"
					}
				}
			});

		};
	</script>
</body>
</html>

