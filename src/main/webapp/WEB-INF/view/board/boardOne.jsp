<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>memberOne</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$('#delete').click(function(){
				var del = confirm('삭제하시겠습니까?');
				if(del == true){
					alert('삭제되었습니다.')
				} else { 
					alert('취소')
					return false;
				}
			});
		});
	</script>
	</head>
	<body>
		<h1>게시글 상세페이지</h1>
		${msg}
		<div>
			<a href="${pageContext.request.contextPath}/home">홈으로</a>
			<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/board/boardList">게시판 리스트</a>
			<a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</div>
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}//board/boardOne">
	</form>
	<table border="1">
		<tr>
			<th>boardNo</th>
			<td>${b.boardNo}</td>
		</tr>
		<tr>
			<th>boardTitle</th>
			<td><input type="text" value="${b.boardTitle}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>boardContent</th>
			<td><textarea rows="6" cols="80" readonly="readonly">${b.boardContent}</textarea></td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a>
		<a id="delete" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a>
	</div>
	</body>
</html>