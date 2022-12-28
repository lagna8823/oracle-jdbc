<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addMember</title>
	</head>
	<body>
		<h1>게시글 작성 페이지</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/board/addBoard" method="post">
			<div>
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardTitle" value=""></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="4" cols="60" name="boardContent"></textarea></td>
				</tr>
			</table>
			<button type="submit">작성하기</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/board/boardList">뒤로가기</a>
			</div>
		</form>
	</body>
</html>