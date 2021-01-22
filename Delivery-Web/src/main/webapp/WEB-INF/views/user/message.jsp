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
<title>채팅하기</title>
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
				"order_no" : order_no
			};
			$.post(url, sendData, function(data) {
				console.log(data);
				if (data != null) {
					appendMessage(data);
					start();
				}
			});
		}
		;

		function start() {
			interval = setInterval(function() {
				getCurrentMessage();
			}, 1000);
		}
		;

		function getCurrentMessage() {
			var url = "/message/getCurrentMessage";
			var sendData = {
				"order_no" : order_no,
				"msg_no" : lastMsgNo
			};

			$.post(url, sendData, function(data) {
				if (data != null) {
					appendMessage(data);
				}
			});
		}

		function appendMessage(data) {
			$.each(data, function(index) {
				var sender_no = this.sender_no;
				var user_no = parseInt("${userVo.user_no}");
				var li;
				if(this.msg_content != null) {
					if(sender_no == user_no) {
						li = $(".format > ul > li.msgRight").clone();
						li.addClass("right");
					} else {
						li = $(".format > ul > li.msgLeft").clone();
						li.addClass("left");
					}
				} else {
					if(sender_no == user_no) {
						li = $(".format > ul > li.imgRight").clone();
						li.addClass("right");
					} else {
						li = $(".format > ul > li.imgLeft").clone();
						li.addClass("left");
					}
				}
				li.find(".sender > span").text(this.sender_name);
				li.find(".sender > img").attr("src", "${image_url}" + this.sender_img);
				li.find(".message > div").text(this.msg_content);
				li.find(".message > span").text(getTime(this.msg_date));
				li.find(".message > img").attr("src", "${image_url}" + this.msg_img);
				
				$(".chat").not(".format").find("ul").append(li);
				
				if(index == data.length-1) {
					lastMsgNo = this.msg_no;
					li[0].scrollIntoView();
				}
			});
		}
		;

		$("#btnSendMsg").click(function() {
			var msg_content = $("#msgContent").val();
			var url = "/message/sendMsgContent";
			var sendData = {
				"order_no" : order_no,
				"sender_no" : user_no,
				"receiver_no" : dlvr_no,
				"msg_content" : msg_content
			};
			$.post(url, sendData, function(data) {
				$("#msgContent").val("");
			});
		});

		$("#btnStopInterval").click(function() {
			console.log(this);
			clearInterval(interval);
		});

		$("#msgImg").change(function(e) {
			var url = "/message/sendMsgImg"
			var f_msg_img = $("input[type=file]")[0].files[0];
			var formData = new FormData();
			formData.append("f_msg_img", f_msg_img);
			formData.append("order_no", order_no);
			formData.append("sender_no", user_no);
			formData.append("receiver_no", dlvr_no);

			$.ajax({
				"processData" : false,
				"contentType" : false,
				"type" : "post",
				"url" : url,
				"data" : formData,
				"success" : function(data) {
					
				}
			});

		});
		
		$("#msgContent").keyup(function() {
			if(window.event.keyCode == 13) {
				$("#btnSendMsg").trigger("click");
			}
		});
		
		function getTime(msg_date) {
			var hour = parseInt(msg_date.split(" ")[1].split(":")[0]);
			var minute = parseInt(msg_date.split(" ")[1].split(":")[1]);
			var time = "";
			if(hour > 9) {
				time += hour + ":";
			} else {
				time += "0" + hour + ":";
			}
			if(minute > 9) {
				time += minute;
			} else {
				time += "0" + minute;
			}
			return time;
		}
	});
</script>
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