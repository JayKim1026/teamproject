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

// <주소>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            var detailAddr = $("#sample4_detailAddress").val();
    		if(detailAddr == null || detailAddr == "") {
    			$("#sample4_detailAddress").focus();
    		}
        }
    }).open();
}
</script>
<script src="/resources/js/registScript.js"></script>