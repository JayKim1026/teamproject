<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/link.jsp"%>
</head>
<body>
	<!-- 헤더 -->
	<header id="head_Container">
		<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
		<h1 id="header_title">마이 페이지</h1>
			<c:if test="${sessionScope.userVo.user_id != null }">
				<form action="/user/logout" method="get">
					<button type="submit" class="btn-default" id="btnLogout">로그아웃</button>
				</form>
			</c:if>
		<br /> userVo:${sessionScope.userVo}
	</header>
	<ul class="sideMenu">
		<li><a href="/user/userPage/info">회원정보</a></li>
		<li><a href="/user/userPage/orderList">주문 내역 조회</a></li>
		<li><a href="/user/userPage/point">포인트 조회</a></li>
		<li><a href="/user/userPage/review">내가 작성한 후기</a></li>
		<li><a href="/user/userPage/question">1:1 문의</a></li>
	</ul>


	<!-- 회원 정보 테이블  -->
	<table class="table">
		<thead>
			<tr>
				<th style="border:none;">기본 회원 정보 <span>필수</span></th>
			<tr>
		</thead>
		<tbody>
			<tr>
				<td>사진</td>
				<td>
					<c:if test="${sessionScope.userVo.user_id != null }">
						<img id="user_img" name="user_img" src="${image_url}" alt="프로필 사진" style="width: 80px; height: 80px;">
					</c:if>
					<p>회원님을 나타내는 사진을 등록해 주세요.<br> 등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
				</td>
				<td ><input class="change_input" type="file" id="change-img" name="user_img" accept="image/, .jpg, .png, .gif"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${sessionScope.userVo.user_id}</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" value="${sessionScope.userVo.user_pw}" style="border: none; cursor: default;" readonly />
				</td>
				<td>
					<input class="change_input"  type="password" name="user_pw">
					<input class="change_input"  type="password" name="user_pw2">
					
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${sessionScope.userVo.user_name}</td>
				<td>
					<input class="change_input"  type="text" name="user_name">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${sessionScope.userVo.user_email}</td>
				<td>
					<input class="change_input"  type="email" name="user_name">
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>${sessionScope.userVo.user_phone}</td>
				<td>
					<input class="change_input"  type="tel" name="user_name">
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>계좌번호</td> -->
<!-- 				<td></td> -->
<!-- 				<td><button class="btn-default">계좌 변경</button></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
		</tbody>
	</table>
	
	<button type="button" id="btnUpdate">수정하기</button>
	
	<form>
		<input type="hidden" id="user_img" name="user_img">
		<input type="hidden" id="user_id" name="user_id">
		<input type="hidden" id="user_pw" name="user_pw">
		<input type="hidden" id="user_pw2" name="user_pw2">
		<input type="hidden" id="user_name" name="user_name">
		<input type="hidden" id="user_email" name="user_email">
		<input type="hidden" id="user_phone" name="user_phone">
	</form>
	
</body>

<script>
$(function() {
	// 수정하기 버튼 클릭
	
	// 이미지 선택
	$("#change-img").change(function(){
		var imgName = $(this).val();
		var user_img = $("input[name=user_img]").val();
		console.log("imgName : " + imgName);
		console.log("user_img : " + user_img );
	});
}); // 핸들러
</script>
</html>