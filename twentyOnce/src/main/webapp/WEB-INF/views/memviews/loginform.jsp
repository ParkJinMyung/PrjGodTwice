<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.SaveIdDto"%>

<%
	SaveIdDto iddto = (SaveIdDto) request.getAttribute("iddto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
<!--  <link rel="stylesheet" href="../resources/css/memcss/login2.css"> -->
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디 입력");
			inputForm.id.focus();
			return false;
		}

		if (!inputForm.pw.value) {
			alert("비밀번호 입력");
			inputForm.pw.focus();
			return false;
		}
	}

	function goJoinForm() {
		location.href = "joinform";
	}
</script>
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Roboto+Condensed:300);

body {
	background-color: white;
	font-family: 'Nunito', sans-serif;
	margin: 0;
	padding: 0;
}

.form-container {
	display: block;
	margin: 10vh auto; /* 10% = Middle of Page */
	width: 500px;
	border: 2px solid #eee;
	border-radius: 20px;
	background-color: ;
}

#form-title {
	display: block;
	height: 100px;
	text-align: center;
	padding-top: 50px;
	font-size: 2.5em;
}

label {
	display: inline-block;
	width: 25%;
	padding-left: 50px;
}

.text-input {
	height: 35px;
	width: 250px;
	border-radius: 5px;
	border: 0;
	font-size: 1em;
	padding-left: 10px;
}

.login {
	margin-top: 50px;
	margin-left: 70px;
	margin-bottom: 50px;
}

.login-button {
	position: relative;
	display: inline-block;
	background-color: white;
	height: 50px;
	width: 40%;
	border-radius: 5px;
	text-align: center;
	vertical-align: middle;
	line-height: 50px;
	color: black;
}

.login-button:hover {
	background-color: #eee;
	color: black;
}

.sign-up-button {
	position: relative;
	display: inline-block;
	background-color: #000;
	height: 50px;
	width: 40%;
	/* border: 2px solid #eee;*/
	border-radius: 5px;
	color: white;
	text-align: center;
	vertical-align: middle;
	line-height: 50px;
	margin-left: 10px;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>

	<form action="loginproc" id="loginForm" method="post" name="loginInfo"
		onsubmit="return checkValue()">


		<!--  로그인 폼 시작-->
		<div class="form-container">
			<div id="form-title">TWICE LOVE</div>
			
				<label for="userId">YOUR ID</label> <input type="text" name="id"
					class="text-input" value="${iddto.ids_id }" />
			

			<p>
				<label for="userPWD">PASSWORD</label> <input type="password"
					name="pw" class="text-input" value="${iddto.ids_pw }" />
			</p>
			<div class="login">
				<input type="submit" value="LOGIN" class="login-button" />
<!-- 				<div class="sign-up-button" onclick="goJoinForm()">SIGN UP</div> -->
			</div>
       <div>
			<p class="password-rec">
				Recover Your Password <a href="#">Here</a>
			</p>
		        <p id="btn1" style="text-align: center;">
		                <label for="saveId">SAVE ID</label>
		                <input type="checkbox" name="saveId" id="saveId" value="saveIdYes" <%=iddto.getCheck() %> />
		                <label for="secure">SECURE CONTECT</label>
		                <input type="checkbox" id="secure" value="secureYes" />
		        </p>
		</div>
		
		</div>


	</form>
</body>
</html>