<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file = "../../include/link.jsp" %>
</head>
<body>
<header id="head_Container">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
				</div>
				<div class="col-md-8">
					<h1> 마이 페이지 </h1>
				</div>
				<div class="col-md-2">

				</div>
			</div>
		</div>
	</div>
</div>
</header>

	<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 side-bar">
			<ul>
				<li><a href="/user/userPage/info">회원정보</a></li>
				<li><a href="/user/userPage/orderList">주문 내역 조회</a></li> 
				<li><a href="/user/userPage/point">포인트 조회</a></li> 
				<li><a href="/user/userPage/review">내가 작성한 후기</a></li> 
				<li><a href="/user/userPage/question">1:1 문의</a></li> 
			</ul>
		</div>
	
		<div class="col-md-8 content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<th>기본 회원 정보 <span>필수</span></th>
									</tr>
								</thead>
								<tbody>
								
									<tr>
										<td>아이디</td>
										<td>user01</td>
										<td></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td></td>
										<td><button class="btn-default">비밀번호 변경</button></td>
									</tr>
									<tr>
										<td>이름</td>
										<td>123132</td>
										<td><button class="btn-default">이름 수정</button></td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>123@1234.com</td>
										<td><button class="btn-default">이메일 변경</button></td>
									</tr>
									<tr>
										<td>휴대전화</td>
										<td>1231123</td>
										<td><button class="btn-default">휴대전화 변경</button></td>
									</tr>
									<tr>
										<td>계좌번호</td>
										<td></td>
										<td><button class="btn-default">계좌 변경</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>



			</div>
		
		<div class="col-md-2">
		
		</div>
	</div>
</div>
</body>
</html>