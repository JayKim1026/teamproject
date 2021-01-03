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

.pwChange{
	display:none;
}

.pwLabel{
	display: inline-block;
    min-width: 165px;
    line-height: 32px;
}

.EmailChange{
	display: none;
}

.phoneChange{
	display: none;
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
						<img id="user_img" name="user_img" src="${image_url}" alt="프로필 사진" style="width: 80px; height: 80px;">
						<img id="chgImgPreview" src="#" alt="변경한 프로필 사진" style="width: 80px; height: 80px;"/>
						<p>회원님을 나타내는 사진을 등록해 주세요.<br> 등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
					</div>
					<div class="imgChange">
						<form role="form" action="/user/imgChange" method="POST" enctype="multipart/form-data" id="frmImgChange">
							<input type="file" class="upload-hidden" id="file-upload" name="chgImg" accept="image/, .jpg, .png, .gif">
							<input type="hidden" value="${sessionScope.userVo.user_img }" name="orgImg"><!-- 기존 프사  -->
						</form>
							<button type="button" class="btn btn-secondary" id="upload-click"> 사진 선택</button>
							<button type="button" class="btn btn-secondary" > 기본 이미지로 변경 </button>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary" id="btnChgImg">사진변경</button>
					<button type="button" class="btn btn-secondary imgChange" id="btnChgImg_cancel">취소</button>
					<button type="button" class="btn btn-secondary imgChange" id="btnChgImg_ok">완료</button>
					
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${sessionScope.userVo.user_id}</td>
				<td></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td class="pwHide">
					<div >
						<input type="password" value="${sessionScope.userVo.user_pw}" style="border: none; cursor: default;" readonly />
					</div>
				</td>
				<td class="pwChange">
					<div>
						<label class="pwLabel"> 현재 비밀번호</label>
						<input type="password" name="user_pw">
					</div>
					<div>
						<label class="pwLabel"> 새 비밀번호</label>
						<input type="password" name="user_Npw">
					</div>
					<div>
						<label class="pwLabel"> 새 비밀번호 확인</label>
						<input type="password" name="user_Npw2">
					</div>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_cancel">취소</button>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_ok">완료</button>
				</td>
				<td> 
					<button type="button" class="btn btn-secondary pwHide" id="btnChgPw">비밀번호 변경</button>
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
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="EmaileHide">
					<div>
						${sessionScope.userVo.user_email}
					</div>
				</td>
				<td class="EmailChange">
					<div>
						<label class="emailLabel">수정 이메일 </label>
						<input type="email" name="user_name">
						<br/>
						<button type="button" class="btn btn-secondary">취소</button>
						<button type="submit" class="btn btn-secondary">완료</button>
					</div>
				</td>
				<td>
					<button type="button" class="btn btn-secondary chgEmail">이메일 변경</button>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div>
						${sessionScope.userVo.user_phone}
					</div>
				</td>
				<td class="phoneChange">
					<div>
						<label>수정 전화번호</label>
						<input type="tel" name="user_name">
						<br/>
						<button type="button" class="btn btn-secondary">취소</button>
						<button type="submit" class="btn btn-secondary">완료</button>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary">휴대전화 변경</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>

<script>
$(function() {
	//<비밀번호 변경>
	
	// 비밀번호 변경 버튼 클릭
	$("#btnChgPw").click(function(){
		$(".pwHide").hide();
		$(".pwChange").show();
	});
	
	// 비밀번호 변경 - 취소버튼 클릭
	$("#btnChgPw_cancel").click(function(){
		$(".pwChange").hide();
		$(".pwHide").show();
	});
	
	// 비밀번호 변경 - 현재 비밀번호 AJAX 확인하기
	$("input[name=user_pw]").keyup(function(){
		
	});
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
	$("#file-upload").on("change" , function() {
		readURL(this);
		$("#user_img").hide();
		$("#chgImgPreview").show();
	});
	
	// 사진 변경 form 전송 //TODO DB에 저장이 되지만 세션에 변경이 안되는 듯. 로그아웃 후 로그인했을 때 사진이 안뜸. 새로 회원가입 후 조회하면 사진 뜸. 
	$("#btnChgImg_ok").click(function(e){
		e.preventDefault();
		$("#frmImgChange").submit();
	});
	
	// 이메일 변경 버튼
	$(".chgEmail").click(function(){
		$(".EmaileHide").hide();
		$(this).hide();
		$(".EmailChange").show();
		
		
	});
}); // 핸들러

// 바꿀 프로필 사진 미리 보여주기
function readURL(input) {
    if (input.files && input.files[0]) {
    	var reader = new FileReader();
		reader.onload = function (e) {
          $('#chgImgPreview').attr('src', e.target.result);
       }
		reader.readAs
		reader.readAsDataURL(input.files[0]);
       	console.log("input.files[0] : " + input.files[0]);
    }
}
</script>
</html>