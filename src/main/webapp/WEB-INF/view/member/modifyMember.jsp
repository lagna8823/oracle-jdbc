<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Member</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			// pw유효성 체크(현재)
			$('#pw').blur(function(){
				if ($('#pw').val().length < 4) {
					$('#pwMsg').text('비밀번호를 확인해주세요');
				} else {
					$('#pwMsg').text('');
				}
			});
			
			// pw2,pw3 유효성 체크(수정할pw)
			$('#pw2').blur(function(){
				if ($('#pw2').val().length < 4) {
					$('#pwMsg').text('비밀번호를 확인해주세요');
				} else {
					$('#pwMsg').text('');
				}
			});
			$('#pw3').blur(function(){
				if ($('#pw3').val().length < 4) {
					$('#pwMsg').text('비밀번호를 확인해주세요');
				} else {
					$('#pwMsg').text('');
				}
			});
			
			// 페이지에 바로 버턴 누름을 방지하기 위해
			$('#signinBtn').click(function() {
				
				// PW 유효성 체크 (공백)
				if( ($('#pw').val().length) < 1) {
					alert('비밀번호가 입력되지 않았습니다.');
					$('#pw').focus();
					return;
				}	
				if( ($('#pw2').val().length) < 1) {
					alert('비밀번호가 입력되지 않았습니다.');
					$('#pw2').focus();
					return;
				}	
				if( ($('#pw3').val().length) < 1) {
					alert('비밀번호가 입력되지 않았습니다.');
					$('#pw3').focus();
					return;
				}	
				// PW 수정할 값 일치하는지 확인
				if( $('#pw2').val()!=$('#pw3').val() )  {
					alert('수정할 비밀번호가 일치하지 않습니다.');
					$('#pw2').focus();
					return;
				}	
				$('#signinForm').submit();
				alert('수정 성공');
			});
		});
	</script>
	</head>
	<body>
		<h1>회원정보 수정</h1>
		${msg}
		<form id="signinForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post">
			<div>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="signinForm" name="memberId" value="${loginMember.memberId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" id="pw" name="memberPw" value=""></td>
				</tr>
				<tr>
					<th>수정 비밀번호</th>
					<td><input type="password" id="pw2" name="memberPw2" value=""></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pw3" name="memberPw3" value=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memberName" value="${loginMember.memberName}" readonly="readonly"></td>
				</tr>	
			</table>
			<button type="button" id="signinBtn">수정하기</button>
			<span style="color:red;" id="pwMsg" class="msg"></span>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/member/memberOne">뒤로가기</a>
			</div>
		</form>
	</body>
</html>