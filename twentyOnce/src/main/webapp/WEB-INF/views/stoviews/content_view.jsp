<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/css/storecss/st_detail.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>	
	  <script>
	    // 주문량 계산 
        $(function(){    	
  			$('#bt_down').click(function(){ 	
    			var n = $('#bt_down').index(this);
    			var num = $(".num:eq("+n+")").val();    			
    			num = $(".num:eq("+n+")").val(num*1-1); 	
  			});  	
        	
        	$('#bt_up').click(function(){ 
   				var n = $('#bt_up').index(this);
    			var num = $(".num:eq("+n+")").val();
    			num = $(".num:eq("+n+")").val(num*1+1); 
  			});
	
		}) 
    </script>
<title>상품 상세보기</title>
<%
	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto==null?false:true;
%>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- Demo page craeted by https://github.com/petr-goca -->
<header role="banner" aria-label="Heading">
 <link rel="stylesheet" type="text/css" href="css/st_detail.css">
  <div class="header">
    <div class="_cont">
      <div class="shadow">
        <a class="logo" title="Home" href='list'>God twenty</a>
      </div>
      <div class="mobile-menu">
        <form action="/search" method="get" id="find">
          <div>
            <input type="text" name="q" id="find-input" class="find-input" placeholder="Search..." value="">
            <button type="submit" title="Search" id="find-btn">Search</button>
          </div>
        </form>
        <%
          	// 관리자가 아닐 경우
        	if(memdto.isAdmin()==false){
        		 %>		
        		 <a id="customer_login_link" href="../../home/memviews/loginform">Sign In</a>
        		 <% 
        	}else{
        		%>
        		<h2 id="customer_login_link"><%=memdto.getId() %>님이 로그인 한 상태입니다.</h2>
        		<%		
        	}
        		%>	
        		
        	<%
        		// 관리자일 경우
        		if(memdto.isAdmin()){		
        	%>
        		<a href="modify_view?sto_code=${content_view.sto_code }"><button type="button" class="modify">수정하기</button></a>
    			<a href="delete?sto_code=${content_view.sto_code } "><button type="button" class="delete">삭제하기</button></a>
        	<%
        		}
        	%>	
        
        <nav role="navigation" aria-label="Catalog">
          <ul>
            <li class="nc nav-li-category">
              <a class="nc nav-category" data-subcategories="1">Twice</a>
              <ul class="nc">
              </ul>
            </li>
            
          </ul>
        </nav>
      </div>
      <span id="nav-icon"></span>
    </div>
  </div>
  <div class="breadcrumb" role="navigation" aria-label="Breadcrumbs">
    <div class="_cont">
      <ol>
        <li><a title="Back to the frontpage" href="/twentyOnce">Home</a></li>
        <li><a title="" href="list">Store</a></li>
        <li>${content_view.sto_name }</li>
      </ol>
    </div>
  </div>
</header>
<section aria-label="Main content" role="main" class="product-detail">
  <div itemscope itemtype="http://schema.org/Product">
    <meta itemprop="url" content="http://html-koder-test.myshopify.com/products/tommy-hilfiger-t-shirt-new-york">
    <meta itemprop="image" content="//cdn.shopify.com/s/files/1/1047/6452/products/product_grande.png?v=1446769025">
    <div class="shadow">
      <div class="_cont detail-top">
        <div class="cols">
          <div class="left-col">
            <div class="thumbs">
              <a class="thumb-image active" href="//cdn.shopify.com/s/files/1/1047/6452/products/product_1024x1024.png?v=1446769025" data-index="0">
                <span><img src="../resources/images/stoimg/${content_view.sto_imageurl }" alt="Tommy Hilfiger T-Shirt New York"></span>
              </a>
              <a class="thumb-image" href="//cdn.shopify.com/s/files/1/1047/6452/products/tricko1_1024x1024.jpg?v=1447104179" data-index="1">
                <span><img src="../resources/images/stoimg/sana_5.jpg" alt="Tommy Hilfiger T-Shirt New York"></span>
              </a>
              <a class="thumb-image" href="//cdn.shopify.com/s/files/1/1047/6452/products/tricko2_1024x1024.jpg?v=1447104180" data-index="2">
                <span><img src="../resources/images/stoimg/sana_6.jpg" alt="Tommy Hilfiger T-Shirt New York"></span>
              </a>
              <a class="thumb-image" href="//cdn.shopify.com/s/files/1/1047/6452/products/tricko3_1024x1024.jpg?v=1447104182" data-index="3">
                <span><img src="../resources/images/stoimg/sana_7.jpg" alt="Tommy Hilfiger T-Shirt New York"></span>
              </a>
            </div><!-- url('//cdn.shopify.com/s/files/1/1047/6452/products/product_1024x1024.png?v=1446769025') -->
            <div class="big">
              <span id="big-image" class="img" quickbeam="image" style="background-image: url('../resources/images/stoimg/${content_view.sto_imageurl }')" data-src="//cdn.shopify.com/s/files/1/1047/6452/products/product_1024x1024.png?v=1446769025"></span>
              <div id="banner-gallery" class="swipe">
                <div class="swipe-wrap">
                  <div style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/product_large.png?v=1446769025')"></div>
                  <div style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko1_large.jpg?v=1447104179')"></div>
                  <div style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko2_large.jpg?v=1447104180')"></div>
                  <div style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko3_large.jpg?v=1447104182')"></div>
                </div>
              </div>
              <div class="detail-socials">
                <div class="social-sharing" data-permalink="http://html-koder-test.myshopify.com/products/tommy-hilfiger-t-shirt-new-york">
                  <a target="_blank"  class="share-facebook" title="Share"></a>
                  <a target="_blank"  class="share-twitter" title="Tweet"></a>
                  <a target="_blank"  class="share-pinterest" title="Pin it"></a>
                </div>
              </div>
            </div>
          </div>
          <div class="right-col">
            <h1><p itemprop="name" class="sto_name">${content_view.sto_name }</p></h1>
            
            <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
              <meta itemprop="priceCurrency" content="USD">
              <link itemprop="availability" href="http://schema.org/InStock">
              <div class="price-shipping">
                <div class="price" id="price-preview" quickbeam="price" quickbeam-price="800">
                  정상가: <p class="sto_price"><fmt:formatNumber pattern="###,###,###" value="${content_view.sto_price }" />원</p>
                  <br>
                  회원 할인가: <p class="sto_price"><fmt:formatNumber pattern="###,###,###" value="${content_view.mem_price}" />원</p>
                  <!-- 여기서 멤버 할인가 -->
                  <!-- 여기서 멤버 할인가 -->
                  <!-- 여기서 멤버 할인가 -->
                  <!-- 여기서 멤버 할인가 -->
                  <!-- 여기서 멤버 할인가 -->	
                </div>
                <div class="guide">
                  <a href="#" onclick="javascript:openWin();">상품 가이드</a>
                  
                  <script type="text/javascript">
                  	function openWin(){
                  		window.open("openWin", "상품 가이드", "width=800, height=700, menubar=no, scrollbar=no, resizable=yes");
                  	}
                  </script>
                </div>
              </div>
              
              <!-- <form method="post" enctype="multipart/form-data" id="AddToCartForm"> -->
              <form name="form" method="post" action="addcart" id="AddToCartForm">
              	<br><br>
                <div class="btn-and-quantity-wrap">
                  <div class="btn-and-quantity">
                  	
                    <div class="spinner">
                    <p class="sto_quantity">
                      <span class="btn minus" id="bt_down"></span>
                      <!-- <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_up"/> -->
                      <input type="text" id="num" name="num" class="num" value="1" />
                      <input type="hidden" id="product_id" name="product_id" value="2721888517">
                       <!-- <img src="http://placehold.it/10x10" alt="" width="10" height="10" class="bt_down" /> -->
                      <span class="q">개</span>
                      <span class="btn plus" id="bt_up"></span>
                      </p>
                    </div>
                                    
                    <%-- <a href="cart_view?sto_code=${content_view.sto_code }"> --%>
                    <span id="AddToCartText"><button id="AddToCart" quickbeam="add-to-cart" type="button" class="addCart_btn2" onclick="location.href='order_view?sto_code=${content_view.sto_code}'">구매하기</button></span>
                      <span id="AddToCartText"><button id="AddToCart" quickbeam="add-to-cart" type="button" class="addCart_btn">장바구니에 담기</button></span>
                      
                    	<input type="hidden" class="gdsNum" name="gdsNum" id="gdsNum" value="${content_view.sto_code }" />
              			<input type="hidden" class="userId" name="userId" id="userId" value="<%=memdto.getId() %>" />
                      	
                      	<%
                      		System.out.println("userId의 값은: "+memdto.getId());
                      	%>
                      	
                      <script type="text/javascript">
                      	  // addCart button 클릭 시, addCart로 ajax 전송
	                      $(".addCart_btn").click(function(){
	                    	   var gdsNum = $("#gdsNum").val();
	                    	   var cartStock = $(".num").val();
	                    	   var userId = $("#userId").val();
	                    	   
	                    	   var data = {
	                    	     gdsNum : gdsNum,
	                    	     cartStock : cartStock,
	                    	     userId : userId 
	                    	   };
                    	   
                    	   $.ajax({
	                    	    url : "addcart",
	                    	    type : "post",
	                    	    data : data,	
	                    	    success : function(result){
	                    	     	alert("카트 담기 성공");
	                    	     	$(".num").val("1");
	                    	    },
	                    	    
	                    	    error : function(){
	                    	     alert("카트 담기 실패");
	                    	    }
	                    	   });
                    	  });
                    </script>
                    </div>
                  </div>
                        </form>
                </div>
              
              <div class="tabs">
                <div class="tab-labels">
                  <span data-id="1" class="active">상품 정보</span>
                  <span data-id="2">상품 태그</span>
                </div>
                <div class="tab-slides">
                  <div id="tab-slide-1" itemprop="description"  class="slide active">
                    2018. 9. 12. 발매 (워너뮤직재팬) 정규 1집 앨범
                  </div>
                  <div id="tab-slide-2" class="slide">
                  <!-- contant 내용이 들어갈 자리 -->
                  </div>
                </div>
              </div>
              <div class="social-sharing-btn-wrapper">
                <span id="social_sharing_btn">Share</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <aside class="related">
      <div class="_cont">
        <h2>You might also like</h2>
        <div class="collection-list cols-4" id="collection-list" data-products-per-page="4">
          <a class="product-box">
            <span class="img">
              <span style="background-image: url('../resources/images/stoimg/sana_5.jpg')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/product_030f9fc5-f253-4dca-a43a-fe2b719d0704_grande.png?v=1447530130')"></span>
            </span>
            <span class="text">
              <strong>${content_view.sto_name }</strong>
              <span>
                 ${content_view.sto_code }원
              </span>
              <div class="variants">
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
          <a class="product-box">
            <span class="img">
              <span style="background-image: url('../resources/images/stoimg/sana_6.jpg')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko1_613d5776-ea61-4f9b-abef-0ce847c63a67_grande.jpg?v=1447530150')"></span>
            </span>
            <span class="text">
              <strong>${content_view.sto_name }</strong>
              <span>
                 ${content_view.sto_code }원
              </span>
              <div class="variants"> 
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
          <a href="/collections/men/products/copy-of-copy-of-copy-of-tommy-hilfiger-t-shirt-new-york-4" class="product-box">
            <span class="img">
              <span style="background-image: url('../resources/images/stoimg/sana_7.jpg')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko2_6c949188-dba0-4789-9434-c0821b92f3f4_grande.jpg?v=1447530164')"></span>
            </span>
            <span class="text">
              <strong>${content_view.sto_name }</strong>
              <span>
                ${content_view.sto_code }원
              </span>
              <div class="variants">
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
          <a class="product-box">
            <span class="img">
              <span style="background-image: url('../resources/images/stoimg/sana_8.jpg')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko3_fd08d231-654c-4304-81b2-9191e6fd141e_grande.jpg?v=1447530674')"></span>
            </span>
            <span class="text">
              <strong>${content_view.sto_code }</strong>
              <span>
                ${content_view.sto_code }원
              </span>
              <div class="variants">  
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
          <a class="product-box hidden">
            <span class="img">
              <span style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko1_bba77d82-7f85-47af-9a45-f4700bcc04ad_grande.jpg?v=1447530689')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/product_f065e961-d296-48a8-8a67-a3532200e257_grande.png?v=1447530689')"></span>
            </span>
            <span class="text">
              <strong>Tony Hunfinger T-Shirt New York 6</strong>
              <span>
                ${content_view.sto_code }원
              <div class="variants">             
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
          <a class="product-box hidden">
            <span class="img">
              <span style="backg	round-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko2_bf59c7f2-7c1f-4822-9494-6a984598a56c_grande.jpg?v=1447530706')" class="i first"></span>
              <span class="i second" style="background-image: url('//cdn.shopify.com/s/files/1/1047/6452/products/tricko1_c6fa0fc1-99a0-4bd0-a1d8-0270127977fc_grande.jpg?v=1447530706')"></span>
            </span>
            <span class="text">
              <strong>Tony Hunfinger T-Shirt New York 7</strong>
              <span>
                 ${content_view.sto_code }원
              </span>
              <div class="variants">   
                <div class="variant">
                  <div class="var color blue available">
                    <div class="c" style="background-color: blue;"></div>
                  </div>
                  <div class="var color red available">
                    <div class="c" style="background-color: red;"></div>
                  </div>
                  <div class="var color yellow available">
                    <div class="c" style="background-color: yellow;"></div>
                  </div>
                </div>
              </div>
            </span>
          </a>
        </div>
        <div class="more-products" id="more-products-wrap">
          <span id="more-products" data-rows_per_page="1">More products</span>
        </div>
      </div>
    </aside>
  </div>

</section>
<footer role="contentinfo" aria-label="Footer">
  <div class="_cont">
    <div class="socials">
      <strong>follow us:</strong>
      <ul>
        <li><a  title="html-koder / test on Twitter" class="tw" target="_blank">Twitter</a></li>
        <li><a  title="html-koder / test on Facebook" class="fb" target="_blank">Facebook</a></li>
        <li><a  title="html-koder / test on Instagram" class="in" target="_blank">Instagram</a></li>
        <li><a  title="html-koder / test on Pinterest" class="pi" target="_blank">Pinterest</a></li>
      </ul>
    </div>
    <div class="top">
      <div class="right">
        <form method="post" action="/contact" class="contact-form" accept-charset="UTF-8">
          <input type="hidden" value="customer" name="form_type" /><input type="hidden" name="utf8" value="✓" />
          <div>
            <input type="hidden" id="contact_tags" name="contact[tags]" value="newsletter"/>
            <input type="text" id="contact_email" name="contact[email]" placeholder="Submit e-mail for special offers...">
            <button type="submit" title="Newsletter Signup">OK</button>
          </div>
        </form>
      </div>
      <div class="left">
        <span class="phone">+010 8800 9955</span>
        <a class="mail" href="mailto:email.from@settings.com">email.from@naver.com</a>
      </div>
    </div>
    <div class="bottom">
      <div class="left">
        <nav role="navigation" aria-label="Service menu">
          <ul>
            <li><a >Lorem ipsum</a></li>
            <li><a >About Us</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</footer>

<!-- Quickbeam cart-->

<div id="quick-cart" quickbeam="cart">
  <a id="quick-cart-pay" quickbeam="cart-pay" class="cart-ico">
    <span>
      <strong class="quick-cart-text">Pay<br></strong>
      <span id="quick-cart-price">0</span>
      <span id="quick-cart-pay-total-count">0</span>
    </span>
  </a>
</div>

<!-- Quickbeam cart end -->

</body>
</html>