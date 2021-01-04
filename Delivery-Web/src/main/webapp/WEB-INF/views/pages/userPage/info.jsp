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

.Label{
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
					<form id="frmPw" action="/user/pwChange" method="post">
						<div>
							<label class="pw Label"> 현재 비밀번호</label>
							<input type="password" id="user_pw" name="user_pw">
						</div>
						<div>
							<label class="pw Label"> 새 비밀번호</label>
							<input type="password" id="user_Npw" name="user_Npw">
						</div>
						<div>
							<label class="pw Label"> 새 비밀번호 확인</label>
							<input type="password" id="user_Npw2" name="user_Npw2">
						</div>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_cancel">취소</button>
					<button type="button" class="btn btn-secondary pwChange" id="btnChgPw_ok">완료</button>
					</form>
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
						<label class="email Label">수정 이메일 </label>
						<input type="email" name="user_name">
						<br/>
						<button type="button" class="btn btn-secondary" id="btnChgEmail_cancel">취소</button>
						<button type="submit" class="btn btn-secondary" id="btnChgEmail_ok">완료</button>
					</div>
				</td>
				<td>
					<button type="button" class="btn btn-secondary chgEmail">이메일 변경</button>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td class="phoneHide">
					<div>
						${sessionScope.userVo.user_phone}
					</div>
				</td>
				<td class="phoneChange">
					<div>
						<label class="phone Label">수정 전화번호</label>
						<input type="tel" name="user_name">
						<br/>
						<button type="button" class="btn btn-secondary" id="btnChgPhone_cancel">취소</button>
						<button type="submit" class="btn btn-secondary" id="btnChgPhone_ok">완료</button>
					</div>
				</td>
				<td>	
					<button type="button" class="btn btn-secondary" id="btnChgPhone">휴대전화 변경</button>
				</td>
			</tr>
			<%-- <tr>
				<td>주소</td>
				<td class="addrHide"> 
					<div>
						${sessionScope.userVO.user_addr}
					</div>
				</td>
				<td class="addrChange">
				</td>
				<td>
					<button type="button" class="btn btn-secondary">주소 변경</button>
				</td>
			</tr> --%>
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
	
	// 비밀번호 변경 - 완료버튼 클릭 
	$("#btnChgPw_ok").click(function(){
		//비밀번호 AJAX 확인하기
		var user_pw = $("input[name=user_pw]").val();
		var url = "/user/pwCheck";
		var sendData = {
				"user_pw"	:	user_pw				
		};
		$.post(url,sendData,function(result){
			// 현재 비밀번호가 => 일치 true / 불일치 false
			if(result == "true") {
				var Npw = $("#user_Npw").val();
				var Npw2 = $("#user_Npw2").val();
				
				if(Npw != null && Npw != ""){
					for(var i = 0; i < Npw.length; i++) {
						var char_Npw = Npw.charCodeAt(i);
						if( 7 < Npw.length && Npw.length < 17) {
							if((47 < char_Npw && char_Npw < 58  ) || (64 < char_Npw && char_Npw < 91) || (96 < char_Npw && char_Npw < 123)) {
								if(Npw == Npw2) {
									$("#frmPw").submit();
								} else {
									alert("새 비밀번호가 일치하지 않습니다.");
									$("#user_Npw").val("").focus();
									$("#user_Npw2").val("");
									return;
								}
							} else {
								alert("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.");
								return;
							}// 영어 대소문자, 숫자  else
						} else {
							alert("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.");
							return;
						}
					} //for
				} else if(Npw == null || Npw == "") {
					alert("새 비밀번호를 입력해주세요.");
					$("#user_Npw").focus();
					return;
				}
				
			} else {
				alert("현재 비밀번호를 다시 입력해주세요.");
				$("#user_pw").val("").focus();
			}
				
		});// post
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
	
	// 사진 변경 form 전송 
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
	// 이메일 변경 - 취소 버튼
		$("#btnChgEmail_cancel").click(function(){
			$(".EmaileHide").show();
			$(".chgEmail").show();
			$(".EmailChange").hide();
		});
	//TODO 
	//이메일 변경 - 완료 버튼 
	
	//휴대전화 변경 버튼
	$("#btnChgPhone").click(function(){
		$(".phoneChange").show();
		$(this).hide();
		$(".phoneHide").hide();
	});
	
	//휴대전화 변경 - 취소버튼
	$("#btnChgPhone_cancel").click(function(){
		$(".phoneChange").hide();
		$("#btnChgPhone").show();
		$(".phoneHide").show();
	});
	//TODO
	//휴대전화 변경 - 완료버튼
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