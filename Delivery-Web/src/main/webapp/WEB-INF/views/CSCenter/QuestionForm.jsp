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
<style>
.logo {
	float: left;
	font-family: 'Nanum Pen Script', cursive;
	text-decoration: none;
	font-size: 35px;
	color: black;
}

.page_title {
	margin-bottom: 10px;
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
	margin-top: 30px;
	font-size: 60px;
	margin-bottom: 30px;
	text-align: center;
}

.content_section {
	background-color: #787878;
	height: 40px;
}

.content_title {
	margin-bottom: 20px;
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

.sidebar_ul {
	margin-top: 63px;
	padding: 0px;
	background-color: white;
	list-style: none;
}

.sidebar_li {
	padding-block: 30px;
	margin: 0;
	border: 1px solid whitesmoke;
	width: 220px;
	justify-content: center;
	text-align: center;
	cursor: pointer;
}

.sidebar_li:hover {
	background-color: whitesmoke;
}

.sidebar_a {
	display: block;
	text-decoration: none;
	color: black;
	font-size: 20px;
}

.this_page {
	background-color: whitesmoke;
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
									<li class="sidebar_li faq"><a class="sidebar_a"
										href="/CSCenter/FAQ">자주하는 질문</a></li>
									<li class="sidebar_li question"><a class="sidebar_a"
										href="/CSCenter/Question">1:1 질문</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-9">
							<div style="margin-bottom: 30px;">
								<h3 class="content_title">
									<strong>1:1 질문</strong>
								</h3>
							</div>
							<form action="" method="POST" enctype="multipart/form-data">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td class="td_title">제목</td>
											<td>
												<div>
													<select class="category" name="q_category">
														<option value="4-000" selected="selected">전체</option>
														<option value="4-001">주문문의</option>
														<option value="4-002">배달문의</option>
														<option value="4-003">웹이용문의</option>
														<option value="4-004">앱이용문의</option>
														<option value="4-005">기타문의</option>
													</select> 
												</div>
												<div>
													<input type="text" name="q_title" required>
												</div>
											</td>
										</tr>
										<tr>
											<td class="td_title">주문번호</td>
											<td>
												<input type="text" name="q_order_no" required readonly style="cursor: initial">
												<button type="button" class="btn btn-secondary btnShowOrderList">주문조회</button>
												<div>
													
												</div>
											</td>
										</tr>
										<tr>
											<td class="td_title">이메일</td>
											<td><input type="email" name="q_email" required readonly style="cursor: initial" value="${userVo.user_email }"></td>
										</tr>
										<tr>
											<td class="td_title">전화</td>
											<td><input type="tel" name="q_title" required readonly style="cursor: initial"  value="${userVo.user_phone }"></td>
										</tr>

										<tr>
											<td class="td_title">내용</td>
											<td>
												<div>주의 사항</div>
												<textarea style="width:100%; height: 400px"></textarea>
											</td>
										</tr>
										<tr>
											<td class="td_title">이미지</td>
											<td><input type="file" accept=".png, .jpg" /></td>
										</tr>
									</tbody>
								</table>
								<button style="float: right;" type="submit" class="btn btn-secondary btnQuestionWriteRun">작성완료</button>
							</form>
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
		if (pageData = "qusetionPage") {
			$(".question").addClass("this_page");
		} else {
			$(".question").removeClass("this_page");
		}
		
		$(function(){
			$(".btnShowOrderList").click(function(e){
				e.preventDefault();
				var url ="/CSCenter/ShowOrderList";
				var user_no = "${userVo.user_no}";
				console.log(user_no);
				var sendData = {
						"user_no" : user_no
				};
				$.post(url, sendData, function(){
					
				});
			});
		});
	</script>
</body>
</html>
