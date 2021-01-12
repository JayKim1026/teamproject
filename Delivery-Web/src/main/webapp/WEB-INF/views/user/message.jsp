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
<script>
$(function() {
	var interval;
	
	function getMessageList() {
		var url = "/message/getMessageList";
		var order_no = parseInt("${orderVo.order_no}");
		var sendData = {
				"order_no"	:	order_no
		};
		$.post(url, sendData, function(data) {
			console.log(data);
		});
	};
	
	getMessageList();
	
// 	interval = setInterval(function() {
// 		var url = "/message/getMessageList";
// 	});
});
</script>
</head>
<body>
	<h1>${orderVo}</h1>
	<h2>${userVo}</h2>
	<input type="text" class="form-control" id="msgContent"/>
	<button type="button" class="btn btn-primary" id="btnSendMsg">보내기</button>
</body>
</html>