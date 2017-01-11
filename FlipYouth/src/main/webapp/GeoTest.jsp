<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <title>輸入地址批次轉換經緯度小工具</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script>
            
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
            		
        </script>
    </head>
    
    <body>
    	<p></p>
    
		<p>1. 請輸入地址，一行輸入一個地址</p>
		<p>
			<textarea rows="9" name="S1" cols="67" id="hiddenUserInputAddress">台北市信義區市府路1號</textarea>
		</p>
		<p>
			3. 點選 <input type="button" value="開始轉換" name="B1" onclick="trans();">
		</p>
		<p>4. 地址轉換經緯度結果如下 (格式：Latitude,Longitude)</p>
		<p>
			<textarea rows="9" name="S2" cols="67" id="target"></textarea>
		</p>
		<input type="text" id="targetlat"></input>
		<input type="text" id="targetlong"></input>
	</body>
</html>