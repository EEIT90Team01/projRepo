<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Print Form Backing Bean</title>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</head>
<body style="background-color:#FFBD45;">

	<h3>Success ${eventGo}</h3><br/>
		userAddAddress to locSN= 	${eventGo.userAddAddress}<br/>
		startDateTime= 				${eventGo.startDateTime}<br/>
		endDateTime= 				${eventGo.endDateTime}<br/>
		closeDateTime= 				${eventGo.closeDateTime}<br/>
		userAddUpLimit= 			${eventGo.userAddUpLimit}<br/>
		userAddDownLimit= 			${eventGo.userAddDownLimit}<br/>
		
	<h3><button><a href="<c:url value='/events/eventing.controller'/>">進入1Eventing 揪團!!!</a></button></h3>
	
	
	
		<p>1. 請輸入地址，一行輸入一個地址</p>
		
		<p>
			<textarea rows="9" name="S1" cols="67" id="source">台北市信義區市府路1號</textarea>
		</p>

		<p>
			3. 點選 <input type="button" value="開始轉換" name="B1" onclick="trans();">
		</p>
		
		<p>4. 地址轉換經緯度結果如下 (格式：Latitude,Longitude)</p>
		
		<p>
			<textarea rows="9" name="S2" cols="67" id="target"></textarea>
		</p>
	
<!-- 	..
	<p> 輸入欲查詢的地址<input id="address" type="text" size="50" value="">   <input type="button" value="查經緯度並在地圖上顯示" onClick="codeAddress()"> </p>
-->
	<script type="text/javascript">
	
	function trans() {
        $("#target").val("");
        var content = $("#source").val();
    }
	
	function addressToLatLng(addr) {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({
            "address": addr
        }, function (results, status) {
			if ($("#c").attr('checked'))
			{
				addr = addr + "=";
			}
			else {
				addr = "";
			}
            if (status == google.maps.GeocoderStatus.OK) {
                var content = $("#target").val();
                $("#target").val(content + addr + results[0].geometry.location.lat() + "," + results[0].geometry.location.lng() + "\n");
            } else {
                var content = $("#target").val();
                $("#target").val(content + addr + "查無經緯度" + "\n");
            }
        });
    }




// 	<script type="text/javascript">
// 	  function codeAddress() {
// 		  	var geocoder= new google.maps.Geocoder();
// 		    var address = document.getElementById("address").value;
// 		    geocoder.geocode( { 'address': address}, function(results, status) {
// 		      if (status == google.maps.GeocoderStatus.OK) {
// 		        map.setCenter(results[0].geometry.location);

// 				document.getElementById("lat").value=results[0].geometry.location.lat();
// 				document.getElementById("lng").value=results[0].geometry.location.lng();
// 		        var marker = new google.maps.Marker({
// 		            map: map,
// 		            position: results[0].geometry.location
// 		        });

// 				showAddress(results[0], marker);
// 		      } else {
// 		        alert("失敗, 原因: " + status);
// 		      }
// 		    });
// 		  }
// 	  function showAddress(result, marker) {
// 	        var popupContent = result.formatted_address;
// 	        popup.setContent(popupContent);
// 	        popup.open(map, marker);
// 	  }
	</script>

	
</body>
</html>