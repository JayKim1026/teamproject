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
		<li><a href="/deliverPage/info">회원정보</a></li>
		<li><a href="/deliverPage/orderList">주문 내역 조회</a></li>
		<li><a href="/deliverPage/point">포인트 조회</a></li>
		<li><a href="/deliverPage/review">내가 작성한 후기</a></li>
		<li><a href="/deliverPage/question">1:1 문의</a></li>
	</ul>
<div>deliverVo:${sessionScope.deliverVo}</div>
질문
</body>
</html>