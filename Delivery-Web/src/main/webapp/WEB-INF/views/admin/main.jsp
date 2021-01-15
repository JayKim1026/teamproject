<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<%@include file="../include/link.jsp" %>
<%@include file="../css/adminHeader.css" %>
</head>
<body>
<!-- Header -->
<%@include file="../include/adminHeader.jsp"%>
<!-- end of Header -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8" style="text-align: center;">
				
						<div class="container">
							<!-- 시작부분 -->
							<div class="d-flex justify-content-between">
								<div>
									<span class="font-weight-bold project">관리자 보드</span> <small
										class="text-black-50 totals">4031 Total</small>
								</div>
							</div>
							<!-- 시작 부분 끝 -->
							
							<!-- 첫번째 컨테이너 내용물 -->
							<div class="bg-white border rounded mt-2">
								<div class=" px-3 mt-3 d-flex flex-row justify-content-between">
									<span>전체현황</span>
									<div class="d-flex align-items-center">
										<span class="border-right px-2 mr-2 text-black-50 fs-10">All
											Time</span> <i class="fa fa-caret-down"></i>
									</div>
								</div>
								<hr>
								<div class="row px-5 mb-3">
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/V4d3OFR.png" width="45">
											<div class="ml-2">
												<span class="d-block font-weight-bold">241</span> 
												<span>일반 가입자</span>
											</div>
										</div>
									</div>
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/F7vcS4O.png" width="50">
											<div class="ml-2">
												<span class="d-block font-weight-bold">3790</span> 
												<span>배달원</span>
											</div>
										</div>
									</div>
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/fExp9fE.png" width="50">
											<div class="ml-2">
												<span class="d-block font-weight-bold">93</span> 
												<span>배달건수</span>
											</div>
										</div>
									</div>
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<div class="ml-5">
												<span class="d-block text-black-50">283 overdue</span> <span
													class="text-black-50">3748 completed</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 첫번째 컨테이너 내용물  끝-->
							
							
							<div class="row mb-5">
								<!-- 왼쪽 첫번째 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>회원</h6>
										<!-- 신규 -->
										<p class="text-black-50 content mb-2">신규 가입자: <span style="font-weight: 600px; text-decoration: underline; color:black;">80</span></p>
										<p class="text-black-50 content mb-2">신규 배달원: <span style="font-weight: 600px; text-decoration: underline; color:black;">50</span></p>
										<p class="text-black-50 content mb-4">가입 대기중: <span style="font-weight: 600px; text-decoration: underline; color:black;">5</span></p>
										<!-- 신규 -->
										
										<!-- 합계 -->
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>전체 일반 가입자</span>
												<div class="mt-1">
													<span class="alpha alpha-red">3000</span>
												</div>
											</div>
											<div class="mr-4">
												<span>전체 배달원</span>
												<div class="mt-2">
													<span class="text-black-50">2500</span>
												</div>
											</div>
											<div class="mr-4">
												<span>전체 회원</span>
												<div class="mt-2">
													<span class="text-black-50">5500</span>
												</div>
											</div>
										</div>
										<!-- 합계 -->
									</div>
								</div>
								<!-- 왼쪽 첫번째 컨테이너 끝 -->
								
								<!-- 오른쪽 첫번째 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>Mobilebox Geedbox - #240</h6>
										<p class="text-black-50 content mb-5">Lorem ipsum dolor
											sit amet, consectetur adipiscing elit, sed do eiusmod tempor
											incididunt ut labore et dolore magna aliqua. Ut enim ad minim
											veniam, quis nostrud exercitation ullamco</p>
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>Developers</span>
												<div class="mt-1">
													<span class="alpha alpha-red">M</span> <span
														class="alpha alpha-green">W</span> <span
														class="alpha alpha-red">N</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Deadline</span>
												<div class="mt-2">
													<span class="text-black-50">20 Dec 2020</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Budget</span>
												<div class="mt-2">
													<span class="text-black-50">$12,000</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 오른쪽 첫번쨰 컨테이너 끝 -->
								
								<!-- 왼쪽 두번쨰(밑에칸) 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>Online Store - #239</h6>
										<p class="text-black-50 content mb-5">Lorem ipsum dolor
											sit amet, consectetur adipiscing elit, sed do eiusmod tempor
											incididunt ut labore et dolore magna aliqua. Ut enim ad minim
											veniam, quis nostrud exercitation ullamco</p>
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>Developers</span>
												<div class="mt-1">
													<span class="alpha alpha-red">M</span> <span
														class="alpha alpha-green">W</span> <span
														class="alpha alpha-red">C</span> <span
														class="alpha alpha-green">D</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Deadline</span>
												<div class="mt-2">
													<span class="text-black-50">24 Dec 2020</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Budget</span>
												<div class="mt-2">
													<span class="text-black-50">$10,000</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 왼쪽 두번쨰(밑에칸) 컨테이너 끝-->
								
								<!-- 오른쪽 투번째(밑에칸) 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>Landing page Boostand - #238</h6>
										<p class="text-black-50 content mb-5">Lorem ipsum dolor
											sit amet, consectetur adipiscing elit, sed do eiusmod tempor
											incididunt ut labore et dolore magna aliqua. Ut enim ad minim
											veniam, quis nostrud exercitation ullamco</p>
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>Developers</span>
												<div class="mt-1">
													<span class="alpha alpha-red">M</span> <span
														class="alpha alpha-green">W</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Deadline</span>
												<div class="mt-2">
													<span class="text-black-50">30 Dec 2020</span>
												</div>
											</div>
											<div class="mr-4">
												<span>Budget</span>
												<div class="mt-2">
													<span class="text-black-50">$17,000</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								 <!-- 오른쪽 투번째(밑에칸) 컨테이너 끝-->
								 
							</div>
						</div>

					</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<%@include file="../include/footer.jsp"%>
<!-- end of footer -->
</body>
</html>