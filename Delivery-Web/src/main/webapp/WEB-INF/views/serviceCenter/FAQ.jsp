<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp"%>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<style>
	
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="top_menu">
					<a class="logo" href="/" style="float: left;">뚜벅뚜벅Company</a>
					<ul style="list-style: none; display: flex; float: right;">
						<li class="menu__stuff"><a href="/account/loginForm">로그인</a></li>
						<li class="menu__stuff"><a href="/account/logout">로그아웃</a></li>
						<li class="menu__stuff"><a href="/account/registerForm">회원가입</a></li>
						<li class="menu__stuff"><a href="/account/dlvr_RegisterForm">뚜벅이
								지원하기</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- content Left -->
			<div class="col-md-2 contentLeft"></div>
			<!-- // content Left -->


			<!-- content main -->
			<div class="col-md-8 contentMain">
				<h1 style="text-align: center;">
					<strong>고객센터</strong>
				</h1>
			</div>
			<!--// content main -->


			<!-- content right -->
			<div class="col-md-2 contentRight"></div>
			<!-- // content right -->
		</div>
		<div class="row">
			<div class="col-md-12">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>
