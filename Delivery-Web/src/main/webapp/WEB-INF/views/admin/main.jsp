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
${sessionScope.adminVo}
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
										<h6>배달</h6>
										<p class="text-black-50 content mb-2">요청 배달: <span style="font-weight: 600px; text-decoration: underline; color:black;">80</span></p>
										<p class="text-black-50 content mb-2">진행중 배달: <span style="font-weight: 600px; text-decoration: underline; color:black;">50</span></p>
										<p class="text-black-50 content mb-4">배달 완료건수: <span style="font-weight: 600px; text-decoration: underline; color:black;">5</span></p>
										
										<!-- 합계 -->
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>완료된 배달</span>
												<div class="mt-1">
													<span class="alpha alpha-red">50</span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>취소된 배달</span>
												<div class="mt-2">
													<span class="text-black-50">80</span>
												</div>
											</div>
											
<!-- 											<div class="mr-4"> -->
<!-- 												<span>Budget</span> -->
<!-- 												<div class="mt-2"> -->
<!-- 													<span class="text-black-50">$12,000</span> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
										<!-- 합계 -->
										
									</div>
								</div>
								<!-- 오른쪽 첫번쨰 컨테이너 끝 -->
								
								<!-- 왼쪽 두번쨰(밑에칸) 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>게시물</h6>
										<p class="text-black-50 content mb-2">새로운 일반글: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="nomalPost"></span></p>
										<p class="text-black-50 content mb-2">새로운 리뷰글: <span style="font-weight: 600px; text-decoration: underline; color:black;">40</span></p>
										<p class="text-black-50 content mb-4">새로운 공지사항: <span style="font-weight: 600px; text-decoration: underline; color:black;">5</span></p>
										<!-- 합계 -->
										<div class="d-flex flex-row">
										
											<div class="mr-4">
												<span>전체 일반글</span>
												<div class="mt-1">
													<span class="alpha alpha-red">500</span> 
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 리뷰글</span>
												<div class="mt-2">
													<span class="text-black-50">350</span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 게시글</span>
												<div class="mt-2">
													<span class="text-black-50">850</span>
												</div>
											</div>
										</div>
										<!-- 합계 -->
									</div>
								</div>
								<!-- 왼쪽 두번쨰(밑에칸) 컨테이너 끝-->
								
								<!-- 오른쪽 투번째(밑에칸) 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<h6>신고접수</h6>
										<p class="text-black-50 content mb-2">새로운 신고접수: <span style="font-weight: 600px; text-decoration: underline; color:black;">30</span></p>
										<div class="d-flex flex-row">
											<div class="mr-4">
												<span>완료된 신고접수</span>
												<div class="mt-1">
													<span class="alpha alpha-red">30</span> 
												</div>
											</div>
											
<!-- 											<div class="mr-4"> -->
<!-- 												<span>Deadline</span> -->
<!-- 												<div class="mt-2"> -->
<!-- 													<span class="text-black-50">30 Dec 2020</span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="mr-4"> -->
<!-- 												<span>Budget</span> -->
<!-- 												<div class="mt-2"> -->
<!-- 													<span class="text-black-50">$17,000</span> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
										<!-- 합계 -->
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
<script>

function getMemberList(){
	var url = "/admin/getMemberList"
	$.post(url, function(data){
		var count = data;
		$("#nomalPost").text(count);
	});
}

function getDeliveryList(){
	var url = "/admin/getDeliveryList"
	$.post(url, function(){
			
	});
}

function getTimelineList(){
	var url = "/admin/getTimelineList"
	$.post(url, function(data){
		
				
	});
}

function getRepotList(){
	var url = "/admin/getReportList"
	$.post(url, function(){
			
	});
}

$(function(){
	getMemberList()
	getDeliveryList()
	getTimelineList()
	getRepotList()
});
</script>
</html>