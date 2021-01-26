<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp"%>
<link rel="stylesheet" href="/resources/css/newInfoCSS.css">
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
<title>사용자 정보 페이지</title>
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
</script>
<script src="/resources/js/userInfoScript.js"></script>
</html>