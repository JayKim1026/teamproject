$(function() {

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
				setTimeout(function() {}, 2000);
				if(sender_no == user_no) {
					li = $(".format > ul > li.imgRight").clone();
					li.addClass("right");
				} else {
					li = $(".format > ul > li.imgLeft").clone();
					li.addClass("left");
				}
			}
			li.find(".sender > span").text(this.sender_name);
			li.find(".sender > img").attr("src", image_url + this.sender_img);
			li.find(".message > div").text(this.msg_content);
			li.find(".message > span").text(getTime(this.msg_date));
			li.find(".message > img").attr("src", image_url + this.msg_img);
			
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