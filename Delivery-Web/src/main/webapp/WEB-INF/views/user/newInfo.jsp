<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp"%>
<%@include file="../css/newInfoCSS.css"%>
<meta charset="UTF-8">
<title>newInfo.jsp</title>
</head>
<body>
	<%@include file="../include/newInfoheader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="main-content">
							<div class="container mt-7">
								<!-- Table -->
								<h2 class="mb-5" style="text-align: center;">반갑습니다, 이진형님 어떤 정보를 변경하고 싶으신가요?</h2>
								<div class="row">
									<div class="col-xl-8 m-auto order-xl-1">
										<div class="card bg-secondary shadow">
											<div class="card-header bg-white border-0">
												<div class="row align-items-center">
													<div class="col-8">
														<h3 class="mb-0">회원정보</h3>
													</div>
													<div class="col-4 text-right">
														<!-- <a href="#!" class="btn btn-sm btn-primary">변경</a> -->
													</div>
												</div>
											</div>
											<div class="card-body">
												<form>
													<h6 class="heading-small text-muted mb-4">기본정보</h6>
													<div class="pl-lg-4">
														<div class="row">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">
																			<label class="form-control-label"
																				for="input-first-name">이름</label> <input type="text"
																				id="input-first-name"
																				class="form-control form-control-alternative"
																				placeholder="First name" value="Lucky">
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

																			<label class="form-control-label"
																				for="input-username">아이디</label> <input type="text"
																				id="input-username"
																				class="form-control form-control-alternative"
																				placeholder="Username" value="lucky.jesse">
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

																			<label class="form-control-label"
																				for="input-password">비밀번호</label> <input
																				type="password" id="input-password"
																				class="form-control form-control-alternative"
																				placeholder="First name" value="Lucky">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative"
																			style="margin-top: 23px;">변경</button>
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

																			<label class="form-control-label" for="input-Email">Email</label>
																			<input type="email" id="input-email"
																				class="form-control form-control-alternative"
																				placeholder="First name" value="Lucky@gmail.com">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative"
																			style="margin-top: 23px;">변경</button>
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

																			<label class="form-control-label"
																				for="input-PhoneNumber">휴대폰</label> <input
																				type="text" id="PhoneNumber"
																				class="form-control form-control-alternative"
																				placeholder="phonenumber" value="010-xxxx-xxxx">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative"
																			style="margin-top: 23px;">변경</button>
																	</div>
																</div>
															</div>
														</div>


														<div class="row" style="margin-top: 10px;">
															<div class="col-md-12">
																<div class="row">
																	<div class="col-md-10">
																		<div class="focused">

																			<label class="form-control-label" for="input-adress">주소</label>
																			<input type="text" id="input-adress"
																				class="form-control form-control-alternative"
																				placeholder="울산광역시 중구 OOO...">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative"
																			style="margin-top: 23px;">변경</button>
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
																<label class="form-control-label" for="input-adress">프로필
																	사진</label>
																<div class="row">
																	<div class="col-md-10">
																		<div>
																			<img src="/resources/images/profile1.jpg">
																		</div>
																	</div>
																	<div class="col-md-2">
																		<button class="form-control form-control-alternative"
																			style="margin-top: 23px;">변경</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</form>
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
</html>