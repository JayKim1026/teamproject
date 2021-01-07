<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 헤더 -->
	<header id="head_Container">
		<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
		<h1 id="header_title">마이 페이지</h1>
			<c:if test="${sessionScope.deliverVo.dlvr_id != null }">
				<form action="/account/logout" method="get">
					<button type="submit" class="btn-default" id="btnLogout">로그아웃</button>
				</form>
			</c:if>
		<br /> deliverVo:${sessionScope.deliverVo}
	</header>
	<nav>
		<ul class="sideMenu">
			<li><a href="/deliver/info">회원정보</a></li>
			<li><a href="/deliver/deliveryList">주문 내역 조회</a></li>
			<li><a href="/deliver/point">포인트 조회</a></li>
			<li><a href="/deliver/question">1:1 문의</a></li>
		</ul>
	</nav>