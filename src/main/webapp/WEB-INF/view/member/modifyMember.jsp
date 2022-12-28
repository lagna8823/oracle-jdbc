<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Member</title>
	</head>
	<body>
		<h1>회원정보 수정</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/member/modifyMember" method="post">
			<div>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" value="${loginMember.memberId}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="memberPw" value=""></td>
				</tr>
				<tr>
					<th>수정 비밀번호</th>
					<td><input type="password" name="memberPw2" value=""></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="memberPw3" value=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memberName" value="${loginMember.memberName}"></td>
				</tr>	
			</table>
			<button type="submit">수정하기</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/home">뒤로가기</a>
			</div>
		</form>
	</body>
</html>