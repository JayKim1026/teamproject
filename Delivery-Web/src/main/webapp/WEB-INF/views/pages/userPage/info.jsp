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
						
						<!-- 회원 정보 조회 시 비밀번호 입력 -->
						<form id="check">
							<label>비밀번호</label>
							<input type="password" id="pw_check" name="pw_check">
							<button type="submit" id="btn_check">확인</button>
						</form>			
						
						<!-- 회원 정보 테이블  -->	
							<table class="table infoTable" style="display:none;">
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
												<img id="user_img" name="user_img" src="${image_url}" alt="프로필 사진" style="width: 30%; height: 30%;">
											</c:if>
											<p>회원님을 나타내는 사진을 등록해 주세요.<br> 등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
										</td>
										<td>
											<button type="button" class="btn-default" id=btnChangeImg>사진 변경</button>
 											<input type="file" style="display:none;" id="changeImg">
										</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td>${sessionScope.userVo.user_id}</td>
										<td></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" value="${sessionScope.userVo.user_pw}" style="border:none"/></td>
										<td><button class="btn-default">비밀번호 변경</button></td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${sessionScope.userVo.user_name}</td>
										<td><button class="btn-default">이름 수정</button></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${sessionScope.userVo.user_email}</td>
										<td><button class="btn-default">이메일 변경</button></td>
									</tr>
									<tr>
										<td>휴대전화</td>
										<td>${sessionScope.userVo.user_phone}</td>
										<td><button class="btn-default">휴대전화 변경</button></td>
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
	
	// 사진변경 버튼
	$("#btnChangeImg").click(function(){
		$("#changeImg").trigger("click");
	});

	
	//가입 정보 보기 전 비밀번호 확인
	$("#btn_check").click(function(e){
		e.preventDefault();

		var pw_check = $("#pw_check").val();
		var user_pw = ${sessionScope.userVo.user_pw}
		
		if(pw_check == user_pw) {
			$(".infoTable").fadeIn(1000);
			$("#check").fadeOut(1000);
		}
	});
	
}); // 핸들러
</script>
</html>