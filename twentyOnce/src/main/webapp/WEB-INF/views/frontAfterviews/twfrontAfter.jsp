<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

<script src="resources/jquery/jquery-3.4.1.min.js"></script>
<script src="resources/jquery/s3Slider.js"></script>
</head>
<style>

body {
	margin: 0px;
	padding: 0px;
	background: #000;
	font-family: 'Raleway', sans-serif;
	font-size: 11pt;
	color: #000000;
}

h1, h2, h3 {
	margin: 0px;
	padding: 0px;
}

h2 {
	padding: 0px 0px 20px 0px;
	letter-spacing: -1px;
	font-size: 1.8em;
	text-align: center;
}

p, ol, ul {
	margin-top: 0px;
	line-height: 160%;
}

p {
	margin-bottom: 2em;
	line-height: 160%;
	text-align: center;
}

strong {
	font-weight: 700;
}

a {
	color: #A2A2A2;
}

a:hover {
	text-decoration: none;
}

/* Images */
.image {
	display: inline-block;
}

.image img {
	display: block;
	width: 100%;
}

.image.featured {
	display: block;
	width: 100%;
	margin: 0 0 2em 0;
}

.image.full {
	display: block;
	width: 100%;
	margin-bottom: 2em;
}

.image.left {
	float: left;
	margin: 0 2em 2em 0;
}

.image.centered {
	display: block;
	margin: 0 0 2em 0;
}

.image.centered img {
	margin: 0 auto;
	width: auto;
}

header {
	margin-bottom: 1em;
}

header h2 {
	font-weight: 600;
}

header .byline {
	display: block;
	margin: 0.5em 0 0 0;
	padding: 0 0 0.5em 0;
}

ul.style {
	
}

ul.style li {
	padding: 0.55em 0em;
}

ul.style li:first-child {
	
}

ul.style a {
	color: #774535 !important;
}

ul.style1 {
	
}

ul.style1 li {
	padding: 0.55em 0em;
}

ul.style1 li:first-child {
	
}

ul.style1 a {
	color: #774535 !important;
}

ul.style1 img {
	float: left;
	margin-right: 1em;
}

/*********************************************************************************/
/* Header                                                                        */
/*********************************************************************************/
#header {
	position: relative;
}

#header .container {
	position: relative;
	padding: 6em 0em;
}

/*********************************************************************************/
/* Logo                                                                          */
/*********************************************************************************/
#logo {
	position: absolute;
	left: 0em;
	top: 4.5em;
}

#logo h1 {
	color: #FFF;
}

#logo a {
	display: block;
	text-decoration: none;
	font-size: 2.8em;
	font-weight: 600;
	color: #FFF;
}

/*********************************************************************************/
/* Nav                                                                           */
/*********************************************************************************/
#nav {
	position: absolute;
	right: 0em;
	top: 5em;
}

#nav>ul>li {
	float: left;
}

#nav>ul>li:last-child {
	padding-right: 0;
}

#nav>ul>li>a, #nav>ul>li>span {
	display: block;
	margin-left: 0.7em;
	padding: 0.80em 1.2em;
	letter-spacing: 0.06em;
	text-decoration: none;
	font-size: 1em;
	outline: 0;
	color: #FFF;
}

#nav li.active a {
	background: #56c9d6;
	border-radius: 5px;
	color: #FFF;
}

#nav>ul>li>ul {
	display: none;
}

/*********************************************************************************/
/* Banner                                                                        */
/*********************************************************************************/
#banner {
	position: relative;
	background: url(../../images/storeimg/banner_twice.jpg) no-repeat center;
	background-size: cover;
}

.homepage #banner {
	
}
</style>

<body>
	<%
		MemberDto memdto = (MemberDto) request.getSession().getAttribute("memdto");
		boolean login = memdto == null ? false : true;

		if (login) {
			if (memdto.isAdmin() == true) {
	%>
	<c:out value="당신은 ADMIN입니다." />
	<%
		} else if (memdto.isAdmin() != true) {
	%><c:out value="당신은 USER입니다." />
	<%
		}
		}
	%>
		<!--       로그인,회원가입-->
		<h5>
			오늘도 트와이스를 보러온 "<%=memdto.getId()%>"님 그대는 오늘 하루도 승리자다.
		</h5>
		<div id="lg">
			<a href="memviews/logout" class="member">로그아웃</a> | <a
				href="memviews/joinform" class="member">회원가입</a>
		</div>




		<div id="header">
			<div class="container">
				<div id="logo">
					<h1>
						<a href="../">twentyOnce</a>
					</h1>
				</div>
				<nav id="nav">
					<ul>
						<li class="active"><a href="list">MAIN</a></li>
						<li><a href="#">NOTICE</a></li>
						<li><a href="cartList?userId">STORE</a></li>
						<li><a href="orderList?userId">DUCKZIL</a></li>
						<li><a href="twocolumn2.html">SCHEDULE</a></li>
						<li><a href="onecolumn.html">VIDEO</a></li>
					</ul>
				</nav>

			</div>
		</div>



		<footer>
		<div id="social">
			<a href="https://www.facebook.com/JYPETWICE"><img
				src="resources/images/mainimg/facebook.PNG" alt="facebook"></a> <a
				href="https://www.instagram.com/twicetagram/"><img
				src="resources/images/mainimg/instargram.PNG" alt="instargram"></a>
			<a href="https://twitter.com/JYPETWICE"><img
				src="resources/images/mainimg/twitter.PNG" alt="twitter"></a> <a
				href="https://www.youtube.com/jypentertainment"><img
				src="resources/images/mainimg/youtube.PNG"></a> <a
				href="https://fans.jype.com/Portal"><img
				src="resources/images/mainimg/fans.PNG" alt="fans"></a>
		</div>

		</footer>



</body>
</html>
