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
<link rel="stylesheet" href="<c:url value='/Kelsey/css/member.css'/>">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">

<!--*********** 下排按鈕x2個link  ********************************-->
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="<c:url value='/Kelsey/css/button.css' />" > 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Member</title>

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
						
						<c:if test="${loginOK != null }">
							<img class="header_right_img" src="data:image/jpg;base64,${user_photo}" >
							<div class="memberContentIndexPage">
									<blockquote class="blockquote_k">
		<!-- 							<p>翻桌唷 -- 會員專區</p> -->
										<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
									</blockquote>
							</div>
							
						</c:if>
								 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
									<h1>
											修&nbsp改&nbsp會&nbsp員&nbsp資&nbsp料&nbsp&nbsp<strong>Flip Youth</strong>
									</h1>
						</div>
						
						
<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>
    
						

	<form action="<c:url value='/editMember.controller'/>" method="post"
		enctype="multipart/form-data">
		<fieldset>

			<legend class= "legend_k">修改個人資料</legend>
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
			<img src="data:image/jpg;base64,${user_photo}" id="imgPreview" class="img-thumbnail img_k" width=150	height=auto>
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
	
	    
	    
    <!-- ********* container 結束 *******************************-->
	
<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>
	
<!-- ************javascript 開始 ************************************************************************-->

 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

 <script src="<c:url value='/Kelsey/js/button.js'/>"></script>

<!-- Bootstrap-jquery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>


<!-- 最新編譯和最佳化的 Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
<!-- <script src="/Kelsey/js/easing/EasePack.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/plugins/CSSPlugin.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/TweenMax.min.js"></script> -->
<!-- 	<script src="/Kelsey/js/nav_motion.js"></script> -->
	<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>
	
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