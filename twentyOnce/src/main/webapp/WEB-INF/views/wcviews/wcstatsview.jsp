<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.wc.dto.NomineeDto"%>

<%

ArrayList<NomineeDto> statslist=(ArrayList)request.getAttribute("statslist");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
/* UI Object 가로 */
.h_graph ul{margin:0 50px 0 50px;padding:1px 0 0 0;border:1px solid #ddd;border-top:0;border-right:0;font-size:11px;font-family:Tahoma, Geneva, sans-serif;list-style:none}
.h_graph li{position:relative;margin:10px 0;vertical-align:top;white-space:nowrap}
.h_graph .g_term{position:absolute;top:0;left:-50px;width:40px;font-weight:bold;color:#767676;line-height:20px;text-align:right}
.h_graph .g_bar{display:inline-block;position:relative;height:20px;border:1px solid #ccc;border-left:0;background:#e9e9e9}
.h_graph .g_bar span{position:absolute;top:0;right:-50px;width:40px;color:#767676;line-height:20px}
/* //UI Object */
</style>

</head>
<body>

<h3>결과화면</h3>
<br>

<%
for(int i=0; i<statslist.size(); i++) {
	NomineeDto nom=statslist.get(i);
	
	double win=nom.getWc_win();
	double match=nom.getWc_match();
	
	double winRate=(win/match)*100;
	
	double champion=nom.getWc_champion();
	double game=nom.getWc_game();
	
	double championRate=(champion/game)*100;
%>
제목: <%=nom.getWc_title() %><br>
승률: <%=winRate %>%<br>
우승비율: <%=championRate %>%<br>
<br>

<div class="h_graph">
<ul>
<li><span class="g_term">승률</span><span class="g_bar" style="width:<%=winRate/2 %>%"><span><%=winRate %>%</span></span></li>
<li><span class="g_term">우승비율</span><span class="g_bar" style="width:<%=championRate/2 %>%"><span><%=championRate %>%</span></span></li>
</ul>
</div>

<br>
<br>
<%
}
%>
<br>

</body>
</html>