$(function(){
	function resetCategory() {
		$("#ca_Food").removeClass("food_color");
		$("#ca_General").removeClass("grocery_color");
		$("#ca_Office").removeClass("genral_color");
		$("#order_ca").removeAttr("data-ca");
	};
	
	$("#ca_Food").click(function(){
		console.log("음식 클릭이여라~");
		resetCategory();
		
		$(this).addClass("food_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").val(ca);
		console.log("인풋데이타:" + ca);
	});
	
	$("#ca_General").click(function(){
		console.log("사무용품 클릭이여라~");
		resetCategory();
		
		$(this).addClass("grocery_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").val(ca);
		console.log("인풋데이타:" + ca);
	});
	
	$("#ca_Office").click(function(){
		console.log("음식 클릭이여라~");
		resetCategory();
		
		$(this).addClass("genral_color");
		var ca = $(this).attr("data-ca");
		$("#order_ca").val(ca);
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
		console.log("클릭");
		var order_req_ta = $("#order_req_ta").val();
		$("#order_req").val(order_req_ta);
		var order_ca = $("#order_ca").val();
		var order_lat = $("#order_lat").val();
		var order_lng = $("#order_lng").val();
		var order_req = $("#order_req").val();
		$("#user_no").val(user_no);
		
		if(order_ca == null){
			alert("카테고리를 선택해주세요.");
		}else if(order_lat == null){
			alert("주소를 입력해주세요.");
		}else if(order_req == null){
			alert("요청 사항을 입력해주세요.")
		}
		
		$("#insertOrderFrm").submit();
	});
});

// Step bar 
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
// End of Step bar 

// mapScript 
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
// end of mapScript 