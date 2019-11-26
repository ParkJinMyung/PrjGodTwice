<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<link type="text/css" rel="stylesheet"
	href="resources/css/home_css/entranceView.css">
<script type="text/javascript">
	//Just for restart animation on resize or click.
	document.onclick = window.onresize = function() {
		var elm = document.querySelector("#black");
		var newone = elm.cloneNode(true);
		elm.parentNode.replaceChild(newone, elm);
	}

	function loginProcess() {
		alert("로그인 창으로 넘어갑니다.");
		
		window.location.href = "/twentyOnce/memviews/loginform";
	}
</script>

</head>
<body>
	<div id="black"></div>
	<div id="text" onclick="javascript:loginProcess()">
		LOVE<br><span style="color: #000;">& TWICE<span></div>
</body>
</html>
