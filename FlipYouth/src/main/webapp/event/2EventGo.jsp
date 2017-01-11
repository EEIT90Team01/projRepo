<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>揪團去</title>



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

<!-- Latest compiled and minified JavaScript -->

<!-- //////////日期時間Plugin//////////// -->
	<link rel="stylesheet" type="text/css" href="../build/jquery.datetimepicker.min.css" />
	<script src="../build/jquery.js"></script>
	

<!-- 	Web fonts -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css">
	
<link rel="stylesheet" href="<c:url value='/Kelsey/css/relation.css'/>">
<link href="<c:url value="/Kelsey/css/nav_motion.css"/>" rel="stylesheet">

	
	
<style>
body {
	font-family: 'cwTeXYen';
	font-size: 16px;
	font: bold;
	text-align: left;
}
</style>

<!--
<style type="text/css">
div{
border: 1px solid;
}
</style>
-->

</head>
<div class="hero">
						
		<c:if test="${loginOK != null }">
			<img class="header_right_img" src="data:image/jpg;base64,${user_photo}" >
			<div class="memberContentIndexPage">
					<blockquote class="blockquote_k">
			<!-- 			<p>翻桌唷 -- 會員專區</p> -->
						<span class="memberContentIndex_usr_name">使用者：${loginOK.nickName}</span><br>
						</blockquote>
			</div>
							
		</c:if>
						
		 <img class="header_left_img" src="<c:url value="/Kelsey/images/light_green/logo_06-02.png"/>" />
			<h1>
			揪&nbsp團&nbsp去&nbsp&nbsp<strong>Flip Youth</strong>
			</h1>
		</div>
		<!-- ********	導入導覽列   **************************************-->
	<jsp:include page="/nav.jsp"></jsp:include>	
<%@ include file="/chatRoom.jsp"%>
<body>

<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="carousel slide" id="carousel-429587">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0"
							data-target="#carousel-429587"></li>
						<li data-slide-to="1" data-target="#carousel-429587"></li>
						<li data-slide-to="2" data-target="#carousel-429587"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item active">
							<img alt="Carousel Bootstrap First" src='<c:url value="/image/Carousel1.jpg" />' />
							<div class="carousel-caption">
								<h4>創建你的揪團</h4>
								<p>根據你的喜好，創建一個獨一無二的揪團!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Second" src='<c:url value="/image/Carousel2.jpg" />' />
							<div class="carousel-caption">
								<h4>加入揪團</h4>
								<p>加入任何你所看到的團，瘋狂桌遊吧!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Third" src='<c:url value="/image/Carousel3.jpg" />' />
							<div class="carousel-caption">
								<h4>隨選隨戰</h4>
								<p>馬上加入，就缺你一個了!!</p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-429587"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel-429587"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="container" style="text-align:center">
				<h2>揪團去</h2>
			</div>
		</div>
		
<form action="<c:url value="/events/eventgo.controller" />" >
	<input id="mbrSN" type="hidden" name="mbrSN" value="${mbrSN}" />
		<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-hover">
				
				<tbody>
					<tr>
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td class="col-md-1">
							揪團地址:
						</td>
						<td class="col-md-8">
							<div class="form-group">
							<select id="selectedMap" name="userAddAddress" onchange="selectedMapAddr()" class="form-control">
								<option value="elseMap" >其他(自行輸入)</option>
								<option value="1" ${param.userAddAddress == '1' ? 'selected' : ''}>仁愛路四段345巷4弄24號</option>
								<option value="2" ${param.userAddAddress == '2' ? 'selected' : ''}>101</option>
								<option value="3" ${param.userAddAddress == '3' ? 'selected' : ''}>資策會台北訓練中心</option>
								<option value="4" ${param.userAddAddress == '4' ? 'selected' : ''}>大安捷運站</option>
								<option value="5" ${param.userAddAddress == '5' ? 'selected' : ''}>總統府</option>
<!-- 								//自設地點出錯後回補// -->
								<c:if test="${param.userAddAddress=='null'}">
									<option value="null" selected>${param.userInputAddress}</option>
								</c:if>
<!-- 								//自設地點出錯後回補// -->
							</select>
							</div>
							<div id="userInputAddrShow">
									<div class="form-group">
										<input type=text class="form-control" name="userInputAddr" placeholder="請輸入地址">
									</div>
									<button onclick="addrSubmit()" type="button" class="btn btn-default">確定地址</button>
									<span style="color:red">
										${errors.userAddAddress}
									</span>
							</div>
							<input id="hiddenUserInputAddress" type="hidden" name="userInputAddress"  />
							<input id="targetlat" type="hidden" name="locLat"  />
							<input id="targetlng" type="hidden" name="locLong"  />							
						</td>
						<td id="ggmap" class="col-md-2">
						<iframe id="ggmapDefault" width="200" height="200" frameborder="0" style="border:0"
								src="https://www.google.com/maps/embed/v1/search?q=106台灣台北市大安區復興南路一段390號&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>	
						</td>
					</tr>
					<tr class="active">
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td>
							開始時日:
						</td>
						<td>
							<input id="date_timepicker_start" name="startDateTime" value="${param.startDateTime}" class="col-md-12 form-control" type="text" placeholder="請選擇時日" onchange="selectedStartT()"/>
							<div class="form-group" style="color:red">
								${errors.startDateTime}
							</div>
						</td>
						<td>
							<div id="checkable" class="col-md-2">
<!--         							<img src="image/check.png" style="width:25px; height:25px;"> -->
    						</div>
						</td>
					</tr>
					<tr class="info">
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td class="col-md-1">
							結束時日:
						</td>
						<td class="col-md-8">
							<input id="date_timepicker_end" name="endDateTime" value="${param.endDateTime}" class="col-md-12 form-control" type="text" placeholder="請選擇時日" onchange="selectedEndT()"/>
							<div class="form-group" style="color:red">
								${errors.endDateTime}
							</div>
						</td>
						<td class="col-md-2">
							<div id="checkableEnd" class="col-md-2">
<!--         							<img src="image/wrong.png" style="width:25px; height:25px;"> -->
    						</div>
						</td>
					</tr>
					<tr class="danger">
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td class="col-md-1">
							截止揪團日:
						</td>
						<td class="col-md-8">
							<input id="date_timepicker_close" name="closeDateTime" value="${param.closeDateTime}" class="col-md-12 form-control" type="text" placeholder="請選擇時日" onchange="selectedCloseT()"/>
							<div class="form-group" style="color:red">
								${errors.closeDateTime}
							</div>
						</td>
						<td class="col-md-2">
							<div id="checkableClose" class="col-md-2">
<!-- 							(確定圖示 錯誤圖示) -->
							</div>
						</td>
					</tr>
					<tr class="success">
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td>
							人數上限:
						</td>
						<td class="col-md-8">
							<div class="form-group">
							<select id="selectedUpLim" onchange="selectedUpLimit()" class="form-control" name="userAddUpLimit" >
								<option value="elseUpLim">其他上限人數:</option>
								<option value="9999" ${param.userAddUpLimit == '9999' ? 'selected' : ''}>無上限</option>
								<option value="2" ${param.userAddUpLimit == '2' ? 'selected' : ''}>2</option>
								<option value="4" ${param.userAddUpLimit == '4' ? 'selected' : ''}>4</option>
								<option value="8" ${param.userAddUpLimit == '8' ? 'selected' : ''}>8</option>
								<option value="16" ${param.userAddUpLimit == '16' ? 'selected' : ''}>16</option>
								<option value="32" ${param.userAddUpLimit == '32' ? 'selected' : ''}>32</option>
							</select>
							</div>
							<div id="userUpLim">
									<div class="form-group">
										<input type=text class="form-control" name="userInputUpLimm" placeholder="請輸入上限人數">
									</div>
									<button onclick="userUpLimSubmit()" type="button" class="btn btn-default">確定上限人數</button>
									<span style="color:red">
										${errors.userAddUpLimit}
									</span>
							</div>
						</td>
						<td>
							<div id="checkUpLimNum" class="col-md-2">
<!-- 							(確定圖示 錯誤圖示) -->
							</div>
						</td>
					</tr>
					<tr class="warning">
						<td style="color:red" class="col-md-1">
							(*必填)
						</td>
						<td>
							人數下限:
						</td>
						<td class="col-md-8">
							<div class="form-group">
							<select id="selectedDownLim" onchange="selectedDownLimit()" class="form-control" name="userAddDownLimit" >
								<option value="elseDownLim">其他下限人數:</option>
								<option value="0" ${param.userAddDownLimit == '0' ? 'selected' : ''}>無下限</option>
								<option value="2" ${param.userAddDownLimit == '2' ? 'selected' : ''}>2</option>
								<option value="4" ${param.userAddDownLimit == '4' ? 'selected' : ''}>4</option>
								<option value="8" ${param.userAddDownLimit == '8' ? 'selected' : ''}>8</option>
								<option value="16" ${param.userAddDownLimit == '16' ? 'selected' : ''}>16</option>
								<option value="32" ${param.userAddDownLimit == '32' ? 'selected' : ''}>32</option>
							</select>
							</div>
							<div id="userDownLim">
									<div class="form-group">
										<input type=text class="form-control" name="userInputDownLimm" placeholder="請輸入下限人數">
									</div>
									<button onclick="userDownLimSubmit()" type="button" class="btn btn-default">確定下限人數</button>
									<span style="color:red">
										${errors.userAddDownLimit}
									</span>
							</div>
						</td>
						<td>
							<div id="checkDownLimNum" class="col-md-2">
<!-- 							(確定圖示 錯誤圖示) -->
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
		
<!-- //////buttons////// -->
		<div class="row">
		<div class="col-md-6">	 
			<button type="submit" class="btn btn-primary btn-block">
				送出並揪團
			</button>
		</div>
		
		<div class="col-md-6">
			<button type="button" class="btn btn-block btn-primary" onclick="window.history.back()">
				返回上一頁
			</button>
		</div>
		
<!-- 		<div class="col-md-4"> -->
<!-- 			<button type="button" class="btn btn-block btn-primary" onclick="clearForm()"> -->
<!-- 				清除 -->
<!-- 			</button> -->
<!-- 		</div> -->
		
		</div>
<!-- //////buttons////// -->
</form>

		<br />
</div>
	<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- javascript功能 -->
<script src="<c:url value="/Kelsey/js/easing/EasePack.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/plugins/CSSPlugin.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/TweenMax.min.js"/>"></script>
	<script src="<c:url value="/Kelsey/js/nav_motion.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	<script src="../build/jquery.datetimepicker.full.min.js"></script>
	
<script type="text/javascript">

/////自訂人數上限/////
function selectedUpLimit() {
			if($('#selectedUpLim option:selected').val()=="elseUpLim"){
				$('#userUpLim').empty();
				$('#userUpLim').append('<form><div class="form-group"><input type=text class="form-control" name="userInputUpLimm" placeholder="請輸入上限人數"></div><button onclick="userUpLimSubmit()" type="button" class="btn btn-default">確定上限人數</button></form>');
			} else{
				$('#userUpLim').empty();
				var selectMap=$('#selectedUpLim option:selected').text();
				$('#selectedUpLim').attr("value","elseUpLim");
				$('#selectedUpLim option[value=userAddTempUpLim]').remove();
			}
	////////比較人數上限////////
			if(jQuery("#selectedUpLim option:selected").val()!="elseUpLim"){
				$('#checkUpLimNum').empty();
				$('#checkUpLimNum').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
			}else{
				$('#checkUpLimNum').empty();
			}
	////////比較人數上限////////
}
function userUpLimSubmit(){
			$('#selectedUpLim option[value=userAddTempUpLim]').remove();
			var userInputUpLimm=$('input[name="userInputUpLimm"]').val();
			$('#selectedUpLim option:selected').text(userInputUpLimm);
			$('#selectedUpLim option:selected').val('userAddTempUpLim');
			$('#selectedUpLim').append($('<option></option>').val('elseUpLim').text('其他上限人數:'));
	////////比較人數上限////////
			if(jQuery("#selectedUpLim option:selected").val()!="elseUpLim"){
				$('#checkUpLimNum').empty();
				$('#checkUpLimNum').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
			}else{
				$('#checkUpLimNum').empty();
			}
	////////比較人數上限////////
			$('#userUpLim').empty();
}
/////自訂人數上限/////
/////自訂人數下限/////
function selectedDownLimit() {
			if($('#selectedDownLim option:selected').val()=="elseDownLim"){
				$('#userDownLim').empty();
				$('#userDownLim').append('<form><div class="form-group"><input type=text class="form-control" name="userInputDownLimm" placeholder="請輸入下限人數"></div><button onclick="userDownLimSubmit()" type="button" class="btn btn-default">確定下限人數</button></form>');
			} else{
				$('#userDownLim').empty();
				var selectMap=$('#selectedDownLim option:selected').text();
				$('#selectedDownLim').attr("value","elseDownLim");
				$('#selectedDownLim option[value=userAddTempDownLim]').remove();
			}
	////////比較人數下限////////
			if(jQuery("#selectedDownLim option:selected").text()=="無下限"||parseInt(jQuery("#selectedDownLim option:selected").text()).valueOf()<=parseInt(jQuery("#selectedUpLim option:selected").text()).valueOf()){
				$('#checkDownLimNum').empty();
				$('#checkDownLimNum').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
			}else if(parseInt(jQuery("#selectedDownLim option:selected").text()).valueOf()>parseInt(jQuery("#selectedUpLim option:selected").text()).valueOf()){
				$('#checkDownLimNum').empty();
				$('#checkDownLimNum').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
			}else{
				$('#checkDownLimNum').empty();
			}
	////////比較人數下限////////
}
function userDownLimSubmit(){
			$('#selectedDownLim option[value=userAddTempDownLim]').remove();
			var userInputDownLimm=$('input[name="userInputDownLimm"]').val();
			$('#selectedDownLim option:selected').text(userInputDownLimm);
			$('#selectedDownLim option:selected').val('userAddTempDownLim');
			$('#selectedDownLim').append($('<option></option>').val('elseDownLim').text('其他下限人數:'));
	////////比較人數下限////////
			if(jQuery("#selectedDownLim option:selected").text()=="無下限"||parseInt(jQuery("#selectedDownLim option:selected").text()).valueOf()<=parseInt(jQuery("#selectedUpLim option:selected").text()).valueOf()){
				$('#checkDownLimNum').empty();
				$('#checkDownLimNum').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
			}else if(parseInt(jQuery("#selectedDownLim option:selected").text()).valueOf()>parseInt(jQuery("#selectedUpLim option:selected").text()).valueOf()){
				$('#checkDownLimNum').empty();
				$('#checkDownLimNum').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
			}else{
				$('#checkDownLimNum').empty();
			}
	////////比較人數下限////////
			$('#userDownLim').empty();
}
/////自訂人數下限/////
//////選地址顯示在MAP上////////
		function selectedMapAddr() {
			if($('#selectedMap option:selected').val()=="elseMap"){
				$('#userInputAddrShow').empty();
				$('#userInputAddrShow').append('<form><div class="form-group"><input type=text class="form-control" name="userInputAddr" placeholder="請輸入地址"></div><button onclick="addrSubmit()" type="button" class="btn btn-default">確定地址</button></form>');
			} else{		
				$('#ggmap').empty();
				$('#userInputAddrShow').empty();
				var selectMap=$('#selectedMap option:selected').text();
				$('#ggmap').append('<iframe width="200" height="200" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/search?q='+selectMap+'&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>');
				$('#selectedMap').attr("value","elseMap");
				$('#selectedMap option[value=null]').remove();
			}
			////
			var $theHiddenInput = $('#hiddenUserInputAddress'); //指到一個input hidden物件
 			var a = $('#selectedMap option:selected').text();//.text之前是物件 後面變值
			$theHiddenInput.val(a);//塞回物件 建立value=a
			////
			addressToLatLng($('#hiddenUserInputAddress').val());
		}
//////選地址顯示在MAP上////////
/////////自定位址顯示在MAP上///////////
		function addrSubmit(){
			$('#ggmap').empty();
			var selectMapInputAddr=$('input[name="userInputAddr"]').val();//暫存的輸入值
			////
			var $theHiddenInput = $('#hiddenUserInputAddress');
// 			var a = $('#selectedMap option:selected').text();
			$theHiddenInput.val(selectMapInputAddr);
			////
			$('#selectedMap option[value=null]').remove();
			$('#ggmap').append('<iframe width="200" height="200" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/search?q='+selectMapInputAddr+'&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>');
			$('#selectedMap option:selected').text(selectMapInputAddr);
			$('#selectedMap option:selected').val('null');
			$('#selectedMap').append($('<option></option>').val('elseMap').text('其他(自行輸入)'));
			$('#userInputAddrShow').empty();
			addressToLatLng($('#hiddenUserInputAddress').val());
		}
/////////自定位址顯示在MAP上///////////
//////////抓經緯度/////////////////
	var addr;
	function addressToLatLng(addr) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode(
            		{"address": addr},
            		function (results, status) {
            			if (status == google.maps.GeocoderStatus.OK) {
            				$("#targetlat").val(results[0].geometry.location.lat());
            				$("#targetlng").val(results[0].geometry.location.lng());
            		}else{
            			$("#targetlat").val("查無經緯度");
        				$("#targetlng").val("查無經緯度");
            		}
            		});
     }
//////////抓經緯度/////////////////
//////////日期時間Plugin datetimepicker////////////
	jQuery(function(){
 		jQuery('#date_timepicker_start').datetimepicker({
  			format:'Y-m-d H:i',
  			onShow:function( ct ){
   				this.setOptions({
					minDate:0,
    				maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
   				})
  			},
  			timepicker:true
 		});
 		jQuery('#date_timepicker_end').datetimepicker({
  			format:'Y-m-d H:i',
  			onShow:function( ct ){
   				this.setOptions({
	// 	minTime:'jQuery("#date_timepicker_start").val().split(" ").pop()',
					maxDate:jQuery('#date_timepicker_start').val(),
    				minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
  				 })
  			},
  			timepicker:true
 		});
 		jQuery('#date_timepicker_close').datetimepicker({
	  		format:'Y-m-d H:i',
	  		onShow:function( ct ){
	   			this.setOptions({
					minDate:0,
	    			maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
	   			})
	  		},
	  		timepicker:true
	 	});
	});
	//console.log($('#datetimepicker').datetimepicker('getValue'));
//////////日期時間Plugin////////////
/////顯示時間正確圖示//////
	function selectedStartT(){
		if(jQuery("#date_timepicker_start").val()!=""){
			$('#checkable').empty();
			$('#checkable').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
		}else{
			$('#checkable').empty();
		}
	}
/////顯示時間正確圖示//////
/////比較結束時間/////
function selectedEndT(){
var starttime = jQuery("#date_timepicker_start").val(); //設定開始時間格式 yyyy/mm/dd 00:00:00 中間記得要空格
var endtime = jQuery('#date_timepicker_end').val(); //設定結束時間格式 
if(Date.parse(starttime).valueOf() > Date.parse(endtime).valueOf()||Date.parse(starttime).valueOf() == Date.parse(endtime).valueOf()){
	$('#checkable').empty();
	$('#checkableEnd').empty();
	$('#checkable').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
	$('#checkableEnd').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
}else if(Date.parse(starttime).valueOf() < Date.parse(endtime).valueOf()){
	$('#checkable').empty();
	$('#checkableEnd').empty();
	$('#checkable').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
	$('#checkableEnd').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
}
}
/////比較結束時間/////
/////比較截止時間/////
function selectedCloseT(){
var closetime = jQuery("#date_timepicker_close").val(); //設定開始時間格式 yyyy/mm/dd 00:00:00 中間記得要空格
var endtime = jQuery('#date_timepicker_end').val(); //設定結束時間格式 
if(Date.parse(closetime).valueOf() > Date.parse(endtime).valueOf()){
	$('#checkableClose').empty();
// 	$('#checkableEnd').empty();
// 	$('#checkable').empty();
	$('#checkableClose').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
// 	$('#checkableEnd').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
// 	$('#checkable').append("<img src='<c:url value='/image/wrong.png' />' style='width:25px; height:25px;'>");
}else if(Date.parse(closetime).valueOf() < Date.parse(endtime).valueOf()||Date.parse(closetime).valueOf() == Date.parse(endtime).valueOf()){
	$('#checkableClose').empty();
// 	$('#checkableEnd').empty();
// 	$('#checkable').empty();
	$('#checkableClose').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
// 	$('#checkableEnd').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
// 	$('#checkable').append("<img src='<c:url value='/image/check.png' />' style='width:25px; height:25px;'>");
}
}
/////比較截止時間/////
/////清除表單/////
// function clearForm() {
// 	var inputs = document.getElementsByTagName("input");
// 	for(var i=0; i<inputs.length; i++) {
// 		if(inputs[i].type=="text") {
// 			inputs[i].value="";
// 		}
// 	}
// }
/////清除表單/////

</script>
<!-- javascript功能 -->
<!--****** 	導入footer  *****************************-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>