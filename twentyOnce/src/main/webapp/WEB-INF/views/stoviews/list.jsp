<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/store.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/sto_menu.css">
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/skel-noscript.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/style.css" />
   <link rel="stylesheet" type="text/css" href="../resources/css/storecss/style-desktop.css" />
</head>
<body>
<% 
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
boolean login=memdto==null?false:true;

System.out.println("시작하는 순서는?");

if(login) {
%>
<%
	if(memdto.isAdmin()) {
%>
	<!-- 관리자일 때 -->
 		<div id="header">
			<div class="container">

				<!-- 로고 -->
				<div id="logo">
					<h1><a href="../">twentyOnce</a></h1>
				</div>

				<!-- Nev -->
				<nav id="nav">
					<ul>
						<li class="active"><a href="list">PRODUCTION</a></li>
						<li><a href="#">SALE</a></li>
						<li><a href="cartList?userId=<%=memdto.getId() %>">SHOPPING CART</a></li>
						<li><a href="orderList?userId=<%=memdto.getId()%>">ORDER LIST</a></li>
						<li><a href="twocolumn2.html">EVENT</a></li>
						<li><a href="onecolumn.html">COMMUNITY</a></li>
					</ul>
				</nav>

			</div>
		</div>
	
		<!-- 상품 배너 -->
		<div id="banner">&nbsp;</div>

		<div id="featured">
			<div class="container">
				<div class="row">
					
					<!-- 상품 목록 출력 -->
					<c:forEach items="${list }" var="dto">
						<div class="3u">
							<section>
								<a href="content_view?sto_code=${dto.sto_code }" class="image full"><img src="../resources/images/stoimg/${dto.sto_imageurl }" alt="" style="width: 282px; height: 243px;" ></a>
								<header>
									<h2>${dto.sto_name }</h2>
								</header>
								<p><fmt:formatNumber pattern="###,###,###" value="${dto.sto_price }" />원</p>				
							</section>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 인기 상품 태그 -->
		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section>
							<header>
								<h2>Twice SNS</h2>
							</header>
							<ul clas s="style1">
								<li class="first"><img src="../resources/images/storeimg/pics06.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="../resources/images/storeimg/pics07.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="../resources/images/storeimg/pics08.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Twice INSTAGRAM</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="../resources/images/storeimg/pics09.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="../resources/images/storeimg/pics10.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="../resources/images/storeimg/pics11.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>Aenean elementum facilisis ligula</h2>
							</header>
							<a href="#" class="image full"><img src="../resources/images/storeimg/pics12.jpg" alt=""></a>
							<p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet. Donec mattis libero eget urna. Duis pretium velit ac mauris.</p>
						</section>
					</div>
				</div>
			</div>
		</div>

		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
						<section>
							<header>
								<h2>Maecenas luctus lectus at sapien</h2>
							</header>
							<p>This is <strong>Autonomy</strong>, a responsive HTML5 site template freebie by <a href="http://templated.co">TEMPLATED</a>. Released for free under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so use it for whatever (personal or commercial) &ndash; just give us credit! Check out more of our stuff at <a href="http://templated.co">our site</a> or follow us on <a href="http://twitter.com/templatedco">Twitter</a>.</p>
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend.</p>
							<p>Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor.</p>
						</section>
					</div>
					<div class="4u">
						<section>
							<header>
								<h2>Lectus at sapien</h2>
							</header>
							<ul class="style">
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li>
								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li>
								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li>
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
      	
      <%
      /* 유저일 때  */
		} else{
		%>
		 <div id="main">
        <!-- 트와이스로고 -->
        <div id="twicelogo"><a href="../"><img src="../resources/images/stoimg/twicelogo.png"></a></div>
        <!-- 로그인 회원가입 -->
        <div id="lg"><a href="cartList?userId=<%=memdto.getId() %>" id="menu5">장바구니</a> |
        		<a href="orderList?userId=<%=memdto.getId() %>" id="menu6">주문목록</a> |
        		<a href="../memviews/store_logout" class="login">로그아웃</a> | <a href="../memviews/joinform" class="member">회원가입</a></div>
        <!-- 바 -->
        <nav id="top_menu">
            <ul>
                <li><a href="/twentyOnce" id="menu1">HOME</a></li>
                <li><a href="../mainviews/profile" id="menu2">PROFILE</a></li>
                <li><a href="../mainviews/gallery" id="menu3">GALLERY</a></li>
                <li><a href="../mainviews/video" id="menu4">VIDEO</a></li>
                <!-- <li><a href="write_view">싸버렸다</a></li> -->
                <li><a href="../brdviews/not_Notice/list" id="menu5">NOTICE</a></li>
                <li><a href="../schviews/schedule" id="menu6">SCHEDULE</a></li>
                <li><a href="../stoviews/list" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>
            </ul>
            <!-- 검색창 -->
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="">
                    <button type="submit" class="searchButton">
                        <span class="demoSpan1">
                        </span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </nav>
        <div id="top">
            <div id="image">
                <ul id="image_ul">
                	<c:forEach items="${list }" var="dto">              		
	                    <li><a href="content_view?sto_code=${dto.sto_code }"><img src="../resources/images/stoimg/${dto.sto_imageurl }" style="width: 300px; height: 400px;" ></a>
	                        <a href="content_view?sto_code=${dto.sto_code }">
	                          <br>
	                          <p><img src="../resources/images/stoimg/new.PNG" /><img src="../resources/images/stoimg/pre.PNG" /><strong>${dto.sto_name }</strong><p>
	                        </a>
	                        <p><fmt:formatNumber pattern="###,###,###" value="${dto.sto_price }" />원</p>
	                    </li>
                	</c:forEach>
                	
          <footer>
            <div id="godlogo">
            <img src="../resources/images/stoimg/gods.png">
            </div>
            <!-- 소셜 로고 -->
            <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="../resources/images/stoimg/facebook.PNG" alt="facebook" /></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="../resources/images/stoimg/instargram.PNG" alt="instargram" /></a>
                <a href="https://twitter.com/JYPETWICE"><img src="../resources/images/stoimg/twitter.PNG" alt="twitter" /></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="../resources/images/stoimg/youtube.PNG" /></a>
                <a href="https://fans.jype.com/Portal"><img src="../resources/images/stoimg/fans.PNG" alt="fans" /></a>
            </div>
       </footer>          
                </ul>

            </div>
            
        </div>
      </div> 	
		<%
		} 
		%>
		
		
<% 
	/* 유저, 관리자가 아닐 떄  */
}	else {
	%>
		 <div id="main">
        <!-- 트와이스로고 -->
        <div id="twicelogo"><a href="../"><img src="../resources/images/stoimg/twicelogo.png"></a></div>
        <!-- 로그인 회원가입 -->
        <div id="lg"><a href="../memviews/loginform" class="login">로그인</a> | <a href="../memviews/joinform" class="member">회원가입</a></div>
        <!-- 바 -->
        <nav id="top_menu">
            <ul>
                 <li><a href="/twentyOnce" id="menu1">HOME</a></li>
                <li><a href="../mainviews/profile" id="menu2">PROFILE</a></li>
                <li><a href="../mainviews/gallery" id="menu3">GALLERY</a></li>
                <li><a href="../mainviews/video" id="menu4">VIDEO</a></li>
                <li><a href="../brdviews/not_Notice/list" id="menu5">NOTICE</a></li>
                <li><a href="../schviews/schedule" id="menu6">SCHEDULE</a></li>
                <li><a href="../stoviews/list" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>
            </ul>
            <!-- 검색창 -->
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="">
                    <button type="submit" class="searchButton">
                        <span class="demoSpan1">
                        </span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </nav>
        <div id="top">
            <div id="image">
                <ul id="image_ul">
                	<c:forEach items="${list }" var="dto">              		
	                    <li><a href="content_view?sto_code=${dto.sto_code }"><img src="../resources/images/stoimg/${dto.sto_imageurl }" style="width: 300px; height: 400px;" ></a>
	                        <a href="content_view?sto_code=${dto.sto_code }">
	                          <br>
	                          <p><img src="../resources/images/stoimg/new.PNG" /><img src="../resources/images/stoimg/pre.PNG" /><strong>${dto.sto_name }</strong><p>
	                        </a>
	                        <p><fmt:formatNumber pattern="###,###,###" value="${dto.sto_price }" />원</p>
	                    </li>
                	</c:forEach>
                	
          <footer>
            <div id="godlogo">
            <img src="../resources/images/stoimg/gods.png">
            </div>
            <!-- 소셜 로고 -->
            <div id="social">
                <a href="https://www.facebook.com/JYPETWICE"><img src="../resources/images/stoimg/facebook.PNG" alt="facebook" /></a>
                <a href="https://www.instagram.com/twicetagram/"><img src="../resources/images/stoimg/instargram.PNG" alt="instargram" /></a>
                <a href="https://twitter.com/JYPETWICE"><img src="../resources/images/stoimg/twitter.PNG" alt="twitter" /></a>
                <a href="https://www.youtube.com/jypentertainment"><img src="../resources/images/stoimg/youtube.PNG" /></a>
                <a href="https://fans.jype.com/Portal"><img src="../resources/images/stoimg/fans.PNG" alt="fans" /></a>
            </div>
       </footer>          
                </ul>

            </div>
            
        </div>
      </div> 	
	
	<% 
		}
    %>  	
</body>
</html>