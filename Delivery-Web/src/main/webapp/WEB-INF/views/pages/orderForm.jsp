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
	<div id="map" style="width: 500px; height: 500px;"></div>
	<div>
		<div class="hAddr">
	        <span class="title">지도중심기준 행정동 주소정보</span>
	        <span id="centerAddr"></span>
	    </div>
		<input type="button" onclick="seacrhAddress()" value="우편번호 찾기">
		<button type="button" onclick="pointFromAddr()">주소로 좌표 찍기</button>
		<br>
		우편 번호
		도로명 주소
		<input type="text" class="form-control" id="roadAddr"/>
		지번
		<input type="text" class="form-control" id="jibunAddr"/>
		<span id="guide" style="color:#999;display:none"></span>
		상세주소
		<input type="text" class="form-control" id="detailAddr"/>
		엑스트라
		<input type="text" class="form-control" id="extraAddr"/>
	</div>
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

			// 마커를 클릭한 위치에 표시 
			marker.setMap(map);
			map.setCenter(position);
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
		
		// 주소 관련 작업
		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),callback);
		}
		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("roadAddr").value = roadAddr;
					document.getElementById("jibunAddr").value = jibunAddr;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("extraAddr").value = extraRoadAddr;
					} else {
						document.getElementById("extraAddr").value = '';
					}
				}, 
				onclose : function(state) {
					if(state == 'COMPLETE_CLOSE') {
	 					pointFromAddr(roadAddr, jibunAddr);
					}
				}
			}).open();
		}

		function getInfo() {
			// 지도의 현재 중심좌표를 얻어옵니다 
			var center = map.getCenter();
			// 지도의 현재 레벨을 얻어옵니다
			var level = map.getLevel();
			// 지도타입을 얻어옵니다
			var mapTypeId = map.getMapTypeId();
			// 지도의 현재 영역을 얻어옵니다 
			var bounds = map.getBounds();
			// 영역의 남서쪽 좌표를 얻어옵니다 
			var swLatLng = bounds.getSouthWest();
			// 영역의 북동쪽 좌표를 얻어옵니다 
			var neLatLng = bounds.getNorthEast();
			// 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
			var boundsStr = bounds.toString();

			var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
			message += '경도 ' + center.getLng() + ' 이고 <br>';
			message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
			message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
			message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', '
					+ swLatLng.getLng() + ' 이고 <br>';
			message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', '
					+ neLatLng.getLng() + ' 입니다';

			// 개발자도구를 통해 직접 message 내용을 확인해 보세요.
			console.log(message);
		}

// 		function setUserMarker(position) {
// 			var url = "/test/getOrderList?odr_lat=" + position.getLat() + "&odr_lng=" + position.getLng() + "&range=1";
// 			var sendData = {
// 		    		"odr_lat"			:	position.getLat(),
// 		    		"odr_lng"			:	position.getLng(),
// 		    		"range"				:	1
// 		    };

// 			var orderList;

// 			$.ajax({
// 				"headers"	:	{
// 					"Content-Type"	:	"application/json"
// 				},
// 				"dataType"	:	"text",
// 				"method"	:	"post",
// 				"url"		:	url,
// 				"async"		:	false,
// 				"success"	:	function(data) {
// 					orderList = JSON.parse(data);
// 				},
// 			});
// 			return orderList;
// 		}
	</script>
</body>
</html>