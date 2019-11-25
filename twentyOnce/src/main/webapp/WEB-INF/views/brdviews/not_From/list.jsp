<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../../resources/css/brd_css/tnotice_main.css">

<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
		<script type="text/javascript">
			
			function fn_list(page) {
				alert("페이지 값 전달 되나 ??");
				var searchType = $("#sel_searchType option:selected").val();
				var searchKeyword = $("#sel_searchkw").val();
				window.location.href="/twentyOnce/brdviews/not_From/list?curPage="+page+"&searchType="+searchType+"&searchkw="+searchKeyword;
				
			}
			function fn_contentview(not_num,curPage){
				alert("상세페이지 값 전달 되나 ??");
				window.location.href="/twentyOnce/brdviews/not_From/content_view?curPage="+curPage+"&not_num="+not_num+"&searchType="+"${paramMap.searchType}"+"&searchkw="+"${paramMap.searchkw}";
			}
			
			function fn_searchCC() {
				alert("검색 값 전달 되나 ??");
				// 선택된 옵션의 text, value값 구하기
				var searchType = $("#sel_searchType option:selected").val();
				var searchKeyword = $("#sel_searchkw").val();
				//검색 할 때마다 1페이지. 페이지 변환시 타입과 키워드 전달
				window.location.href="/twentyOnce/brdviews/not_From/list?curPage=1&searchType="+searchType+"&searchkw="+searchKeyword;	
			}
		</script>
</head>
<body>
	<table border="0" class="twidth">
	<caption><a href="#">home</a> /&nbsp notice</caption>
	<thead>
		<tr>
			<th>num</th>
			<th>title</th>
			<th>name</th>
			<th>date</th>
			<th>view</th>
		</tr>
		</thead>
		<%-- 		 ${}를 이용해서 데이터값을 가져온다. --%>
<tbody>
		<c:forEach items="${paramMap.list}" var="dto">
			<tr>
				<td>${dto.not_num }</td>

				<td><a href="javascript:fn_contentview('${dto.not_num}','${paramMap.paging.curPage}')">
						${dto.not_title }</a></td>

				<td>${dto.not_name }</td>
				<td><fmt:formatDate value="${dto.not_date}"
						pattern="yyyy.MM.dd" /></td>
				<td>${dto.not_view }</td>
			</tr>
		</c:forEach>
</tbody>
<tfoot>
		<tr>
		<!-- 로그인한 사용자만 글쓰기 버튼 활성화하기 -->
<%-- 		<c:if test="${sessionScope.not_name != null} }" > --%>
		<td colspan="5">
		<a href="write_view"><input type="button" value="write"></a></td>
<%-- 		</c:if> --%>
			
		</tr>
</tfoot>
	</table>
	<!-- paging -->

		<div>
				<c:if test="${paramMap.paging.curPage>1 }">
					<!-- 현재페이지가 1보다 클때 -->
					<!-- 처음을 누르면 1페이지로 -->
					<a href="javascript:fn_list('1')">[처음]</a>
					</c:if>
					<c:if test="${paramMap.paging.curBlock>1 }">
					<!-- 이전 페이지 블록으로 이동. 현재 페이지 블록이 1보다 크다면 -->
					<a href="javascript:fn_list('${paramMap.paging.prevPage}')">[이전]</a>
					</c:if>
			
				<c:forEach  begin="${paramMap.paging.blockBegin }" end="${paramMap.paging.blockEnd}" var="i" step="1">
					<!-- 하나의 블록 시작 페이지 ~ 끝 페이지 -->
					<c:choose>
						<c:when test="${i eq paramMap.paging.curPage }">
							<!-- 위에 변수 i의 값과 현재 페이지의 값이 같을때 -->
							<span style="color:orange"> ${i} </span>
						</c:when>
						<c:otherwise>
							<a href="javascript:fn_list('${i }')"><c:out value="${i }"></c:out></a>
							
							<!-- 			이거 없음 페이지 이동식 데이터 값 안들고 간다~~ -->
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${paramMap.paging.curPage <= paramMap.paging.totBlock }">
					<a href="javascript:fn_list('${paramMap.paging.nextPage }')">[다음]</a>
					</c:if>
					<c:if test="${paramMap.paging.curPage < paramMap.paging.totPage }">
					<a href="javascript:fn_list('${paramMap.paging.totPage }')">[마지막]</a>
				</c:if>

		</div>
         <div> 
 			<select name="searchType" id="sel_searchType" >
 			<c:choose>
 			<c:when test="${paramMap.searchType =='not_title'}">
				<option value="not_title" selected="selected">제목</option>
				<option value="not_content"	>내용</option>
				<option value="not_name" >작성자</option>
				</c:when>
			<c:when test="${paramMap.searchType =='not_content'}">
				<option value="not_title" >제목</option>
				<option value="not_content"	selected="selected">내용</option>
				<option value="not_name" >작성자</option>
				</c:when>
				
		<c:otherwise>
				<option value="not_title" >제목</option>
				<option value="not_content"	>내용</option>
				<option value="not_name" selected="selected">작성자</option>
       </c:otherwise>				
				</c:choose>
				</select>
				
		<input type="text" name="searchkw" id="sel_searchkw" style="width: 150px;" maxlength="50"
				value="${paramMap.searchkw }" placeholder="Search" /> 
				
		<a href="javascript:fn_searchCC()" class="btn_search">검색</a> 
 		</div> 
	

</body>
</html>


