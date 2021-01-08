<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp"%>
<meta charset="UTF-8">
<title>support center</title>
<style>
.miniBarWrap { 
	margin: 8px;
	
}

.miniBar_logo {
	
}

.miniBar_menu { 
	display: flex;
	list-style: none;
	float:right;
}

.menu__stuff{
	padding: 2px;
	margin: 3px;
}
	

</style>
</head>

	<div class="miniBarWrap"> 
		<a class="miniBar_logo" href="/">뚜벅뚜벅Company</a>

		<ul class="miniBar_menu">
			<c:if test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
				<li class="menu__stuff"><a href="/account/loginForm">로그인</a></li>
				<li class="menu__stuff"><a href="/account/logout">로그아웃</a></li>
				<li class="menu__stuff"><a href="/account/registerForm">회원가입</a></li>
				<li class="menu__stuff"><a href="/account/dlvr_RegisterForm">뚜벅이 지원하기</a></li>
			</c:if>
		</ul>
	</div>

	<div>
		<h1><strong>고객센터</strong></h1>
	</div>
	
	<div> 
		<a href="#">아이디 찾기</a>
		<a href="#">비밀번호 찾기</a>
		<a href="#">마이페이지</a>
	</div>
	
	<nav>
		<a href="#">공지사항</a>
		<a href="#">자주하는 질문</a>
		<a href="#">1:1 문의</a>
	</nav>
	<section>
		<h2></h2>
	</section>
<body>

</body>
</html>
