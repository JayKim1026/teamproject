<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp"%>
<%@include file="../css/newInfoCSS.css"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
<style>
.divChgPw {
	display: none;
}

.divChgEmail {
	display: none;
}

.divChgPhone {
	display: none;
}

.divChgAddr {
	display: none;	
}

</style>
<meta charset="UTF-8">
<title>newInfo.jsp</title>
</head>
<body>
	<%@include file="../include/Infoheader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="main-content">
							<div class="container mt-7">
								<!-- Table -->
								<div>${userVo }</div>
								<h2 class="mb-5" style="text-align: center;">반갑습니다, ${userVo.user_name }님 어떤 정보를 변경하고 싶으신가요?</h2>
								<div class="row">
									<div class="col-xl-8 m-auto order-xl-1">
										<div class="card bg-secondary shadow">
											<div class="card-header bg-white border-0">
												<div class="row align-items-center">
													<div class="col-8">
														<h3 class="mb-0">회원정보</h3>
													</div>
													<div class="col-4 text-right">
													</div>
												</div>
											</div>
											<div class="card-body">
													<h6 class="heading-small text-muted mb-4">기본정보</h6>
													<div class="pl-lg-4">
														<div class="row">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label">이름</label> 
																			<input type="text" class="form-control form-control-alternative" style="background-color: white;" readonly value="${userVo.user_name }">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<p class="form-control form-control-alternative" style="margin-top: 23px; color: red;">변경불가</p>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label" >아이디</label> 
																			<input type="text" class="form-control form-control-alternative" value="${userVo.user_id }" style="background-color: white;"readonly="readonly">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<p class="form-control form-control-alternative" 
																		style="margin-top: 23px; color: red;">변경불가</p>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label" >생일</label> 
																			<input type="text" class="form-control form-control-alternative" value="${userVo.user_birth }" style="background-color: white;"readonly="readonly">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<p class="form-control form-control-alternative" 
																		style="margin-top: 23px; color: red;">변경불가</p>
																	</div>
																</div>
															</div>
														</div>
														
														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																		<div class="divOrgPw">
																			<label class="form-control-label">비밀번호</label>
																			<span class="orgPwCheckResult"></span>
																			<input type="password"  class="form-control form-control-alternative" style="background-color: white;" readonly value="${userVo.user_pw }">
																		</div>
																			<div class="divChgPw">
																				<form class="frmChgPw" action="/user/pwChange" method="post">
																					<label class="form-control-label" for="input-password"> 현재 비밀번호</label>
																					<input type="password" id="orgPw" name="orgPw" class="form-control form-control-alternative">
																					
																					<label class="form-control-label" for="input-password">새 비밀번호</label>
																					<input type="password" id="chgPw" name="chgPw" class="form-control form-control-alternative">
																					
																					<label class="form-control-label" for="input-password">새 비밀번호 확인</label>
																					<input type="password" id="chgPw2" name="chgPw2" class="form-control form-control-alternative">
																					<div style="display: flex;">
																						<button type="button" class="form-control btnCancelPw" style="width: 60px; margin-top: 23px;">취소</button> 
																						<button type="submit" class="form-control btnChgPwRun" style="width: 60px; margin-left: 10px; margin-top: 23px;">완료</button>
																					</div>
																				</form>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative btnChgPw" style="margin-top: 23px;">변경하기</button>
																	</div>
																</div>
															</div>
														</div>

														<div class="row"
															style="margin-top: 10px; margin-bottom: 33px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label">Email</label>
																			<div class="divOrgEmail">
																				<input type="email" class="form-control form-control-alternative" style="background-color: white;" readonly value="${userVo.user_email }">
																			</div>
																			
																			<div class="divChgEmail">
																				<form class="frmChgEmail" action="/user/emailChange" method="POST">
																					<input type="email" name="chgEmail" class="form-control form-control-alternative">
																					<div style="display:flex;">
																						<button type="button" class="form-control btnCancelEmail" style="width: 60px; margin-top: 23px;">취소</button> 
																						<button type="submit" class="form-control btnChgEmailRun" style="width: 60px; margin-left: 10px; margin-top: 23px;">완료</button>
																					</div>
																				</form>
																			</div>
																		
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button type="submit" class="form-control form-control-alternative btnChgEmail" style="margin-top: 23px;">변경하기</button>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<hr class="my-4">
													<!-- Address -->
													<h6 class="heading-small text-muted mb-4">연락처 및 주소</h6>
													<div class="pl-lg-4">
														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">

																			<label class="form-control-label">휴대폰</label> 
																				<div class="divOrgPhone">
																					<input type="tel" class="form-control form-control-alternative" style="background-color: white;" readonly value="${userVo.user_phone }">
																				</div>
																				<div class="divChgPhone">
																					<form class="frmChgPhone" action="/user/phoneChange" method="POST">
																						<input type="tel" id="chgPhone" name="chgPhone" class="form-control form-control-alternative">
																						<div style="display:flex;">
																							<button type="button" class="form-control btnCancelPhone" style="width: 60px; margin-top: 23px;">취소</button> 
																							<button type="submit" class="form-control btnChgPhoneRun" style="width: 60px; margin-left: 10px; margin-top: 23px;">완료</button>
																						</div>
																					</form>
																				</div>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative btnChgPhone" style="margin-top: 23px;">변경하기</button>
																	</div>
																</div>
															</div>
														</div>

														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label">주소</label> 
																			<div class="divOrgAddr">
																				<input type="text" class="form-control form-control-alternative" style="background-color: white;" readonly value="${sessionScope.userVo.user_addr}">
																			</div>	
																			<div class="divChgAddr">
																				<form role="form" class="frmChgAddr" action="/user/addrChange" method="POST" >
																					<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호">
																					<input type="button" class="btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="btnAddr"><br>
																					<input type="text" class="form-control user_addr addr1" id="sample4_roadAddress" placeholder="도로명주소">
																					<input type="text"class="form-control "  id="sample4_jibunAddress" placeholder="지번주소">
																					<span id="guide" style="color:#999;display:none"></span>
																					<input type="text" class="form-control addr3" id="sample4_detailAddress" placeholder="상세주소(필수)" required>
																					<input type="text" class="form-control addr2"  id="sample4_extraAddress" placeholder="참고항목">
																					<input type="hidden" id="chgAddr" name="chgAddr">
																					<div style="display: flex;">
																						<button type="button" class="form-control btnCancelAddr" style="width: 60px; margin-top: 23px;">취소</button>
																						<button type="submit" class="form-control btnChgAddrRun" style="width: 60px; margin-left: 10px; margin-top: 23px;">완료</button>
																					</div>
																				</form>
																			</div>
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button type="button" class="form-control form-control-alternative btnChgAddr" style="margin-top: 23px;">변경하기</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<hr class="my-4">
													<!-- Description -->
													<h6 class="heading-small text-muted mb-4">About me</h6>
												<div class="pl-lg-4">
													<div class="row" style="margin-top: 10px;">
														<div class="col-md-12">
															<label class="form-control-label">프로필 사진</label>
															<div class="row">
																<div class="col-md-10">
																	<img id="orgImg" name="orgImg" src="${image_url}" alt="프로필 사진" style="width: 200px; height: 200px;">
																	<img id="chgImgPreview" src="#" alt="변경한 프로필 사진" style="width: 200px; height: 200px; display: none;"/>
																		<form role="form" class="frmChgImg" action="/user/imgChange" method="POST" enctype="multipart/form-data">
																			<input type="file" class="upload-hidden" id="file-upload" name="chgImg" style="display: none;" accept="image/, .jpg, .png, .gif">
																			<input type="hidden" value="${sessionScope.userVo.user_img }" name="orgImg"><!-- 기존 프사  -->
																			<div style="display: flex">
																				<button type="button" class="form-control btnPicImg" style="display:none; width: 100px; margin-top: 23px;"> 사진 선택</button>
																				<button type="button" class="form-control btnPicDefaultImg" style="display:none; width: 150px; margin-left: 10px; margin-top: 23px;"> 기본 이미지로 변경 </button>
																			</div>
																		</form>
																</div>
																<div class="col-md-2">
																	<button class="form-control form-control-alternative btnChgImg" style="margin-top: 23px;">변경하기</button>
																	<button type="button" class="form-control form-control-alternative btnCancelImg" style="display:none; margin-top: 23px;">취소</button>
																	<button type="submit" class="form-control form-control-alternative btnChgImgRun" style="display:none; margin-top: 23px;">완료</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
<script>
$(function(){
	//메세지
	var imgChangeResult = "${imgChangeResult}";
	if(imgChangeResult == "success") {
		alert("프로필 사진이 변경 되었습니다.");
	}
	
	var pwChangeResult = "${pwChangeResult}";
	if(pwChangeResult == "success") {
		alert("비밀번호가 변경되었습니다.");
	}
	
	var phoneChangeResult = "${phoneChangeResult}";
	if(phoneChangeResult == "success") {
		alert("전화번호가 변경되었습니다.");
	}
	
	var emailChangeResult = "${emailChangeResult}";
	if(emailChangeResult == "success") {
		alert("이메일이 변경되었습니다.");
	}
	
	var addrChangeResult = "${addrChangeResult}";
	if(addrChangeResult == "success") {
		alert("주소가 변경 되었습니다.")
	}
	
	
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
	
		var url = "/user/pwCheck";
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
</script>
</html>