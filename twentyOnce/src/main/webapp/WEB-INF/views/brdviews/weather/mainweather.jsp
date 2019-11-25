<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="../../resources/css/brd_css/weather.css">
<link type="text/css" rel="stylesheet"
	href="../../resources/css/brd_css/weather2.css">
<style type="text/css">
.blind {
	overflow: scroll;
/* 	visibility: hidden; */
}
</style>
</head>
<body>

	<div class="container" style="text-align: center; ">${weather_info}</div>

	<script type="text/javascript">
		$(document).ready(function() {
			alert("날씨 로딩");
			drawTable();
		});
		function drawTable() {
			
		}
	</script>

</body>
</html>