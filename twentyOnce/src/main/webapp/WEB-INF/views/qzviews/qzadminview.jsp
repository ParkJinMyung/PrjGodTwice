<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.MemberDto"%>

<%

MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");

if(memdto!=null&&memdto.isAdmin()==true) {

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function checkValue() {
		inputForm=eval("document.qzadd");
		if(!inputForm.quiz.value){ //각각 입력창
			alert("문제 입력");
			inputForm.quiz.focus();
			return false;
		}
		if(!inputForm.choicea.value){
			alert("선지1 입력");
			inputForm.choicea.focus();
			return false;
		}
		if(!inputForm.choiceb.value){
			alert("선지2 입력");
			inputForm.choiceb.focus();
			return false;
		}
		if(!inputForm.choicec.value){
			alert("선지3 입력");
			inputForm.choicec.focus();
			return false;
		}
		if(!inputForm.choiced.value){
			alert("선지4 입력");
			inputForm.choiced.focus();
			return false;
		}
		if(!inputForm.choicee.value){
			alert("선지5 입력");
			inputForm.choicee.focus();
			return false;
		}
		if(!inputForm.answer.value){
			alert("답 입력");
			inputForm.answer.focus();
			return false;
		}
	}
	
	function goBack() { //홈 화면으로
		location.href="home";
	}
</script>
</head>
<body>

<!-- 
QCODE			NUMBER(3,0)
QQUIZ			VARCHAR2(50 BYTE)
QCHOICEA	VARCHAR2(20 BYTE)
QCHOICEB	VARCHAR2(20 BYTE)
QCHOICEC	VARCHAR2(20 BYTE)
QCHOICED	VARCHAR2(20 BYTE)
QCHOICEE	VARCHAR2(20 BYTE)
QANSWER		NUMBER(1,0)
 -->
 
 <h3>퀴즈를 출제하세요</h3>
<br>
<br>
<form action="qzadddone" method="post" name="qzadd" onsubmit="return checkValue()">
<br>
퀴즈 문제 <input type="text" name="quiz" size="20" class="middle">
<br>
<br>
선지1 <input type="text" name="choicea" size="10" class="middle">
<br>
<br>
선지2 <input type="text" name="choiceb" size="10" class="middle">
<br>
<br>
선지3 <input type="text" name="choicec" size="10" class="middle">
<br>
<br>
선지4 <input type="text" name="choiced" size="10" class="middle">
<br>
<br>
선지5 <input type="text" name="choicee" size="10" class="middle">
<br>
<br>
정답(숫자) <input type="text" name="answer" size="10" class="middle">
<br>
<br>
<input type="submit" value="입력완료" class="middle">
<br>
<br>
<input type="button" value="돌아가기" onclick="goBack()">
</form>

<%
} else { //로그인 실패시
%>

<script>
alert("관리자가 아닙니다.");
history.go(-1);
</script>

<%
}
%>

</body>
</html>