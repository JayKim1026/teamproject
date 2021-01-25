<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../css/newOrderFormHeader.css" %>
<header id="head_Container">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
				</div>
				<div class="col-md-8">
					<img src="/resources/images/delivery_logo2.png" id="head_center_img"/>
				</div>
				<div class="col-md-2">
					<img src="${image_url}${userVo.user_img}" class="rounded-circle" id="head_icon_img"/>
					<a id="dropdownMenuButton" data-toggle="dropdown" 
					style="font-family : 'Nanum Pen Script', cursive; font-size : 30px; padding-left: 10%;">${userVo.user_name}</a>
					<span style="font-family : 'Nanum Pen Script', cursive; font-size : 20px; padding-left: 2%;">님 환영합니다.</span>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						 <a class="dropdown-item" href="/user/info">마이페이지</a> 
						 <a class="dropdown-item" href="/user/orderList">주문목록</a> 
						 <a class="dropdown-item" href="/order/newOrderForm">주문하러가기</a> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</header>