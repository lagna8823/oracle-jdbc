<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Remove Member</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		
		$(document).ready(function() {
			// 디버깅 
			//console.log(${loginMemberPw});
			//console.log($('#pw').val());
			// pw유효성 체크
			$('#pw').blur(function(){
				if ($('#pw').val().length < 4) {
					$('#pwMsg').text('비밀번호를 확인해주세요');
				} else {
					$('#pwMsg').text('');
				}
			});
			
			// 페이지에 바로 버턴 누름을 방지하기 위해
			$('#signinBtn').click(function() {
						
				// PW 유효성 체크
				if( ($('#pw').val().length) < 1) {
					alert('비밀번호가 입력되지 않았습니다.');
					$('#pw').focus();
					return 
				} else { 
						 
					// 탈퇴 비밀번호 검증
					var out = confirm('정말로 탈퇴 하시겠습니까?');
						if(out == true){
						 	if( ${loginMemberPw} == $('#pw').val() ){
								$('#signinForm').submit();
								alert('탈퇴되었습니다.');
							} else {
								alert('취소되었습니다.'); 
								return false;
							}
						} else { 
							alert('취소되었습니다.');
							return false;
						}
				}
			});
		});
	</script>
	</head>
	<body>
		<h1>회원 탈퇴</h1>
		${msg}
		<form id="signinForm" action="${pageContext.request.contextPath}/member/removeMember" method="post">
		<div>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="memberId" value="${loginMember.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="memberPw" value=""></td>
			</tr>	
		</table>
		<button type="button" id="signinBtn">탈퇴하기</button>
		<span style="color:red;" id="pwMsg" class="msg"></span>
		</div>
		</form>
		<div>
			<a href="${pageContext.request.contextPath}/home">뒤로가기</a>
		</div>
	</body>
</html>