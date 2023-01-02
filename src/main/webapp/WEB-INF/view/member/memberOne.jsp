<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>memberOne</title>
	
	<!-- header -->
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/css/headBootstrap.css">
		
	<!-- body -->	
	<!-- 부트스트랩 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}./member/Resources/css/bootstrap.css">
	<!--  부트스트랩 js 사용 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}./member/Resources/js/bootstrap.js"></script>
	
	
	<style>
	html {
	  height: 100%;
	}
	.body {
	  margin:0;
	  padding:0;
	  font-family: sans-serif;
	  background: #73685d;
	  background-size: cover; 
	}
	
	.login-box {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 400px;
	  padding: 40px;
	  transform: translate(-50%, -50%);
	  background: rgba(0,0,0,.5);
	  box-sizing: border-box;
	  box-shadow: 0 15px 25px rgba(0,0,0,.6);
	  border-radius: 10px;
	}
	
	.login-box h2 {
	  margin: 0 0 30px;
	  padding: 0;
	  color: #fff;
	  text-align: center;
	}
	
	.login-box .user-box {
	  position: relative;
	}
	
	.login-box .user-box input {
	  width: 100%;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #f5f5f5;
	  margin-bottom: 30px;
	  border: none;
	  border-bottom: 1px solid #fff;
	  outline: none;
	  background: transparent;
	}
	.login-box .user-box label {
	  position: absolute;
	  top:0;
	  left: 0;
	  padding: 10px 0;
	  font-size: 16px;
	  color: #fff;
	  pointer-events: none;
	  transition: .5s;
	}
	
	.login-box form a {
	  position: relative;
	  display: inline-block;
	  padding: 10px 20px;
	  color: #f5f5f5;
	  font-size: 16px;
	  text-decoration: none;
	  text-transform: uppercase;
	  overflow: hidden;
	  transition: .5s;
	  margin-top: 40px;
	  letter-spacing: 4px
	}	
	
	.login-box a:hover {
	  background: #73685d;
	  color: #fff;
	  border-radius: 5px;
	  box-shadow: 0 0 5px #73685d,
	              0 0 25px #73685d,
	              0 0 50px #73685d,
	              0 0 100px #73685d;
	}
	
	
	
	.login-box button span {
	  position: absolute;
	  display: block;
	}
	
	.login-box a span {
	  position: absolute;
	  display: block;
	}
	
	.login-box a span:nth-child(1) {
	  top: 0;
	  left: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(90deg, transparent, #73685d);
	  animation: btn-anim1 1s linear infinite;
	}
	
	@keyframes btn-anim1 {
	  0% {
	    left: -100%;
	  }
	  50%,100% {
	    left: 100%;
	  }
	}
	
	.login-box a span:nth-child(2) {
	  top: -100%;
	  right: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(180deg, transparent, #73685d);
	  animation: btn-anim2 1s linear infinite;
	  animation-delay: .25s
	}
	
	@keyframes btn-anim2 {
	  0% {
	    top: -100%;
	  }
	  50%,100% {
	    top: 100%;
	  }
	}
	
	.login-box a span:nth-child(3) {
	  bottom: 0;
	  right: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(270deg, transparent, #73685d);
	  animation: btn-anim3 1s linear infinite;
	  animation-delay: .5s
	}
	
	@keyframes btn-anim3 {
	  0% {
	    right: -100%;
	  }
	  50%,100% {
	    right: 100%;
	  }
	}
	
	.login-box a span:nth-child(4) {
	  bottom: -100%;
	  left: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(360deg, transparent, #73685d);
	  animation: btn-anim4 1s linear infinite;
	  animation-delay: .75s
	}
	
	@keyframes btn-anim4 {
	  0% {
	    bottom: -100%;
	  }
	  50%,100% {
	    bottom: 100%;
	  }
	}
	
	.login-box button {
	  position: relative;
	  display: inline-block;
	  padding: 10px 20px;
	  color: #f5f5f5;
	  background: rgba(0,0,0,.0);
	  box-shadow: 0 15px 25px rgba(0,0,0,.0);
	  border:none;
	  font-size: 16px;
	  text-decoration: none;
	  text-transform: uppercase;
	  overflow: hidden;
	  transition: .5s;
	  margin-top: 40px;
	  letter-spacing: 4px
	}
	
	.login-box button:hover {
	  background: #73685d;
	  color: #fff;
	  border-radius: 5px;
	  box-shadow: 0 0 5px #73685d,
	              0 0 25px #73685d,
	              0 0 50px #73685d,
	              0 0 100px #73685d;
	  border:none;
	}
	
	.login-box button span {
	  position: absolute;
	  display: block;
	}
	
	.login-box button span:nth-child(1) {
	  top: 0;
	  left: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(90deg, transparent, #73685d);
	  animation: btn-anim1 1s linear infinite;
	}
	
	@keyframes btn-anim1 {
	  0% {
	    left: -100%;
	  }
	  50%,100% {
	    left: 100%;
	  }
	}
	
	.login-box button span:nth-child(2) {
	  top: -100%;
	  right: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(180deg, transparent, #73685d);
	  animation: btn-anim2 1s linear infinite;
	  animation-delay: .25s
	}
	
	@keyframes btn-anim2 {
	  0% {
	    top: -100%;
	  }
	  50%,100% {
	    top: 100%;
	  }
	}
	
	.login-box button span:nth-child(3) {
	  bottom: 0;
	  right: -100%;
	  width: 100%;
	  height: 2px;
	  background: linear-gradient(270deg, transparent, #73685d);
	  animation: btn-anim3 1s linear infinite;
	  animation-delay: .5s
	}
	
	@keyframes btn-anim3 {
	  0% {
	    right: -100%;
	  }
	  50%,100% {
	    right: 100%;
	  }
	}
	
	.login-box button span:nth-child(4) {
	  bottom: -100%;
	  left: 0;
	  width: 2px;
	  height: 100%;
	  background: linear-gradient(360deg, transparent, #73685d);
	  animation: btn-anim4 1s linear infinite;
	  animation-delay: .75s
	}
	
	@keyframes btn-anim4 {
	  0% {
	    bottom: -100%;
	  }
	  50%,100% {
	    bottom: 100%;
	  }
	}
	
	.react1 {
		box-sizing: border-box;
	}
	.react2 {
		box-sizing: border-box;
		position: absolute;
		top: 261px;
	}
	a {
		  color: #f5f5f5;
		  text-decoration: none;
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
		});
	</script>
	</head>
	<body class="body">
		<header>
			<br>
			<nav style="backgorund-color:#3B3B3B;" class="navbar navbar-expand-lg navbar-light">
			  <div class="container-fluid" style="padding-left: 2em";>
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
			      </ul>	
			  </div>
			</nav>
		</header>
		<div class="login-box">
		<h2>${loginMember.memberName} ' INFO</h2>
			<form>
			    <div class="user-box">
			      <input readonly="readonly">
			      <label>User ID : ${loginMember.memberId}</label>	
			    </div>
			    <div class="user-box">
			      <input readonly="readonly">
			      <label>Password : ********</label>
			    </div>
			    <div class="user-box">
			      <input readonly="readonly">
			      <label>User Name : ${loginMember.memberName}</label>
			     
			    </div>
			    <div class="react1">
			    	<span class="react2">
					   <a href="${pageContext.request.contextPath}/home">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							돌아가기
					    </a>  
					    <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
					    <a href="${pageContext.request.contextPath}/member/modifyMember">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							수정
					     </a>
					     <a href="${pageContext.request.contextPath}/member/removeMember">
							<span></span>
							<span></span>
							<span></span>
							<span></span>
							탈퇴
					     </a>
				     </span>
				</div>
			</form>
		</div>
	</body>
</html>