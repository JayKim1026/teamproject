<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../css/main.css" %>
<%@include file="../util/mapModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/1190a8ce02.js"
	crossorigin="anonymous"></script>
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
				<li><a class="menu__stuff" href="">Home</a></li>
				<li><a class="menu__stuff" href="/user/loginForm">Login</a></li>
				<li><a class="menu__stuff" href="">Join us</a></li>
			</ul>
			<ul class="nav__link">
				<li><a class="menu__stuff2" href="" style="padding-right: 20;">About</a></li>
				<li><a class="menu__stuff2" href="">Membership</a></li>
			</ul>
			<div class="nav__textArea">
				<input type="text" class="form-control form-control" placeholder="울산광역시/남구/KH정보교육원" />
				<button id="btnSearch">검색</button>
			</div>
		</nav>
<script>
$(function(){
$("#btnSearch").click(function() {
	$("#modal-172661").trigger("click");
	});
});
</script>
	</header>
	
<body>
	<div class="introduce__first">
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
</body>
</html>