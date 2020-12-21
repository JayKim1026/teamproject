<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../css/style.css" %>
<%@include file="../util/mapModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Main.jsp</title>
</head>
<body>
<header>
<nav class="navbar">
		
	<div class="nav__logo">
		<a class="logo__font" href="">뚜벅뚜벅Company</a>
		<i class="fab fa-accusoft"></i>
	</div>
		
	<ul class="nav__main">
		<li><a class="menu__stuff" href="">Home</a></li>	
		<li><a class="menu__stuff" href="">Login</a></li>	
		<li><a class="menu__stuff" href="">Join us</a></li>	
	</ul>
		
	<ul class="nav__link">
		<li><a class="menu__stuff2" href="" style="padding-right:20;">About</a></li>	
		<li><a class="menu__stuff2" href="">Membership</a></li>	
	</ul>
	
	<div class="nav__textArea">
		<input type="text" class="form-control form-control" placeholder="울산광역시/남구/KH정보교육원"/>
		<button id="btnSearch">검색</button>
	</div>
					
</nav>
<script>
$(function(){
	$("#btnSearch").click(function(){
		$("#modal-172661").trigger("click");
	});
});
</script>
</header>
<body>
	<div class="introduce__us">
		<p class="int__1">초록색 행복을 배달합니다.</p>
		<p class="int__1">We are Green Delivery</p>	
	</div>
	
	<span class="introduce__pic1">
		<img src="/resources/images/ubereats.jpg" width="400px" height="500px">
	</span>
	
	<span class="introduce__pic2">
		<img src="/resources/images/green.jpg" width="400px" height="500px">
	</span>
	
	<span class="introduce__pic3">
		<img src="/resources/images/walk.jpg" width="400px" height="500px">
	</span>
	
</body>


</body>
</html>