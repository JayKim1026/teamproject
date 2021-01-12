<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../css/main.css" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp" %>
<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<body>
	<header>
		<nav class="navbar">
			<div class="nav__logo">
				<a class="logo__font" href="">뚜벅뚜벅Company</a> <i
					class="fab fa-accusoft"></i>
			</div>
			<ul class="nav__main">
				<c:if test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
				<li><a class="menu__stuff" href="/account/loginForm">Login</a></li>
				<li><a class="menu__stuff" href="/account/registerForm">Join us</a></li>
				<li><a class="menu__stuff" href="/account/dlvr_RegisterForm">Deliver Join</a></li>
				<li><a class="menu__stuff" href="/serviceCenter/FAQ">고객센터</a></li>
				</c:if>
				
				<c:if test="${sessionScope.userVo != null || sessionScope.deliverVo != null}">
				<li><a class="menu__stuff" href="/account/logout">Logout</a></li>
				<li><a class="menu__stuff" href="/timeline/showTimeline">TimeLine</a></li>
				</c:if>
			</ul>
			<ul class="nav__link">
				<!-- 일반 회원  -->
				<c:if test="${sessionScope.userVo != null }">
					<li><a class="menu__stuff2" href="/order/orderForm" style="padding-right: 20;">주문하기</a></li>
				</c:if>

				<c:if test="${sessionScope.userVo != null }">
					<li><a class="menu__stuff2" href="/user/newInfo" style="padding-right: 20;">마이페이지</a></li>
				</c:if>
				
				<!-- 배달원 -->
				<c:if test="${sessionScope.deliverVo != null }">
					<li><a class="menu__stuff2" href="/deliver/info" style="padding-right: 20;">마이페이지</a></li>
				</c:if>

			</ul>
			<div class="nav__textArea">
				<%@include file="../util/adressMain.jsp" %>
				<button id="btnSearch">지도보기</button>
			</div>
		</nav>

	</header>
	
<body>
	<div class="introduce__first">
		userVo:${sessionScope.userVo}
		<br/>
		<br/>
		dlvrVo:${sessionScope.deliverVo}
		<p class="introduce__first_p">초록색 행복을 배달합니다.</p>
		<p class="introduce__first_p">We are Green Delivery</p>
	</div>
	
	<div class="introduce__second">
		<img src="/resources/images/ubereats.jpg" class="introduce__second_pic" id="introduce__second_pic_left">
		<img src="/resources/images/green.jpg" class="introduce__second_pic">
		<img src="/resources/images/walk.jpg" class="introduce__second_pic" id="introduce__second_pic_right">
	</div>
	
	<div class="introduce__third">
		<p class="introduce__third_p" id="introduce__third_p_left">누구나, 가볍게 그리고 안전하게 배달해요.</p>
		<p class="introduce__third_p">누구나 쉽게, 초록색 행복을 지킬수있어요.</p>
		<p class="introduce__third_p" id="introduce__third_p_right">튼튼한 두다리로 사고 걱정없이 자유롭게!</p>
	</div>
	
	<div class="introduce__icon">
		<img src="/resources/images/hiring.png" class="hiring_icon">
	</div>
	
	<div class="introduce__four">
		<img src="/resources/images/hire1.png" class="introduce__hire_img" id="introduce__hire_img_left"> 
		<i class="fas fa-arrow-right" id="introduce__hire_icon_left"></i> 
		<img src="/resources/images/hire2.png" class="introduce__hire_img" id="introduce__hire_img"> 
		<i class="fas fa-arrow-right" id="introduce__hire_icon_right"></i> 
		<img src="/resources/images/hire3.png" class="introduce__hire_img" id="introduce__hire_img_right">
	</div>
	
	<div class="introduce__five">
		<p class="introduce__five_font" id="introduce__five_font_left">누구나, 가볍게 그리고 안전하게 배달해요.</p>
		<p class="introduce__five_font">누구나 쉽게, 초록색 행복을 지킬수있어요.</p>
		<p class="introduce__five_font" id="introduce__five_font_right">튼튼한 두다리로 사고 걱정없이 자유롭게!</p>
	</div>
</body>

<!-- Footer -->
<section id="footer">
	<div class="container">
		<div class="row text-center text-xs-center text-sm-left text-md-left">
			<div class="col-xs-12 col-sm-4 col-md-4">
				<h5>Quick links</h5>
				<ul class="list-unstyled quick-links">
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Home</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>About</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>FAQ</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Get Started</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Videos</a></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4">
				<h5>Quick links</h5>
				<ul class="list-unstyled quick-links">
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Home</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>About</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>FAQ</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Get Started</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Videos</a></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4">
				<h5>Quick links</h5>
				<ul class="list-unstyled quick-links">
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Home</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>About</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>FAQ</a></li>
					<li><a href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-angle-double-right"></i>Get Started</a></li>
					<li><a href="https://wwwe.sunlimetech.com"
						title="Design and developed by"><i
							class="fa fa-angle-double-right"></i>Imprint</a></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
				<ul class="list-unstyled list-inline social text-center">
					<li class="list-inline-item"><a
						href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-facebook"></i></a></li>
					<li class="list-inline-item"><a
						href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-twitter"></i></a></li>
					<li class="list-inline-item"><a
						href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-instagram"></i></a></li>
					<li class="list-inline-item"><a
						href="https://www.fiverr.com/share/qb8D02"><i
							class="fa fa-google-plus"></i></a></li>
					<li class="list-inline-item"><a
						href="https://www.fiverr.com/share/qb8D02" target="_blank"><i
							class="fa fa-envelope"></i></a></li>
				</ul>
			</div>
			<hr>
		</div>
		<div class="row">
			<div
				class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
				<p>
					<u><a href="https://www.nationaltransaction.com/">National
							Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc.
					Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis,
					MN]
				</p>
				<p class="h6">
					© All right Reversed.<a class="text-green ml-2"
						href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a>
				</p>
			</div>
			<hr>
		</div>
	</div>
</section>
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
				<div class="modal-body" id="map" style="width:497; height:550;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="resizing">리사이징</button> 
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>	
		</div>	
	</div>	
</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
<script>
$(function(){
	//메세지
	var userJoin_msg = "${userJoin_msg}";
	if(userJoin_msg == "registSuccess") {
		alert("회원가입이 완료되었습니다.");
	}
	
	var dlvrJoin_msg = "${dlvrJoin_msg}";
	if(dlvrJoin_msg == "registSuccess") {
		alert("회원가입이 완료되었습니다.")
	}
	
	var loginPlz = "${loginPlz}";
	if(loginPlz == "loginPlz") {
		alert("로그인을 해주세요.")
	}
	
// 	var login_success = "${login_result}";
// 	if(login_success == "login_success") {
// 		alert("로그인 성공");
// 	}
	
	// 지도
	var container = document.getElementById('map');

	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
	
	function resizeMap() {
	    var mapContainer = document.getElementById('map');
	    mapContainer.style.width = '497px';
	    mapContainer.style.height = '550px'; 
	}
	
	function relayout() {    
	    
	    map.relayout();
	}
	

	$("#btnSearch").click(function() {
		$("#modal-172661").trigger("click");

	});

	$("#resizing").click(function(){
		relayout();
		// 주소-좌표 변환 객체를 생성합니다	
	});
});	
</script>
</body>
</html>
