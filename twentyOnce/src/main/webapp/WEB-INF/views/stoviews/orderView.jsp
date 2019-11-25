<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
 <style>

 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }

 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 .deliveryChange { text-align:right; }
 .delivery1_btn,
 .delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>orderView</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
<h3>orderView</h3>
 <section id="content">
 <div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
   <c:if test="${status.first}">
    <p><span>수령인</span>${orderView.orderRec}</p>
    <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
    <p><span>상태</span>${orderView.delivery}</p>
	   
	   	<div class="deliveryChange">
			 <form role="form" method="post" class="deliveryForm" action="delivery">
			 
			  <input type="hidden" name="orderId" value="${orderView.orderId}" />
			  <input type="hidden" name="delivery" class="delivery" value="" />
			  
			  <button type="button" class="delivery1_btn">배송 중</button>
			  <button type="button" class="delivery2_btn">배송 완료</button>
			  
			  <script> 
			    // 배송 중 버튼 클릭 시, delivery의 val 값을 배송 중으로 변경한다.
			    $(".delivery1_btn").click(function(){
			    	$(".delivery").val("배송 중");
			    	alert('배송 중입니다.');
			    	run();
			    });
			   
			    // 배송 완료 버튼 클릭 시, delivery의 val 값을 배송 완료로 변경한다.
			    $(".delivery2_btn").click(function(){
			    	$(".delivery").val("배송 완료");
			    	alert('배송 완료입니다.');
			     	run();			
			    });
			   
			    // run()으로 통과한 후, deliveryForm을 submit 시킨다.
			    function run(){
			    	$(".deliveryForm").submit();
			    }			  
			  </script>
			 </form>
		</div>
   </c:if>
   
  </c:forEach>
 </div> 
 
 <ul class="orderView">
  <c:forEach items="${orderView}" var="orderView"> 
  <li>
   <div class="thumb">
    <img src="../resources/images/stoimg/${orderView.sto_imageurl }" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${orderView.sto_name}<br />
     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.sto_price}" /> 원<br />
     <span>구입 수량</span>${orderView.cartStock} 개<br />
     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.sto_price * orderView.cartStock}" /> 원                  
    </p>
   </div>
  </li>     
  </c:forEach>
 </ul>
</section> 
</body>
</html>