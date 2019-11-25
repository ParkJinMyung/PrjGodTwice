<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="twentyOnce.vis.dto.StatsDto"%>
<%@page import="twentyOnce.vis.dto.GraphDto"%>
<%@page import="twentyOnce.vis.dto.DateDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
    
<%

//통계 상세 보기
DateDto datedto=(DateDto)request.getAttribute("datedto");

int year=datedto.getYear();
int month=datedto.getMonth();
int day=datedto.getDay();

int currYear=datedto.getCurrYear();
int currMonth=datedto.getCurrMonth();
int currDay=datedto.getCurrDay();

ArrayList<GraphDto> grphlist=(ArrayList)request.getAttribute("grphlist");

StatsDto statdto=(StatsDto)request.getAttribute("statdto");
int avgviews=statdto.getAvgviews();

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<h3>방문자 통계</h3>
<br>
<br>

ㅇ통계 요약
<br>
<br>
총 방문수: ${statdto.totalviews }<br>
일간 방문수: ${statdto.dailyviews }<br>
주간 방문수: ${statdto.weeklyviews }<br>
월간 방문수: ${statdto.monthlyviews }<br>
<br>
<br>

ㅇ통계 상세 보기
<br>
<br>

<a href="visstatsview?year=<%=datedto.getYear() %>&month=<%=datedto.getMonth() %>&day=<%=datedto.getDay()-1 %>">
1일 전</a>
<br>
<br>

<%if (!(year==currYear&&month==currMonth&&day==currDay)) {%>
<a href="visstatsview?year=<%=datedto.getYear() %>&month=<%=datedto.getMonth() %>&day=<%=datedto.getDay()+1 %>">
1일 후</a>
<br>
<br>
<%} %>

<%=statdto.getStandardTime() %>
<br>
2주일치 통계 자료
<br>
<br>

<div id="chart_div"></div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawTrendlines);

function drawTrendlines() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '일일 방문자');
      data.addColumn('number', '평균');

      data.addRows([
          [<%=day-14%>, <%=grphlist.get(0).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-13%>, <%=grphlist.get(1).getGrphcount() %>, <%=avgviews %>],
          [<%=day-12%>, <%=grphlist.get(2).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-11%>, <%=grphlist.get(3).getGrphcount() %>, <%=avgviews %>],
          [<%=day-10%>, <%=grphlist.get(4).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-9%>, <%=grphlist.get(5).getGrphcount() %>, <%=avgviews %>],
          [<%=day-8%>, <%=grphlist.get(6).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-7%>, <%=grphlist.get(7).getGrphcount() %>, <%=avgviews %>],  
          [<%=day-6%>, <%=grphlist.get(8).getGrphcount() %>, <%=avgviews %>],  
          [<%=day-5%>, <%=grphlist.get(9).getGrphcount() %>, <%=avgviews %>],  
          [<%=day-4%>, <%=grphlist.get(10).getGrphcount() %>, <%=avgviews %>],  
          [<%=day-3%>, <%=grphlist.get(11).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-2%>, <%=grphlist.get(12).getGrphcount() %>, <%=avgviews %>], 
          [<%=day-1%>, <%=grphlist.get(13).getGrphcount() %>, <%=avgviews %>],
          [<%=day%>, <%=grphlist.get(14).getGrphcount() %>, <%=avgviews %>]
        ]);

      var options = {
        hAxis: {
          title: '날짜(일)'
        },
        vAxis: {
          title: '인원(명)'
        },
        colors: ['#AB0D06', '#007329'],
        trendlines: {
          0: {type: 'exponential', color: '#333', opacity: 1},
          1: {type: 'linear', color: '#111', opacity: .3}
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
</script>

<br>

<br>
<br>
방문 합계: <%=statdto.getTwoweeksviews() %>회<br>
평균 페이지뷰: <%=statdto.getAvgpageviews() %>페이지<br>
평균 사용 시간: <%=statdto.getAvgusemins() %>분<br>
가장 많이 접속한 아이디: '<%=statdto.getMaxuseid() %>'님<br>

<!-- 
일일 방문수의 2주일치
(
왼쪽 오른쪽 버튼으로
기준이 되는 날을 바꿀 수 있음.
)
​
평균 페이지뷰
평균 사용 시간
가장 많이 이용한 아이디
 -->

</body>
</html>