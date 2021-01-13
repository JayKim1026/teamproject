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


.logo {
	float: left;
	font-family: 'Nanum Pen Script', cursive;
	text-decoration: none;
	font-size: 35px;
	color: black;
}

.topMenu_ul, .content_ul {
	list-style: none;
	display: flex;
	float: right;
}

.topMenu_li, .content_li {
	margin-left: 20px;
	font-family: 'Nanum Pen Script';
}

.topMenu_a {
	text-decoration: none;
	font-size: 25px;
	color: black;
	margin-right: 10px;
}

.page_title {
	margin-top:30px;
	font-size: 60px;
	margin-bottom: 30px;
}

.content_a {
	text-decoration: none;
	font-size: 25px;
	color: white;
	margin-right: 10px;
}

.content_view {
	padding: 30px;
	background-color: white;
	justify-content: center;
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
							<c:when
								test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
								<li class="topMenu_li"><a class="topMenu_a"
									style="border: 1px black" href="/account/loginForm">로그인</a></li>
								<li class="topMenu_li"><a class="topMenu_a"
									href="/account/registerForm">회원가입</a></li>
								<li class="topMenu_li"><a class="topMenu_a"
									href="/account/dlvr_RegisterForm">뚜벅이 지원</a></li>
							</c:when>
							<c:otherwise>
								<li class="topMenu_li"><a class="topMenu_a"
									href="/account/logout">로그아웃</a></li>
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
				<div class="page_title">
					<h1 style="text-align: center;">
						<strong>고객센터</strong>
					</h1>
				</div>
				<div class="content_section" style="background-color: #787878; height: 40px">
					<ul class="content_ul">
					<c:if test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
						<li class="content_li"><a class="content_a" href="/account/findAccountForm">아이디 찾기</a></li>
						<li class="content_li"><a class="content_a" href="/account/findAccountForm">비밀번호 찾기</a></li>
					</c:if>
						<c:if test="${sessionScope.userVo != null}">
							<li class="content_li"><a class="content_a"
								href="/user/info">마이페이지</a></li>
						</c:if>

						<c:if test="${sessionScope.deliverVo != null }">
							<li class="content_li"><a class="content_a"
								href="/deliver/info">마이페이지</a></li>
						</c:if>
					</ul>
				</div>
				<section class="content_view">
					<div><h3>자주하는 질문</h3></div>
					<table class="table">
						<thead>
							<tr>
								<th style="text-align: center">번호</th>
								<th style="text-align: center">분류</th>
								<th style="text-align: left; margin-left: 30px;"><span style="margin-left: 30px;">내용</span></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="FAQVo" items="${FAQList }">
							<tr style="border-bottom: ">
								<td style="text-align: center">${FAQVo.faq_no }</td>
								<td style="text-align: center">${FAQVo.code_detail }</td>
								<td style="text-align: left; "><a class="faqTitle" href="#" style="margin-left: 30px;">${FAQVo.faq_title }</a></td>
							</tr>
							<tr style="display:none;" class="FAQcontentTr">
								<td colspan="3" class="FAQcontentTd" style="background-color: whitesmoke; align-content: center; "><span style="margin-left: 342px">${FAQVo.faq_content }</span></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
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
<script>
$(function(){
	// FAQ 내용 보여주기
	$(".faqTitle").each(function(index){
		$(this).click(function(){
			$(".FAQcontentTr").eq(index).slideToggle("slow");
		});
	});
});
</script>
</body>
</html>
