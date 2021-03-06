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
									href="/account/registerForm">사용자 가입</a></li>
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
								</ul>
							</div>
						</div>
						<div class="col-md-9">
							<div style="margin-bottom: 30px;">
								<h3 class="content_title">
									<strong>자주하는 질문</strong>
								</h3>
								<select class="category" name="category">
									<option value="4-000" selected="selected">전체</option>
									<option value="4-001">주문문의</option>
									<option value="4-002">배달문의</option>
									<option value="4-003">웹이용문의</option>
									<option value="4-004">앱이용문의</option>
									<option value="4-005">기타문의</option>
								</select> 
								
								<input type="text" class="form keyword" name="search">
								<button type="button" class="btnSearch">검색</button>
							</div>

							<table class="table orgTable">
								<thead>
									<tr>
										<th class="" style="text-align: center">번호</th>
										<th style="text-align: center">카테고리</th>
										<th style="text-align: left; margin-left: 30px;"><span
											style="margin-left: 30px;">제목</span></th>
									</tr>
								</thead>
								<tbody class="orgTbody">

								</tbody>
							</table>

							<table id="cloneTable" style="display: none; table-layout: fixed;">
								<tbody id="cloneTbody">
									<tr>
										<td style="text-align: center; width: 5%;"></td>
										<td style="text-align: center; width: 10%;"></td>
										<td style="text-align: left; width: 45%;"><a class="faqTitle" style="margin-left: 30px;"></a></td>
									</tr>
									<tr style="display: none;" class="trAnswer">
										<td style="background-color: whitesmoke;"></td>
										<td style="background-color: whitesmoke;"></td>
										<td class="FAQcontentTd" style="background-color: whitesmoke; "><span></span></td>
									</tr>
								</tbody>
							</table>
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
	if(pageData = "faqPage") {
		$(".faq").addClass("this_page");
	} else {
		$(".faq").removeClass("this_page");
	}
	
	$(function() {
		var category = $(".category").val();
		var keyword = $(".keyword").val();
		getFAQ(category, keyword);

		function getFAQ(category, keyword) {
			var url = "/CSCenter/search"
			var sendData = {
				"category" : $(".category").val(),
				"keyword" : $(".keyword").val()
			};

			$.get(url, sendData, function(data) {
				console.log(data);
				$(".orgTbody").empty();
				$.each(data, function() {
					var trTitleClone = $("#cloneTbody").children().eq(0).clone();
					var trAnswerClone = $("#cloneTbody").children().eq(1).clone();
					trTitleClone.find("td").eq(0).text(this.r);
					trTitleClone.find("td").eq(1).text(this.code_detail);
					trTitleClone.find("td").eq(2).find("a").text(this.faq_title);
					trTitleClone.find("td").eq(2).find("a").attr("data-r", this.r);
					trAnswerClone.find("td").find("span").text(this.faq_content);

					$(".orgTbody").append(trTitleClone);
					$(".orgTbody").append(trAnswerClone);
				});
			});
		}

		// 검색하기
		$(".btnSearch").click(function() {
			getFAQ(category, keyword);
		});

		// FAQ 내용 보여주기
		$(document).on("click", ".faqTitle", function() {
			console.log($(this).attr("data-r"));
			var r = parseInt($(this).attr("data-r"));
			if($(".trAnswer").eq(r - 1).css("display") != "none") {
				$(".trAnswer").eq(r - 1).hide();
			} else {
				$(".trAnswer").hide();
				$(".trAnswer").eq(r - 1).slideToggle("slow");
			}
		});
	}); // 핸들러
</script>
</body>
</html>
