<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp"%>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link rel="stylesheet" href="/resources/css/csStyle.css">
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
									href="/account/loginForm">로그인</a></li>
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
					<h1>
						<strong>고객센터</strong>
					</h1>
				</div>
				<div class="content_section">
					<ul class="content_ul">
						<c:if
							test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
							<li class="content_li"><a class="content_a"
								href="/account/findAccountForm">아이디 찾기</a></li>
							<li class="content_li"><a class="content_a"
								href="/account/findAccountForm">비밀번호 찾기</a></li>
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
					<div class="row">
						<!-- 사이드 바 -->
						<div class="col-md-3">
							<div class="sidebarWrapper">
								<ul class="sidebar_ul">
									<li class="sidebar_li faq"><a class="sidebar_a" href="/CSCenter/FAQ">자주하는 질문</a></li>
									<li class="sidebar_li question"><a class="sidebar_a" href="/CSCenter/Question">1:1 질문</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-9">
							<div style="margin-bottom: 30px;">
								<h3 class="content_title">
									<strong>1:1 질문</strong>
								</h3>
							</div>

							<table class="table orgTable">
								<thead>
									<tr>
										<th class="" style="text-align: center">번호</th>
										<th style="text-align: center">카테고리</th>
										<th style="text-align: center;">제목</th>
										<th style="text-align: center;">작성자</th>
										<th style="text-align: center;">작성일</th>
									</tr>
								</thead>
								<tbody class="orgTbody">

								</tbody>
							</table>

							<table id="cloneTable" style="display: none;">
								<tbody id="cloneTbody">
									<tr>
										<td style="text-align: center"></td>
										<td style="text-align: center"></td>
										<td style="text-align: left;"><a class="faqTitle"
											href="#" style="margin-left: 30px;"></a></td>
									</tr>
									<tr style="display: none;" class="trAnswer">
										<td style="background-color: whitesmoke;"></td>
										<td style="background-color: whitesmoke;"></td>
										<td class="FAQcontentTd"
											style="background-color: whitesmoke; align-content: left;"><span></span></td>
									</tr>
								</tbody>
							</table>
							<button style="float: right;" type="button" class="btn btn-secondary btnQuestionFormLord">글쓰기</button>
						</div>
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
<script>
	var pageData = "${pageData}";
	if(pageData = "qusetionPage") {
		$(".question").addClass("this_page");
	} else {
		$(".question").removeClass("this_page");
	}
	
	$(function(){
		// 1:1 문의 글쓰기 버튼 클릭 Form load
		$(".btnQuestionFormLord").click(function(){
			location.href="/CSCenter/QuestionForm";
		});
	}); //핸들러
</script>
</body>
</html>
