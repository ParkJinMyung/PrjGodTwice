<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="../resources/css/brd_css/nstyle.css">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('content', {
			width : '700px',
			height : '400px',
			filebrowserUploadUrl : 'brdviews/not_From/community/imageUpload'
		});

		CKEDITOR.on('dialogDefinition', function(ev) {
			var dialogName = ev.data.name;
			var dialogDefinition = ev.data.definition;
			var dialog = ev.data.definition.dialog;

			switch (dialogName) {
			case 'image': //Image Properties dialog
				 dialog.on('show', function (obj) {
	                    this.selectPage('Upload'); //업로드텝으로 시작
	                });
				dialogDefinition.removeContents('Link');
				dialogDefinition.removeContents('advanced');
				break;
			}
		});
		

		$("#list").click(function() {
			location.href = "/twentyOnce/brdviews/not_From/list";
		});

		$("#save").click(function() {

			//에디터 내용 가져옴
			var content = CKEDITOR.instances.content.getData();

			//널 검사. (아이디가 # 인 input요소의 값을 공백을 제거하고 가져옴) 그게 공백이라면
			if ($("#subject").val().trim() == "") {
				alert("제목을 입력하세요.");
				$("#subject").focus();
				return;
			}

			if ($("#writer").val().trim() == "") {
				alert("작성자를 입력하세요.");
				$("#writer").focus();
				return;
			}

			document.form1.submit();

		});
	});
</script>
</head>
<body>
<body>

	<form action="write" method="post" name="form1">
		<div align="center">

			<table width="1200px">
				<tr>
					<td>TITLE: <input type="text" id="subject" name="not_title"
						style="width: 600px;" placeholder="제목"
						value="${content_view.not_title}" />
				</tr>
				<tr>
					<td>NAME: <input type="text" id="writer" name="not_name"
						style="width: 170px;" maxlength="10" placeholder="수정할 것 각각 게시판뜻대로"
						value="${content_view.not_name}" />
					</td>
				</tr>
				<tr>
					<td><textarea id="content" name="not_content" rows="10"
							cols="80">${content_view.not_content}</textarea></td>
				</tr>
				<tr>
					<td align="right">
						<button id="list" name="list">게시판</button>
						<button id="save" name="save">저장</button>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>