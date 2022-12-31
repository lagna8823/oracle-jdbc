<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Board</title>
		
		<!-- 부트스트랩 css 사용 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}./member/Resources/css/bootstrap.css">
		<!--  부트스트랩 js 사용 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}./member/Resources/js/bootstrap.js"></script>
		
		
		<style>
		html {
		  height: 100%;
		}
		body {
		  margin:0;
		  padding:0;
		  font-family: sans-serif;
		  background: linear-gradient(#141e30, #243b55);
		}
		
		.login-box {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 400px;
		  padding: 40px;
		  transform: translate(-50%, -50%);
		  background: rgba(0,0,0,.5);
		  box-sizing: border-box;
		  box-shadow: 0 15px 25px rgba(0,0,0,.6);
		  border-radius: 10px;
		}
		
		.login-box h2 {
		  margin: 0 0 30px;
		  padding: 0;
		  color: #fff;
		  text-align: center;
		}
		
		.user-box1 {
		  position: relative;
		}
		
		.user-box1 input {
		  width: 100%;
		  padding: 10px 0;
		  font-size: 16px;
		  color: #fff;
		  margin-bottom: 30px;
		  border: none;
		  border-bottom: 1px solid #fff;
		  outline: none;
		  background: transparent;
		}
		.user-box1 label {
		  position: absolute;
		  top:0;
		  left: 0;
		  padding: 10px 0;
		  font-size: 16px;
		  color: #fff;
		  pointer-events: none;
		  transition: .5s;
		}
		
		.login-box {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  width: 400px;
		  padding: 40px;
		  transform: translate(-50%, -50%);
		  background: rgba(0,0,0,.5);
		  box-sizing: border-box;
		  box-shadow: 0 15px 25px rgba(0,0,0,.6);
		  border-radius: 10px;
		}
		
		.login-box h2 {
		  margin: 0 0 30px;
		  padding: 0;
		  color: #fff;
		  text-align: center;
		}
		
		.login-box .user-box {
		  position: relative;
		}
		
		.login-box .user-box input {
		  width: 100%;
		  padding: 10px 0;
		  font-size: 16px;
		  color: #fff;
		  margin-bottom: 30px;
		  border: none;
		  border-bottom: 1px solid #fff;
		  outline: none;
		  background: transparent;
		}
		.login-box .user-box label {
		  position: absolute;
		  top:0;
		  left: 0;
		  padding: 10px 0;
		  font-size: 16px;
		  color: #fff;
		  pointer-events: none;
		  transition: .5s;
		}
		
		.login-box .user-box input:focus ~ label,
		.login-box .user-box input:valid ~ label {
		  top: -20px;
		  left: 0;
		  color: #03e9f4;
		  font-size: 12px;
		}
		
		.login-box form a {
		  position: relative;
		  display: inline-block;
		  padding: 10px 20px;
		  color: #03e9f4;
		  font-size: 16px;
		  text-decoration: none;
		  text-transform: uppercase;
		  overflow: hidden;
		  transition: .5s;
		  margin-top: 40px;
		  letter-spacing: 4px
		}
		
		.login-box a:hover {
		  background: #03e9f4;
		  color: #fff;
		  border-radius: 5px;
		  box-shadow: 0 0 5px #03e9f4,
		              0 0 25px #03e9f4,
		              0 0 50px #03e9f4,
		              0 0 100px #03e9f4;
		}
		
		.login-box button span {
		  position: absolute;
		  display: block;
		}
		
		.login-box a span {
		  position: absolute;
		  display: block;
		}
		
		.login-box a span:nth-child(1) {
		  top: 0;
		  left: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(90deg, transparent, #03e9f4);
		  animation: btn-anim1 1s linear infinite;
		}
		
		@keyframes btn-anim1 {
		  0% {
		    left: -100%;
		  }
		  50%,100% {
		    left: 100%;
		  }
		}
		
		.login-box a span:nth-child(2) {
		  top: -100%;
		  right: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(180deg, transparent, #03e9f4);
		  animation: btn-anim2 1s linear infinite;
		  animation-delay: .25s
		}
		
		@keyframes btn-anim2 {
		  0% {
		    top: -100%;
		  }
		  50%,100% {
		    top: 100%;
		  }
		}
		
		.login-box a span:nth-child(3) {
		  bottom: 0;
		  right: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(270deg, transparent, #03e9f4);
		  animation: btn-anim3 1s linear infinite;
		  animation-delay: .5s
		}
		
		@keyframes btn-anim3 {
		  0% {
		    right: -100%;
		  }
		  50%,100% {
		    right: 100%;
		  }
		}
		
		.login-box a span:nth-child(4) {
		  bottom: -100%;
		  left: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(360deg, transparent, #03e9f4);
		  animation: btn-anim4 1s linear infinite;
		  animation-delay: .75s
		}
		
		@keyframes btn-anim4 {
		  0% {
		    bottom: -100%;
		  }
		  50%,100% {
		    bottom: 100%;
		  }
		}
		
		.login-box button {
		  position: relative;
		  display: inline-block;
		  padding: 10px 20px;
		  color: #03e9f4;
		  background: rgba(0,0,0,.0);
		  box-shadow: 0 15px 25px rgba(0,0,0,.0);
		  border:none;
		  font-size: 16px;
		  text-decoration: none;
		  text-transform: uppercase;
		  overflow: hidden;
		  transition: .5s;
		  margin-top: 40px;
		  letter-spacing: 4px
		}
		
		.login-box button:hover {
		  background: #03e9f4;
		  color: #fff;
		  border-radius: 5px;
		  box-shadow: 0 0 5px #03e9f4,
		              0 0 25px #03e9f4,
		              0 0 50px #03e9f4,
		              0 0 100px #03e9f4;
		  border:none;
		}
		
		.login-box button span {
		  position: absolute;
		  display: block;
		}
		
		.login-box button span:nth-child(1) {
		  top: 0;
		  left: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(90deg, transparent, #03e9f4);
		  animation: btn-anim1 1s linear infinite;
		}
		
		@keyframes btn-anim1 {
		  0% {
		    left: -100%;
		  }
		  50%,100% {
		    left: 100%;
		  }
		}
		
		.login-box button span:nth-child(2) {
		  top: -100%;
		  right: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(180deg, transparent, #03e9f4);
		  animation: btn-anim2 1s linear infinite;
		  animation-delay: .25s
		}
		
		@keyframes btn-anim2 {
		  0% {
		    top: -100%;
		  }
		  50%,100% {
		    top: 100%;
		  }
		}
		
		.login-box button span:nth-child(3) {
		  bottom: 0;
		  right: -100%;
		  width: 100%;
		  height: 2px;
		  background: linear-gradient(270deg, transparent, #03e9f4);
		  animation: btn-anim3 1s linear infinite;
		  animation-delay: .5s
		}
		
		@keyframes btn-anim3 {
		  0% {
		    right: -100%;
		  }
		  50%,100% {
		    right: 100%;
		  }
		}
		
		.login-box button span:nth-child(4) {
		  bottom: -100%;
		  left: 0;
		  width: 2px;
		  height: 100%;
		  background: linear-gradient(360deg, transparent, #03e9f4);
		  animation: btn-anim4 1s linear infinite;
		  animation-delay: .75s
		}
		
		@keyframes btn-anim4 {
		  0% {
		    bottom: -100%;
		  }
		  50%,100% {
		    bottom: 100%;
		  }
		}
		
		.react1 {
			box-sizing: border-box;
		}
		.react2 {
			box-sizing: border-box;
			position: absolute;
			top:  202px;
			left: 250px;
		}
		.react3 {
			box-sizing: border-box;
			position: absolute;
			top: 202px;
		}
		.react4 {
			box-sizing: border-box;
			position: absolute;
			top: 212px;
			right: 40px;
		}
		</style>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#bt').focus();
				
				// TITLE 유효성 체크
				$('#bt').blur(function() {
					if ($('#bt').val()==('')) {
						$('#btBcMsg').text('제목을 입력해주세요');
					} else if ($('#bt').val().length > 41) {
						$('#btBcMsg').text('제목은 40자리까지 입력가능합니다.');
						$('#bt').focus();
					} else {
						console.log($('#bt').val()); 
						$('#btBcMsg').text('');
						$('#bc').focus();
					}
				});
				
				// CONTENT 유효성 체크
				$('#bc').blur(function(){
					if ($('#bc').val()==('')) {
						$('#btBcMsg').text('내용을 입력해주세요');
					} else if ($('#bc').val().length < 2) {
						$('#btBcMsg').text('내용은 2자이상이어야 합니다');
					} else {
						console.log($('#bc').val()); 
						$('#btBcMsg').text('');
					}
				});
				
				// 페이지에 바로 버턴 누름을 방지하기 위해
				$('#signinBtn').click(function() {
					
					// TITLE  유효성 체크
					if( ($('#bt').val().length) < 1) {
						alert('아이디가 입력되지 않았습니다.');
						$('#bt').focus();
						return;
					}	
					// CONTENT 유효성 체크
					if( ($('#bc').val().length) < 1) {
						alert('비밀번호가 입력되지 않았습니다.');
						$('#bc').focus();
						return;
					}	
					
					$('#signinForm').submit();
					alert('게시글 수정 성공');
				});
			});
		</script>	
	</head>
	<body>
		<tbody>
			<div class="login-box">
			<h2>회원정보 수정</h2>
			<form id="signinForm" action="${pageContext.request.contextPath}/member/removeMember" method="post">
				    <div class="user-box1">
				      <input type="text" id="id" name="memberId" required="" readonly="readonly">
				      <label>User ID : ${loginMember.memberId}</label>
				    </div>
				    <div class="user-box">
				      <input type="password" id="pw" name="memberPw" required="">
				      <label>Password</label>
				    </div>
				    <div class="react1">
				    	<span class="react2">
						     <button type="button" id="signinBtn">
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								탈퇴하기
						     </button>
					    </span>
				    	<span class="react3">
						   <a href="${pageContext.request.contextPath}/member/memberOne">
								<span></span>
								<span></span>
								<span></span>
								<span></span>
								돌아가기
						    </a>  
					     </span>
					    <div class="react4">
					    	 <span style="color:red;" id="pwMsg" class="msg">${msg}</span>
					    </div>
					</div>
				</form>
				
		<form id="signinForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
			<div>
			<table border="1">
				<input type="hidden" name="boardNo" value="${b.boardNo}">
				<tr>
					<th>제목</th>
					<td><input type="text" id="bt" name="boardTitle" value="${b.boardTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="bc" rows="4" cols="60" name="boardContent">${b.boardContent}</textarea></td>
				</tr>
			</table>
			<button type="button" id="signinBtn">수정하기</button>
			<span style="color:red;" id="btBcMsg" class="msg"></span>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/board/boardList">뒤로가기</a>
			</div>
		</form>
	</body>
</html>