<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
	<head>
	<meta charset="utf-8">
	<title>menu</title>
	<style>
	.body {
	background-color: #F5F5F5;
    background-size: cover; 
	}
	</style>
	
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/headBootstrap.css">
	
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
		});
	</script>
		
	</head>
	<body class="body">
		<header>
			<nav style="backgorund-color:#3B3B3B;" class="navbar navbar-expand-lg">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="${pageContext.request.contextPath}/home" _msthash="1864226" _msttexthash="22220536">Oracle Board</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" _msthidden="A" _msthiddenattr="1739517" _mstaria-label="320099">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarColor01">
			      <ul class="navbar-nav me-auto">
			        <li class="nav-item">
			          <a class="nav-link active" href="${pageContext.request.contextPath}/home"><font _mstmutation="1" _msthash="622544" _msttexthash="4701515">Home </font><span class="visually-hidden" _msthash="913744" _msttexthash="11687494">(현재)</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/memberOne" _msthash="622726" _msttexthash="8814104">Info</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList" _msthash="622908" _msttexthash="8603816">Board</a>
			        </li>
			        <li class="nav-item">
			          <a id="logout" class="nav-link" href="${pageContext.request.contextPath}/member/logout" _msthash="623090" _msttexthash="4600687">Logout</a>
			        </li>
			        <li>
			       
			        </li>
			        <li class="nav-item">
	        			<a class="nav-link" href="${pageContext.request.contextPath}/member/memberOne" _msthash="622726" _msttexthash="8814104">${loginMember.memberName} 접속중</a>
			        </li>
			      </ul>
			  </div>
			</nav>
			<br><br>
		</header>
	</body>
</html>