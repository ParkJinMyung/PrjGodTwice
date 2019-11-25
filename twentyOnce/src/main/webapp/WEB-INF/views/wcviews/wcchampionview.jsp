<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>
    

<%

NomineeDto championDto=(NomineeDto)request.getAttribute("championDto");

%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h3>championview</h3><br>

ㅇ우승자<br>
<br>
<img alt="" src="<%=championDto.getWc_memory() %>">
<br>
<br>
제목: <%=championDto.getWc_title() %><br>
승리수: <%=championDto.getWc_win() %><br>
매치수: <%=championDto.getWc_match() %><br>
우승수: <%=championDto.getWc_champion() %><br>
<br>
<a href="wcstatsview">통계 보기</a>

</body>
</html>