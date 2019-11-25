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
		inputForm=eval("document.schadd");
		if(!inputForm.date.value){ //각각 입력창
			alert("날짜 입력");
			inputForm.date.focus();
			return false;
		}
		if(!inputForm.title.value){
			alert("제목 입력");
			inputForm.title.focus();
			return false;
		}
		if(!inputForm.content.value){
			alert("내용 입력");
			inputForm.content.focus();
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
SCH_CODE
SCH_DATE 이건 넣자
SCH_TITLE 이건 넣자
SCH_CONTENT 이건 넣자
SCH_LOCATION 이건 넣자
 -->

<h3>스케줄을 입력하세요</h3>
<br>
<br>
<form action="schadddone" method="post" name="schadd" onsubmit="return checkValue()">
<br>
날짜(yyyy/mm/dd) <input type="text" name="date" size="20" class="middle">
<br>
<br>
제목 <input type="text" name="title" size="20" class="middle">
<br>
<br>
내용 <input type="text" name="content" size="20" class="middle">
<br>
<br>
위치(선택) <input type="text" name="location" size="20" class="middle">
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