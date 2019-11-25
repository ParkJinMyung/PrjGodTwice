<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:url value=""></c:url>
<link href= '<c:url value='../../resources/packages/core/main.css' />' rel='stylesheet' />
<link href='<c:url value='../../resources/packages/daygrid/main.css' />' rel='stylesheet' />
<script src='<c:url value='../../resources/packages/core/main.js'/>' > </script>
<script src='<c:url value='../../resources/packages/daygrid/main.js'/>'>  </script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid' ]
      });
    
      calendar.render();
    });
    
   
</script>
</head>
<body>
 
<div id='calendar'></div>

</body>
</html>
