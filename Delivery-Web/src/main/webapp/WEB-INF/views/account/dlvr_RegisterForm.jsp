<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/registerForm.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Deliver Register Page</title>
<%@ include file="../include/link.jsp"%>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<!-- 라이더 회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 register_wrapper">
				<div class="register_title">라이더 회원 가입</div>
				<div style="margin-top:20px; margin-bottom: 20px;">
					<p style="text-align: center;"><strong><span style="color:red;">&#91;주의&#93;</span> 라이더 회원은 <u>만18세 이상</u>만 가입이 가능합니다.</strong></p>
				</div>
				<form role="form" id="frmRegist" action="/deliver/dlvr_RegisterRun" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="dlvr_id"> 아이디 </label> 
						<input type="text" class="form-control" id="dlvr_id" name="dlvr_id" required maxlength="16" /> 
						<span class="id_state" id="checkIdDupl"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_pw"> 비밀번호 </label> 
						<input type="password" class="form-control" id="dlvr_pw" name="dlvr_pw" required maxlength="16" /> 
						<span class="pw_state"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_pw2"> 비밀번호 확인 </label> 
						<input type="password" class="form-control" id="dlvr_pw2" name="dlvr_pw2" required maxlength="16" />
						<span class="pw_check"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_name"> 이름 </label> 
						<input type="text" class="form-control" id="dlvr_name" name="dlvr_name" required maxlength="8" >
						<span class="name_state"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_birth"> 생년 월일 </label>
						<div class="form-group">
							<input type="date" class="form-control" id="dlvr_birth" name="str_dlvr_birth" 
								   max="2100-12-31" required />
						</div>
					</div>

					<div class="form-group imgFile">
						<div>
							<p style="text-align: center;"><strong>※ 증명사진과 주민등록증 사진은 <u>신원확인</u> 목적 외에는 이용되지 않고 있습니다 ※</strong></p>
						</div>
						<div>
							<label for="dlvr_img"> 프로필 사진 </label> 
							<input type="file" class="form-control-file" id="dlvr_img" name="f_dlvr_img" accept="image/,.jpg,.png"/> 
							<span class="imgPreview"></span>
						</div>
						<br />
						<div>
							<label for="dlvr_idcard"> 주민등록증 </label>
							<input type="file" class="form-control-file" id="dlvr_idcard" name="f_dlvr_idcard" accept="image/,.jpg,.png"/>
							<span class="idcardPreview"></span>
						</div>
					</div>
					<div class="form-group">
						<span class="file_state"></span>
					</div>

					<div>
						<label>주소</label>
						<br /> 
						<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호"> 
						<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						<br>
						<input type="text" class="form-control dlvr_addr" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소(필수!)" required> 
						<input type="text" class="form-control" id="sample4_extraAddress" placeholder="참고항목">
						<input type="hidden" id="dlvr_addr" name="dlvr_addr">
		 			</div>

					<div class="form-group">
						<br /> <label for="dlvr_phone"> 전화번호 </label> 
						<input type="tel" class="form-control" id="dlvr_phone" name="dlvr_phone" required maxlength="16" />
						<span class="phone_state"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_email"> 이메일 </label> 
						<input type="email" class="form-control" id="dlvr_email" name="dlvr_email" required />
					</div>
					
					<button type="submit" class="btn btn-primary" id="btnRegister">가입완료</button>
				</form>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
<script>
$(function() {
	//메세지
	var isImage_msg = "${isImage_msg}";
	if(isImage_msg == "notImage") {
		alert("jpg, png 파일만 업로드 가능합니다.");
	}
});
</script>
<script src="/resources/js/dlvrRegistScript.js"></script>