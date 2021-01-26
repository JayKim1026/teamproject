<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/link.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/newOrderFormHeader.css">
<link rel="stylesheet" href="/resources/css/newOrderForm.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>배달 페이지</title>
<style>
.food_color{
	background-color: yellow;
}
.grocery_color{
	background-color: green;
}
.genral_color{
	background-color: blue;
}
</style>
</head>
<body>
<!-------------------------------------------------  Header  ------------------------------------------------->
<%@include file="../include/newOrderFormHeader.jsp" %>
<!-------------------------------------------------end of Header  ------------------------------------------------->
<!-------------------------------------------------  Progress Bar  ------------------------------------------------->
<div class="container-fluid" style="margin-top:160px;">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
					<div class="col-md-8" style="display: flex; justify-content: center;">
						<div class="stepwizard col-md-offset-3">
							<div class="stepwizard-row setup-panel">
								<div class="stepwizard-step">
									<a href="#step-1" type="button"
										class="btn btn-primary btn-circle">1</a>
									<p>Step 1</p>
								</div>
								<div class="stepwizard-step">
									<a href="#step-2" type="button"
										class="btn btn-default btn-circle" disabled="disabled">2</a>
									<p>Step 2</p>
								</div>
								<div class="stepwizard-step">
									<a href="#step-3" type="button"
										class="btn btn-default btn-circle" disabled="disabled">3</a>
									<p>Step 3</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
<!-------------------------------------------------  // end ofProgress Bar  ------------------------------------------------->

<!-------------------------------------------------  Content  ------------------------------------------------->
<div class="container-fluid" style="margin-top: 30px;">
	<div class="row">
		<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						
							<!-------------------------------- 첫번째 탭-------------------------------->
							 <div class="setup-content" id="step-1">
								<!-- 음식주문 -->
								<div class="category-list-card" data-ca="3-012" id="ca_Food">
									<div class="category-image">
									</div>
									<div class="category-name">
										<h3>Food Delivery</h3>
										<p>맛있는 음식들을 저렴한 가격에 배달시켜보세요!</p>
									</div>
									<div class="right-arrow-div">
										<i class="fa fa-angle-right"></i>
									</div>
								</div>
								
								<!-- 장보기 -->
								<div class="category-list-card" data-ca="3-013" id="ca_General">
									<div class="category-image">
									</div>
									<div class="category-name">
										<h3>Grocery Shopping</h3>
										<p>신선한 과일, 야채 .. 뚜벅맨이 대신 지금 갑니다!</p>
									</div>
									<div class="right-arrow-div">
										<i class="fa fa-angle-right"></i>
									</div>
								</div>
								
								<!-- 사무용품 -->
								<div class="category-list-card" data-ca="3-011" id="ca_Office">
									<div class="category-image">
									</div>
									<div class="category-name">
										<h3>General Shopping</h3>
										<p>사무용품, 및 필요하신 물품을 뚜벅맨이 당신의 집 문앞까지!</p>
									</div>
									<div class="right-arrow-div">
										<i class="fa fa-angle-right"></i>
									</div>
								</div>
									<button class="btn btn-primary nextBtn btn-lg float-right" type="button" >Next</button>
							</div>
							<!-------------------------------- //첫번째 탭 끝 -------------------------------->
							
							<!-------------------------------- 두번째 탭 -------------------------------->
							 <div class="setup-content" id="step-2">
								<div class="design-process-content">
									<div id="map" style="width: 500px; height: 500px; margin:0 auto;"></div>
									<div>
										<div class="hAddr">
											<span class="title">지도중심기준 행정동 주소정보</span>
										</div>
										<input type="button" onclick="seacrhAddress()" value="우편번호 찾기">
										<br> 도로명 주소 <input type="text" class="form-control" id="roadAddr" readonly />  
											<input type="hidden" class="form-control" id="jibunAddr" readonly />
									</div>
								</div>
								<button class="btn btn-primary nextBtn btn-lg float-right" type="button" id="btnAdressSave">Next</button>
							</div>
							<!-------------------------------- // 두번째 탭 끝-------------------------------->
							
							<!-------------------------------- 세번째 탭 -------------------------------->
							 <div class="setup-content" id="step-3">
									<div class="main-content">
										<div class="container mt-7">
											<div class="row">
												<div class="col-xl-8 m-auto order-xl-1">
													<div class="card bg-secondary shadow">
														<div class="card-header bg-white border-0">
															<div class="row align-items-center">
																<div class="col-8">
																	<h3 class="mb-0">주문서 작성</h3>
																</div>
																<div class="col-4 text-right"></div>
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
																					<label class="form-control-label">이름</label> <input
																						type="text"
																						class="form-control form-control-alternative"
																						style="background-color: white;" readonly
																						value="${userVo.user_name }">
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
																					<label class="form-control-label">주소</label> 
																					<input
																						type="text"
																						class="form-control form-control-alternative"
																						style="background-color: white;"
																						readonly="readonly" id="lastAddr">
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
																						<label class="form-control-label">연락처</label> <span
																							class="orgPwCheckResult"></span> <input
																							type="text"
																							class="form-control form-control-alternative"
																							style="background-color: white;" readonly
																							value="${userVo.user_phone}">
																					</div>
																					
																				</div>
																			</div>
																			<div class="col-md-2">
																				<button
																					class="form-control form-control-alternative btnChgPw"
																					style="margin-top: 23px;">변경하기</button>
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
																			<div class="col-md-12">
																				<div class="focused">

																					<label class="form-control-label">주문 요청 사항</label>
																					<div class="divOrgPhone">
																						<textarea
																							class="form-control form-control-alternative"
																							style="background-color: white;" id="order_req_ta"></textarea>
																					</div>
																								
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<hr class="my-4">

														<div class="col-md-12">
															<div class="row">
																<div class="col-md-12">
																<form action="/order/insertOrder" method="post" id="insertOrderFrm">
																	<input type="hidden" id="order_ca" name="order_ca"> 
																	<input type="hidden" id="order_lat" name="order_lat"> 
																	<input type="hidden" id="order_lng" name="order_lng">
																	<input type="hidden" id="order_req" name="order_req">
																	<input type="hidden" id="user_no" name="user_no">
																</form>
																<button class="btn btn-primary nextBtn btn-lg float-right" type="button" id="btnInsertOrder">Next</button>
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
							<!-------------------------------- //세번째 탭 끝 -------------------------------->
					</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>

<!-------------------------------------------------  // end of Content  ------------------------------------------------->

<!-------------------------------------------------  footer  ------------------------------------------------->
<%@include file="../include/footer.jsp" %>
<!-------------------------------------------------end of footer ------------------------------------------------->

<!--MyScript -->
<script>
var user_no = parseInt("${userVo.user_no}");
</script>
<script src="/resources/js/orderScript.js"></script>
</body>
</html>