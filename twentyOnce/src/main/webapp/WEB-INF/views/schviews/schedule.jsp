<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="twentyOnce.sch.dto.CalendarResource"%>
<%@page import="twentyOnce.sch.dto.ScheduleDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 
<%

String boxSize = "70";

boolean flagSch=false; //스케줄 클릭했는지 여부
boolean flagLoc=false; //지도 가져왔는지 여부

CalendarResource calsource=(CalendarResource)request.getAttribute("calsource");

int currYear=calsource.getCurrYear();
int currMonth=calsource.getCurrMonth();
Calendar c=calsource.getC();
Calendar cal=calsource.getCal();

//스케줄 리스트
ArrayList<String> schDateList=(ArrayList)request.getAttribute("schdatelist");
ArrayList<String> schTitleList=(ArrayList)request.getAttribute("schtitlelist");
ArrayList<String> schCodeList=(ArrayList)request.getAttribute("schcodelist");

ScheduleDto schduler=null;

if((ScheduleDto)request.getAttribute("scheduler")!=null) {
	schduler=(ScheduleDto)request.getAttribute("scheduler");
	flagSch=true;
	if(schduler.getSch_location()!=null) {
		flagLoc=true;
	}
}

%>

<%! //메소드: 날짜 실제 여부

    public boolean isDate(int y, int m, int d) {
   
         m -= 1;
         Calendar c = Calendar.getInstance();
         c.setLenient(false);
       
         try {
              c.set(y, m, d);
              Date dt = c.getTime();
             
         } catch(IllegalArgumentException e) {
       	  
              return false;
         }
         
         return true;
    }

%>

<%! //메소드: 제목 형식

    public String getTitle(Calendar cal){
       
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월");
         return sdf.format(cal.getTime());    
    }

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 달력(Calendar)</title>
<style>
   
   #calendarTable, #calendarTable th, #calendarTable td   {
       border-collapse: collapse;
                   
   }
   
   #calendarTable {
       border:2px solid #000;
       width:600px;//달력크기. 519px이었음.
   }
   
   #calendarTable th, #calendarTable td {
       width: <%=boxSize%>px;
       border:1px solid #000;        
       border-collapse: collapse;
       padding: 5px;        
   }
   
   #calendarTable th {        
       background-color: #666;
       color: #fff;
       
   }    
   #calendarTable td {        
       height: <%=boxSize%>px;
       text-align : left;            
   }
   
   #calendarTable td.empty {
       background-color: #DFDCD8;
   }
   
   #calendarTable td.toDayColor {
       background-color: #6C7EAA;
   }
   
   
</style>
</head>
<body bgcolor='white'>
<br>
<table border='0' width='600' cellpadding='0' cellspacing='0'>
<!-- width=521이었음. -->
 <tr>
    <td width='150' align='right' valign='middle'>
        <a href="schedule?month=<%=currMonth%>&year=<%=currYear%>&action=0">
            <font size="2">이전달</font>
        </a>
    </td>
    <td width='220' align='center' valign='middle'>
        <b><%= getTitle(cal)%></b>
    </td>
    <td width='150' align='left' valign='middle'>
        <a href="schedule?month=<%=currMonth%>&year=<%=currYear%>&action=1">
            <font size="2">다음달</font>
        </a>
   </td>
 </tr>
</table>
<br>
<table>
 <tr>        
 <td width="100%" >
   <table id="calendarTable">
      <tr>
             <th>일</th>
             <th>월</th>
             <th>화</th>
             <th>수</th>
             <th>목</th>
             <th>금</th>
             <th>토</th>                      
      </tr>
<%
//달력 출력

    String todayColor; //오늘 색깔 구분
    int count = 1; //달력 칸 순서
    int dispDay = 1; //날짜(일)

    for (int w = 1; w < 7; w++) //달력 세로칸 수 (<tr>로 줄바꿈)
    {
%>

      <tr>
<%
         for (int d = 1; d < 8; d++) //달력 가로칸 수
         {
              if (!(count >= cal.get(Calendar.DAY_OF_WEEK))) //여기는 실제 날짜 시작 전임.
              {
%>
         <td class="empty">&nbsp;</td>
<%
                   count += 1; //1칸 더함.
              }
              else
              {
                   if (isDate(currYear, currMonth+1, dispDay)) // isDate메소드로 실제 날짜인지 확인.
                   {
                        if (dispDay == c.get(Calendar.DAY_OF_MONTH) && //여기는 오늘임.
                           c.get(Calendar.MONTH) == cal.get(Calendar.MONTH)
                               && c.get(Calendar.YEAR) == cal.get(Calendar.YEAR))
                        {
                            todayColor = "class='toDayColor'";
                        }
                        else //여기는 오늘이 아님.
                        {
                            todayColor = "";
                        }
%>
         <td <%=todayColor%>><%=dispDay%><br>
<%
//ㅇㅇ
for(int i = 0; i < schDateList.size(); i++) {
	String date=schDateList.get(i);
	if(Integer.parseInt(date)==dispDay) {
		String title=schTitleList.get(i);
		String code=schCodeList.get(i);
%>
		<a href="schedule?schCode=<%=code%>&month=<%=currMonth%>&year=<%=currYear%>"><%=title%></a>
<%
		if(i+1<schDateList.size()) {
			String nextdate=schDateList.get(i+1);
			if(Integer.parseInt(nextdate)==dispDay) {
%>
				/
<%
			}
		}
	}
}


%>
         </td>
<%
						dispDay += 1; //1일 더함.
                     	count += 1; //1칸 더함.
                   }
                   else //여기는 실제 날짜 끝난 후임.
                   {
%>
         <td class="empty">&nbsp;</td>
<%
					}
				}
      }
}
%>
      </tr>
    </table>
    </td>
    </tr>
 </table>
 <br>
<%
if(flagSch==true) {
%>
 
<h3>스케줄</h3><br>
제목: ${scheduler.sch_title }<br>
날짜: ${scheduler.sch_date }<br>
내용: ${scheduler.sch_content }
<%
	if(flagLoc==true) {
%>
<br>
위치: ${scheduler.sch_location }<br>
<br>

	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 700px; height: 500px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbfbaf00b1a03aecfa7287dc81a31d6d"></script>
	<script>
//지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(<%=schduler.getSch_location()%>), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
//컨트롤러
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
//마커
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(<%=schduler.getSch_location()%>); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;"><%=schduler.getSch_title()%> <br><a href="https://map.kakao.com/link/map/<%=schduler.getSch_title()%>,<%=schduler.getSch_location()%>" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		iwPosition = new kakao.maps.LatLng(<%=schduler.getSch_location()%>); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>
	
<br>

<%
	}
}
%>
 
</body>
</html>