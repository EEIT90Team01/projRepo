<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css_Samuel/bootstrap.min.css">
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
	<div id="top-image" class="container">
		<div class="col-md-4 "></div>
		<div class="col-md-4 " style="margin-top:100px;" >
			<form class="well form-horizontal"
				style="background-color: rgba(72, 72, 72, 0.4);border:0px;"
				action="<c:url value="/memberInsert.controller"/>" method="POST"
				enctype="multipart/form-data">
				<fieldset style="padding-top: 25px;">

					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">暱稱：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
								<input name="nickname" id="nickname" placeholder="ex:煞氣阿普" class="form-control" type="text">
							</div>
							<span id="nameSP"></span>${errors.nickname}
						</div>
					</div>

					<!-- Text input-->

					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">帳號：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-cog"></i></span> 
								<input name="id" id="id" placeholder="帳號" class="form-control" type="text">
							</div>
							<span id="idSP"></span>${errors.id}
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">密碼：</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
								<input name="password" id="password" placeholder="密碼" class="form-control" type="password">
							</div>
							<span id="pswSP"></span>${errors.password}
						</div>
					</div>


					<!-- Text input-->

					<div class="form-group">
						<label style="color:white;" class="col-md-2 control-label">E-Mail</label>
						<div class="col-md-9 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-envelope"></i></span> 
									<input id="email" name="email" placeholder="ooxx@gmail.com" class="form-control" type="text">
							</div>
							<span id="emailSP"></span>${errors.email}
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-8 control-label"></label>
						<div class="col-md-1"  ></div>
						<input type="hidden" name="action" value="insert1">
						<button type="submit" class="btn btn-success">
							確認 <span class="glyphicon glyphicon-send"></span>
						</button>

					</div>
				</fieldset>
			</form>
		</div>
	</div>



<script>

	$('#nickname').blur(check);
	$('#id').blur(check);
	$('#password').blur(check);
	$('#email').blur(check);
	
// 	function submitOnclick(){
// 		if()
// 	}
	
	 function check(){
		 console.log("進入check");
		var event = this.id;
		if( $(this).val() == "" ){
			if(event == "nickname"){$('#nameSP').html("<img src= Samuel/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "id"){$('#idSP').html("<img src= Samuel/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "password"){$('#pswSP').html("<img src= Samuel/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "email"){$('#emailSP').html("<img src= Samuel/error.png /><span style = 'color:red'>必要輸入</span>")}
		}else{
			if(event == "password"){$('#pswSP').html("")}
			if(event == "nickname"){
				$('#nameSP').html("");
					$.ajax({
						type:'GET',
						url:'/FlipYouth/check.controller',
						data:{nickname:$('#nickname').val().trim()},
						datatype:'text',
						contentType: "text/plain; charset=UTF-8",
						success:function(data){
							if(data == "success"){
								$('#nameSP').html("<span style = 'color:green'>"+data+"</span>");	
							}else{
								$('#nameSP').html("<span style = 'color:red'>"+data+"</span>");
							}
							
						}
					}) 
				}
			if(event == "id"){
				$('#idSP').html("");
					$.ajax({
						type:'GET',
						url:'/FlipYouth/check.controller',
						data:{id:$('#id').val().trim()},
						datatype:'text',
						success:function(data){
							if(data == "success"){
								$('#idSP').html("<span style = 'color:green'>"+data+"</span>");
							}else{
								$('#idSP').html("<span style = 'color:red'>"+data+"</span>");
							}
						}
					}) 
				}
			if(event == "email"){
				$('#email').html("");
				$.ajax({
					type:'GET',
					url:'/FlipYouth/check.controller',
					data:{email:$('#email').val().trim()},
					datatype:'text',
					success:function(data){
						if(data == "success"){
							$('#emailSP').html("<span style = 'color:white'>"+data+"</span>");
						}else{
							$('#emailSP').html("<span style = 'color:red,text-shadow: white 0px 0px 0px 4px;'>"+data+"</span>");
						}
					}
				})
			}
			
		}
	}
	
</script>
</body>
</html>
