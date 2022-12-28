<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Member</title>
	</head>
	<body>
		<h1>게시글 수정</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
			<div>
			<table border="1">
				<input type="hidden" name="boardNo" value="${b.boardNo}">
				<tr>
					<th>제목</th>
					<td><input type="text" name="boardTitle" value="${b.boardTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="4" cols="60" name="boardContent">${b.boardContent}</textarea></td>
				</tr>
			</table>
			<button type="submit">수정하기</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/board/boardList">뒤로가기</a>
			</div>
		</form>
	</body>
</html>