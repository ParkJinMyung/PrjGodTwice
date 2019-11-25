<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
	 section#content ul li { margin:10px 0; padding:10px 0; border-bottom: 1px solid #999; list-style: none; }
	 section#content ul li img { width:250px; height:250px; list-style: none; }
	 section#content ul li::after { content:""; display:block; clear:both; list-style: none; }
	 section#content div.thumb { float:left; width:250px; }
	 section#content div.gdsInfo { margin: 10px 0; padding: 0 10px 10px 10px; width:calc(100% - 270px); }
	 section#content div.gdsInfo { font-size:20px; line-height:2; }
	 section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:5px; }
	 section#content div.gdsInfo .delete { text-align:left; }
	 section#content div.gdsInfo .delete button { font-size:22px;
	            padding:5px 10px; border:1px solid #eee; background:#eee;}	            
	.allCheck { float:left; width:200px; }
	.allCheck input { width:16px; height:16px; }
	.allCheck label { margin-left:10px; }
	.delBtn { float:right; width:300px; text-align:right; }
	.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
	
	.checkBox { float:left; width:30px; }
	.checkBox input { width:16px; height:16px; }
	.listResult { padding:20px; background:#eee; }
	.listResult .sum { float:left; width:45%; font-size:22px; }
	
	.listResult .orderOpne { float:right; width:45%; text-align:right; }
	.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
	.listResult::after { content:""; display:block; clear:both; }
	
	.orderInfo { border:5px solid #eee; padding:20px; display: none; }
	.orderInfo .inputArea { margin:10px 0; }
	.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
	.orderInfo .inputArea input { font-size:14px; padding:5px; }
	#userAddr2, #userAddr3 { width:250px; }
	
	.orderInfo .inputArea:last-child { margin-top:30px; }
	.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
</style>
<%
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto==null?false:true;
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
</head>
<body>
	<h3>장바구니</h3>
	<a href="list">돌아가기</a>
	<section id="content">
 <ul>
 
 	<li>
 	
	  <div class="allCheck">
	   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
	   
	   <script type="text/javascript">
		   $("#allCheck").click(function(){
			   var chk = $("#allCheck").prop("checked");
			   if(chk) {
			    $(".chBox").prop("checked", true);
			   } else {
			    $(".chBox").prop("checked", false);
			   }
			});
	   </script>
	  </div>
	  <div class="delBtn">
	   <button type="button" class="selectDelete_btn">선택 삭제</button> 

	   <script type="text/javascript">
	     		 $(".selectDelete_btn").click(function(){
	     			  var confirm_val = confirm("정말 삭제하시겠습니까?");
	     			  
	     			  if(confirm_val) {
	     			   var checkArr = new Array();
	     			   
	     			   $("input[class='chBox']:checked").each(function(){
	     			    	checkArr.push($(this).attr("data-cartNum"));
	     			   });
	     			    
	     			 $.ajax({
	     			    	url : "deleteCart",
	     			    	type : "post",
	     			    	data : { chbox : checkArr },
	     			    	success : function(result){
	     			    		if (result == 1) {
									location.href = "stoviews/list";
								}else {
									alert("삭제 실패");		
								}
							}
	     			   	});
	     			  } 
	     			});
     		</script>
	  </div>
	  
 	</li>
 	
 	<c:set var="sum" value="0" />
 	
 	<c:forEach items="${cartList}" var="cartList"> 
  <li>
  	<div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
   <script>
	 $(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
	</script>
  	</div>
   <div class="thumb">
   <img src="../resources/images/stoimg/${cartList.sto_imageurl}" style="width: 250px; height: 250px;" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명 : </span>${cartList.sto_name}<br />
    <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.sto_price}" />원<br />
     <span>구입 수량 : </span>${cartList.cartStock}개<br />
     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.sto_price * cartList.cartStock}" />원
    </p>
    	<div class="delete">
     		<button type="button" class="delete_${cartList.cartNum }_btn">삭제</button>
     		
     		<script>
	     		 $(".delete_${cartList.cartNum}_btn").click(function(){
	     		  	var confirm_val = confirm("정말 삭제하시겠습니까?");
	     		  
	     		  	if(confirm_val) {
	     		   	var checkArr = new Array();
	     		   
	     		   	checkArr.push($(this).attr("data-cartNum"));
	     		              
	     		 $.ajax({
	     		    	url : "deleteCart",
	     		    	type : "post",
	     		    	data : { chbox : checkArr },
	     		    	success : function(result){
	     		     	if(result == 1) {            
	     		      	location.href = "cartList?userId="+<%=memdto.getId() %>;
	     		 	} else {
	     		      			alert("삭제 실패");
	     		     		}
	     				}
	     			});
	     		} 
	     	});  		
     		</script>
    	</div>
   </div>
  </li>
  <c:set var="sum" value="${sum + (cartList.sto_price * cartList.cartStock) }" />
   </c:forEach> 
 </ul>
 	
 	<div class="listResult">
	 	<div class="sum">
	  		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
	 	</div>
	 	<div class="orderOpne">
	  		<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
	  		
	  		<script>
			 $(".orderOpne_bnt").click(function(){
			  	$(".orderInfo").slideDown();
			  	$(".orderOpne_bnt").slideUp();
			 });      
			</script>
	 	</div>
	</div>
 	
	<div class="orderInfo">
 <form action="orderInfo" role="form" method="post" autocomplete="off">
    
  <input type="hidden" name="amount" value="${sum}" />
  
<%--   <dir class="inputArea">
  	<input type="hidden" name="orderId" value="${sum}" />
  </dir> --%>
    
    <input type="hidden" name=""> 
    
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
	</script>
  </div>
 </form> 
</div>
</section>
</body>
</html>