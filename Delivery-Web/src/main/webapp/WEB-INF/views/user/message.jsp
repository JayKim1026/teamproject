<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
 .profile-pic {
     width: 60px;
     height: 60px;
     border-radius: 50%;
     object-fit: contain;
     background-color: #E0E0E0
 }
</style>
<script>
$(function() {
	var user_no = parseInt("${orderVo.user_no}"); 
	var dlvr_no = parseInt("${orderVo.dlvr_no}");
	var order_no = parseInt("${orderVo.order_no}");
	var interval;
	var lastMsgNo;
	
	getMessageList();
	
	function getMessageList() {
		var url = "/message/getMessageList";
		var sendData = {
				"order_no"	:	order_no
		};
		$.post(url, sendData, function(data) {
			console.log(data);
			if(data != null) {
				appendMessage(data);
				start();
			}
		});
	};
	
	function start() {
		interval = setInterval(function() {
			getCurrentMessage();
		}, 1000);
	};
	
	function getCurrentMessage() {
		var url = "/message/getCurrentMessage";
		var sendData = {
				"order_no"		:	order_no, 
				"msg_no"		:	lastMsgNo
		};
		
		$.post(url, sendData, function(data) {
			if(data != null) {
				appendMessage(data);
			}
		});
	}
	
	function appendMessage(data) {
		$.each(data, function(index) {
			console.log(this);
			var sender_no = this.sender_no;
			console.log(sender_no);
			var clone;
			if(user_no == sender_no) {
				clone = $(".senderForm").eq(0).clone();
			} else {
				clone = $(".receiverForm").eq(0).clone();
			}
			clone.children().eq(0).attr("src", "${image_url}" + this.sender_img);
			clone.children().eq(1).text(this.sender_name);
			clone.children().eq(2).text(this.msg_content);
			clone.children().eq(3).text(this.msg_date);
			
			$("#chatForm").append(clone);
			clone.show(500);
			
			if(index == data.length-1) {
				lastMsgNo = this.msg_no;
			}
		});
	};
	
	$("#btnSendMsg").click(function() {
		var msg_content = $("#msgContent").val();
		var url = "/message/sendMsgContent";
		var sendData = {
				"order_no"		:	order_no, 
				"sender_no"		:	user_no, 
				"receiver_no"	:	dlvr_no, 
				"msg_content"	:	msg_content
		};
		$.post(url, sendData, function(data) {
			console.log(data);
		});
	});
});
</script>
</head>
<body>
	<div class="senderForm" style="display: none; float: right">
		<img alt="senderImg" src="" class="profile-pic">
		<span></span>
		<span></span>
		<span></span>
	</div>
	<div class="receiverForm" style="display: none">
		<img alt="receiverImg" src="" class="profile-pic">
		<span></span>
		<span></span>
		<span></span>
	</div>
	<h1>${orderVo}</h1>
	<h2>${userVo}</h2>
	<input type="text" class="form-control" id="msgContent"/>
	<button type="button" class="btn btn-primary" id="btnSendMsg">보내기</button>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8" id="chatForm">
				
				
				
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
</body>
</html>