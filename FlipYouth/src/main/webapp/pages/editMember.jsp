<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Member</title>
<style type="text/css">
fieldset {
	margin: 15px;
	border: 5px solid #FFC8B4;
	border-radius: 10px;
	width: 400px;
	min-height: 350px;
	padding: 20px;
}

.st1 {
	border-bottom: 1.5px solid pink;
	margin: 10px;
	padding: 10px;
}

.st2 {
	margin: 20px;
	text-align: center;
}

.st3 {
	border-bottom: 1.5px solid pink;
	margin: 10px;
	padding: 10px;
	min-height: 150px;
}

.title {
	text-align: right;
	width: 80px;
	padding-right: 5px;
}

p {
	font-size: 0.5em;
	color: #beaeae;
}

</style>
</head>
<body>
	<form action="<c:url value='/editMember.controller'/>" method="post"
		enctype="multipart/form-data">
		<fieldset>

			<legend>修改個人資料</legend>
			<div class="st1">
				<label class="title">暱稱：</label> <input type="text" name="nickName"
					id="nickName" value="${loginOK.nickName}"  required /><span id="idspName"><span>${errors.nickName}</span>
			</div>
			<div class="st1">
				<label class="title">密碼：</label> <input type="text"
					name="mbrPassword" id="mbrPassword" placeholder="${loginOK.mbrPassword}" 
					required /><span id="idspPwd"><span>${errors.nickName}</span>
			</div>
			<div class="st1">
				<label class="title">地址：</label> <input type="text" name="address"
					id="address" value="${loginOK.address}"  required/>
			</div>
			<div class="st1">
				<label class="title">手機號碼：</label> <input type="text" name="phone"
					id="phone" value="${loginOK.phone}"  required /><span id="idspPhone"><span>${errors.nickName}</span>
			</div>
			<div class="st1">
				<label class="title">Email：</label> <input type="text"
					name="mbrEmail" id="mbrEmail" value="${loginOK.mbrEmail}" /><span
					id="idspMbrEmail" required ><span>${errors.nickName}</span>
			</div>
			<div class="st3">
				<label class="title">大頭貼：</label> <input type="file" name="image"
					id="member_photo" accept="image/jpeg,image/png" multiple accept="image/*"
					value=" ${loginOK.image}" /><br>
					<!-- 	*alt屬性   alt="your image" 為  照片沒有顯示出來時會出現的字 -->
			<img src="<c:url value='/images/basic_gray/picture.png'/>" id="imgPreview" >
			</div>
				
			</div>

			<div class="st2">
				<input onclick="edit()" type="submit" id="idsubmit" value="送出修改" />
				<input type="reset" id="idreset" value="清除" />
			</div>

		</fieldset>
	</form>
	<!-- 	表格輸入時, 想即時檢查資料庫有没有相同記錄時，不用多問大家都會選用 Ajax 。 -->
	<!-- 可以令你行 JavaScript 時不會因 loading 停頓，又不用重新整理頁面 ， 迅捷回應  -->
	<script type="text/javascript">
		//     window.onload = function () {
		//         document.getElementById("nickName").onblur = function(){document.getElementById("idspName").innerHTML = "<img src='../images/cancel.png' style='width:15px;height:15 px;margin:2px;'><span style='color:red;font-size:0.5em;'>不可為空白</span>"};
		//         document.getElementById("mbrPassword").onblur =  function(){document.getElementById("idspPwd").innerHTML = "<img src='../images/cancel.png' style='width:15px;height:15 px;margin:2px;'><span style='color:red;font-size:0.5em;'>不可為空白</span>"};
		//         document.getElementById("phone").onblur =  function(){document.getElementById("idspPhone").innerHTML = "<img src='../images/cancel.png' style='width:15px;height:15 px;margin:2px;'><span style='color:red;font-size:0.5em;'>不可為空白</span>"};
		//         document.getElementById("mbrEmail").onclick =  function(){document.getElementById("idspMbrEmail").innerHTML = "<img src='../images/cancel.png' style='width:15px;height:15 px;margin:2px;'><span style='color:red;font-size:0.5em;'>不可為空白</span>"};
		//     }



		$(function() {
			function readURL(input) {//readURL(input)中的input是抓程式中input的標籤
				if (input.files && input.files[0]) {
					//創建一個 FileReader()的參用
					var reader = new FileReader();
					//使用者想要改變的圖片被載入完成時,執行以下方法。fuvction(e)中的e 是指event物件
					reader.onload = function(e) {
						$('#imgPreview').attr('src', e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			//如果圖片被改變,則呼叫readURL方法
			$("#member_photo").change(function() {
				readURL(this);
			});
		});//end of ready

// 				function edit() {
// 					$.ajax({
// 						url : "/member.controller",
// 						type : "POST",
// 						data : {
// 							nickName : $('#nickName').val(),
// 							mbrPassword : $('#mbrPassword').val(),
// 							address : $('#address').val(),
// 							phone :$('#phone').val(),
// 							mbrEmail : $('#mbrEmail').val(),
// 							image : $('#image').val(),

// 						},
// 		// 				由於AJAX 預設都是 非同步模式 (Asynchronous) 所以必須把 Asynchronous 設為 false (就是同步 Synchronous) 
// 		// 				解釋就是等AJAX 有了返回值才會執行下面的 JS 
// 		// 				jquery的async:false,這個屬性默認是true：異步，false：同步
// 						async : false,
// 						success : function(res) {
// 							$('#span').html(res);
// 						},
// 					})
// 				}
	</script>
</body>
</html>