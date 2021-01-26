$(function() {
	//header 가리기
	$("#main_DlvrJoinus").hide();
	
	//회원가입 완료 버튼 클릭
	$("#btnRegister").click(function(e) {
		e.preventDefault();
		
		var road1 = $("#sample4_roadAddress").val();
		var road2 = $("#sample4_extraAddress").val();
		var road3 = $("#sample4_detailAddress").val();
		
		if(road2 == null || road2 == "") {
			$("#dlvr_addr").val(road1 + road3);
		} else {
			$("#dlvr_addr").val(road1 + road2 + " " + road3);
		}
		//<아이디 ~ 이메일 이미지는 제외>
		var idCheck = $("#dlvr_id").val();
		var pwCheck = $("#dlvr_pw").val();
		var pwCheck2 = $("#dlvr_pw2").val();
		var nameCheck = $("#dlvr_name").val();
		var birthCheck = $("#dlvr_birth").val();
		var imgCheck = $("#dlvr_img").val();
		var idcardCheck = $("#dlvr_idcard").val();
		var sample4_detailAddress = $("#sample4_detailAddress").val();
		var phoneCheck = $("#dlvr_phone").val();
		var emailCheck = $("#dlvr_email").val();
		
		if(idCheck.trim() == null || idCheck.trim() == "") {
			alert("아이디를 입력해주세요");
			$("#dlvr_id").focus();
			return;
		} else if(pwCheck.trim() == null || pwCheck.trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#dlvr_pw").focus();
			return;
		} else if(pwCheck2.trim() == null || pwCheck2.trim() == ""){
			alert("확인 비밀번호를 입력해 주세요");
			$("#dlvr_pw2").focus();
			return;
		} else if(nameCheck.trim() == null || nameCheck.trim() == "") {
			alert("이름을 입력해 주세요");
			$("#dlvr_name").focus();
			return;
		} else if(birthCheck == null || birthCheck == "") {
			alert("생일을 입력해 주세요");
			$("#dlvr_birth").focus();
			return;
		} else if(imgCheck == null || imgCheck == "") {
			alert("증명사진을 업로드 해주세요.");
			$("#dlvr_img").focus();
			return;
		} else if(idcardCheck == null || idcardCheck =="") {
			alert("신분증 사진을 업로드 해주세요.");
			$("#dlvr_idcard").focus();
			return;
		} else if(sample4_detailAddress.trim() == null || sample4_detailAddress.trim() == ""){
			alert("상세주소를 입력해주세요");
			$("#btnAddr").focus();
			return; 
		} else if(phoneCheck.trim() == null || phoneCheck.trim() == "") {
			alert("전화번호를 입력해 주세요");
			$("#dlvr_phone").focus();
			return;
		} else if(emailCheck.trim() == null || emailCheck.trim() == "") {
			alert("이메일을 입력해주세요");
			$("#dlvr_email").focus();
			return;
		} else {
			$("#frmRegist").submit();
		}
	}); // 회원 가입 완료 버튼
	
	//<아이디칸>사용 가능한 아이디(영어 소문자, 숫자) 
	$("#dlvr_id") .keyup( function() {
		var dlvr_id = $("#dlvr_id").val();
		var dlvr_id_length = $(this).val().length;
		var char_dlvr_id = "";
		var result = true;
		if (dlvr_id == "" || dlvr_id == null) {
			$(".id_state").text("");
		} else {
			for (var i = 0; i < dlvr_id.length; i++) {
				if( 5 < dlvr_id.length && dlvr_id.length < 17) {
					char_dlvr_id = dlvr_id.charCodeAt(i)
					if ((47 < char_dlvr_id && char_dlvr_id < 58)|| (96 < char_dlvr_id && char_dlvr_id < 123)) {
						$(".id_state").text("")
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
			if (result) {
				var url = "/account/checkIdDupl";
				var dlvr_id = $("#dlvr_id").val();
				sendData = {
					"acc_id" : dlvr_id
				};
				$.post(url, sendData, function(data) {
					if (data == true) {
						$(".id_state").text("멋진 아이디네요!").css("color", "green");
					} else {
						$(".id_state").text("이미 사용 중이거나, 탈퇴한 아이디 입니다.").css("color", "red");
					}
				});// ajax
			}// 중복확인 if
		}// else
	});// id keyup

	// <비밀번호칸> 숫자, 영어 대소문자만 입력 
	$("#dlvr_pw").keyup(function() {
		var dlvr_pw = $(this).val();
		//console.log("dlvr_pw : " + dlvr_pw);
		var char_dlvr_pw = "";
		if (dlvr_pw == "" || dlvr_pw == null) {
			$(".pw_state").text("");
		} else {
			for (var i = 0; i < dlvr_pw.length; i++) {
				if( 7 < dlvr_pw.length && dlvr_pw.length < 17) {
					char_dlvr_pw = dlvr_pw.charCodeAt(i);
					console.log("char_dlvr_pw : " + char_dlvr_pw);
					if ((47 < char_dlvr_pw && char_dlvr_pw < 58)|| (64 < char_dlvr_pw && char_dlvr_pw < 91) || (96 < char_dlvr_pw && char_dlvr_pw < 123)) {
						$(".pw_state").text("");
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

	// <비밀번호 확인칸 > dlvr_pw2 dlvr_pw랑 일치하는지 확인
	$("#dlvr_pw2").keyup(
			function() {
				var dlvr_pw = $("#dlvr_pw").val();
				var dlvr_pw2 = $("#dlvr_pw2").val();
				if (dlvr_pw2 == null || dlvr_pw2 == "") {
					$(".pw_check").text("");
				} else {
					if (dlvr_pw != dlvr_pw2) {
						$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
					} else {
						$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
					}
				}
			});

	//<이름칸>이름칸에 한글만 입력 가능.
	$("#dlvr_name").keyup(
			function() {
				var dlvr_name = $("#dlvr_name").val();
				var char_dlvr_name = "";
				if (dlvr_name == "" || dlvr_name == null) {
					$(".name_state").text("");
				} else {
					for (var i = 0; i < dlvr_name.length; i++) {
						char_dlvr_name = dlvr_name.charCodeAt(i);
						if (char_dlvr_name < 44032 || 55203 < char_dlvr_name) {
							$(".name_state").text("이름을 바르게 입력해주세요 (특수기호, 숫자 , 영어는 입력 불가능합니다)").css("color", "red");
							break;
						} else {
							$(".name_state").text("");
						}
					}
				}
			});
	// <생년월일 칸> 현재 날짜와 선택한 날짜 비교로 성인 체크.
	$("#dlvr_birth").change(function(){		
		var dlvr_birth = $(this).val().split("-");
		var dlvr_year = dlvr_birth[0];
		var date = new Date();
		var nowYear = date.getFullYear();
	
		var ageCheck = (nowYear - dlvr_year);
		if(ageCheck < 19) {
			alert("만 18세 이하는 가입하실 수 없습니다.");
			location.href="/main/main"
		} 
	});
	
	//<전화번호>
	$("#dlvr_phone").keyup(function(){
		var dlvr_phone = $(this).val();
		var char_dlvr_phone = "";
		if(dlvr_phone == null || dlvr_phone == "") {
			$(".phone_state").text("");
		} else {
			for(var i = 0; i < dlvr_phone.length; i++) {
				if(9 < dlvr_phone.length && dlvr_phone.length< 17 ) {
					char_dlvr_phone = dlvr_phone.charCodeAt(i);
					if( 47< char_dlvr_phone && char_dlvr_phone < 58) {
						$(".phone_state").text("");
					} else {
						$(".phone_state").text("전화번호를 바르게 입력해주세요.(10자에서 16자의 숫자만 입력 가능합니다) ").css("color", "red");
						break;
					} 
				} else {
					$(".phone_state").text("전화번호를 바르게 입력해주세요.(10자에서 16자의 숫자만 입력 가능합니다) ").css("color", "red");
				}
			}
		}
	});
		
		
}); // 핸들러

// <주소>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample4_postcode').value = data.zonecode;
			document.getElementById("sample4_roadAddress").value = roadAddr;
			document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if (roadAddr !== '') {
				document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("sample4_extraAddress").value = '';
			}
			var guideTextBox = document.getElementById("guide");
			// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
			if (data.autoRoadAddress) {
				var expRoadAddr = data.autoRoadAddress
						+ extraRoadAddr;
				guideTextBox.innerHTML = '(예상 도로명 주소 : '
						+ expRoadAddr + ')';
				guideTextBox.style.display = 'block';
			} else if (data.autoJibunAddress) {
				var expJibunAddr = data.autoJibunAddress;
				guideTextBox.innerHTML = '(예상 지번 주소 : '
						+ expJibunAddr + ')';
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