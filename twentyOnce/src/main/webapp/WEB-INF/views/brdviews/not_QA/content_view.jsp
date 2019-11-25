<%@page import="twentyOnce.mem.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% 	

	MemberDto memdto=(MemberDto)session.getAttribute("memdto");
	boolean login=memdto == null?false:true;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content_view.jsp</title>
<link type="text/css" rel="stylesheet"
	href="../../resources/css/brd_css/tnotice_detail.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	
	function fn_openBoardList() {
		alert("상세보기 열었던 페이지로 재 이동");
		window.location.href = "/twentyOnce/brdviews/not_QA/list?curPage=" + "${map.curPage}"
				+ "&searchType=" + "${map.searchType}" + "&searchkw="
				+ "${map.searchkw}";
	}
	// 댓글 시작
	$(document).ready(function() {
		$("#comment_btn").unbind("click").click(function(e) {
			e.preventDefault();
			fn_insertReply();
		}); 
		
		if($("#reply_list").children().length < 1){
			fn_viewReply(); //reply_list의 자식요소 의 개수가 1보다 미만일때
		}
	});
// 	<입력>
	 function fn_insertReply() {
		 
     var memdtoID = "${memdto.getId()}"; 
			if (memdtoID==null) { //로그인해서 id 값이 존재해야지 댓글 등록 가능하다.
				alert("로그인 하고 사용해라 이자식아");
			} else if ($("#reply_content").val().length < 1) {// 댓글 내용항목이 없음
				alert("댓글 작성하고 다시 시도해라 이자식아");
			} else { // if(memdtoID!=null) 조건 추가
				$.ajax({
					type : "POST",
					url : "replyWrite",
					data : {
						not_bno : "${content_view.not_num}",
						not_rid : "${content_view.not_name}",//ㅅㅈ
						not_rcontent : $("#reply_content").val()
					},
					success : function(map) {
						if (parseInt(map.result) == 1) {
							alert("값 입력 성공");
							$("#reply_content").val("");
							fn_viewReply($("#reply_list").find("span").text());
						} else {
							alert("값 입력 못받음");
						}
					},
					error : function(error) {
						alert(JSON.stringify(error));
					}
				});
			}
		}
	 //화면에서 보여지는 댓글들의 아이디는 본인이다.  로그인된 아이디 값으로 수정해야한다.
		function fn_viewReply(curPage) {
			$.ajax({
						type : "POST",
						url : "replyView",
						data : {
							not_bno : "${content_view.not_num}",
							curPage : curPage <1? 1: curPage
						},
						error: function(request,status,error){
							alert("code:"+ request.status+"\n"
									+"message:"+request.responseText+"\n"
									+"error:"+error+"서버가 응답 ㄴㄴ");
						},
						success : function(result) {
							$("#comment_table").find("caption").children().remove();
							$("#td_page").children().remove();
							$("#reply_list tr").next().remove();
							
							//댓글 카운팅 표시
							$("#comment_table").find("caption").text("댓글 : " + result.total);
							//페이징 처리
							var page = "";

							if (result.paging.curPage > 1) { //현재 페이지가 1보다 크다면
								page += "<a href = 'javascript:fn_viewReply(1)'>[처음]</a>";

							}
							if (result.paging.curBlock > 1) {// 현재있는 장소의 페이지 블록이 1보다 크다면 
								page += "<a href = 'javascript:fn_viewReply("
										+ result.paging.prevPage + ")'>[이전]</a>";
							}

							//번호 페이징 처리

							for (var i = result.paging.blockBegin; i <= result.paging.blockEnd; i++) {
								if (i == result.paging.curPage) {
									page += "<span style = 'color:orange'>" + i
											+ "</span>";

								} else {
									page += "<a href='javascript:fn_viewReply("+ i + ")'>" + i + "</a>";
								}
							}
							if (result.paging.curBlock <= result.paging.totBlock) {

								page += "<a href = 'javascript:fn_viewReply("
										+ result.paging.nextPage + ")'>[다음]</a>";
							}
							if (result.paging.curPage <= result.paging.totPage) {

								page += "<a href = 'javascript:fn_viewReply("
										+ result.paging.totPage + ")'>[끝]</a>";
							}

							$("#td_page").append(page);

							$(result.list).each(function(i) {

									var str = "<tr >"
									+ "<td>"+ result.list[i].NOT_RID+ "</td>"
									+ "<td>"+ result.list[i].NOT_RDATE + "</td>"
									+ "<td>"+"<div class='rcontent"+i+"'>"+ result.list[i].NOT_RCONTENT+"</div>"+ "</td>"
									+ "<td>"+ "<a class='btn' href='javascript:fn_commentDelete("+result.list[i].NOT_RNO+")'>삭제</a>" + "</td>"
									+ "<td>"+ "<a class='btn' href='javascript:fn_commentUpdate("+i+","+result.list[i].NOT_RNO+")'>수정</a>" + "</td>"
	                                + "</tr>";
						$("#reply_list").append(str);
					});
				}
			}); 
		}
//	 	<수정> 수정은 본인과 관리자만 가능하다.
		function fn_commentUpdate(i,rno){
//	 		모달페이지 오픈
			 $(".replyModal").attr("style","display:block");
// 기존값 뽑아오기
			var repCon = $(".rcontent"+i).text();
				$(".modal_repCon").val(repCon);
//	 			취소 닫기 버튼 클릭
			$(".modal_cancel").click(function(){
				$(".replyModal").attr("style","display:none");
			}); 
//	 		수정버튼 클릭
			$(".modal_modify_btn").click(function(){
				$.ajax({
					type:"POST",
					url:"replyUpdate",
					data:{  
						not_rno: rno,
						not_rcontent:$(".modal_repCon").val()
					},
					success : function(){
						alert("댓글 수정 완료");
						fn_viewReply($("#reply_list").find("span").text());
						$(".replyModal").attr("style","display:none");
					}
				});
				
			});		
		}
//	 		<삭제>  댓글 삭제는 본인과 관리자만 가능하다.
		function fn_commentDelete(rno){
			if(confirm("댓글을 삭제할거니?")){
				$.ajax({
					type:"POST",
					url:"replyDelete",
					data:{
						not_rno: rno
					},
					error: function(request,status,error){
						alert("code:"+ request.status+"\n"
								+"message:"+request.responseText+"\n"
								+"error:"+error+"서버가 응답 ㄴㄴ");
					},
					success : function(){
						alert("댓글 삭제 완료");
						//현재 보고 있는 댓글 페이지 번호 넘김
						fn_viewReply($("#reply_list").find("span").text());
					}
				});
			}
		}
</script>
</head>


<body>
	<h3>content_view.jsp</h3>
	<form action="content_modify" method="post">
		<input type="hidden" name="not_num" value="${content_view.not_num }" />
		<input type="hidden" name="not_name" value="${content_view.not_name }" />
		<input type="hidden" name="not_title"
			value="${content_view.not_title }" /> <input type="hidden"
			name="not_content" value="${content_view.not_content }" /> <input
			type="hidden" name="not_num" value="${content_view.not_num }" /> <input
			type="hidden" name="not_date" value="${content_view.not_date }" /> <input
			type="hidden" name="not_view" value="${content_view.not_view }" />

		<table border="0" class="twidth">
			<thead>
				<tr id="head_top">
					<th>${content_view.not_num }</th>
					<th>${content_view.not_title }</th>
					<th><fmt:formatDate value="${content_view.not_date}"
							pattern="yyyy.MM.dd" /></th>
				</tr>
				<tr id="head_bottom">
					<th>${content_view.not_name }</th>

					<th>조회수 ${content_view.not_view }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3" id="content">${content_view.not_content }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input type="submit" id="btnmodify"
						value="modify" /> &nbsp;&nbsp;<a
						href="javascript:fn_openBoardList()">LIST</a> &nbsp;&nbsp;<a
						href="delete?num=${content_view.not_num }">DELETE</a></td>
				</tr>
			</tfoot>
		</table>
	</form>
	<!-- 게시물 끝 -->
	<table>
		<tbody>
			<tr>
				<td>COMMENT</td>
				<td><textarea id="reply_content" name="not_rcontent" cols="85"
						rows="10" placeholder="댓글을 입력하시오"></textarea></td>
				<td><button name="comment_btn" id="comment_btn">등록</button></td>
			</tr>
		</tbody>
	</table>
	<!-- 댓글 조회 시작-->
	<table class="board_view" id="comment_table">

		<thead id="reply_list">
			<tr>
				<td id="td_page" style="text-align: center;"></td>
			</tr>
		</thead>
	
	</table>
	<style type="text/css">
 div.replyModal { position:relative; z-index:1; display:none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:470px; height:200px; }
 div.modalContent button { font-size:13px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
</style>

<div class="replyModal">

 <div class="modalContent">
  <div>
   <textarea class="modal_repCon" name="modal_reCon">${replyList.NOT_RCONTENT }</textarea>
</div>  
  
  <div>
   <button type="button" class="modal_modify_btn">댓글저장</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>


</body>
</html>