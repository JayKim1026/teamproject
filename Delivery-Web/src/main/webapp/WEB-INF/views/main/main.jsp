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
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12" style="margin-top:15px;">
					<div class="row">
						<div class="col-md-2">
							<div class="nav__logo">
								<a class="logo__font" href="">뚜벅뚜벅Company</a>
								 <i class="fab fa-accusoft"></i>
							</div>
						</div>
						
						<div align="right" class="col-md-10">
							<c:if
								test="${sessionScope.userVo == null && sessionScope.deliverVo == null }">
								<a class="menu__font" href="/account/loginForm" style="padding-right:20px; font-size:35px;">로그인</a>
								<a class="menu__font" href="/account/registerForm">일반회원 가입</a>
								<a class="menu__font" href="/account/dlvr_RegisterForm">라이더 가입</a>
							</c:if>
							
							<c:if
								test="${sessionScope.userVo != null || sessionScope.deliverVo != null}">
								<a class="menu__font" href="/account/logout">Logout</a>
								<a class="menu__font" href="/timeline/showTimeline">TimeLine</a>
								<!-- 관리자 임시로 여기뒀음 -->
								<a class="menu__font" href="/admin/main">관리자페이지</a>
							</c:if>
							<!-- 일반 회원  -->
							<c:if test="${sessionScope.userVo != null }">
								<a class="menu__font" href="/order/orderForm" >주문하기</a>
								<a class="menu__font" href="/order/newOrderForm">새로운 주문하기</a>
							</c:if>
							<c:if test="${sessionScope.userVo != null }">
								<a class="menu__font" href="/user/info">마이페이지</a>
							</c:if>
							<!-- 배달원 -->
							<c:if test="${sessionScope.deliverVo != null }">
								<a class="menu__font" href="/deliver/info">마이페이지</a>
							</c:if>
							<a class="menu__font" href="/CSCenter/FAQ">고객센터</a>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12" style="margin-top: 300px;">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" style="text-align: center;">
					<h1 class="animate__animated animate__fadeInDown animate__delay-1s" style="color:white; font-family : 'Nanum Pen Script', cursive;">
						배달 그 이상의 가치,
					</h1>
					<h1 class="animate__animated animate__fadeInDown animate__delay-2s" style="color:white; font-family : 'Nanum Pen Script', cursive;">
						행복을 배달합니다.
					</h1>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</header>
	
<body>

<!-- First Content -->
<div class="container-fluid content_box" data-aos="fade-up" data-aos-duration="2000">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<!-- Left Space -->
				<div class="col-md-2">
				</div>
				<!-- end of Left Space -->
				
				<!-- Center -->
				<div class="col-md-8" style="margin-top:150px; justify-content: ceter;">
					<div style="display:flex; justify-content: center;">
						<p class="introduce__first_p">걸어서 지구 한바퀴, 초록색 행복을 배달하는 우리 
						<span style="color:green; text-decoration: underline; font-weight: 600;">"뚜벅뚜벅COMPANY"</span> 를 소개합니다!</p>
					</div>
					
					<div style="display:flex; justify-content: center;">
						<p class="font_Naum" style="font-size:28px;">익숙한 우리동네 안에서 간단한 장보기, 사무용품, 음식 등을 배달하는 친환경 배달 전용 플랫폼 입니다.<br>
						뚜벅뚜벅COMPANY와 함께하는 성인이라면, 별도의 면허, 장비없이 오직 튼튼한 두다리로만 배달에 참여할수있습니다.</p>
					</div>
					
					<div style="display:flex; justify-content:center;">
						<img src="/resources/images/walkman.png"
						style="width:350px; height:350px; border-radius:10px;">
					</div>
					
					<div style="display:flex; justify-content: center;">
						<p class="font_Naum introduce__first_p">초록색 행복을 배달하는 우리, 지금 당신에게 배달갑니다!</p>
					</div>
					
				</div>
				<!-- End of Center -->
				
				<!-- Right Space -->
				<div class="col-md-2">
				</div>
				<!-- Enf of Right Space -->
			</div>
		</div>
	</div>
</div>
<!-- End of First Content -->

<!-- Second Content -->
<div class="container-fluid content_box" data-aos="fade-up" data-aos-duration="2000">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			
				<!-- Left Space -->
				<div class="col-md-2">
				</div>
				<!-- end of Left Space -->
				
				<!-- Center -->
				<div class="col-md-8">
				
					<div style="text-align: left;">
						<p class="font_Naum" style="font-size:40px;"><span style="color:green; text-decoration: underline;">우리는</span>, 이렇게 배달해요!</p>
					</div>
				
					<div class="flex_box" style="margin-top:60px;">
						<img src="/resources/images/Grandparents.png" class="introduce__second_pic" id="introduce__second_pic_left">
						<img src="/resources/images/chill.jpg" class="introduce__second_pic">
						<img src="/resources/images/delivery_cu.jpg" class="introduce__second_pic" id="introduce__second_pic_right">
					</div>
					<div class="flex_box" style="margin-top:30px;">
						
						<div>
						<p class="font_Naum title"><span style="color:green;">누구나, 쉽게</span> 그리고 안전하게 배달해요.</p>
						<p class="font_Naum second_title">청년부터 어르신까지 쉽고 안전한 배달</p>
						<p class="font_Naum describe_content"><span style="text-decoration: underline; font-weight: 600;">저용량</span> 위주의 가벼운 물품들을 누구든 쉽게 배달할수있어요!</p>
						</div>
						
						<div>
						<p class="font_Naum title"><span style="color:green;">소중한 당신의 시간,</span> 휴식은 선택이아닌 필수!</p>
						<p class="font_Naum second_title">유연한 근무시간, 배달은 내가 원할때만해요.</p>
						<p class="font_Naum describe_content">동네를 산책하듯 혹은 쇼핑을 가듯 자유로운 근무제도</p>
						</div>
						<div style="text-align: right;">
						<p class="font_Naum title"><span style="color:green;">튼튼한 두다리로</span> 사고 걱정없이 자유로운 배달</p>
						<p class="font_Naum second_title" ><span style="color:green;">걸어서</span> Ok, <span style="color:green;">뛰어서</span> Ok, <span style="color:green;">자전거</span> Ok</p>
						<p class="font_Naum describe_content">우리는 두다리를 이용해 배달하는 뚜벅이 입니다!</p>
						</div>
					</div>
					
				</div>
				<!-- End of Center -->
				
				<!-- Right Space -->
				<div class="col-md-2">
				</div>
				<!-- Enf of Right Space -->
				
			</div>
		</div>
	</div>
</div>
<!-- End of Second Content -->

<!-- Third Content -->
<div class="container-fluid content_box" data-aos="fade-up" data-aos-duration="2000">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			
				<!--Left Space -->
				<div class="col-md-2">
				</div>
				<!-- end of Left Space -->
				
				<!--Center -->
				<div class="col-md-8">
				
					<!-- Hire Icon -->
					<div style="margin-top:60px; text-align: left;">
						<p class="font_Naum" style="font-size:40px;"><span style="color:green; text-decoration: underline;">뚜벅뚜벅</span>, 뚜벅이!<br></p>
						<p class="font_Naum" style="font-size:40px;"><span style="color:green; text-decoration: underline;">누구나</span> 쉽게, 뚜벅이가 될 수있어요!</p>
					</div>
					<!-- end of Hire Icon -->
					
					<!-- pictures -->
					<div class="flex_box" style="margin-top: 80px;">
						<img src="/resources/images/hire1.png" class="introduce__hire_img"> 
						<i class="fas fa-arrow-right" id="introduce__hire_icon_left"></i> 
						<img src="/resources/images/hire2.png" class="introduce__hire_img"> 
						<i class="fas fa-arrow-right" id="introduce__hire_icon_right"></i> 
						<img src="/resources/images/hire3.png" class="introduce__hire_img">
					</div>
					<!-- end of pictures -->
					
					<!-- text -->
					<div class="flex_box">
						<p class="introduce__five_font">이력서는 필요없어요!쉬운 가입만하면 누구나!</p>
						<p class="introduce__five_font">원하는 주문만 쏙쏙!</p>
						<p class="introduce__five_font" id="introduce__five_font_right">매주 금요일, 배달 완료건에 대한 금액 지급!</p>
					</div>
					
					<div style="float:right; margin-top:100px;">
						<img src="/resources/images/delivery_logo2.png"  style="width:70px; height:70px; margin-left:40px;">
						<div>
							<a href="/account/dlvr_RegisterForm"><span class="font_Naum" style="font-size:29px;">라이더 등록하러가기</span></a>
						</div>
					</div>
				
					<!-- end of text -->
				</div>
				<!--End of Center -->
				
				<!--Right Space -->
				<div class="col-md-2">
				</div>
				<!--Enf of Right Space -->
			</div>
		</div>
	</div>
</div>
<!-- End of Third Content -->

<!-- Third Content -->
<div class="container-fluid content_box" style="background-color:black;"> <!-- data-aos="fade-up" data-aos-duration="2000"-->
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			
				<!--Left Space -->
				<div class="col-md-2">
				</div>
				<!-- end of Left Space -->
				
				<!--Center -->
				<div class="col-md-4">
				
					<!-- Hire Icon -->
					<div style="margin-top:60px; text-align: left;">
						<p class="font_Naum" style="font-size:40px;"><span style="color:white; text-decoration: underline;">FAQ</span></p>
						<p class="font_Naum" style="font-size:40px;"><span style="color:white; text-decoration: underline;">자주하는 질문</span></p>
					</div>
					<!-- end of Hire Icon -->
					
					
					<!-- end of pictures -->
					
					<!-- text -->
					<ul style="list-style: none; padding-left:0px;">
					
						<li style="margin-top:40px;">
							<div>
								<p class="faq_font"><span style="color:green">Q</span> 뚜벅이가 되고싶어요! 자격조건이 따로있나요?<br></p>	
								<p class="faq_font">A 만 18세이상, 남녀노소 누구나 뚜벅이가 될수있습니다.<br>
												단, 배달받으시는 고객분들을 위해 깔끔한 복장 아시죠?</p>
							</div>
						</li>
						
						<li style="margin-top:40px;">
							<div>
								<p class="faq_font"><span style="color:green">Q</span> 자전거도 없고 자동차도 없어요 ㅠ_ㅠ 어떻게 배달하나요?<br></p>	
								<p class="faq_font">A 자동차도 없는, 자전거도 없는 당신! 우리는 걸어서 배달해요!</p>
							</div>
						</li>
						
						<li style="margin-top:40px;">
							<div>
								<p class="faq_font"><span style="color:green">Q</span> 회원가입시 필요한 서류는 어떻게되나요?<br></p>	
								<p class="faq_font">A 본인 명의 계좌, 그리고 신분확인을 위한 신분증사진을 필요로합니다.</p>
							</div>
						</li>
						
						<li style="margin-top:40px;">
							<div>
								<p class="faq_font"><span style="color:green">Q</span> 배달 중 상품을 분실/파손 했어요ㅠㅠ 어떻게하죠?<br></p>	
								<p class="faq_font">A 당황하지마시고 먼저 고객님에게 알린 후, 고객센터로 전화주세요!</p>
							</div>
						</li>
						
						<li style="margin-top:40px;">
							<div>
								<p class="faq_font">더 많은것들이 궁금하다면?<br></p>
								<a href="/CSCenter/FAQ"><span class="faq_font" style="text-decoration: underline;">고객센터<br></span></a>	
								<i class="far fa-hand-point-up" style="color:white;"></i>
							</div>
						</li>
						
					</ul>
				
					<!-- end of text -->
				</div>
				<!--End of Center -->
				
				<!--Right Space -->
				<div class="col-md-2">
				</div>
				<!--Enf of Right Space -->
			</div>
		</div>
	</div>
</div>
<!-- End of Third Content -->

<!--Last Content(get app on playstore and appstore)-->
<div class="container-fluid content_box">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			
				<!--Left Space -->
				<div class="col-md-2">
				</div>
				<!-- end of Left Space -->
				
				<!--Center -->
				<div class="col-md-4">
					<img src="/resources/images/phoneLogo.png" style="margin-top:220px;">
				</div>
				<div class="col-md-4">
					<ul style="list-style: none; padding-left:0px; margin-top:315px;">
						
						<li>
							<div>
								<p class="font_Naum" style="font-size: 45px;">지금, <span style="color:green; text-decoration: underline;">뚜벅뚜벅COMPANY</span>를 <br><span style="text-decoration: underline;">다운로드</span> 해보세요!</p>
							</div>
						</li>
						
						<li>
							<div>
								<p class="font_Naum" style="font-size: 25px;">세상의 모든 발자국, 가장 쉬운 배달 플랫폼 <span style="color:green; text-decoration: underline;">뚜벅뚜벅COMPANY</span></p>
							</div>
						</li>
						
						<li>
							<div>
								<p class="font_Naum" style="font-size: 20px;">*아이폰 추후 사용 가능*</p>
							</div>
							<div>
								<img src="/resources/images/androidandapple.png" style="width:500px;">
							</div>
						</li>
					</ul>
				</div>
				<!--End of Center -->
				
				<!--Right Space -->
				<div class="col-md-2">
				</div>
				<!--Enf of Right Space -->
			</div>
		</div>
	</div>
</div>
<!-- End of Last Content(get app on playstore and appstore) -->


	
</body>

<!-- Footer -->
<%@include file="../include/footer.jsp" %>
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
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
</body>
</html>
