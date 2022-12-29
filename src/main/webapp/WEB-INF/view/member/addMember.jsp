<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#id').focus();
				
				// id유효성 체크
				$('#id').blur(function() {
					if ($('#id').val()==('')) {
						$('#idMsg').text('아이디를 입력해주세요');
					} else if ($('#id').val().length > 9) {
						$('#idMsg').text('아이디는 8자리까지 입력가능합니다.');
						$('#id').focus();
					} else {
						console.log($('#id').val()); 
						$('#idMsg').text('');
						$('#pw').focus();
					}
				});
				
				// pw유효성 체크
				$('#pw').blur(function(){
					if ($('#pw').val().length < 4) {
						$('#pwMsg').text('비밀번호는 4자이상이어야 합니다');
					} else {
						console.log($('#pw').val()); 
						$('#pwMsg').text('');
						$('#name').focus();
					}
				});
				
				// name유효성 체크
				$('#name').blur(function(){
					if ($('#name').val().length < 1) {
						$('#nameMsg').text('이름이 입력되지 않습니다.');
					} else {
						console.log($('#name').val()); 
						$('#nameMsg').text('');
					}
				});
				
				// 페이지에 바로 버턴 누름을 방지하기 위해
				$('#signinBtn').click(function() {
					
					// ID 유효성 체크
					if( ($('#id').val().length) < 1) {
						alert('아이디가 입력되지 않았습니다.');
						$('#id').focus();
						return;
					}	
					// PW 유효성 체크
					if( ($('#pw').val().length) < 1) {
						alert('비밀번호가 입력되지 않았습니다.');
						$('#pw').focus();
						return;
					}	
					// NAME 유효성 체크
					if( ($('#name').val().length) < 1) {
						alert('이름이 입력되지 않았습니다.');
						$('#name').focus();
						return;
					}
					$('#signinForm').submit();
					alert('회원가입 성공');
				});
		});
		</script>
	</head>
	<body>
		<h1>회원 가입</h1>
		${msg}
		<form id="signinForm" action="${pageContext.request.contextPath}/member/addMember" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="id" name="memberId" value="">
						<span style="color:red;" id="idMsg" class="msg"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="pw" name="memberPw" value="">
						<span style="color:red;" id="pwMsg" class="msg"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="memberName" value="">
						<span style="color:red;" id="nameMsg" class="msg"></span>
					</td>
				</tr>	
			</table>
			<button type="button" id="signinBtn">가입하기</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/member/login">뒤로가기</a>
			</div>
		</form>
	</body>
</html>