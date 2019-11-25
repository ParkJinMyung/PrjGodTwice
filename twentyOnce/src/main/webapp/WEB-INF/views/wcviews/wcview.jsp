<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>
<%@page import="twentyOnce.wc.dto.WorldcupProgress"%>
    
<%

//진행 사항

WorldcupProgress wcprogress=(WorldcupProgress)request.getAttribute("wcprogress");
int thisRound=wcprogress.getThisRound();
int nextMatch=wcprogress.getNextMatch();

//대전 상대

ArrayList<NomineeDto> matchlist=(ArrayList)request.getAttribute("matchlist");

NomineeDto nom0=matchlist.get(0);
NomineeDto nom1=matchlist.get(1);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="nom0form" action="wcview" method="POST">
<input type="hidden" name="thisround" value="<%=thisRound %>" />
<input type="hidden" name="nextmatch" value="<%=nextMatch+2 %>" />
<input type="hidden" name="lastwinner" value="<%=nom0.getWc_code() %>" />
<input type="hidden" name="lastloser" value="<%=nom1.getWc_code() %>" />
</form>

<form name="nom1form" action="wcview" method="POST">
<input type="hidden" name="thisround" value="<%=thisRound %>" />
<input type="hidden" name="nextmatch" value="<%=nextMatch+2 %>" />
<input type="hidden" name="lastwinner" value="<%=nom1.getWc_code() %>" />
<input type="hidden" name="lastloser" value="<%=nom0.getWc_code() %>" />
</form>

<%
if(thisRound>2) {
%>
<h3>월드컵 <%=thisRound %>강</h3>
<%
} else {
%>
<h3>월드컵  결승전</h3>
<%
}
%>

<%=nom0.getWc_title() %><br>
<%-- <a href="wcview?thisround=<%=thisRound %>&nextmatch=<%=nextMatch+2 %>&lastwinner=<%=nom0.getwCode() %>&lastloser=<%=nom1.getwCode() %>">
<img alt="" src="<%=nom0.getwMemory() %>">
</a><br> --%>
<a href="#" onclick="javascript:document.nom0form.submit();">
<img alt="" src="<%=nom0.getWc_memory() %>">
</a>
<br>

<br>

<%=nom1.getWc_title() %><br>
<%-- <a href="wcview?thisround=<%=thisRound %>&nextmatch=<%=nextMatch+2 %>&lastwinner=<%=nom1.getwCode() %>&lastloser=<%=nom0.getwCode() %>">
<img alt="" src="<%=nom1.getwMemory() %>">
</a><br> --%>
<a href="#" onclick="javascript:document.nom1form.submit();">
<img alt="" src="<%=nom1.getWc_memory() %>">
</a>
<br>

</body>
</html>