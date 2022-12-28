<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	${msg}
	<form action="${pageContext.request.contextPath}/member/login" method="post">
	<div>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="memberId" value=""></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="memberPw" value=""></td>
		</tr>	
	</table>
	<button type="submit">로그인</button>
	</div>
	</form>
	<div>
		<a href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
	</div>
</body>
</html>