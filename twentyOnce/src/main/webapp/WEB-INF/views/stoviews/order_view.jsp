<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<%
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto==null?false:true;
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
</head>
<body>
	<h3>결제 페이지</h3>
	
	<table>
		<tr>
			<td>
				<img alt="img" src="../resources/images/stoimg/${order_view.sto_imageurl }" style="width: 250px; height: 250px;">
			</td>
		</tr>
		
		<tr>
			<td>상품 코드: ${order_view.sto_code }</td>
		</tr>
		
		<tr>
			<td>상품명: ${order_view.sto_name }</td>
		</tr>
		
		<tr>
			<td>개당 가격: <fmt:formatNumber pattern="###,###,###" value="${order_view.sto_price}" />원</td>
		</tr>
		
		<tr>
			<td>구입 수량: ${order_view.sto_quantity }개</td>
		</tr>
		
		<tr>
			<td>최종 가격: <fmt:formatNumber pattern="###,###,###" value="${order_view.sto_price * order_view.sto_quantity }" />원</td>
		</tr>	
	</table> 
	<hr>
					<div class="orderInfo">
 <form action="orderInfo" role="form" method="post" autocomplete="off">
    
  <input type="hidden" name="amount" value="${sum}" />
  
<%--   <dir class="inputArea">
  	<input type="hidden" name="orderId" value="${sum}" />
  </dir> --%>
    
  	<%
	  	Calendar cal= Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONDAY) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum="";
		
		for (int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum+1;
		System.out.println("orderId: "+orderId);
  	%>
  <div class="inputArea">
  	<input type="hidden" name="orderId" id="orderId" value="<%=orderId%>">
  </div>
   
  <div class="inputArea">
  	<input type="hidden" name="userId" id="userId" value="<%=memdto.getId()%>">
  </div>
  
  <div class="inputArea">
  	<input type="hidden" name="orderDate" id="orderDate" value="<%=ymd%>">
  </div> 
  
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="orderRec" id="orderRec" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="orderPhone" id="orderPhone" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr1">우편번호</label>
   <input type="text" name="userAddr1" id="userAddr1" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr2">1차 주소</label>
   <input type="text" name="userAddr2" id="userAddr2" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr3">2차 주소</label>
   <input type="text" name="userAddr3" id="userAddr3" required="required" />
  </div>
  
  <div class="inputArea">
   <button type="submit" class="order_btn">주문</button>
   <button type="button" class="cancel_btn">취소</button> 
   
   <script>
		$(".cancel_btn").click(function(){
	 		$(".orderInfo").slideUp();
	 		$(".orderOpne_bnt").slideDown();
		});      
     
    	$(".order_btn").click(function(){
    		alert('구매 성공');
    	}
	</script>
  </div>
 </form> 
</div>
</body>
</html>