<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
boolean login=memdto==null?false:true;

if(login) {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>

로그인에 성공했습니다.
<br>
<br>
<a href="logout">로그아웃</a>
<br>
<a href="../../twentyOnce">메인 화면</a>
<br>
<br>
아이디 "<%=memdto.getId() %>"로 로그인 한 상태
<br>
방갑습니다 "<%=memdto.getName() %>"님!
<br>
<br>
<%
	if(memdto.isAdmin()) {
%>
당신은 관리자입니다.
<%
	} else {
%>
당신은 유저입니다.
<%
	}
%>
<br>
<br>
폰번: <%=memdto.getPhone() %>
<br>
이메일: <%=memdto.getEmail() %>
<br>
주소: <%=memdto.getAddr() %>
<br>
등급: <%=memdto.getTier() %>
<%
} else { //로그인 실패시
%>

<script>
alert("로그인에 실패하였습니다.");
history.go(-1);
</script>

<%
}
%>

</body>
</html>