<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css_Samuel/bootstrap.min.css">


</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form onsubmit="return  submitOnclick()" action="<c:url value="/memberInsert.controller"/>" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="nickname">暱稱:</label>
					<input type="text" class="form-control" name="nickname" id="nickname" value="${param.nickname}" />
					<span id="nameSP"></span>${errors.nickname}
				</div>
				<div class="form-group">
					<label for="id">帳號:</label>                                                                             
					<input type="text" class="form-control"  name="id" id="id" value="${param.id}"/>
					<span id="idSP"></span>${errors.id}
				</div>
				<div class="form-group">
					<label for="">密碼:</label>
					<input type="password" class="form-control"  name="password" id="password" value="${param.password}"/>
					<span id="pswSP"></span>${errors.password}
				</div>
				<div class="form-group">
						<label for="email">電子信箱:</label>
						<input type="text" class="form-control"  name="email" id="email" value="${param.email}"/>
						<span id="emailSP"></span>${errors.email}
				</div>
				
				<input type="hidden" name="action"value="insert1">
				<button type="submit" id="submit" class="btn btn-default" >確認</button>
			</form>
		</div>
		<div class="col-md-4">
		</div>
	</div>
</div>
<script>

	$('#nickname').blur(check);
	$('#id').blur(check);
	$('#password').blur(check);
// 	$('#email').blur(check);
	
// 	function submitOnclick(){
// 		if()
// 	}
	
	 function check(){
		var event = this.id;
		if( $(this).val() == "" ){
			if(event == "nickname"){$('#nameSP').html("<img src= image/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "id"){$('#idSP').html("<img src= image/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "password"){$('#pswSP').html("<img src= image/error.png /><span style = 'color:red'>必要輸入</span>")}
			if(event == "email"){$('#emailSP').html("<img src= image/error.png /><span style = 'color:red'>必要輸入</span>")}
		}else{
			if(event == "password"){$('#pswSP').html("")}
			if(event == "nickname"){
				$('#nameSP').html("");
					$.ajax({
						type:'GET',
						url:'/FlipYouthSamuel/check.controller',
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
						url:'/FlipYouthSamuel/check.controller',
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
					url:'/FlipYouthSamuel/check.controller',
					data:{email:$('#email').val().trim()},
					datatype:'text',
					success:function(data){
						if(data == "success"){
							$('#emailSP').html("<span style = 'color:green'>"+data+"</span>");
						}else{
							$('#emailSP').html("<span style = 'color:red'>"+data+"</span>");
						}
					}
				})
			}
			
		}
	}
	
</script>
</body>
</html>