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
											<img src="https://i.imgur.com/F7vcS4O.png" width="50">
											<div class="ml-2">
												<span class="d-block font-weight-bold" id="mainMemberCount"></span> 
												<span>일반 가입자</span>
											</div>
										</div>
									</div>
									
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/V4d3OFR.png" width="45">
											<div class="ml-2">
												<span class="d-block font-weight-bold" id="mainDeliverCount"></span> 
												<span>배달원</span>
											</div>
										</div>
									</div>
									
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/fExp9fE.png" width="50">
											<div class="ml-2">
												<span class="d-block font-weight-bold" id="mainOrderCount"></span> 
												<span>배달건수</span>
											</div>
										</div>
									</div>
									
									<div class="col-md-3 mt-1">
										<div class="d-flex flex-row">
											<img src="https://i.imgur.com/fExp9fE.png" width="50">
											<div class="ml-2">
												<span class="d-block font-weight-bold" id="mainPostCount"></span> 
												<span>게시물</span>
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
										<div><span style="margin-left:63px;">회원</span> <a href="/admin/editMember"style="float:right;">회원관리</a></div>
										<!-- 신규 -->
										<p class="text-black-50 content mb-2">신규 일반회원: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="member_Count"></span></p>
										<p class="text-black-50 content mb-2">신규 배달원: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="dlvr_Count_waiting"></span></p>
										<p class="text-black-50 content mb-4">가입 대기중: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="dlvr_Count"></span></p>
										<!-- 신규 -->
										
										<!-- 합계 -->
										<div class="d-flex flex-row justify-content-between">
											
											<div class="mr-4">
												<span>전체 일반 가입자</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_Member_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 배달원</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_Deliver_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 회원</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_All_Member_Count"></span>
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
										<div><span style="margin-left:63px;">주문</span> <a href="/admin/orderList"style="float:right;">주문관리</a></div>
										<p class="text-black-50 content mb-2">요청 배달: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="requested_Order_Count"></span></p>
										<p class="text-black-50 content mb-2">진행중 배달: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="inProgress_Order_Count"></span></p>
										<p class="text-black-50 content mb-4">배달 완료건수: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="finished_Order_Count"></span></p>
										
										<!-- 합계 -->
										<div class="d-flex flex-row justify-content-between">
											
											<div class="mr-4">
												<span>취소된 주문</span>
												<div class="mt-1">
													<span class="alpha alpha-red" id="canceled_Order_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>취소된 배달</span>
												<div class="mt-2">
													<span class="text-black-50" id="canceled_Deliver_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 배달건</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_Finished_Count"></span>
												</div>
											</div>
										</div>
										<!-- 합계 -->
										
									</div>
								</div>
								<!-- 오른쪽 첫번쨰 컨테이너 끝 -->
								
								<!-- 왼쪽 두번쨰(밑에칸) 컨테이너 -->
								<div class="col-md-6 mt-3">
									<div class="bg-white p-3 rounded border">
										<div><span style="margin-left:63px;">게시물</span> <a href="#"style="float:right;">게시글관리</a></div>
										<p class="text-black-50 content mb-2">새로운 일반글: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="post_Count"></span></p>
										<p class="text-black-50 content mb-2">새로운 리뷰글: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="review_Count"></span></p>
								 		<p class="text-black-50 content mb-4">새로운 공지사항: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="notice_Count"></span></p>
										<!-- 합계 -->
										<div class="d-flex flex-row justify-content-between">
										
											<div class="mr-4">
												<span>전체 일반글</span>
												<div class="mt-1">
													<span class="alpha alpha-red" id="total_Post_Count"></span> 
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 리뷰글</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_Review_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>전체 게시글</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_count"></span>
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
										<div><span style="margin-left:63px;">신고</span> <a href="#"style="float:right;">신고관리</a></div>
										<p class="text-black-50 content mb-2">새로운 신고접수: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="requested_Report_Count"></span></p>
										<p class="text-black-50 content mb-2">새로운 댓글 신고: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="report_Comment_Count"></span></p>
										<p class="text-black-50 content mb-4">새로운 게시물 신고: <span style="font-weight: 600px; text-decoration: underline; color:black;" id="report_Post_Count"></span></p>
										<!-- 합계 -->
										<div class="d-flex flex-row justify-content-between">
										
											<div class="mr-4">
												<span>게시물 신고</span>
												<div class="mt-1">
													<span class="text-black-50" id="total_Report_Post_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>댓글 신고</span>
												<div class="mt-2">
													<span class="text-black-50" id="total_Report_Comment_Count"></span>
												</div>
											</div>
											
											<div class="mr-4">
												<span>완료된 신고접수</span>
												<div class="mt-2">
													<span class="alpha alpha-red" id="finished_Report_Count"></span> 
												</div>
											</div>
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
	var url = "/admin/getMemberCount"
	$.post(url, function(data){
		console.log("dlvr_Count_waiting:" + data.dlvr_Count_waiting);
		console.log(data);
		$("#member_Count").text(data.member_Count);
		$("#dlvr_Count_waiting").text(data.dlvr_Count_waiting);
		$("#dlvr_Count").text(data.dlvr_Count);
		$("#total_Member_Count").text(data.total_Member_Count);
		$("#total_Deliver_Count").text(data.total_Deliver_Count);
		$("#total_All_Member_Count").text(data.total_All_Member_Count);
		$("#mainMemberCount").text(data.total_Member_Count);
		$("#mainDeliverCount").text(data.total_Deliver_Count);
	});
}

function getDeliveryList(){
	var url = "/admin/getDeliveryCount"
	$.post(url, function(data){
		console.log(data);
		$("#requested_Order_Count").text(data.requested_Order_Count);
		$("#inProgress_Order_Count").text(data.inProgress_Order_Count);
		$("#finished_Order_Count").text(data.finished_Order_Count);
		$("#total_Finished_Count").text(data.total_Finished_Count);
		$("#canceled_Order_Count").text(data.canceled_Order_Count);
		$("#canceled_Deliver_Count").text(data.canceled_Deliver_Count);
		$("#mainOrderCount").text(data.total_Finished_Count);
		
	});
}

function getTimelineList(){
	var url = "/admin/getTimelineCount"
	$.post(url, function(data){
		console.log(data);
		$("#post_Count").text(data.post_Count);
		$("#review_Count").text(data.review_Count);
		$("#notice_Count").text(data.notice_Count);
		$("#total_Post_Count").text(data.total_Post_Count);
		$("#total_Review_Count").text(data.total_Review_Count);
		$("#total_count").text(data.total_count);
		$("#mainPostCount").text(data.total_count);
				
	});
}

function getRepotList(){
	var url = "/admin/getReportCount"
	$.post(url, function(data){
		console.log(data);
		$("#requested_Report_Count").text(data.requested_Report_Count);			
		$("#report_Post_Count").text(data.report_Post_Count);			
		$("#report_Comment_Count").text(data.report_Comment_Count);			
		$("#total_Report_Post_Count").text(data.total_Report_Post_Count);			
		$("#total_Report_Comment_Count").text(data.total_Report_Comment_Count);			
		$("#finished_Report_Count").text(data.finished_Report_Count);			
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