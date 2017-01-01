<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/producHome.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/bootstrap-select.css"/>">
<link rel="stylesheet"
	href="<c:url value="/Tim/css_Tim/nouislider.css"/>">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script>

<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<style type="text/css">
/* .nav>li>a:focus, .nav>li>a:hover { */
/* 	text-decoration: none; */
/* 	background-color: #3f51b5; */
/* } */

/* a:hover { */
/* 	font-family: Microsoft JhengHei; */
/* 	color: #fdfcfc; */
/* 	font-size: 900; */
/* 	font-weight: 900; */
/* } */

/* .active { */
/* 	background-color: #3f51b5; */
/* 	font-family: Microsoft JhengHei; */
/* 	color: #ffffff; */
/* 	font-size: 900; */
/* 	font-weight: 900; */
/* 	font: #ffffff; */
/* } */
/* .active>a{ */

/* } */
.navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.open>a,
	.navbar-header a:hover {
	background-image: -o-linear-gradient(top, #3f51b5 0, #3f51b5 100%);
	background-image: linear-gradient(to bottom, #3f51b5 0, #3f51b5 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffdbdbdb',
		endColorstr='#ffe2e2e2', GradientType=0);
}

.navbar-collapse.collapse {
	display: block !important;
	height: auto !important;
	padding-bottom: 0;
	overflow: visible !important;
}

.navbar-default { /*長條背景*/
	background-image: -webkit-linear-gradient(top, #F3f3f3 0, #F3f3f3 100%);
	background-image: -o-linear-gradient(top, #F3f3f3 0, #F3f3f3 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, from(#fff),
		to(#f8f8f8));
	background-image: linear-gradient(to bottom, #F3f3f3 0, #F3f3f3 100%);
}

.navbar {
	position: relative;
	min-height: 0px;
	margin-bottom: 20px;
	border: 1px solid transparent;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	/* font-size: 14px; */
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}
</style>
</head>
<body>
  <!-- ------------------------------- -->
	
	<div class="row">
		<div class="middle-header">
      <div class="container">
        <div class="row">
          <div class="col-md-3 logo">
            <img alt="Logo" style="height: 113px;
    width: 259px;" src="<c:url value="/Tim/image/login/shoplogo.png"/>" class="img-responsive">
          </div>
          <div class="col-sm-8 col-md-6 search-box m-t-2">
            <div class="input-group">
             <input href="#one" aria-controls="one"  style="margin: 30px 50px;"
						role="tab" data-toggle="tab" onchange="toggleTab(this)"  type="text" class="form-control" id="search" placeholder="查詢字串"> <div class="input-group-btn">
                
                <button type="button" class="btn btn-default btn-search"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </div>
         
        </div>
      </div>
    </div>
    <!-- ------------------------------- -->
	</div>
	<nav class="navbar navbar-default shadow-navbar" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<div class="collapse navbar-collapse" id="navbar-ex1-collapse">

				<ul class="nav navbar-nav">
					<li role="presentation" class="active"><a href="#home"
						aria-controls="home" role="tab" data-toggle="tab"
						onclick="toggleTab(this)">商城首頁</a></li>
					<li role="presentation" id="list"><a href="#one" aria-controls="one" 
						role="tab" data-toggle="tab" onclick="toggleTab(this)">商城列表</a></li>
					<li role="presentation"><a href="#two" aria-controls="two"
						role="tab" data-toggle="tab" onclick="toggleTabCar(this)">購物車</a></li>
					<li role="presentation"><a href="#three" aria-controls="three"
						role="tab" data-toggle="tab" onclick="toggleTabcheck(this)">填寫聯絡人資料</a></li>
					<li role="presentation"><a href="#four" aria-controls="four"
						role="tab" data-toggle="tab" onclick="toggleTabcheckOver(this)">確認訂單</a></li>
					<li role="presentation">
				</ul>
			</div>
		</div>
	</div>
	</nav>
	<!-- 	<div class="container"> -->

	<!--            -->
	<!--             <ul class="nav navbar-nav"> -->
	<!--               <li><a href="index.html">商城首頁</a></li> -->
	<!--               <li class="active"><a href="products.html">商品列表</a></li> -->
	<!--               <li><a href="cart.html">購物車</a></li> -->
	<!--               <li><a href="checkout.html">確認訂單</a></li> -->
	<!--              </ul> -->
	<!--           </div> -->
	<!--        -->






	<script type="text/javascript">
		function toggleTabcheckOver(thiss){
			<%if (session.getAttribute("loginOK") == null) {%>
			window.location.href = "/FlipYouth/Tim/login/login.jsp"
		<%}%>
			$('#four').empty();
			$('#four')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/orderOver2.jsp"></iframe>');
			$('.a').hide();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
		function toggleTab(thiss) {
			$('#list').siblings().removeClass('active');
			$('#list').addClass('active');
			sendSelect();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')

			$('#' + a).show();
		}
		function toggleTabCar(thiss) {
			$('#two').empty();
			$('#two')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/Shop/shoppingCar.jsp"></iframe>');
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
		function toggleTabcheck(thiss) {
	<%if (session.getAttribute("loginOK") == null) {%>
		window.location.href = "/FlipYouth/Tim/login/login.jsp"
	<%}%>
		$('#three').empty();
			$('#three')
					.append(
							'<iframe marginheight="0" frameborder="0" style="width: 100% ;height: 900px" name="frame1" src="/FlipYouth/Tim/page/order/check.jsp"></iframe>');
			$('.a').hide();
			$('.a').hide();
			var a = $(thiss).attr('aria-controls')
			$('#' + a).show();
		}
	</script>
	<!-- Tab panes -->
	<div class="container">
		<div style="display: none" role="tabpanel" class="a tab-pane active"
			id="home">
			<jsp:include page="/Tim/page/Shop/shopHome.jsp"></jsp:include>
		</div>

		<div style="display: none" role="tabpanel" class="tab-pane a" id="one">
			<jsp:include page="/Tim/page/Shop/list.jsp"></jsp:include>
		</div>
		<div style="display: none" role="tabpanel" class="tab-pane a" id="two">
			<%-- 			<iframe style="width: 100% ;height: 900px" name="frame1" src="<c:url value="/Tim/page/Shop/shoppingCar.jsp"/>"></iframe> --%>
			<%-- 			<jsp:include page="/Tim/page/Shop/shoppingCar.jsp"></jsp:include> --%>
		</div>
		<div style="display: none" role="tabpanel" class="tab-pane a"
			id="three"></div>

		<div style="display: none" role="tabpanel" class="tab-pane a"
			id="four"></div>
	</div>


	<script type="text/javascript">
		
	</script>




	<!-- 		<div id="list" style="display: none"></div> -->
	<!-- 		<!-- 		<div id="orderOver" style="display: none"> -->
	<%-- 		<%-- 			<jsp:include page="/Tim/page/order/orderOver.jsp"></jsp:include> --%>
	<!-- 		<!-- 		</div> -->
	<!-- 		<div id="shoppingCar" style="display: none"> -->
	<%-- 			<jsp:include page="/Tim/page/Shop/shoppingCar.jsp"></jsp:include> --%>
	<!-- 		</div> -->
	<!-- 		<div id="shopHome" style="display: none"></div> -->

	<%-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script src="<c:url value="/Tim/js_Tim/bootstrap-select.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/nouislider.js"/>"></script>
<script src="<c:url value="/Tim/js_Tim/range.js"/>"></script> --%>
</body>
</html>