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
<title>메시지 페이지</title>
<style>
.profile-pic {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	object-fit: contain;
	background-color: #E0E0E0
}

.format {
	display: none;
}

.chat {
	padding-bottom: 80px;
}

.chat > ul {
	width: 100%; list-style: none;
}

.chat > ul > li {
	width: 100%;
}

.chat > ul > li.left {
	text-align: left;
}

.chat > ul > li.right {
	text-align: right;
}

.chat > ul > li > div.sender { 
	margin: 10px 20px 0 20px; 
	font-weight: bold; 
}

.chat > ul > li > div.message {
	margin-top: 10px;
}

.chat > ul > li > div.message > div { 
	display: inline-block; word-break:break-all; 
	margin: 5px 20px; max-width: 75%; 
	border: 1px solid #888; padding: 10px; 
	border-radius: 5px; background-color: #FCFCFC; 
	color: #555; text-align: left; 
}

.chat > ul > li > div.message > img {
	width: 300px;
}

</style>
<script>
	var image_url = "${image_url}";
	var user_no = parseInt("${orderVo.user_no}");
	var dlvr_no = parseInt("${orderVo.dlvr_no}");
	var order_no = parseInt("${orderVo.order_no}");
	var interval;
	var lastMsgNo;
</script>
<script src="/resources/js/messageScript.js"></script>
</head>
<body>
	<header>
		<h1>주문번호 : ${orderVo.order_no }번 채팅방</h1>
	</header>
	
	<!-- 채팅 클론하는 div -->
	<div class="chat format">
		<ul>
			<li class="msgLeft">
				<div class="sender">
					<img class="profile-pic">
					<span></span>
				</div>
				<div class="message">
					<div></div>
					<span></span>
				</div>
			</li>
			<li class="msgRight">
				<div class="sender">
					<span></span>
					<img class="profile-pic">
				</div>
				<div class="message">
					<span></span>
					<div></div>
				</div>
			</li>
			<li class="imgLeft">
				<div class="sender">
					<img class="profile-pic">
					<span></span>
				</div>
				<div class="message">
					<img>
					<span></span>
				</div>
			</li>
			<li class="imgRight">
				<div class="sender">
					<span></span>
					<img class="profile-pic">
				</div>
				<div class="message">
					<span></span>
					<img>
				</div>
			</li>
		</ul>
	</div>
		
	<!-- 클론한 걸 띄우는 div -->
	<section style="margin-top:200px">
		<div class="row" >
			<div class="col-md-3"></div>
			<div class="col-md-6 chat" id="chatForm" style="overflow: auto; width:auto; height: 500px; background-color: whitesmoke;">
				<ul>
					
				</ul>
			</div>
			<div class="col-md-3"></div>
		</div>
	</section>
	
		<section style="margin-top:30px">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="message_write_section">
						<input type="text" class="form-control" id="msgContent"/>
						<button type="button" class="btn btn-primary" id="btnSendMsg">보내기</button>
						<input type="file" class="btn btn-dark" id="msgImg" accept="image/,.jpg,.png,.gif" />
						<button type="button" class="btn btn-warning" id="btnStopInterval">중지</button>
					</div>
				<div class="col-md-3"></div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>