<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@page import="twentyOnce.qz.dto.QuizProgress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

QuizProgress qprogress=(QuizProgress)request.getSession().getAttribute("qprogress");
MemberDto memdto=(MemberDto)request.getSession().getAttribute("memdto");
//memdto.setTier(qprogress.getCorrectnum());

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>qzresultview입니다</h3>
<br>
맞은 개수: <%=qprogress.getCorrectnum() %>/<%=qprogress.getQuizturn() %>
<br>
당신의 회원 등급은 <%=memdto.getTier() %>입니다.
<br>
당신의 포인트는 <%=memdto.getPoint() %>입니다.

</body>
</html>
<%
request.getSession().removeAttribute("qprogress");
%>