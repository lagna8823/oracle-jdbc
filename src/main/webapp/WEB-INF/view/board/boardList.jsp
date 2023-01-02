<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap.css">
	<!--  부트스트랩 js 사용 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap.js"></script>
	
	<style>
		body {
		  padding:1.5em;
		  background: #f5f5f5
		}
		
		table {
		  border: 1px #a39485 solid;
		  font-size: .9em;
		  box-shadow: 0 2px 5px rgba(0,0,0,.25);
		  width: 100%;
		  border-collapse: collapse;
		  border-radius: 5px;
		  overflow: hidden;
		}
		
		th {
		  text-align: left;
		}
		  
		thead {
		  font-weight: bold;
		  color: #fff;
		  background: #73685d;
		}
		  
		 td, th {
		  padding: 1em .5em;
		  vertical-align: middle;
		}
		  
		 td {
		  border-bottom: 1px solid rgba(0,0,0,.1);
		  background: #fff;
		}
		
		a {
		  color: #73685d;
		  text-decoration: none;
		}
		  
		 @media all and (max-width: 768px) {
		    
		  table, thead, tbody, th, td, tr {
		    display: block;
		  }
		  
		  th {
		    text-align: right;
		  }
		  
		  table {
		    position: relative; 
		    padding-bottom: 0;
		    border: none;
		    box-shadow: 0 0 10px rgba(0,0,0,.2);
		  }
		  
		  thead {
		    float: left;
		    white-space: nowrap;
		  }
		  
		  tbody {
		    overflow-x: auto;
		    overflow-y: hidden;
		    position: relative;
		    white-space: nowrap;
		  }
		  
		  tr {
		    display: inline-block;
		    vertical-align: top;
		  }
		  
		  th {
		    border-bottom: 1px solid #a39485;
		  }
		  
		  td {
		    border-bottom: 1px solid #e5e5e5;
		  }
		  
		  
		  }
	</style>
	
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
		<header>
			<div>
				<a style="font-size:1.2em;  font-weight: bolder !important;" href="${pageContext.request.contextPath}/home">홈으로</a>
				<a style="font-size:1.2em;  font-weight: bolder !important;" id="logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
				<a style="font-size:1.2em;  font-weight: bolder !important;" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
				<a style="font-size:1.2em;  font-weight: bolder !important;" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
			</div>
		</header>
		<h1>게시판 리스트</h1>
		<div>
			<a href="${pageContext.request.contextPath}/board/addBoard">글 작성하기</a>
		</div>
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}/home">
			<select name="search" id="search" value="${search}">
				<c:if test="${search == ('')}">
					<option value="" selected="selected">-선택-</option>
					<option value="title" >title</option>
					<option value="content">content</option>
					<option value="memberId">memberId</option>
				</c:if>
				<c:if test="${search eq 'title'}">
					<option value="" >-선택-</option>
					<option value="title" selected="selected">title</option>
					<option value="content">content</option>
					<option value="memberId">memberId</option>
				</c:if>
				<c:if test="${search eq 'content'}">
					<option value="" >-선택-</option>
					<option value="title" >title</option>
					<option value="content" selected="selected">content</option>
					<option value="memberId">memberId</option>
				</c:if>
				<c:if test="${search eq 'memberId'}">
					<option value="" >-선택-</option>
					<option value="title" >title</option>
					<option value="content">content</option>
					<option value="memberId" selected="selected">memberId</option>
				</c:if>
			</select>
			<label for="word"> search : </label>
			<input type="text" name="word" id="word" value="${word}">
			<button type="submit">search</button>
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
		<table>
		    <thead>
		    <tr>
		        <th>boardNo</th>
				<th>boardTitle</th>
				<th>memberId</th>
				<th>createdate</th>
		    </tr>
		    </thead>
		    <tbody>
			    <c:forEach var="b" items="${boardList}">
					<tr>
						<td>${b.boardNo}</td>
						<td><a href="${pageContext.request.contextPath}/board/boardOne?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
						<td>${b.memberId}</td>
						<td>${b.createdate}</td>
					</tr>
				</c:forEach>
		    </tbody>
		</table>
		<br>
		<div align="center";>
		<!-- 페이징 -->
			<!-- 첫 페이지 -->
			<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=1&word=${word}">처음</a>
			
			<!-- 이전 페이지 -->
			<c:if test="${currentPage>1}">
				<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=${currentPage-1}&word=${word}">이전</a>
			</c:if>	
			
			<!-- 현재 페이지 -->
			${currentPage}
			
			<!-- 다음 페이지 -->
			<c:if test="${currentPage<lastPage}">
				<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=${currentPage+1}&word=${word}">다음</a>
			</c:if>	
			
			<!-- 마지막 페이지 -->
			<a href="${pageContext.request.contextPath}/home?rowPerPage=${rowPerPage}&currentPage=${lastPage}&word=${word}">마지막</a>
		</div>
	</body>
</html>
