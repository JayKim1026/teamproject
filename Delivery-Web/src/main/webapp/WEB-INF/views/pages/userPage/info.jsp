<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../../include/link.jsp" %>
</head>

<body>
<!-- 헤더 -->
<header id="head_Container">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
				</div>
				<div class="col-md-8">
					<h1> 마이 페이지 </h1>
				</div>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${sessionScope.userVo.user_id != null }">
							<button type="button" class="btn-default" id="btnLogout">로그아웃</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn-default" id="btnLogin">로그인</button>
						</c:otherwise>
					</c:choose>
					<br/>
					userVo:${sessionScope.userVo}
				</div>
			</div>
		</div>
	</div>
</div>
</header>

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 side-bar">
			<ul>
				<li><a href="/user/userPage/info">회원정보</a></li>
				<li><a href="/user/userPage/orderList">주문 내역 조회</a></li> 
				<li><a href="/user/userPage/point">포인트 조회</a></li> 
				<li><a href="/user/userPage/review">내가 작성한 후기</a></li> 
				<li><a href="/user/userPage/question">1:1 문의</a></li> 
			</ul>
		</div>
	
		<div class="col-md-8 content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
						
						<!-- 회원 정보 테이블  -->	
							<table class="table infoTable">
								<thead>
									<tr>
										<th>기본 회원 정보 <span>필수</span></th>
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
									</tr>
									<tr>
										<td>아이디</td>
										<td>${sessionScope.userVo.user_id}</td>
										<td></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" value="${sessionScope.userVo.user_pw}" style="border:none; cursor: default;" readonly/></td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${sessionScope.userVo.user_name}</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${sessionScope.userVo.user_email}</td>
									</tr>
									<tr>
										<td>휴대전화</td>
										<td>${sessionScope.userVo.user_phone}</td>
									</tr>
									<!-- <tr>
										<td>계좌번호</td>
										<td></td>
										<td><button class="btn-default">계좌 변경</button></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>

<script>
$(function(){
	// 로그아웃 
	$("#btnLogout").click(function(){
		location.href="/user/logout";
	});
}); // 핸들러
</script>
</html>