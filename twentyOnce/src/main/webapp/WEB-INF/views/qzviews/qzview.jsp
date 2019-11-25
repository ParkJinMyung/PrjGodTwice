<%@page import="twentyOnce.qz.dto.QuizProgress"%>
<%@page import="twentyOnce.qz.dto.QuizDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

QuizDto qdto=(QuizDto)request.getSession().getAttribute("qdto");
QuizProgress qprogress=(QuizProgress)request.getSession().getAttribute("qprogress");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function goNext(a) { //다음 이동
	
	//체크 여부 확인
	var isCheck = false;
    var arr_cb = document.getElementsByName("checkbox");
    var answer="";
    
    for(var i=0;i<arr_cb.length;i++){
        if(arr_cb[i].checked == true) {
            isCheck = true;
            answer=arr_cb[i];
            break;
        }
    }
	
	if(!isCheck) { //체크 안 함
		alert("하나 이상 체크");
		return false;
		
	} else { //다음 문제
		return answer;
		
	}
}


function oneCheckbox(a){ //체크박스 하나만

    var obj = document.getElementsByName("checkbox");

    for(var i=0; i<obj.length; i++){

        if(obj[i] != a){

            obj[i].checked = false;

        }
    }
}

</script>

</head>
<body>

<h3>qzview입니다</h3>
<br>
<br>
<label>
<%=qprogress.getQuizturn()+1 %>.
<%=qdto.getQz_quiz() %>
</label>
<br>
<br>
<form name="quizInfo" action="qzview" method="post" onsubmit="return goNext(this)">

<label><%=qdto.getQz_choicea() %></label>
<input name="checkbox" type="checkbox" value="1" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choiceb() %></label>
<input name="checkbox" type="checkbox" value="2" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choicec() %></label>
<input name="checkbox" type="checkbox" value="3" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choiced() %></label>
<input name="checkbox" type="checkbox" value="4" onclick="oneCheckbox(this)">
<br>
<label><%=qdto.getQz_choicee() %></label>
<input name="checkbox" type="checkbox" value="5" onclick="oneCheckbox(this)">
<br>
<br>
<input type="submit" value="다음 문제">
</form>
<br>

</body>
</html>