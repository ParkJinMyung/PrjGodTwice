<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="twentyOnce.mem.dto.SaveIdDto"%>

<%
	SaveIdDto iddto = (SaveIdDto) request.getAttribute("iddto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
 <link rel="stylesheet" href="../resources/css/mem_css/frontLogin.css">
 <script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디 입력");
			inputForm.id.focus();
			return false;
		}

		if (!inputForm.pw.value) {
			alert("비밀번호 입력");
			inputForm.pw.focus();
			return false;
		}
	}

// 	function goJoinForm() {
// 		alert("Join");
// 		$('.replyModal').attr("style","display:block");
		
// 	}
$(function() {
  
  var modBtn  = $('.sign-up-button'),
      modal   = $('#modal'),
      close   = modal.find('.close'),
      modContent = modal.find('.modal-content');
  
  // open modal when click on open modal button 
  modBtn.on('click', function() {
    modal.css('display', 'block');
    modContent.removeClass('modal-animated-out').addClass('modal-animated-in');
  });
  
  // close modal when click on close button or somewhere out the modal content 
  $(document).on('click', function(e) {
    var target = $(e.target);
    if(target.is(modal) || target.is(close)) {
      modContent.removeClass('modal-animated-in').addClass('modal-animated-out').delay(300).queue(function(next) {
        modal.css('display', 'none');
        next();
      });
    }
  });
  
});

</script>
<style type="text/css">
/* Modal */
.modal {
  background-color: rgba(0,0,0,.65);
  display: none;
  overflow: auto;
  position: fixed;
  z-index: 1000;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

/* Modal Content */
.modal-content {
  position: relative;
  top: 0px;
  width: 900px;
  height:800px;
  margin: 0 auto;
  background-color: #fff;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}
.modal-animated-in {
  animation: totop-in .3s ease;
}
.modal-animated-out {
  animation: totop-out .3s ease forwards;
}
.modal-header {
  background-color: #2B2D42;	
  width: 97%;
  height: 60px;
  line-height: 60px;
  padding-left: 20px;
}
.modal-content .close {
  position: absolute;
  right: 0;
  top: 0;
  background-color: #222;
  width: 60px;
  height: 60px;
  color: #fff;
  line-height: 60px;
  text-align: center;
  cursor: pointer;
  transition: all .3s;
}
.modal-content .close:hover {
  background-color: #fff;
  color: #222;
}

/* Modal Body */
.modal-body {
  padding: 0 20px;
}
.modal-body ul {
  margin: 0;
  padding: 0;
  list-style: none;
}
.modal-body ul li {
  position: relative;
  display: block;
  margin-left: 20px;
  color: #555;
}
.modal-body ul li::before {
  position: absolute;
  content: '\f00c';
  color: #5cc560;
  left: -20px;
  top: 10px;
  display: inline-block;
  font: normal normal normal 14px/1 FontAwesome;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
}


.modal-header h3,
.modal-footer h3 {
  color: #fff;
}

/* Keyframes */
@keyframes totop-in {
  0% {
    top: 600px;
    opacity: 0;
  }
  100% {
    top: 0;
    opacity: 1;
  }  
}

@keyframes totop-out {
  0% {
    top: 0px;
    opacity: 1;
  }
  100% {
    top: -100%;
    opacity: 0;
  }  
}
</style>

</head>
<div id="toptop"></div>
<body>
	<form action="../frontAfterviews/twfrontAfter" id="loginForm" method="post" name="loginInfo"
		onsubmit="return checkValue()">

		<!--  로그인 폼 시작-->
		<div class="form-container">
			<div id="form-title">TWICE LOVE</div>
			
				<label for="userId">YOUR ID</label> <input type="text" name="id"
					class="text-input" value="${iddto.ids_id }" />
			

			<p>
				<label for="userPWD">PASSWORD</label> <input type="password"
					name="pw" class="text-input" value="${iddto.ids_pw }" />
			</p>
			<div class="login">
				<input type="submit" value="LOGIN" class="login-button" />
				<div class="sign-up-button" onclick="javascript:goJoinForm()" >SIGN UP</div>
			</div>
       <div>
			<p class="password-rec" style="text-align: center;">
				Recover Your Password <a href="#">Here</a>
			</p>
		        <p id="btn1" style="text-align: center;">
		                <label for="saveId">SAVE ID</label>
		                <input type="checkbox" name="saveId" id="saveId" value="saveIdYes" <%=iddto.getCheck() %> />
		                <label for="secure">SECURE CONTECT</label>
		                <input type="checkbox" id="secure" value="secureYes" />
		        </p>
		</div>
		
		</div>
	</form>
<!-- Modal -->
<!-- Modal -->
<form action="joinproc" method="post" name="joinInfo" onsubmit="return checkValue()">
<div id="modal" class="modal">
  <!-- Modal Content -->
  <div class="modal-content">
    <!-- Modal Header -->
    <div class="modal-header">
      <h3 class="header-title">MEMBER JOIN</h3>
      <div class="close fa fa-close"></div>    
    </div>
    <!-- Modal Body -->

    <div class="modal-body">
      <h3>Hello</h3>
      YOUR ID <input type="text" name="id" size="10" class="middle"><br>
      PASSWORD <input type="password" name="pw" size="10" class="middle"><br>
      NAME <input type="text" name="name" size="10" class="middle"><br>
      PHONE <input type="text" name="phone" size="10" class="middle"><br>
      E-MAIL <input type="text" name="email" size="10" class="middle"><br>
      ADDRRESS <input type="text" name="addr" size="10" class="middle"><br>
      <input type="submit" value="JOIN~" class="middle">
      <input type="button" value="돌아가기" onclick="goBack()">
   
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>
</div>
</form>

</body>
</html>