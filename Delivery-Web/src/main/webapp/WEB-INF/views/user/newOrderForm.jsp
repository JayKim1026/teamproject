<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/link.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../css/timelineHeader.css" %>
<%@include file="../css/newOrderForm.css" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>newOrderForm.jsp</title>
</head>
<body>
<!-------------------------------------------------  Header  ------------------------------------------------->
<%@include file="../include/timelineHeader.jsp" %>
<!-------------------------------------------------end of Header  ------------------------------------------------->

<!-------------------------------------------------  Progress Bar  ------------------------------------------------->
<div class="container-fluid" style="margin-top:30px;">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
					<div class="col-md-8">
						<ul class="nav nav-tabs process-model more-icon-preocess"
							role="tablist">
							<li role="presentation" class="active"><a href="#discover"
								aria-controls="discover" role="tab" data-toggle="tab"><i
									class="fa fa-search" aria-hidden="true"></i>
									<p>배달 종류 선택</p> </a></li>
							<li role="presentation"><a href="#strategy"
								aria-controls="strategy" role="tab" data-toggle="tab"><i
									class="fa fa-send-o" aria-hidden="true"></i>
									<p>주소 선택</p> </a></li>
							<li role="presentation"><a href="#optimization"
								aria-controls="optimization" role="tab" data-toggle="tab"><i
									class="fa fa-qrcode" aria-hidden="true"></i>
									<p>품목 선택</p> </a></li>
							<li role="presentation"><a href="#content"
								aria-controls="content" role="tab" data-toggle="tab"><i
									class="fa fa-newspaper-o" aria-hidden="true"></i>
									<p>추가사항</p> </a></li>
							<li role="presentation"><a href="#reporting"
								aria-controls="reporting" role="tab" data-toggle="tab"><i
									class="fa fa-clipboard" aria-hidden="true"></i>
									<p>배달중..</p> </a></li>
						</ul>
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
						<div class="tab-content">
							<!-------------------------------- 첫번째 탭-------------------------------->
							<div role="tabpanel" class="tab-pane active" id="discover">
								<!-- 음식주문 -->
								<div class="category-list-card">
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
								<div class="category-list-card">
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
								<div class="category-list-card">
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
								
							</div>
							<!-------------------------------- //첫번째 탭 끝 -------------------------------->
							
							<!-------------------------------- 두번째 탭 -------------------------------->
							<div role="tabpanel" class="tab-pane" id="strategy">
								<div class="design-process-content">
									<div id="map" style="width: 500px; height: 500px; margin:0 auto;"></div>
									<div>
										<div class="hAddr">
											<span class="title">지도중심기준 행정동 주소정보</span>
										</div>
										<input type="button" onclick="seacrhAddress()" value="우편번호 찾기">
										<br> 도로명 주소 <input type="text" class="form-control"
											id="roadAddr" readonly /> 지번 <input type="text"
											class="form-control" id="jibunAddr" readonly />
									</div>
								</div>
							</div>
							<!-------------------------------- // 두번째 탭 끝-------------------------------->
							
							<!-------------------------------- 세번째 탭 -------------------------------->
							<div role="tabpanel" class="tab-pane" id="optimization">
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
																					<label class="form-control-label">주소</label> <input
																						type="text"
																						class="form-control form-control-alternative"
																						value="${userVo.user_id }"
																						style="background-color: white;"
																						readonly="readonly">
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
																							type="password"
																							class="form-control form-control-alternative"
																							style="background-color: white;" readonly
																							value="${userVo.user_pw }">
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
																							style="background-color: white;"></textarea>
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
																	<button class="btn btn-success" style="float:right;">주문</button>
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
							
							<!-------------------------------- 네번째 탭 -------------------------------->
							<div role="tabpanel" class="tab-pane" id="content" style="padding-top: 300px;">
								
									<div class="container">
										<div class="row">
											<div id="loader">
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="dot"></div>
												<div class="lading"></div>
											</div>
										</div>
									</div>
									
									<div>
										<h3 style="text-align: center;">뚜벅맨 배정중...</h3>
									</div>
								
							</div>
							<!-------------------------------- //네번째 탭  끝 -------------------------------->
							
							<!-------------------------------- 다섯번째 탭 -------------------------------->
							<div role="tabpanel" class="tab-pane" id="reporting">
								<div class="design-process-content">
									<h3>가는중..</h3>
								</div>
							</div>
							<!-------------------------------- //다섯번째 탭 끝 -------------------------------->
							
						</div>
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

<!------------------------------------------------- mapScript ------------------------------------------------->
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
			level : 5, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		};
		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude
				var lng = position.coords.longitude;
				var locPosition = new kakao.maps.LatLng(lat, lng);
				map.setCenter(locPosition);
			});
		} else {
			console.log("안됨");
		}
		// 픽업위치 마커
		var marker = new kakao.maps.Marker();
		// 지도를 생성 
		var map = new kakao.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체 생성
		var geocoder = new kakao.maps.services.Geocoder();

		// 마커를 생성하고 지도위에 표시하는 함수
		function setOrderMarker(position) {
			marker.setMap(null);
			marker.setPosition(position);

			var lat = position.getLat();
			var lng = position.getLng();
			var roadAddr = "";
			var jibunAddr = "";

			// 좌표로 주소 반환
			searchDetailAddrFromCoords(position, function(result, status) {
				console.log(position);
				console.log(result);
				console.log(status);
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = "";
					if(result[0].road_address != null) {
						detailAddr = "도로명주소 : " + result[0].road_address.address_name;
						document.getElementById("roadAddr").value = result[0].road_address.address_name;
						document.getElementById("jibunAddr").value = "";
					} else {
						detailAddr = "지번주소 : " + result[0].address.address_name;
						document.getElementById("roadAddr").value = "";
						document.getElementById("jibunAddr").value = result[0].address.address_name;
					}
					console.log(detailAddr);
				}
			});

			// 마커를 클릭한 위치에 표시, 중심 이동
			marker.setMap(map);
			map.setCenter(position);
			document.getElementById("order_lat").value = lat;
			document.getElementById("order_lng").value = lng;
		}

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;
			var message = '위도 = ' + latlng.getLat() + ', 경도 = ' + latlng.getLng();
			setOrderMarker(latlng);
			console.log(message);
		});

		// 주소로 좌표 얻기
		function pointFromAddr(roadAddr, jibunAddr) {
			var keyword = "";
			if (roadAddr != null && roadAddr != "") {
				keyword = roadAddr;
			} else {
				keyword = jibunAddr;
			}

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(keyword, function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 					setOrderMarker(coords);
				}
			});
		}
		
		// 좌표로 주소 얻기
		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		// 다음 주소 api
		function seacrhAddress() { 
			var roadAddr; // 도로명 주소 변수
			var jibunAddr; // 지명 주소
			new daum.Postcode({ 
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					roadAddr = data.roadAddress; // 도로명 주소 변수
					jibunAddr = data.jibunAddress; // 지명 주소

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("roadAddr").value = roadAddr;
					document.getElementById("jibunAddr").value = jibunAddr;
				}, 
				onclose : function(state) {
					if(state == 'COMPLETE_CLOSE') {
	 					pointFromAddr(roadAddr, jibunAddr);
					}
				}
			}).open();
		}
</script>
<!-------------------------------------------------// end of mapScript ------------------------------------------------->

</body>
</html>