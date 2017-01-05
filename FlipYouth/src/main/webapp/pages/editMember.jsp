<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<!--  最新編譯和最佳化的Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!--  選擇性佈景主題 Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">


<link rel="stylesheet" href="<c:url value='/Kelsey/css/relation.css'/>">
<%-- <link href="<c:url value="/Kelsey/css/index3.css"/>" rel="stylesheet"> --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Member</title>
<style type="text/css">
.st1 {
	border-bottom: 1.5px solid pink;
	margin: 10px;
	padding: 10px;
}

fieldset {
	border: 5px solid #FFC8B4;
	border-radius: 10px;
	width: 400px;
	min-height: 350px;
	padding: 20px;
	margin:0 auto;
}

.st2 {
	margin-top: 0px;
	text-align: center;
}

.title {
	
	width: 80px;
	padding-right: 5px;
}

.legend_k{
	width: auto;
	border-bottom: none;
}
.st3{
	text-align: center;
}
.img_k{
	
	margin-right: 10px;
}
#member_photo{
	width: 170px;
	margin: 10px auto;
}
</style>
</head>
<body>
<%@ page import="model.MemberBean"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
//將存在資料庫的二進位檔轉成base64並輸出在網頁上
WebApplicationContext context = (WebApplicationContext) WebApplicationContextUtils.getWebApplicationContext(application);
MemberBean user = (MemberBean)session.getAttribute("loginOK");
String user_photo = null;
if(user != null){
	user_photo = Base64.getEncoder().encodeToString(user.getImage());
}
session.setAttribute("user_photo", user_photo);
%>

												
						<div class="hero">
								 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
									<h1>
											會&nbsp員&nbsp資&nbsp料&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
						
	<!-- ***************	導覽列   開始  ******************************-->
<!-- 	<a href="#menu" id="toggle"><span></span></a> -->

<!--   <div id="menu"> -->
<!--     <ul> -->
<!--       <li><a href="#home">Home</a></li> -->
<!--       <li><a href="#about">About</a></li> -->
<!--       <li><a href="#contact">Contact</a></li> -->
<!--     </ul> -->
<!--   </div> -->
<!-- </div> -->
	
<!-- <a href="#menu" id="toggle"><span></span></a> -->
<!-- 	<div id='menu' class="list-group-k"> -->
	<div id='nav-group' class="list-group-k">
		<nav>
		<ul>
			<li ><a href="login.jsp#login-modal"
				data-toggle="modal" data-target="login.jsp#login-modal">Login</a></li>
			<li ><a
				href="<c:url value='/pages/memberIndex.jsp'/>" >
					<img src="<c:url value='/Kelsey/images/basic_gray/settings.png'/>" class="navimg">&nbsp&nbsp會員中心&nbsp
					
			</a></li>

			<li ><a href="<c:url value='/Shop.controller'/>"> <img
					src="<c:url value='/Kelsey/images/basic_gray/shopping-cart.png'/>" class="navimg">&nbsp&nbsp翻桌唷&nbsp商城&nbsp
			</a></li>

			<li ><a href="" > <img
					src="<c:url value='/Kelsey/images/basic_gray/megaphone.png'/>" class="navimg">&nbsp&nbsp我的揪團&nbsp
			</a></li>

			<li ><a
				href="<c:url value='/searchRelation.controller' />"> <img
					src="<c:url value='/Kelsey/images/basic_gray/stick-man.png'/>" class="navimg">&nbsp&nbsp我的好友&nbsp
			</a></li>

			<li ><a href="" > <img
					src="<c:url value='/Kelsey/images/basic_gray/time.png'/>" class="navimg">&nbsp&nbsp我的月曆&nbsp
			</a></li>
		</ul>
		</nav>

	</div>
    
						

	<form action="<c:url value='/editMember.controller'/>" method="post"
		enctype="multipart/form-data">
		<fieldset>

			<legend>修改個人資料</legend>
			<div class="st1">
				<label class="title">暱稱：</label> <input type="text" name="nickName"
					id="nickName" value="${loginOK.nickName}"  required /><span id="idspName"><span>${errors.nickName}</span>
			</div>
			<div class="st1">
				<label class="title">密碼：</label> <input type="password"
					name="mbrPassword" id="mbrPassword" required /><span id="idspPwd"><span>${errors.nickName}</span>
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
			<label class="title">大頭貼</label><br>
			<img src="data:image/jpg;base64,${loginOK.image}" id="imgPreview" class="img-thumbnail img_k" width=150	height=auto>
				 <input type="file" name="image"
					id="member_photo" accept="image/jpeg,image/png"
					value=" ${loginOK.image}" /><br>
					<!-- 	*alt屬性   alt="your image" 為  照片沒有顯示出來時會出現的字 -->
			
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
	
<!-- ************javascript 開始 ************************************************************************-->

<!-- Bootstrap-jquery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>


<!-- 最新編譯和最佳化的 Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
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