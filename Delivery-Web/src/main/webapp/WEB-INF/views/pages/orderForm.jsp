<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>주문 페이지</title>
</head>
<body>
	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-10">
			<div>
				<form id="frmOrder" action="/order/insertOrder" method="post">
					<input type="hidden" id="order_lat" name="order_lat" />
					<input type="hidden" id="order_lng" name="order_lng" />
					<span class="title">카테고리</span>
					<select name="order_ca">
						<option value="3-011">사무용품</option>
						<option value="3-012">음식</option>
						<option value="3-013">기타</option>
					</select>
					<br>
					<span class="title">요구사항</span>
					<input type="text" class="form-control" id="order_req" name="order_req" placeholder="요구사항 입력"/>
				</form>
			</div>
			<div id="map" style="width: 500px; height: 500px;"></div>
			<div>
				<div class="hAddr">
			        <span class="title">지도중심기준 행정동 주소정보</span>
			    </div>
				<input type="button" onclick="seacrhAddress()" value="우편번호 찾기">
				<br>
				도로명 주소
				<input type="text" class="form-control" id="roadAddr" readonly/>
				지번
				<input type="text" class="form-control" id="jibunAddr" readonly/>
			</div>
			<button id="btnInsertOrder">주문 작성 완료</button>
		</div>
		<div class="col-md-1">
		</div>
	</div>
	
	<script>
		$(function() {
			$("#btnInsertOrder").click(function() {
				if(checkValues()) {
					frmOrder.submit();
				}
			});
			
			function checkValues() {
				var order_lat = $("#order_lat").val();
				var order_lng = $("#order_lng").val();
				var order_req = $("#order_req").val();
				
				if((order_lat == null || order_lat == "") || (order_lng == null || order_lng == "")) {
					alert("주소 입력하쇼");
				} else if(order_req == null || order_req == "") {
					alert("요구사항 입력하쇼");
				} else {
					return true;
				}
				return false;
			}
		});
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
			level : 4, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		};
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
</body>
</html>