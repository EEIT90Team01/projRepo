<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>FlipYouth 後台管理系統登入</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
html, body {
	height: 100%;
}

.site-wrapper {
	display: table;
	width: 100%;
	height: 100%; /* For at least Firefox */
	min-height: 100%;
}

.site-wrapper-inner {
	display: table-cell;
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h3 class="text-center">Content Management System Login</h3>
						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								<form class="form-horizontal" role="form"
									action="<c:url value="/admin/secure/adminLogin.controller" />"
									method="post">
									<div class="form-group">
										<label for="inputid" class="col-sm-2 control-label">
											ID </label>
										<div class="col-sm-10">
											<input type="text" name="admId" value="${param.admId}"
												class="form-control" id="inputid" required autofocus> <span class="text-danger">${errors.admId}</span>
										</div>
									</div>
									<div class="form-group">

										<label for="inputPassword" class="col-sm-2 control-label">
											Password </label>
										<div class="col-sm-10">
											<input type="password" name="admPassword"
												class="form-control" id="inputPassword" required> <span class="text-danger">${errors.admPassword}</span>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-warning btn-block">Login</button>
										</div>
									</div>
								</form>
							</div>
							<div class="col-md-4"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>