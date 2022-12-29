<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#rowPerPage').change(function() {
				$('#pageForm').submit();
				alert('change');
			})
			
			$('#logout').click(function(){
				var out = confirm('로그아웃 하시겠습니까?');
				if(out == true){
					alert('로그아웃 되었습니다.')
				} else { 
					alert('취소')
					return false;
				}
			});
		});
	</script>
	</head>
	<body>
		<div>
			${loginMember.memberName}님 환영합니다.
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/home">홈으로</a>
			<a id="logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/board/boardList">게시판 전체보기</a>
			<a href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
		</div>
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}/home">
			<label for="word"> 검색 : </label>
			<input type="text" name="word" id="word" value="${word}">
			<button type="submit">검색</button>
			
			<select name="rowPerPage" id="rowPerPage">
				<c:if test="${rowPerPage == 10}">
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 20}">
					<option value="10">10</option>
					<option value="20" selected="selected">20</option>
					<option value="30">30</option>
				</c:if>
				<c:if test="${rowPerPage == 30}">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30" selected="selected">30</option>
				</c:if>
			</select>
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
	<div>
		<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}&word=${word}">이전</a>
		<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}&word=${word}">다음</a>
	</div>
		
	</body>
</html>