<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 -->
	<header id="head_Container">
		<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
		<h1 id="header_title">마이 페이지</h1>
			<c:if test="${sessionScope.userVo.user_id != null }">
				<form action="/user/logout" method="get">
					<button type="submit" class="btn btn-secondary" id="btnLogout">로그아웃</button>
				</form>
			</c:if>
		<br /> userVo 	: ${sessionScope.userVo}
	</header>
	<nav>
		<ul class="sideMenu">
			<li><a href="/userPage/info">회원정보</a></li>
			<li><a href="/userPage/orderList">주문 내역 조회</a></li>
			<li><a href="/userPage/point">포인트 조회</a></li>
			<li><a href="/userPage/review">내가 작성한 후기</a></li>
			<li><a href="/userPage/question">1:1 문의</a></li>
		</ul>
	</nav>