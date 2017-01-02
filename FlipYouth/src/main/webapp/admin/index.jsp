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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/jszip-2.5.0/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-html5-1.2.4/cr-1.3.2/fh-3.1.2/se-1.2.0/datatables.css"/>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/admin/css/admin.css"/>' />
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
				<a class="navbar-brand"  style="cursor:default">FlipYouth 後台管理系統</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a id="hometab"
						href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
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
					</tr>
				</thead>
				<tfoot>
					<tr>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>

	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="deleteModalTitle">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="deleteModalTitle">刪除資料</h4>
				</div>
				<div class="modal-body text-center">
					<label>請輸入備註<input type="text" class="form-control" id="belInput">
					<h3 class="text-danger"></h3></label>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
					<button type="button" class="btn btn-primary delete-confirm">刪了！</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of deleteModal -->
	<div class="modal fade" id="cuModal" tabindex="-1" role="dialog"
		aria-labelledby="cuModalTitle">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="cuModalTitle">增修資料</h4>
				</div>
				<div class="modal-body">
					<form action="/FlipYouth/admin/cu.controller" method="POST" enctype="text/plain">
						
						<!-- <div class="form-group">
							<label for="exampleInputFile">File input</label> <input
								type="file" id="exampleInputFile">
							<p class="help-block">Example block-level help text here.</p>
						</div> -->
						
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of cuModal -->


	<!-- js -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs/jszip-2.5.0/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-html5-1.2.4/cr-1.3.2/fh-3.1.2/se-1.2.0/datatables.js"></script>
	<script src="https://oss.maxcdn.com/jquery.form/3.50/jquery.form.min.js"></script>
	<script src='<c:url value="/admin/js/admin.js"/>'></script>
</body>
</html>