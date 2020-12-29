<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../../include/link.jsp" %>
</head>
<body>
<header id="head_Container">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
				</div>
				<div class="col-md-8">
					<h1> 마이 페이지 </h1>
				</div>
				<div class="col-md-2">

				</div>
			</div>
		</div>
	</div>
</div>
</header>

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 sidebar">
			<ul>
				<li><a href="/user/userPage/info">회원정보</a></li>
				<li><a href="/user/userPage/orderList">주문 내역 조회</a></li> 
				<li><a href="/user/userPage/point">포인트 조회</a></li> 
				<li><a href="/user/userPage/review">내가 작성한 후기</a></li> 
				<li><a href="/user/userPage/question">1:1 문의</a></li> 
			</ul>
		</div>
		
		<div class="col-md-8 mainBody">
			포인트 조회
		</div>
		
		<div class="col-md-2">
		
		</div>
	</div>
</div>
</body>
</html>