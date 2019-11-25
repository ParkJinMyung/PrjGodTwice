<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<%
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function checkValue() {
	inputForm=eval("document.pwchangeInfo");
	if(!inputForm.pwnow.value){ //각각 입력창
		alert("현재 비밀번호 입력");
		inputForm.pwnow.focus();
		return false;
	}
	if(!inputForm.pwnew.value){
		alert("새 비밀번호 입력");
		inputForm.pwnew.focus();
		return false;
	}
	if(!inputForm.pwcheck.value){
		alert("비밀번호 확인 입력");
		inputForm.pwcheck.focus();
		return false;
	}
	if(inputForm.pwnew.value!=inputForm.pwcheck.value){
		alert("비밀번호 일치하지 않음");
		inputForm.pwcheck.focus();
		return false;
	} else {
		alert("비번 변경중");
	}
}

function goBack() { //홈 화면으로
	location.href="../";
}

</script>

</head>
<body>

ㅇ회원 정보
<br>
아이디 <%=memdto.getId() %>
<br>
이름 <%=memdto.getName() %>
<br>
<%
Date time=new Date();
SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

time.setTime(request.getSession().getLastAccessedTime());
%>
Last Login Date <%=formatter.format(time)%>
<br>
<br>
ㅇ상세 정보
<br>
이메일: <%=memdto.getEmail() %>
<br>
폰번: <%=memdto.getPhone() %>
<br>
주소: <%=memdto.getAddr() %>
<br>
<br>
ㅇ암호 변경
<br>
<br>
<form action="mypage" method="post" name="pwchangeInfo" onsubmit="return checkValue()">
현재 비밀번호 <input type="password" name="pwnow" size="10" class="middle">
<br>
<br>
새 비밀번호 <input type="password" name="pwnew" size="10" class="middle">
<br>
<br>
비밀번호 확인 <input type="password" name="pwcheck" size="10" class="middle">
<br>
<br>
<input type="submit" value="암호 변경" class="middle">
<br>
<br>
<input type="button" value="돌아가기" onclick="goBack()">
</form>
</body>
</html>