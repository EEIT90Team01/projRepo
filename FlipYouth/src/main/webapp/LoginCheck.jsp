<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><html> --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
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
<!-- <link rel="stylesheet" type="text/css" href="css/Tim.css"> -->
<!-- Latest compiled and minified JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
$('.login').click(function(event) {
// 	event.stopPropagation();
	event.preventDefault();
	var link_name = $(this).attr('name');
	$.ajax({
		  type: 'POST',
		  url: this.href,
		  data:{url:this.name},
		  success : function(res) {
			  <%if (session.getAttribute("loginOK") != null) {%>
				window.location=link_name;
				<%} else {%>
				event.stopPropagation();
				$(res).appendTo('#body');
				<%}%>
		  },
		  async:false,
	});
	
	
// 	$.post(this.href, function(html){
	<%-- 		<%if (session.getAttribute("loginOK") != null) {%> --%>
//	 		window.location="checkOut.jsp";
	<%-- 		<%} else {%> --%>
//	 		$(html).appendTo('#body');
	<%-- 		<%}%> --%>
//	 	})
	
	
})
</script>
</body>
</html>