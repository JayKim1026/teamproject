<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/timelineHeader.css">
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
					<i id="head_icon_name">${userVo.user_name}</i>
					<i class="far fa-comment-dots" id="head_icon_dots"></i>
					<i class="fas fa-bell" id="head_icon_bell"></i>
				</div>
			</div>
		</div>
	</div>
</div>
</header>