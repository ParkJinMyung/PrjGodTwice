<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/css/stocss/store.css">
<link type="text/css" rel="stylesheet" href="../resources/css/stocss/menu.css">
<link type="text/css" rel="stylesheet" href="../resources/css/nstyle.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<title>상품 추가하기</title>
</head>
<body>
    <div id="main">
        <div id="logo"><a href="main.html"><img src="image/twicelogo.png"></a></div>
        <div id="lg"><a href="#" class="login">로그인</a> | <a href="join.html" class="member">회원가입</a></div>
        <div id="TW1">

        </div>
        <nav id="top_menu">
            <ul>
                <li><a href="main.html" id="menu1">HOME</a></li>
                <li><a href="profile.html" id="menu2">PROFILE</a></li>
                <li><a href="gallery.html" id="menu3">GALLERY</a></li>
                <li><a href="video.html" id="menu4">VIDEO</a></li>
                <li><a href="notice.html" id="menu5">NOTICE</a></li>
                <li><a href="schedule.html" id="menu6">SCHEDULE</a></li>
                <li><a href="store.html" id="menu7">STORE</a></li>
                <li><a href="#" id="menu8">DUCKZILL</a></li>
            </ul>
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="">
                    <button type="submit" class="searchButton">
                        <span class="demoSpan1">
                        </span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>

	<form action="write" method="post" enctype="multipart/form-data">
<table>
		<tr>
			<td class="left">상품코드</td>
			<td><input type="hidden" name="sto_code" size="50" /></td>
		</tr>
		
		<tr>
			<td class="left">상품명</td>
			<td><input type="text" name="sto_name" size="50" /></td>
		</tr>
		
		<tr>
			<td class="left">가격</td>
			<td><input type="text" name="sto_price" size="50" /></td>
		</tr>
		
		<tr>
			<td class="left">상품 재고</td>
			<td><input type="text" name="sto_quantity" size="50" /></td>
		</tr>
		
		<%		
		  	Calendar cal= Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONDAY) + 1);
			String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			
			System.out.println("ymd 달력의 값은: "+ymd);
		%>
		
		<tr>
			<td class="left">날짜</td>
			<td><input type="hidden" id="sto_date" name="sto_date" value="<%=ymd%>" /></td>
		</tr>
		
		<tr>
			<td class="left">원산지</td>
			<td>
				<select name="sto_country">
					<option value="중국">중국</option>
					<option value="일본">일본</option>
					<option value="캐나다">캐나다</option>
					<option value="한국">한국</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<Td class="left">상품 내용</Td>
			<td><textarea rows="5" cols="51" name="sto_contant"></textarea></td>
		</tr>
		
		<tr>
			<td><label for="sto_imageurl">썸네일</label></td>
			<td><input type="file" id="sto_imageurl" name="sto_imageurl"  /></td>
			<div class="sto_imageurl"><img src="" /></div>
			
			<script type="text/javascript">
					$("#sto_imageurl").change(function(){
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".sto_imageurl img").attr("src", data.target.result).width(200);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
			</script>
		</tr>
					
		<tr>
			<td class="left">상품 상세 이미지 1</td>
			<td><input type="file" name="sto_detailimageurl1" id="sto_detailimageurl1" /></td>
			<div class="sto_detailimageurl1"><img src="" /></div>
			
			<script type="text/javascript">
				$("#sto_detailimageurl1").change(function(){
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".sto_detailimageurl1 img").attr("src", data.target.result).width(200);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
			
			<%=request.getRealPath("/") %>
		</tr>
		
		<tr>
			<td class="left">상품 상세 이미지 2</td>
			<td><input type="file" name="sto_detailimageurl2" id="sto_detailimageurl2" /></td>
			<div class="sto_detailimageurl2"><img src="" /></div>
			
			<script type="text/javascript">
			$("#sto_detailimageurl2").change(function(){
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".sto_detailimageurl2 img").attr("src", data.target.result).width(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
			</script>
		</tr>
		
		<tr>
			<td class="left">상품 상세 이미지 3</td>
			<td><input type="file" name="sto_detailimageurl3" id="sto_detailimageurl3" /></td>
			<div class="sto_detailimageurl3"><img src="" /></div>
			
			<script type="text/javascript">
			
			$("#sto_detailimageurl3").change(function(){
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".sto_detailimageurl3 img").attr("src", data.target.result).width(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
			</script>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit" value="write" />&nbsp;&nbsp;
								<a href="list"><button type="button">상품 보기</button></a></td>
		</tr>
	</table>
	</form>
</body>
</html>