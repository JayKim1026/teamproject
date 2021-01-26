$(function(){
	//비밀번호 변경 버튼
	$(".btnChgPw").click(function(){
		$(".divOrgPw").hide();
		$(this).hide();
		$(".divChgPw").show();
	});
	//비밀번호 변경 취소 버튼
	$(".btnCancelPw").click(function(){
		$(".btnChgPw").show();
		$(".divOrgPw").show();
		$(".divChgPw").hide();
	});
	//비밀번호 변경 완료 버튼
	$(".btnChgPwRun").click(function(e){
		e.preventDefault();
		var orgPw = $("#orgPw").val();
		var chgPw = $("#chgPw").val();
		var chgPw2= $("#chgPw2").val();
	
		var url = "/deliver/pwCheck";
		var sendData = {
			"orgPw" : orgPw
		}
		$.post(url, sendData, function(data){
			console.log("현재 비밀번호 확인 : " + data);
			if(data != "true") {
				alert("현재 비밀번호를 확인해주세요.");
				$("#orgPw").focus().val("");
				return;
			} else {
				if(chgPw.trim() == null || chgPw.trim() == "") {
					alert("새 비밀번호를 입력해주세요");
					$("#chgPw").focus();
					return;
				} else {
					for(var i = 0; i < chgPw.length; i++) {
						var charPw = chgPw.charCodeAt(i);
						if(7 < chgPw.length && chgPw.length < 17) {
							if((47 < charPw && charPw < 58  ) || (64 < charPw && charPw < 91) || (96 < charPw && charPw < 123)) {
								if(chgPw == chgPw2) {
									$(".frmChgPw").submit();
								} else {
									alert("새 비밀번호가 서로 일치하지 않습니다.");
									$("#chgPw").val("").focus();
									$("#chgPw2").val("");
									return;
								}
							} else {
								alert("비밀번호는 8에서 16자 사이의 영문 대소문자, 숫자만 가능합니다.");
								$("#chgPw").focus().val("");
								$("#chgPw2").val("");
								return;
							}
						} else {
							alert("비밀번호는 8에서 16자 사이의 영문 대소문자, 숫자만 가능합니다.");
							$("#chgPw").focus().val("");
							$("#chgPw2").val("");
							return;
						}
					} // for
				}
			}
		});// post
	});
	
	
	//이메일 변경 버튼
	$(".btnChgEmail").click(function(){
		$(this).hide();
		$(".divOrgEmail").hide();
		$(".divChgEmail").show();
	});
	
	//이메일 변경 취소 버튼
	$(".btnCancelEmail").click(function(){
		$(".divChgEmail").hide();
		$(".btnChgEmail").show();
		$(".divOrgEmail").show();
	});
	
	//휴대전화 변경 버튼
	
	$(".btnChgPhone").click(function(){
		$(this).hide();
		$(".divOrgPhone").hide();
		$(".divChgPhone").show();
	});
	
	//휴대전화 변경 취소 버튼
	$(".btnCancelPhone").click(function(){
		$(".divOrgPhone").show();
		$(".btnChgPhone").show();
		$(".divChgPhone").hide();
	});
	
	//휴대전화 변경 완료 버튼
	$(".btnChgPhoneRun").click(function(e){
		e.preventDefault();
		var chgPhone = $("#chgPhone").val();
		if(chgPhone.trim() == null || chgPhone.trim() == "") {
			alert("휴대전화 번호를 입력해주세요");
			$("#chgPhone").focus();
		} else {
			for(var i = 0; i < chgPhone.length ; i++) {
				var charPhone = chgPhone.charCodeAt(i);
				if(9 < chgPhone.length && chgPhone.length < 17) {
					if( 47< charPhone && charPhone < 58) {
						$(".frmChgPhone").submit();
					} else {
						alert("10~16자로 숫자만 입력해주세요");
						$("#chg_phone").val("").focus();
						return;
					}
				} else {
					alert("10~16자로 숫자만 입력해주세요");
					$("#chg_phone").val("").focus();
					return;
				}
			} // for
		}
	});
	//주소 변경 버튼 클릭
	$(".btnChgAddr").click(function(){
		$(".divChgAddr").show();
		$(this).hide();
		$(".divOrgAddr").hide();
	});
	
	//주소 변경 취소 버튼 클릭
	$(".btnCancelAddr").click(function(){
		$(".divChgAddr").hide();
		$(".divOrgAddr").show();
		$(".btnChgAddr").show();
	});
	
	//주소변경 완료 버튼
	$(".btnChgAddrRun").click(function(e){
		e.preventDefault();
		var road1 = $("#sample4_roadAddress").val();
		var road2 = $("#sample4_extraAddress").val();
		var road3 = $("#sample4_detailAddress").val();
		
		// 상세주소가 없는 경우 return
		if(road3.trim() == null || road3.trim() == "") {
			alert("상세주소를 입력해 주세요");
			$("#sample4_detailAddress").focus();
			return;
		} else {
			if(road2 == null || road2 == "") {
				$("#chgAddr").val(road1 + road3);
				$(".frmChgAddr").submit();
			} else {
				$("#chgAddr").val(road1 + road2 + " " + road3);
				$(".frmChgAddr").submit();
			}
		}
	});
	
	//사진 변경 버튼 클릭 
	$(".btnChgImg").click(function(){
		$(".btnPicImg").show();
		$(".btnPicDefaultImg").show();
		$(".btnCancelImg").show();
		$(".btnChgImgRun").show();
		$(this).hide();
	});
	
	//사진 변경 취소 버튼 클릭
	$(".btnCancelImg").click(function(){
		$(".btnPicImg").hide();
		$(".btnPicDefaultImg").hide();
		$(".btnCancelImg").hide();
		$(".btnChgImgRun").hide();
		$("#chgImgPreview").hide();
		$(".btnChgImg").show();
		$("#orgImg").show();
	});
	
	//사진 선택 버튼 클릭
	$(".btnPicImg").click(function(){
		$("#file-upload").trigger("click");
	});
	
	//사진 선택 이후 이벤트
	$("#file-upload").on("change" , function() {
		readURL(this);
		$("#orgImg").hide();
		$("#chgImgPreview").show();
	});
	
	//TODO 사진 변경 완료 버튼
	$(".btnChgImgRun").click(function(e){
		e.preventDefault();
		$(".frmChgImg").submit();
	});



}); // 핸들러

// 바꿀 프로필 사진 미리 보여주기 JS
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


//<다음 주소 JS> 
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