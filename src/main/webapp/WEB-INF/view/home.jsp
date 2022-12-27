<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>home</title>
	</head>
	<body>
		<div>
			${loginMember.memberName}님 환영합니다.
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/BoardListController">게시판</a>
			<a href="${pageContext.request.contextPath}/LogoutController">로그아웃</a>
			<a href="${pageContext.request.contextPath}/UpdateMemberPwController">비밀번호 수정</a>
			<a href="${pageContext.request.contextPath}/UpdateMemberController">회원정보 수정</a>
			<a href="${pageContext.request.contextPath}/DeleteMemberFormController">회원탈퇴</a>
		</div>
	</body>
</html>