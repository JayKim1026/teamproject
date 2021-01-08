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
	var waUri = "ws://echo.websocket.org/";
	var output;
	
	function init() {
		output = document.getElementById("output");
		testWebSocket();
	}
	
	function testWebSocket() {
		websocket = new WebSocket(waUri);
		websocket.onopen = function(evt) {onOpen(evt);};
		websocket.onclose = function(evt) {onClose(evt);};
		websocket.onmessage = function(evt) {onMessage(evt);};
		websocket.onerror = function(evt) {onError(evt);};
	}
	
	function sendMessage() {
		websocket = new WebSocket(waUri);
		websocket.onopen = function(evt) {onOpen(evt);};
		websocket.onmessage = function(evt) {onMessage(evt);};
		websocket.onclose = function(evt) {onClose(evt);};
	}
	
	function onOpen(evt) {
		writeToScreen("연결완료");
		doSend("테스트메시지");
	}
	
	function onClose(evt) {
		writeToScreen("연결해제");
	}
	
	function onMessage(evt) {
		writeToScreen('<span style="color: blue;">수신: ' + evt.data + '</span>');
		websocket.close();
	}
	
	function onError(evt) {
		writeToScreen('<span style="color: red;">에러:</span>' + evt.data);
	}
	
	function doSend(message) {
		writeToScreen("발신: " + message);
		websocket.send(message);
	}
	
	function writeToScreen(message) {
		var pre = document.createElement("p");
		pre.style.wordWrap = "break-word";
		pre.innerHTML = message;
		output.appendChild(pre);
	}
	
// 	window.addEventListener("load", init, false);
</script>
</head>
<body>
	<h2>WebSocket Test</h2>
	<div id="output"></div>
	<input type="text" id="msg"/>
	<button id="send" onclick="sendMessage()">전송</button>
</body>
</html>