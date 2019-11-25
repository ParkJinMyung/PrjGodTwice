<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//ID			VARCHAR2(20 BYTE)
//PW			VARCHAR2(20 BYTE)
//NAME		VARCHAR2(20 BYTE)
//PHONE	VARCHAR2(20 BYTE)
//EMAIL		VARCHAR2(30 BYTE)
//ADDR		VARCHAR2(100 BYTE)
//TIER		NUMBER(1,0)
//ADMIN	NUMBER(1,0)
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function checkValue() {
		inputForm=eval("document.joinInfo");
		if(!inputForm.id.value){ //각각 입력창
			alert("아이디 입력");
			inputForm.id.focus();
			return false;
		}
		if(!inputForm.pw.value){
			alert("비밀번호 입력");
			inputForm.pw.focus();
			return false;
		}
		if(!inputForm.name.value){
			alert("이름 입력");
			inputForm.name.focus();
			return false;
		}
		if(!inputForm.phone.value){
			alert("전화번호 입력");
			inputForm.phone.focus();
			return false;
		}
		if(!inputForm.email.value){
			alert("이메일 입력");
			inputForm.email.focus();
			return false;
		}
		if(!inputForm.addr.value){
			alert("주소 입력");
			inputForm.addr.focus();
			return false;
		}
	}
	
	function goBack() { //로그인 화면으로
		location.href="loginform";
	}
</script>
  <link rel="stylesheet" href="../resources/css/memcss/joins2.css">
  <link rel="stylesheet" href="../resources/css/menu.css">
</head>
<body>
  <a href="home">
  <div id="twicelogo">
    <img src="../resources/images/mainimg/twicelogo.png">
  </div>
</a>

<nav id="menu">
<div id="middle_menu">
<form action="joinproc" method="post" name="joinInfo" onsubmit="return checkValue()">
<br>
아이디 <input type="text" name="id" size="10" class="middle">
<br>
<br>
비밀번호 <input type="password" name="pw" size="10" class="middle">
<br>
<br>
이름 <input type="text" name="name" size="10" class="middle">
<br>
<br>
전화번호 <input type="text" name="phone" size="10" class="middle">
<br>
<br>
이메일 <input type="text" name="email" size="10" class="middle">
<br>
<br>
주소 <input type="text" name="addr" size="10" class="middle">
<br>
<br>
<input type="submit" value="회원가입" class="middle">
<br>
<br>
<input type="button" value="돌아가기" onclick="goBack()">
</form>
</div>
</nav>
</body>
</html>