<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember</title>
	</head>
	<body>
		<h1>회원 가입</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/member/addMember" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" value=""></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memberPw" value=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memberName" value=""></td>
				</tr>	
			</table>
			<button type="submit">가입하기</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/member/login">뒤로가기</a>
			</div>
		</form>
	</body>
</html>