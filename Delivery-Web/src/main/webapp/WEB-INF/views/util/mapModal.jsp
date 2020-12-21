<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 지도 모달 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
	
<div class="row">
	<div class="col-md-12">
	<a style="display:none;" id="modal-172661" href="#modal-container-172661" role="button" class="btn" data-toggle="modal">지도 모달</a>
		<div class="modal fade" id="modal-container-172661" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">KaKaoMap</h5> 
						<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body" id="map" style="width:497px; height:550px;">
						<!-- 지도 -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary">주문하기</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>	
			</div>	
		</div>	
	</div>
</div>
<body>
<script>
	var container = document.getElementById('map');

	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
</body>