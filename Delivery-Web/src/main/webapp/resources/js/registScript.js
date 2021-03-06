$(function(){
	//header 가리기
	$("#main_Joinus").hide();
	//회원가입 완료 버튼 클릭
	$("#btnRegister").click(function(e) {
		e.preventDefault();
		//<주소>
		var road1 = $("#sample4_roadAddress").val();
		var road2 = $("#sample4_extraAddress").val();
		var road3 = $("#sample4_detailAddress").val();
		if(road2 == null || road2 == "") {
			$("#user_addr").val(road1 + road3);
		} else {
			$("#user_addr").val(road1 + road2 + " " + road3);
		}
		//<아이디 ~ 이메일 이미지는 제외>
		var idCheck = $("#user_id").val();
		var pwCheck = $("#user_pw").val();
		var pwCheck2 = $("#user_pw2").val();
		var nameCheck = $("#user_name").val();
		var birthCheck = $("#user_birth").val();
		var sample4_detailAddress = $("#sample4_detailAddress").val();
		var phoneCheck = $("#user_phone").val();
		var emailCheck = $("#user_email").val();
		
		if(idCheck.trim() == null || idCheck.trim() == "") {
			alert("아이디를 입력해주세요");
			$("#user_id").focus();
			return;
		} else if(pwCheck.trim() == null || pwCheck.trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#user_pw").focus();
			return;
		} else if(pwCheck2.trim() == null || pwCheck2.trim() == ""){
			alert("확인 비밀번호를 입력해 주세요");
			$("#user_pw2").focus();
			return;
		} else if(nameCheck.trim() == null || nameCheck.trim() == "") {
			alert("이름을 입력해 주세요");
			$("#user_name").focus();
			return;
		} else if(birthCheck == null || birthCheck == "") {
			alert("생일을 입력해 주세요");
			$("#user_birth").focus();
			return;
		} else if(sample4_detailAddress.trim() == null || sample4_detailAddress.trim() == ""){
			alert("상세주소를 입력해주세요");
			$("#sample4_detailAddress").focus();
			return; 
		} 
		else if(phoneCheck.trim() == null || phoneCheck.trim() == "") {
			alert("전화번호를 입력해 주세요");
			$("#user_phone").focus();
			return;
		} else if(emailCheck.trim() == null || emailCheck.trim() == "") {
			alert("이메일을 입력해주세요");
			$("#user_email").focus();
			return;
		} else {
			$("#frmRegist").submit();
		}
	}); // 회원 가입 완료 버튼
	
	//<아이디칸>사용 가능한 아이디(영어 대소문자, 숫자) 
	$("#user_id").keyup(function() {
		var user_id = $("#user_id").val();
		var char_user_id = "";
		var result = true;
		if(user_id == "" || user_id == null) {
			$(".id_state").text("");
		} else {
			for(var i = 0; i < user_id.length; i++) {
				if( 5 < user_id.length &&  user_id.length < 17) {
					char_user_id = user_id.charCodeAt(i)
					if((47 < char_user_id && char_user_id < 58  ) || (96 < char_user_id && char_user_id < 123)){
						$(".id_state").text("");
					} else {
						result = false;
						$(".id_state").text("6~16자의 영문 소문자와 숫자만 사용가능합니다.").css("color", "red");
						break;
					}
				} else {
					result = false;
					$(".id_state").text("6~16자의 영문 소문자와 숫자만 사용가능합니다.").css("color", "red");
					break;
				}
			}
		//<아이디칸>아이디 중복확인
		if(result) {
			var url = "/account/checkIdDupl";
			var user_id = $("#user_id").val();
			sendData = {
					"acc_id" :  user_id
			};
			$.post(url, sendData, function(data){
				if(data == true){
					$(".id_state").text("멋진 아이디네요!").css("color", "green");
				} else {
					$(".id_state").text("이미 사용중이거나 탈퇴한 아이디 입니다.").css("color", "red");
				}
			});// ajax
		}
		}// 중복확인 if
	});// id keyup
	
	// <비밀번호칸> 숫자, 영어 대소문자만 입력
	$("#user_pw").keyup(function(){
		var user_pw = $(this).val();
		var char_user_pw = "";
		if(user_pw == "" || user_pw == null){
			$(".pw_state").text("");
		} else {
			for(var i = 0; i < user_pw.length; i++){
				if( 7 < user_pw.length && user_pw.length < 17){
					char_user_pw = user_pw.charCodeAt(i);
					if((47 < char_user_pw && char_user_pw < 58  ) || (64 < char_user_pw && char_user_pw < 91) || (96 < char_user_pw && char_user_pw < 123)){
						$(".pw_state").text("사용가능").css("color", "green");
					} else {
						$(".pw_state").text("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.").css("color", "red");
						break;
					} 
				} else {
					$(".pw_state").text("8~16자의 영문 대소문자와 숫자만 입력가능 합니다.").css("color", "red");
					break;
				}
			}
		}
	});
	
	// <비밀번호 확인칸 > user_pw2 user_pw랑 일치하는지 확인
	$("#user_pw2").keyup(function() {
		var user_pw = $("#user_pw").val();
		var user_pw2 = $("#user_pw2").val();
		if(user_pw2 == null || user_pw2 == ""){
			$(".pw_check").text("");
		} else {
			if(user_pw != user_pw2){
				$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
			} else {
				$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
			}
		}
	});
	
	//<이름칸>이름칸에 한글만 입력 가능.
	$("#user_name").keyup(function() {
		var user_name = $("#user_name").val();
		var char_user_name = "";
		if(user_name == "" || user_name == null) {
			$(".name_state").text("");
		} else {
			for(var i = 0; i < user_name.length; i++){
				char_user_name = user_name.charCodeAt(i);
				if(char_user_name < 44032 || 55203 < char_user_name ){
					$(".name_state").text("이름을 바르게 입력해주세요 (특수기호, 숫자 , 영어는 입력 불가능합니다)").css("color", "red");
				} else {
					$(".name_state").text("");
				} 
			}
		}
	});
	//<전화번호>
	$("#user_phone").keyup(function(){
		var user_phone = $(this).val();
		var char_user_phone = "";
		if(user_phone == null || user_phone == "") {
			$(".phone_state").text("");
		} else {
			for(var i = 0; i < user_phone.length; i++) {
				char_user_phone = user_phone.charCodeAt(i);
				if(9 < user_phone.length && user_phone.length < 17) {
					if( 47< char_user_phone && char_user_phone < 58) {
						$(".phone_state").text("");
					} else {
						$(".phone_state").text("전화번호를 바르게 입력해주세요.(10자에서 16자의 숫자만 입력 가능합니다) ").css("color", "red");
						break;
					}
				} else {
					$(".phone_state").text("전화번호를 바르게 입력해주세요.(10자에서 16자의 숫자만 입력 가능합니다) ").css("color", "red");
					break;
				}
			}
		}
	});
	//<이메일>
	$("#user_email").keyup(function(){
		var user_email = $(this).val();
		var char_user_email = "";
		if(user_email == null || user_email == "") {
			$(".email_state").text("");
		} else {
			if(user_email.indexOf("@") != -1 && user_email.indexOf(".") != -1 &&
                    (user_email.indexOf("@") != 0) &&
                    (user_email.indexOf("@")+1 < user_email.indexOf(".")) &&
                    (user_email.indexOf(".")+1 < user_email.length)) {
				$(".email_state").text("");
            } else {
            	$(".email_state").text("옳지 않은 이메일 형식입니다").css("color", "red");
            }
		}
	});
	
	$("#sample4_postcode").click(function() {
		sample4_execDaumPostcode();
	});
}); // 핸들러

//<주소>
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