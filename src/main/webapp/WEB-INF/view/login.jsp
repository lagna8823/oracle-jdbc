<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			// id유효성 체크
			$('#id').blur(function() {
				if ($('#id').val()==('')) {
					$('#idPwMsg').text('아이디를 입력해주세요');
				} else if ($('#id').val().length > 9) {
					$('#idPwMsg').text('아이디 또는 비밀번호를 확인해주세요');
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
					$('#idPwMsg').text('아이디 또는 비밀번호를 확인해주세요');
				} else {
					$('#idPwMsg').text('');
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
				$('#signinForm').submit();
			});
		});
	</script>
	</head>
	<body>
		<h1>로그인 페이지</h1>
		${msg}
		<form id="signinForm" action="${pageContext.request.contextPath}/member/login" method="post">
		<div>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" name="memberId" value="">
				</td>
				
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pw" name="memberPw" value="">
				</td>
			</tr>	
		</table>
		<button type="button" id="signinBtn">로그인</button>
		<span style="color:red;" id="idPwMsg" class="msg"></span>
		</div>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
		</div>
	</body>
</html>