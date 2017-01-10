<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 加favicon -->
<link rel="icon" type="image/png" href="<c:url value="/favicon.ico"/>">
<script type="text/javascript"src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css_Samuel/bootstrap.min.css">
<link rel="stylesheet" href="css_Samuel/jasny-bootstrap.css">
<script type="text/javascript" src="css_Samuel/jasny-bootstrap.min.js"></script>
<style>
#top-image {
	background: url('/FlipYouth/Samuel/css/chatbox/images/feedback-img.jpg')-25px -50px;
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 0;
	height: 100%;
	background-size: calc(100% + 50px);
}
</style>




</head>
<body>
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-4"></div> -->
<!-- 			<div class="col-md-4"> -->
<%-- 				<form action=" <c:url value="/information.controller"/>" --%>
<!-- 					method="POST" enctype="multipart/form-data"> -->

<!-- 					<div class="fileinput fileinput-new" data-provides="fileinput"> -->
<!-- 						<div class="fileinput-preview thumbnail" data-trigger="fileinput" -->
<!-- 							style="width: 200px; height: 150px;"></div> -->
<!-- 						<div> -->
<!-- 							<span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span> -->
<!-- 							<span class="fileinput-exists">Change</span><input type="file" id="image" name="image"></span>  -->
<!-- 							<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="form-group"> -->
<!-- 						<label for="name">姓名:</label> <input type="text" -->
<%-- 							class="form-control" name="name" id="name" value="${param.name}" /> --%>
<%-- 						<span id="nameSP"></span>${errors.name} --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="id">性別:</label> -->
<!-- 						<div class="radio" id="gender"> -->
<!-- 							<label><input type="radio" name="gender" value="1" -->
<!-- 								CHECKED>男</label> <label><input type="radio" -->
<!-- 								name="gender" value="0">女</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="phone">行動電話:</label> <input type="text" -->
<!-- 							class="form-control" name="phone" id="phone" -->
<%-- 							value="${param.phone}" /> <span id="phoneSP"></span>${errors.phone} --%>
<!-- 					</div> -->

<!-- 					<div class="form-group"> -->
<!-- 						<label for="">地址:</label> <input type="text" class="form-control" -->
<%-- 							name="address" id="address" value="${param.address}" /> <span --%>
<%-- 							id="addrSP"></span>${errors.address} --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> --> 
<!--  						<label for="">個人大頭照:</label> <input type="file" --> 
<!--  							class="form-control" name="image" id="image" /> <span id="imgSP"></span> --> 
<!--  					</div> --> 


<!-- 					<input type="hidden" name="action" value="confirm"> -->
<!-- 					<button type="submit" id="submit" class="btn btn-default">確認</button> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-4"></div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<div id="top-image" class="container">
		<div class="col-md-4 "></div>
		<div class="col-md-4 " style="margin-top:100px;" >
			<form class="well form-horizontal" style="background-color: rgba(72, 72, 72, 0.4);border:0px;"
				action="<c:url value="/information.controller"/>" method="POST" enctype="multipart/form-data">
				
				<fieldset style="padding-top: 25px;">
					<div class="col-md-3"></div>
					<div class="fileinput fileinput-new" data-provides="fileinput"> 
						<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
						<div style="text-align:center;" >
							<span style="margin:0 auto" class="btn btn-default btn-file"><span class="fileinput-new">Select image</span>
							<span class="fileinput-exists">Change</span><input style="margin:0 auto" type="file" id="image" name="image"></span> 
							<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
						</div>
					</div>
					


					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">姓名：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
								<input name="name" id="name" placeholder="ex:傑尼龜" class="form-control" type="text">
							</div>
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">性別：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="radio" id="gender"> 
							<label><input type="radio" name="gender" value="1"
								CHECKED>男</label> <label><input type="radio"
								name="gender" value="0">女</label>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">行動電話：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span> 
								<input name="phone" id="phone" placeholder="ex:09xxxxxxxx" class="form-control" type="text">
							</div>						
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-8 control-label"></label>
						<div class="col-md-1"  ></div>
						<button type="submit" class="btn btn-success">確認 
						<span class="glyphicon glyphicon-send"></span>
						</button>
						<input type="hidden" name="action" value="confirm">
					</div>
				</fieldset>
			</form>
		</div>
	</div>







</body>
</html>