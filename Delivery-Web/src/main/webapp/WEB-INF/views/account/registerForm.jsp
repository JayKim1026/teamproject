<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/registerForm.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<%@ include file="../include/link.jsp" %>
<title>사용자 회원가입 페이지</title>
</head>
<body>
<%@include file="../include/header.jsp" %>
<!-- 일반회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 register_wrapper" >
				<div class="register_title">일반회원 가입</div>
				<form role="form" id="frmRegist" action="/user/registerRun" method="post" enctype="multipart/form-data">
					<div class="form-group">
					 	<label for="user_id"> 아이디 </label>
						<input type="text" class="form-control" id="user_id" name="user_id" required maxlength="16"/>
						<span class="id_state" id="checkIdDupl"></span>
					</div>

					<div class="form-group">
						<label for="user_pw"> 비밀번호 </label>	
						<input type="password" class="form-control" id="user_pw" name="user_pw" required  maxlength="16"/>
						<span class="pw_state"></span>
					</div>

					<div class="form-group">
						<label for="user_pw2"> 비밀번호 확인 </label>
						<input type="password" class="form-control" id="user_pw2" name="user_pw2" required maxlength="16"/>
						<span class="pw_check"></span>
					</div>

					<div class="form-group">
						<label for="user_name"> 이름 </label>
						<input type="text" class="form-control" id="user_name" name="user_name" required  maxlength="8">
						<span class="name_state"></span>
					</div>

					<div>
						<label for="user_birth"> 생년 월일 </label>
						<div class="form-group">
							<input type="date" class="form-control" id="user_birth" name="str_user_birth" max="2100-12-31" required/>
						</div>
					</div>
					
					<div class="form-group">
						<div>
							<label for="user_img"> 프로필 사진 </label> 
							<input type="file" class="form-control-file" id="user_img" name="f_user_img" accept="image/,.jpg,.png,.gif"/> 
							<span class="file_state"></span>
						</div>
					</div>

					<div>
						<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
						<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="btnAddr"><br>
						<input type="text" class="form-control user_addr addr1" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text"class="form-control "  id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control addr3" id="sample4_detailAddress" placeholder="상세주소(필수)" required>
						<input type="text" class="form-control addr2"  id="sample4_extraAddress" placeholder="참고항목">
						<input type="hidden" id="user_addr" name="user_addr">
					</div>

					<div class="form-group">
					<br/>
						<label for="user_phone"> 전화번호 </label>
						<input type="tel" class="form-control" id="user_phone" name="user_phone" required min="10" maxlength="16"/>
						<span class="phone_state"></span>
					</div>

					<div class="form-group">
						<label for="user_email"> 이메일 </label>
						<input type="email" class="form-control" id="user_email" name="user_email" required/>
						<span class="email_state"></span>
					</div>
					<button type="submit" class="btn btn-primary" id="btnRegister">가입완료</button>
				</form>
				</div>
			</div>
			<!--// 회원가입 폼  -->
			<div class="col-md-4"></div>
		</div>
<%@ include file = "../include/footer.jsp" %>
</body>
<script>
$(function() {
	// 메세지
	var isImage_msg = "${isImage_msg}";
	if(isImage_msg == "notImage") {
		alert("jpg, png, gif 파일만 업로드 가능합니다.");
	} 
});
</script>
<script src="/resources/js/registScript.js"></script>