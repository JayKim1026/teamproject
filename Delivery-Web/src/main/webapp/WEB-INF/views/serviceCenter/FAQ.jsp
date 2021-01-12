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
body {
	background-color : whitesmoke;
}

.logo {
	float: left;
	font-family: 'Nanum Pen Script', cursive;
	text-decoration: none;
	font-size: 35px;
	color : black;
}
.topMenu_ul, .content_ul {
	list-style: none; 
	display: flex; 
	float: right;
}

.topMenu_li, .content_li {
	margin-left: 20px;
	font-family : 'Nanum Pen Script';
	
}
.topMenu_a {
	text-decoration: none;
	font-size: 25px;
	color: black;
	margin-right: 10px;
}

.content_a {
	text-decoration: none;
	font-size: 25px;
	color: white;
	margin-right: 10px;
}

.content_view {
	padding : 30px;
	background-color: white;
}

.FAQ_ul {
	list-style: none;
	text-decoration: none;
}

.FAQ_li {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 topMenuWrapper">
				<div class="topMenu">
					<a class="logo" href="/">뚜벅뚜벅Company</a>
					<ul class="topMenu_ul">
					<c:choose>
						<c:when test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
							<li class="topMenu_li"><a class="topMenu_a" style="border: 1px black" href="/account/loginForm">로그인</a></li>
							<li class="topMenu_li"><a class="topMenu_a" href="/account/registerForm">회원가입</a></li>
							<li class="topMenu_li"><a class="topMenu_a" href="/account/dlvr_RegisterForm">뚜벅이 지원</a></li>
						</c:when>
						<c:otherwise>
							<li class="topMenu_li"><a class="topMenu_a" href="/account/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					
					</ul>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<!-- content Left -->
			<div class="col-md-2 contentLeft"></div>
			<!-- // content Left -->


			<!-- content main -->
			<div class="col-md-8 contentMainWrapper">
				<div class="title">
					<h1 style="text-align: center;">
						<strong>고객센터</strong>
					</h1>
				</div>
					<div class="content_section" style="background-color: #787878; height: 40px">
					<span style="color:#787878">TEST</span>
						<ul class="content_ul">
							<li class="content_li"><a class="content_a" href="/account/findAccountForm">아이디 찾기</a></li>
							<li class="content_li"><a class="content_a" href="/account/findAccountForm">비밀번호 찾기</a></li>
							<li class="content_li"><a class="content_a" href="/user/info">마이페이지</a></li>
							<c:if test="${sessionScope.userVo != null}">
								<li class="content_li"><a class="content_a" href="/user/info">마이페이지</a></li>
							</c:if>
							
							<c:if test="${sessionScope.deliverVo != null }">
								<li class="content_li"><a class="content_a" href="/deliver/info">마이페이지</a></li>
							</c:if>
						</ul>
					</div>
				<section class="content_view">
					<div class="Deliver_FAQ">
						<div class="content_FAQTitle"><h3><strong>Deliver</strong> FAQ</h3></div>
					</div>
					<div class="DeliverFAQWrapper">
						<ul class="FAQ_ul">
							<li class="FAQ_li">누구나 지원 가능한가요?</li>
							<li class="FAQ_li">배달 수단이나 장비가 따로 필요한가요?</li>
							<li class="FAQ_li">운행 시간에 제한이 있나요?</li>
							<li class="FAQ_li">상품 분실/파손 시 또는 기타 문의는 어디로 해야하나요?</li>
							<li class="FAQ_li">배달 내역은 어디서 확인하나요?</li>
							<li class="FAQ_li">배달을 잘못 받았습니다</li>
							<li class="FAQ_li">라이더 회원 탈퇴를 하고 싶어요</li>
							<li class="FAQ_li">배달을 잘못했습니다 어떻게 해야 하나요?</li>
						</ul>
					</div>
					<div class="User_FAQ">
						<div class="content_FAQTitle"><h3><strong>일반고객</strong> FAQ </h3></div>
					</div>
					<div class="UserFAQWrapper">
						<ul class="FAQ_ul">
							<li class="FAQ_li">주문하려면 어떻게 하나요?</li>
							<li class="FAQ_li">주문을 취소하고 싶어요</li>
							<li class="FAQ_li">주문 후 메뉴 혹은 수량을 변경 하고 싶어요.</li>
							<li class="FAQ_li">내 주문 내역을 삭제할 수 있나요?</li>
							<li class="FAQ_li">리뷰 작성은 어떻게 하나요?</li>
							<li class="FAQ_li">작성한 리뷰는 어디서 확인할 수 있나요?</li>
							<li class="FAQ_li">리뷰 수정/삭제는 어떻게 하나요?</li>
							<li class="FAQ_li">주문한 내역은 어디서 확인할 수 있나요?</li>
							<li class="FAQ_li">회원 탈퇴를 하고 싶어요.</li>
							<li class="FAQ_li">이용 시간은 어떻게 되나요?</li>
						</ul>
					</div>
				</section>
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
