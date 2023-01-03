<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Modify Board</title>
		
		<!-- button -->
		<!-- 부트스트랩 css 사용 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/headBootstrap.css">
	
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
				$('#bt').focus();
				
				// TITLE 유효성 체크
				$('#bt').blur(function() {
					if ($('#bt').val()==('')) {
						$('#btBcMsg').text('제목을 입력해주세요');
					} else if ($('#bt').val().length > 41) {
						$('#btBcMsg').text('제목은 40자리까지 입력가능합니다.');
						$('#bt').focus();
					} else {
						console.log($('#bt').val()); 
						$('#btBcMsg').text('');
						$('#bc').focus();
					}
				});
				
				// CONTENT 유효성 체크
				$('#bc').blur(function(){
					if ($('#bc').val()==('')) {
						$('#btBcMsg').text('내용을 입력해주세요');
					} else if ($('#bc').val().length < 2) {
						$('#btBcMsg').text('내용은 2자이상이어야 합니다');
					} else {
						console.log($('#bc').val()); 
						$('#btBcMsg').text('');
					}
				});
				
				// 페이지에 바로 버턴 누름을 방지하기 위해
				$('#signinBtn').click(function() {
					
					// TITLE  유효성 체크
					if( ($('#bt').val().length) < 1) {
						alert('아이디가 입력되지 않았습니다.');
						$('#bt').focus();
						return;
					}	
					// CONTENT 유효성 체크
					if( ($('#bc').val().length) < 1) {
						alert('비밀번호가 입력되지 않았습니다.');
						$('#bc').focus();
						return;
					}	
					
					$('#signinForm').submit();
					alert('게시글 수정 성공');
				});
			});
		</script>	
	</head>
	<body>
		<header>
			<!-- 메뉴 partial jsp 구성 -->
			<div>
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
		</header>
		<h2>Member ' Info Modify</h2>
		<br>
		<form id="signinForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
			<div>
			<table border="1">
				<input type="hidden" name="boardNo" value="${b.boardNo}">
				<tr>
					<th>제목</th>
					<td><input type="text" id="bt" name="boardTitle" value="${b.boardTitle}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="bc" rows="6" cols="80" name="boardContent">${b.boardContent}</textarea></td>
				</tr>
			</table>
				<br>
				<div style="padding-left: 15em">
					<a class="btn btn-dark" href="${pageContext.request.contextPath}/board/boardList">뒤로가기</a>
					<button type="button" class="btn btn-dark" id="signinBtn">수정하기</button>
					<span style="color:red;" id="btBcMsg" class="msg"></span>
				</div>
			</div>
		</form>
	</body>
</html>