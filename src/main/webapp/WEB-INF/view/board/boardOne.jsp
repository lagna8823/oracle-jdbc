<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>memberOne</title>
	
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/bootstrap.css">
	<!--  부트스트랩 js 사용 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/Resources/js/bootstrap.js"></script>
	
	<style>
		body {
		  padding:1.5em;
		  background: #f5f5f5;
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
		  
		.thead {
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
		  color: black;
		  text-decoration: none;
		  font-weight: bolder !important;
		}
		  
		 @media all and (max-width: 768px) {
		    
		  table, thead, tbody, th, td, tr {
		    display: block;
		  }
		  
		  th {
		    text-align: right;
		    font-weight: bolder !important;
		  }
		  
		  table {
		    position: relative; 
		    padding-bottom: 0;
		    border: none;
		    box-shadow: 0 0 10px rgba(0,0,0,.2);
		  }
		  
		  .thead {
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
		    font-weight: bolder !important;
		  }
		  
		  td {
		    border-bottom: 1px solid #e5e5e5;
		  }
		  
		  
		  }
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#logout').click(function(){
				var out = confirm('로그아웃 하시겠습니까?');
				if(out == true){
					alert('로그아웃 되었습니다.')
				} else { 
					alert('취소')
					return false;
				}
			});
			$('#delete').click(function(){
				var del = confirm('삭제하시겠습니까?');
				if(del == true){
					alert('삭제되었습니다.')
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
				<a style="font-size:1.2em;  color: black; font-weight: bolder !important;" href="${pageContext.request.contextPath}/home">홈으로</a>
				<a style="font-size:1.2em;  color: black; font-weight: bolder !important;" id="logout" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
				<a style="font-size:1.2em;  color: black; font-weight: bolder !important;" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
				<a style="font-size:1.2em;  color: black; font-weight: bolder !important;" href="${pageContext.request.contextPath}/member/memberOne">회원정보</a>
			</div>
		</header>
		<h1>게시글 상세페이지</h1>
		<form id="pageForm" method="get" action="${pageContext.request.contextPath}//board/boardOne">
	</form>
	<table>
		<tr>
			<th>boardNo</th>
			<td>${b.boardNo}</td>
		</tr>
		<tr>
			<th>boardTitle</th>
			<td><input type="text" value="${b.boardTitle}" readonly="readonly"></td>
		</tr>
		<tr>
			<th>boardContent</th>
			<td><textarea rows="6" cols="80" readonly="readonly">${b.boardContent}</textarea></td>
		</tr>
	</table>	
	<br>
	<div style="padding-left: 30em">
		<a href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${b.boardNo}">수정</a>
		<span>&nbsp;&nbsp;</span>
		<a id="delete" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${b.boardNo}">삭제</a>
	</div>
	</body>
</html>