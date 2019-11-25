<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/css/stoimg/nstyle.css">
<title>상품 수정하기</title>
</head>
<body>
<h3>상품 수정하기</h3>
	<form action="modify" method="post">
	<table>
		<input type="hidden" name="sto_code" value="${modify_view.sto_code }" />
		<tr>
			<td class="left">상품 코드</td>
			<td>${modify_view.sto_code}</td>
		</tr>
		
		<tr>
			<td class="left">상품 섬네일</td>
			<td>
				<img alt="img" style="width: 250px; height: 250px;" src="../resources/images/stoimg/${modify_view.sto_imageurl }">
			</td>
		</tr>
		
		<tr>
			<td class="left">상품명</td>
			<td><input type="text" name="sto_name" value="${modify_view.sto_name }" size="20"></td>
		</tr>
			
		<tr>
			<td class="left">가격</td>
			<td><input type="text" name="sto_price" value="${modify_view.sto_price }" size="20"></td>
		</tr>
		
		<tr>
			<td class="left">원산지</td>
			<td><input type="text" name="sto_country" value="${modify_view.sto_country }" size="20"></td>
		</tr>
		
		<tr>
			<td class="left">수량</td>
			<td><input type="text" name="sto_quantity" value="${modify_view.sto_quantity }" size="20"></td>
		</tr>

		<tr>
			<td class="left">세부 내용</td>
			<td><input type="text" name="sto_contant" value="${modify_view.sto_contant }" size="20" ></td>	
		</tr>
		
 		<tr>
			<td colspan="2"><input type="submit" value="modify" />
				<a href="content_view?sto_code=${modify_view.sto_code }">뒤로가기</a>
				</td>
				<td></td>
		</tr> 
			
		</table>
	</form>
</body>
</html>