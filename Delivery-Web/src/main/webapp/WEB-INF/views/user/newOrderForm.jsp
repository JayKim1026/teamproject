<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/link.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../css/newOrderFormHeader.css" %>
<%@include file="../css/newOrderForm.css" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>newOrderForm.jsp</title>
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
${sessionScope.userVo}
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
																<form action="/order/insertOrder" method="post" id="insertOrder">
																	<input type="hidden" id="order_ca"> 
																	<input type="hidden" id="order_lat"> 
																	<input type="hidden" id="order_lng">
																	<input type="hidden" id="order_req">
																	<input type="hidden" id="user_no">
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
$(function(){
$("#ca_Food").click(function(){
	console.log("음식 클릭이여라~");
	var has = $(this).hasClass("food_color");
	if(has){
		$(this).removeClass("food_color");
		$("#order_ca").removeAttr("data-ca");
	}else{
		$(this).addClass("food_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").attr("data-ca", ca);
		
	}
	var ca = $("#order_ca").attr("data-ca");
	console.log("인풋데이타:" + ca);
});

$("#ca_General").click(function(){
	console.log("사무용품 클릭이여라~");
	var has = $(this).hasClass("grocery_color");
	if(has){
		$(this).removeClass("grocery_color");
		$("#order_ca").removeAttr("data-ca");
	}else{
		$(this).addClass("grocery_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").attr("data-ca", ca);
		
	}
	var ca = $("#order_ca").attr("data-ca");
	console.log("인풋데이타:" + ca);
});

$("#ca_Office").click(function(){
	console.log("음식 클릭이여라~");
	var has = $(this).hasClass("genral_color");
	if(has){
		$(this).removeClass("genral_color");
		$("#order_ca").removeAttr("data-ca");
	}else{
		$(this).addClass("genral_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").attr("data-ca", ca);
		
	}
	var ca = $("#order_ca").attr("data-ca");
	console.log("인풋데이타:" + ca);
});

$("#btnAdressSave").click(function(){
	console.log("lat:" + $("#order_lat").val());
	console.log("lng:" + $("#order_lng").val());
	var roadAddr = $("#roadAddr").val();
	var jibunAddr = $("#jibunAddr").val();
	console.log(roadAddr);
	console.log(jibunAddr);
	if(roadAddr != null){
		$("#lastAddr").val(roadAddr);
	}
	
	
});

$("#btnInsertOrder").click(function(){
	console.log("마지막클릭");
	var order_req_ta = $("#order_req_ta").val();
	$("#order_req").val(order_req_ta);
	var order_ca = $("#order_ca").attr("data-ca");
	var order_lat = $("#order_lat").val();
	var order_lng = $("#order_lng").val();
	var order_req = $("#order_req").val();
	var user_no = parseInt("${userVo.user_no}");
	$("#user_no").val(user_no);
	
	if(order_ca == null){
		alert("카테고리를 선택해주세요.");
	}else if(order_lat == null){
		alert("주소를 입력해주세요.");
	}else if(order_req == null){
		alert("요청 사항을 입력해주세요.")
	}else{
		
	}
	
});

});
</script>
<!------------------------------------------------- Step bar ------------------------------------------------->
<script>
$(document).ready(function () {
	  var navListItems = $('div.setup-panel div a'),
	          allWells = $('.setup-content'),
	          allNextBtn = $('.nextBtn');

	  allWells.hide();

	  navListItems.click(function (e) {
	      e.preventDefault();
	      var $target = $($(this).attr('href')),
	              $item = $(this);

	      if (!$item.hasClass('disabled')) {
	          navListItems.removeClass('btn-primary').addClass('btn-default');
	          $item.addClass('btn-primary');
	          allWells.hide();
	          $target.show();
	          $target.find('input:eq(0)').focus();
	      }
	  });

	  allNextBtn.click(function(){
	      var curStep = $(this).closest(".setup-content"),
	          curStepBtn = curStep.attr("id"),
	          nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	          curInputs = curStep.find("input[type='text'],input[type='url']"),
	          isValid = true;

	      $(".form-group").removeClass("has-error");
	      for(var i=0; i<curInputs.length; i++){
	          if (!curInputs[i].validity.valid){
	              isValid = false;
	              $(curInputs[i]).closest(".form-group").addClass("has-error");
	          }
	      }

	      if (isValid)
	          nextStepWizard.removeAttr('disabled').trigger('click');
	  });

	  $('div.setup-panel div a.btn-primary').trigger('click');
	});
</script>
<!------------------------------------------------- End of Step bar ------------------------------------------------->
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