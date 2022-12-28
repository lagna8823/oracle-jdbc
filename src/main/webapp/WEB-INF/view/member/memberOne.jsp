<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>memberOne</title>
	</head>
	<body>
		<h1>${loginMember.memberName}회원님의 정보</h1>
		<div>
			<a href="${pageContext.request.contextPath}/home">홈으로</a>
			<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/board/boardList">게시판 리스트</a>
			<a href="${pageContext.request.contextPath}/member/modifyMember">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		</div>
		<div>
		<table>
			<tr>
				<th>아이디</th>
				<td>${loginMember.memberId}</td>
			</tr>
			<tr>	
				<th>비밀번호</th>
				<td>********</td>
			</tr>	
			<tr>
				<th>이름</th>
				<td>${loginMember.memberName}</td>
			</tr>
		</table>
		</div>
	</body>
</html>