<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>memberOne</title>
	</head>
	<body>
		<h1>${loginMember.memberName}회원님의 작성한 글목록</h1>
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
			<th>boardTitle</th>
			<th>createdate</th>
		</tr>
		<c:forEach var="b" items="${boardList}">
			<tr>
				<td>${b.boardNo}</td>
				<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
				<td>${b.createdate}</td>
			</tr>
		</c:forEach>
	</table>
	</body>
</html>