<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Board</title>
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
		<h1>게시글 수정</h1>
		${msg}
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