<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-widt	h, initial-scale=1">

<title>評比此團</title>

<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

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
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
 integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
 crossorigin="anonymous"></script>
 
 <!-- 	Web fonts -->
<link rel="stylesheet" type="text/css"
          href="http://fonts.googleapis.com/earlyaccess/cwtexyen.css">
<style>
      body{
        font-family: 'cwTeXYen';
        font-size: 22px;
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
<body style="background-color:#FFBD45;">
<div class="container-fluid">
	
<!-- /////跑馬燈///// -->
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
							<img alt="Carousel Bootstrap First"
								src='<c:url value="/image/Carousel1.jpg" />' />
							<div class="carousel-caption">
								<h4>創建你的揪團</h4>
								<p>根據你的喜好，創建一個獨一無二的揪團!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Second"
								src='<c:url value="/image/Carousel2.jpg" />' />
							<div class="carousel-caption">
								<h4>加入揪團</h4>
								<p>加入任何你所看到的團，瘋狂桌遊吧!!</p>
							</div>
						</div>
						<div class="item">
							<img alt="Carousel Bootstrap Third"
								src='<c:url value="/image/Carousel3.jpg" />' />
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
<!-- /////////////// -->

	<div class="col-md-12">
		<h1 style="text-align: center">
			&nbsp;評比此團&nbsp;
		</h1>
	</div>

<!-- /////////////// -->

<!-- /////TABLE///// -->
<table class="table">
	<tbody>
	
	<tr class="active">
		<td>
			揪團流水號:
		</td>
		<td class="col-md-6">
			#
		</td>
		<td class="col-md-4" rowspan="3">
			<div>
				<span>地點: 北市松山區XX路XX號(店名)</span>
			</div>
			<div>
				<span>日期:&nbsp;</span>
				<span>2016/12/25</span>
				<span>&nbsp;&nbsp;</span>
				<span>時間:&nbsp;</span>
				<span>10:25</span>
				<span>&nbsp;~&nbsp;</span>
				<span>22:00</span>
			</div>
			<div>
			<iframe width="450" height="380" frameborder="0" style="border:0"
								src="https://www.google.com/maps/embed/v1/search?q=台灣台北市大安區仁愛路四段345巷4弄24號&key=AIzaSyCGJ1ulbWXOsbaH2_m77VzpX-CKiC0ZRmw" allowfullscreen></iframe>	
			</div>
		</td>
	</tr>
	
	<tr class="info">
		<td>
			房主:
		</td>
		<td>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;房主資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>輕功水上漂</span>
		</td>		
	</tr>
	
	<tr class="success">
		<td>
			成員:
		</td>
		<td>
			<p>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;會員資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>水上輕飄飄</span>
			</p>
			<p>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;會員資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>顆顆邊緣人</span>
			</p>
			<p>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;會員資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>樹林烤雞腿</span>
			</p>
			<p>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;會員資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>滿滿大平台</span>
			</p>
			<p>
			<div style="float:right">
				<button type="button" class="btn btn-primary btn-block">
					&gt;&gt;&gt;會員資料&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-danger btn-block">
					&gt;&gt;&gt;封鎖&lt;&lt;&lt;
				</button>
			</div>
			<div style="float:right;margin-right: 10px">
				<button type="button" class="btn btn-warning btn-block">
					&gt;&gt;&gt;檢舉&lt;&lt;&lt;
				</button>
			</div>
			<img width="50" height="50" alt="Bootstrap Image Preview" 
							src="http://lorempixel.com/140/140/" class="img-circle" />
			<span>雷蒂嘎嘎嘎</span>
			</p>
		</td>
	</tr>
	</tbody>
</table>
<!-- /////////////// -->

<!-- /////bottom//// -->
			<div class="col-md-4">
			
			</div>
			<div class="col-md-4">
				<button type="button" class="btn btn-block btn-primary" style="font-size:22px">
					返回
				</button>
			</div>
			<div class="col-md-4">
			
			</div>
<!-- ////////// -->

</div>
<br />
</body>
</html>