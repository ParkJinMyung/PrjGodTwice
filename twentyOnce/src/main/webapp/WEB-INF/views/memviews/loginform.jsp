<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.SaveIdDto"%>

<%
SaveIdDto iddto=(SaveIdDto)request.getAttribute("iddto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
 <link rel="stylesheet" href="../resources/css/memcss/login2.css">
<script type="text/javascript">

	function checkValue() {
		inputForm=eval("document.loginInfo");	
		if(!inputForm.id.value){
			alert("아이디 입력");
			inputForm.id.focus();
			return false;
		}
		
		if(!inputForm.pw.value){
			alert("비밀번호 입력");
			inputForm.pw.focus();
			return false;
		}
	}
	
	function goJoinForm() {
		location.href="joinform";
	}
</script>

</head>
<body>

<form action="loginproc" id="loginForm" method="post" name="loginInfo" onsubmit="return checkValue()">
   <a href="../">
   	<div id="top">
   	<img alt="" src="../resources/images/loginimg/grde.png" class="topto">
   <div class="logo"> <img src="../resources/images/loginimg/logo.png" ></div></div></a>
 <fieldset>
         <div id="login">
            <p>
                <label for="userId" class="labelStyle">ID</label>
                <input type="text" name="id" id="id" size="10" value="${iddto.ids_id }" />
            </p>
            
            <p>
                <label for="userPWD" class="labelStyle">PW</label>
                <input type="password" name="pw" id="pw" size="10" value="${iddto.ids_pw }" />
            </p>
        </div>
                <input type="submit" value="로그인" id="btnLogin" />
                
        <p id="btn1">
                <input type="checkbox" name="saveId" id="saveId" value="saveIdYes" <%=iddto.getCheck() %> />
                <label for="saveId">아이디저장</label>
                <input type="checkbox" id="secure" value="secureYes" />
                <label for="secure">보안접속</label>
        </p>
            
        <p id="btn2">
                <input type="button" value=" 아이디/비밀번호 찾기 "
                id="btnSearch" />
                <input type="button" value="회원가입" id="btnJoin" onclick="goJoinForm()" /> 
            </p>
            </fieldset>
</form>
</body>
</html>