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
<ul class="sideMenu">
		<li><a href="/deliver/deliverPage/info">회원정보</a></li>
		<li><a href="/deliver/deliverPage/orderList">주문 내역 조회</a></li>
		<li><a href="/deliver/deliverPage/point">포인트 조회</a></li>
		<li><a href="/deliver/deliverPage/question">1:1 문의</a></li>
	</ul>
<div>deliverVo:${sessionScope.deliverVo}</div>
주문리스트
</body>
</html>