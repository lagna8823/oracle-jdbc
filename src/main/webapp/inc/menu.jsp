<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
	<head>
	<meta charset="utf-8">
	<title>menu</title>
	
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/headBootstrap.css">
		
	</head>
	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Oracle Board</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarColor03">
			      <ul class="navbar-nav me-auto">
			        <li class="nav-item">
			          <a class="nav-link active" href="${pageContext.request.contextPath}/home">Home
			            <span class="visually-hidden">(current)</span>
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/MemberOne">회원정보</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/board/boardList">게시판</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</header>
	</body>
</html>