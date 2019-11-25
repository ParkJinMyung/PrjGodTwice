<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/maincss/mainhp.css">
    <link rel="stylesheet" href="resources/css/maincss/menu2.css">
    <script src="resources/jquery/jquery-3.4.1.min.js"></script>
    <script src="resources/jquery/s3Slider.js"></script>
</head>
<body>
<%-- <h1> 
twentyOnce 홈페이지
</h1>

<P>  The time on the server is ${serverTime}. </P>

로그인/로그아웃
<br>
<br> --%>
<%
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
boolean login=memdto==null?false:true;

if(login) {
%>
<%
	if(memdto.isAdmin()) {
%>
<!-- 당신은 관리자입니다. -->
<div id="main_img">
<!--       로그인,회원가입-->
		아이디 "<%=memdto.getId() %>"님 환영합니다.
        <div id="lg"><a href="memviews/logout" class="member">로그아웃</a> | <a href="memviews/joinform" class="member">회원가입</a></div>
        <a href="/twentyOnce">
        
        
<!--           로고이미지-->
           <div id="twicelogo">
                <img src="resources/images/mainimg/twicelogo2.png">
            </div>
        </a>
<!--        메뉴바-->
        <nav id="top_menu">
            <ul>
                <li><a href="/twentyOnce_pageing" id="menu1">HOME</a></li>
                <li><a href="mainviews/profile" id="menu2">PROFILE</a></li>
                <li><a href="mainviews/gallery" id="menu3">GALLERY</a></li>
                <li><a href="mainviews/video" id="menu4">VIDEO</a></li>
                <li><a href="brdviews/not_Notice/list" id="menu5">NOTICE</a></li>
                <li><a href="schviews/schedule" id="menu6">SCHEDULE</a></li>
                <li><a href="stoviews/list" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>                      	
                <li><a href="qzviews/qzadminview" id="menu9">QUIZ</a></li>
                <li><a href="schviews/schadminview" id="menu10">SCHAMDIN</a></li>
                <li><a href="visviews/visstatsview" id="menu11">VISIT</a></li>	
               
            </ul>
        </nav>
        <div class="slider" id="main-slider"><!-- outermost container element -->
	<div class="slider-wrapper"><!-- innermost wrapper element -->
		<img src="resources/images/mainimg/twice.PNG" alt="First" class="slide" /><!-- slides -->
		<img src="resources/images/mainimg/twice2.png" alt="Second" class="slide" />
		<img src="resources/images/mainimg/twice3.png" alt="Third" class="slide" />
	</div>
</div>	
<!--        하단 footer-->
        <footer>
<!--           갓스물로고-->
            <div id="godlogo">
                <img src="resources/images/mainimg/gods.png">
            </div>
<!--            소셜바-->
            <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="resources/images/mainimg/facebook.PNG" alt="facebook"></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="resources/images/mainimg/instargram.PNG" alt="instargram"></a>
                <a href="https://twitter.com/JYPETWICE"><img src="resources/images/mainimg/twitter.PNG" alt="twitter"></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="resources/images/mainimg/youtube.PNG"></a>
                <a href="https://fans.jype.com/Portal"><img src="resources/images/mainimg/fans.PNG" alt="fans"></a>
                </div>
        
    </footer>
    </div>


<%
	} else {
%>
<!-- 당신은 유저입니다. -->
<div id="main_img">
<!--       로그인,회원가입-->
		아이디 "<%=memdto.getId() %>"님 환영합니다.
        <div id="lg"><a href="memviews/logout" class="member">로그아웃</a> | <a href="memviews/joinform" class="member">회원가입</a></div>
        <a href="/twentyOnce">
        
        
<!--           로고이미지-->
            <div id="twicelogo">
                <img src="resources/images/mainimg/twicelogo2.png">
            </div>
        </a>
<!--        메뉴바-->
        <nav id="top_menu">
            <ul>
                <li><a href="/twentyOnce" id="menu1">HOME</a></li>
                <li><a href="mainviews/profile" id="menu2">PROFILE</a></li>
                <li><a href="mainviews/gallery" id="menu3">GALLERY</a></li>
                <li><a href="mainviews/video" id="menu4">VIDEO</a></li>
                <li><a href="brdviews/not_Notice/list" id="menu5">NOTICE</a></li>
                <li><a href="schviews/schedule" id="menu6">SCHEDULE</a></li>
                <li><a href="stoviews/list" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>
            
            </ul>
        </nav>
        <div class="slider" id="main-slider"><!-- outermost container element -->
	<div class="slider-wrapper"><!-- innermost wrapper element -->
		<img src="resources/images/mainimg/twice.PNG" alt="First" class="slide" /><!-- slides -->
		<img src="resources/images/mainimg/twice2.png" alt="Second" class="slide" />
		<img src="resources/images/mainimg/twice3.png" alt="Third" class="slide" />
	</div>
</div>	
<!--        하단 footer-->
        <footer>
<!--           갓스물로고-->
            <div id="godlogo">
                <img src="resources/images/mainimg/gods.png">
            </div>
<!--            소셜바-->
            <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="resources/images/mainimg/facebook.PNG" alt="facebook"></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="resources/images/mainimg/instargram.PNG" alt="instargram"></a>
                <a href="https://twitter.com/JYPETWICE"><img src="resources/images/mainimg/twitter.PNG" alt="twitter"></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="resources/images/mainimg/youtube.PNG"></a>
                <a href="https://fans.jype.com/Portal"><img src="resources/images/mainimg/fans.PNG" alt="fans"></a>
                </div>
        
    </footer>
    </div>

<%
	}
%>
<br>
<br>
<a href="memviews/mypage">마이페이지</a>
<%
} else {
%>
 <div id="main_img">
<!--       로그인,회원가입-->
        <div id="lg"><a href="memviews/loginform" class="login">로그인</a> | <a href="memviews/joinform" class="member">회원가입</a></div>
        <a href="/twentyOnce">
        
        
<!--           로고이미지-->
            <div id="twicelogo">
                <img src="resources/images/mainimg/twicelogo2.png">
            </div>
        </a>
<!--        메뉴바-->
        <nav id="top_menu">
            <ul>
                <li><a href="/twentyOnce" id="menu1">HOME</a></li>
                <li><a href="mainviews/profile" id="menu2">PROFILE</a></li>
                <li><a href="mainviews/gallery" id="menu3">GALLERY</a></li>
                <li><a href="mainviews/video" id="menu4">VIDEO</a></li>
                <li><a href="brdviews/not_Notice/list" id="menu5">NOTICE</a></li>
                <li><a href="schviews/schedule" id="menu6">SCHEDULE</a></li>
                <li><a href="stoviews/list" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>
             <%--    <%
                	if(memdto.isAdmin()){
                %>
                	<li><a href="qzviews/qzadminview">QUIZ</a></li>
                	<li><a href="schviews/schadminview">SCHEDULE</a></li>
                	<li><a href="visviews/visstatsview">VISIT</a></li>	
               	<% 
                	}
                %> --%>
            </ul>
        </nav>
        <div class="slider" id="main-slider"><!-- outermost container element -->
	<div class="slider-wrapper"><!-- innermost wrapper element -->
		<img src="resources/images/mainimg/twice.PNG" alt="First" class="slide" /><!-- slides -->
		<img src="resources/images/mainimg/twice2.png" alt="Second" class="slide" />
		<img src="resources/images/mainimg/twice3.png" alt="Third" class="slide" />
	</div>
</div>	
<!--        하단 footer-->
        <footer>
<!--           갓스물로고-->
            <div id="godlogo">
                <img src="resources/images/mainimg/gods.png">
            </div>
<!--            소셜바-->
            <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="resources/images/mainimg/facebook.PNG" alt="facebook"></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="resources/images/mainimg/instargram.PNG" alt="instargram"></a>
                <a href="https://twitter.com/JYPETWICE"><img src="resources/images/mainimg/twitter.PNG" alt="twitter"></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="resources/images/mainimg/youtube.PNG"></a>
                <a href="https://fans.jype.com/Portal"><img src="resources/images/mainimg/fans.PNG" alt="fans"></a>
                </div>
        
    </footer>
    </div>
<%
}
%>
</body>
</html>
