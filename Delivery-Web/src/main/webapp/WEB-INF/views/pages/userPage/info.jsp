<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<%@ include file="../../include/link.jsp"%>
<style>
.imgChange{
	display:none;
} 
.upload-hidden{
	display:none;
}
#chgImgPreview{
	display:none;	
}
</style>
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
					<div>
						<c:if test="${sessionScope.userVo.user_id != null }">
							<img id="user_img" name="user_img" src="${image_url}" alt="프로필 사진" style="width: 80px; height: 80px;">
							<div id="chgImgPreview">preview</div>
						</c:if>
						<p>회원님을 나타내는 사진을 등록해 주세요.<br> 등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
					</div>
					<div class="imgChange">
						<form role="form" action="/user/imgChange" method="POST" enctype="multipart/form-data" id="frmImgChange">
							<input type="file" class="upload-hidden" id="file-upload" name="chgImg" accept="image/, .jpg, .png, .gif">
							<input type="hidden" value="${sessionScope.userVo.user_img }" name="orgImg">
						</form>
							<button type="button" class="btn btn-secondary" id="upload-click"> 사진 선택</button>
							<button type="button" class="btn btn-secondary" > 기본 이미지로 변경 </button>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary" id="btnChgImg">사진변경</button>
					<button type="button" class="btn btn-secondary imgChange" id="btnChgImg_cancel">취소</button>
					<button type="submit" class="btn btn-secondary imgChange" id="btnChgImg_ok">완료</button>
					
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${sessionScope.userVo.user_id}</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<div class="out">
						<input type="password" value="${sessionScope.userVo.user_pw}" style="border: none; cursor: default;" readonly />
					</div>
				</td>
				<td>
					<div class="update_div">
						<label> 현재 비밀번호</label>
						<input type="password" name="user_pw">
					</div>
					<div class="update_div">
						<label> 새 비밀번호</label>
						<input type="password" name="user_pw1">
					</div>
					<div class="update_div">
						<label> 새 비밀번호 확인</label>
						<input type="password" name="user_pw2">
					</div>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<div>
						${sessionScope.userVo.user_name}
					</div>
				</td>
				<td>
					<div class="update_div" >
						<label>수정 이름 </label>
						<input type="text" name="user_name">
					</div>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<div>
						${sessionScope.userVo.user_email}
					</div>
				</td>
				<td>
					<div class="update_div">
						<label>수정 이메일 </label>
						<input type="email" name="user_name">
					</div>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div>
						${sessionScope.userVo.user_phone}
					</div>
				</td>
				<td>	
					<div class="update_div">
						<label>수정 전화번호</label>
						<input type="tel" name="user_name">
					</div>
				</td>
			</tr>
		</tbody>
	</table>

	<!-- <form>
		<input type="hidden" id="user_img" name="user_img">
		<input type="hidden" id="user_id" name="user_id">
		<input type="hidden" id="user_pw" name="user_pw">
		<input type="hidden" id="user_pw2" name="user_pw2">
		<input type="hidden" id="user_name" name="user_name">
		<input type="hidden" id="user_email" name="user_email">
		<input type="hidden" id="user_phone" name="user_phone">
	</form> -->
	
</body>

<script>
$(function() {
	//<이미지 수정>
	// 사진 변경 버튼
	$("#btnChgImg").click(function() {
		$(this).hide();
		$(".imgChange").show();
	});
	
	// 사진변경 - 취소 버튼
	$("#btnChgImg_cancel").click(function() {
		$(this).hide();
		$(".imgChange").hide();
		$("#btnChgImg").show();
		$("#chgImgPreview").hide();
		$("#user_img").show();
	});
	
	// 사진변경 - 사진 선택 버튼 -> input file 실행
	$("#upload-click").click(function() {
		$("#file-upload").trigger("click")
	});
	
	// 사진변경 - 실행된 input file에서 이미지를 선택 => 미리보기 이미지 띄우기
	$("#file-upload").change(function(e) {
		var imgChangeName = e.target.files;
		//TODO 제이쿼리 이미지 미리보기
		console.log("imgChangeName : " + imgChangeName );
		if(imgChangeName != null ){
			$("#user_img").hide();
			$("#chgImgPreview").show();
			//TODO 변경할 프사 미리보기
			
		} else {
			return;
		}
		
	});
	// TODO 사진변경 - 완료 버튼
	
	
}); // 핸들러
</script>
</html>