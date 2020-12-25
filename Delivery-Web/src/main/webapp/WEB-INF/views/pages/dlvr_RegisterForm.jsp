<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../css/registerForm.css"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<title>Deliver Register Page</title>
<%@ include file="../include/link.jsp" %>
</head>
<body>
<%@include file="../include/header.jsp" %>
<!-- 라이더 회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 register_wrapper" >
				<div class="register_title">라이더 회원 가입</div>
				<form role="form" action="/deliver/dlvr_RegisterRun" method="post">
					<div class="form-group">
					 	<label for="dlvr_id"> 아이디 </label>
						<input type="text" class="form-control" id="dlvr_id" name="dlvr_id" required maxlength="16"/>
						<span class="id_state" id="checkIdDupl"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_pw"> 비밀번호 </label>	
						<input type="password" class="form-control" id="dlvr_pw" name="dlvr_pw" required maxlength="16"/>
						<span class="pw_state">사용불가 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</div>

					<div class="form-group">
						<label for="dlvr_pw2"> 비밀번호 확인 </label>
						<input type="password" class="form-control" id="dlvr_pw2" name="dlvr_pw2" required maxlength="16"/>
						<span class="pw_check">비밀번호 같은지 확인</span>
					</div>

					<div class="form-group">
						<label for="dlvr_name"> 이름 </label>
						<input type="text" class="form-control" id="dlvr_name" name="dlvr_name" required maxlength="8">
						<span class="name_state"><!-- 한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가) --></span>
					</div>

					<div>
						<label for="dlvr_birth"> 생년 월일 </label>
						<div class="form-group">
							<input type="date" class="form-control" id="dlvr_birth" name="str_dlvr_birth" max="2100-12-31" required/>
						</div>
					</div>

					<div class="form-group">
						<label for="dlvr_img"> 증명사진 </label>
						<input type="file" class="form-control-file" id="dlvr_img" name="dlvr_img"/>
						<span class="imgPreview"></span>
					</div>

					<div class="form-group">
						<label for="dlvr_idcard">  주민등록증 </label>
						<input type="file" class="form-control-file" id="dlvr_idcard" name="dlvr_idcard"/>
						<span class="idcardPreview"></span>
					</div>
										
					<div>
					<label>주소</label><br/>
						<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
						<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" class="form-control dlvr_addr" id="sample4_roadAddress" placeholder="도로명주소"  name="dlvr_addr">
						<input type="text"class="form-control"  id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
						<input type="text" class="form-control"  id="sample4_extraAddress" placeholder="참고항목">
					</div>

					<div class="form-group">
					<br/>
						<label for="dlvr_phone"> 전화번호 </label>
						<input type="tel" class="form-control" id="dlvr_phone" name="dlvr_phone"  required maxlength="16"/>
					</div>

					<div class="form-group">
						<label for="dlvr_email"> 이메일 </label>
						<input type="email" class="form-control" id="dlvr_email" name="dlvr_email" required/>
					</div>

					<!-- <div class="form-group">
						<label for="dlvr_acc_num"> 계좌번호 </label>
						<input type="text" class="form-control" id="dlvr_acc_num" />
					</div> -->

					<button type="submit" class="btn btn-primary" id="btnRegister">가입완료</button>
				</form>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
<%@ include file = "../include/footer.jsp" %>
</body>
<script>
$(function(){
	$("input[type=file]").on("change", function(e){
		var file = e.originalEvent.dataTransfer.file;
		console.log(file);
	});	
	/* // 가입 완료
	$("#btnRegister").click(function(e){
		e.preventDefault();
		var dlvr_id = $("#dlvr_id").val();
		var dlvr_pw = $("#dlvr_pw").val();
		var dlvr_name = $("#dlvr_name").val();
		var dlvr_birth = $("#dlvr_birth").val();
		var dlvr_addr = $(".dlvr_addr").val();
		var dlvr_phone = $("#dlvr_phone").val();
		var dlvr_email = $("#dlvr_email").val();
		console.log("dlvr_id : " +dlvr_id);
		console.log("dlvr_pw : " +dlvr_pw);
		console.log("dlvr_name : " +dlvr_name);
		console.log("dlvr_birth: " +dlvr_birth);
		console.log("dlvr_addr : " +dlvr_addr);
		console.log("dlvr_phone : " +dlvr_phone);
		console.log("dlvr_email : " +dlvr_email);
	});
	 */
	
	/* //<아이디칸>사용 가능한 아이디(영어 대소문자, 숫자) 
	$("#dlvr_id").keyup(function() {
		var dlvr_id = $("#dlvr_id").val();
		var char_dlvr_id = "";
		var result = true;
		if(dlvr_id == "" || dlvr_id == null) {
			$(".id_state").text("");
		} else {
			for(var i = 0; i < dlvr_id.length; i++) {
				char_dlvr_id = dlvr_id.charCodeAt(i)
				if((47 < char_dlvr_id && char_dlvr_id < 58  ) || (64 < char_dlvr_id && char_dlvr_id < 91) || (96 < char_dlvr_id && char_dlvr_id < 123)){
					$(".id_state").text("사용가능").css("color", "green");
				} else {
					result = false;
					$(".id_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
					break;
				}
			}
		}
		//<아이디칸>아이디 중복확인
		if(result) {
			var url = "/user/checkIdDupl";
			var dlvr_id = $("#dlvr_id").val();
			sendData = {
					"dlvr_id" :  dlvr_id
			};
			$.get(url, sendData, function(data){
				if(data == true){
					$(".id_state").text("멋진 아이디네요!").css("color", "green");
				} else {
					$(".id_state").text("이미 사용 중이거나, 탈퇴한 아이디 입니다.").css("color", "red");
				}
			});// ajax
		}// 중복확인 if
	});// id keyup */
	
	// <비밀번호칸> 숫자, 영어 대소문자만 입력 + TODO 자릿수 8자에서 16자
	$("#dlvr_pw").keyup(function(){
		var dlvr_pw = $(this).val();
		var char_dlvr_pw = "";
		if(dlvr_pw == "" || dlvr_pw == null){
			$(".pw_state").text("");
		} else {
			for(var i = 0; i < dlvr_pw.length; i++){
				char_dlvr_pw = dlvr_pw.charCodeAt(i);
				if((47 < char_dlvr_pw && char_dlvr_pw < 58  ) || (64 < char_dlvr_pw && char_dlvr_pw < 91) || (96 < char_dlvr_pw && char_dlvr_pw < 123)){
					$(".pw_state").text("사용가능").css("color", "green");
				} else {
					$(".pw_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
					break;
				} 
			}
		}
	});
	
	// <비밀번호 확인칸 > dlvr_pw2 dlvr_pw랑 일치하는지 확인
	$("#dlvr_pw2").keyup(function() {
		var dlvr_pw = $("#dlvr_pw").val();
		var dlvr_pw2 = $("#dlvr_pw2").val();
		if(dlvr_pw2 == null || dlvr_pw2 == ""){
			$(".pw_check").text("");
		} else {
			if(dlvr_pw != dlvr_pw2){
				$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
			} else {
				$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
			}
		}
	});
	
	//<이름칸>이름칸에 한글만 입력 가능.
	$("#dlvr_name").keyup(function() {
		var dlvr_name = $("#dlvr_name").val();
		var char_dlvr_name = "";
		if(dlvr_name == "" || dlvr_name == null) {
			$(".name_state").text("");
		} else {
			for(var i = 0; i < dlvr_name.length; i++){
				char_dlvr_name = dlvr_name.charCodeAt(i);
				if(char_dlvr_name < 45032 || 55203 < char_dlvr_name ){
					$(".name_state").text("특수기호, 숫자 , 영어 입력 불가능합니다").css("color", "red");
					break;
				} else {
					$(".name_state").text("");
				} 
			}
		}
	});
}); // 핸들러
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
        }
    }).open();
}
</script>