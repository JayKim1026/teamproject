<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 조회</title>
<%@ include file="../include/link.jsp"%>
<style>
table {
	table-layout: fixed;
	word-break: break-all;
}

.content_table {
	margin: auto;
}
</style>
</head>
<body>
<%@include file="../include/Infoheader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<section class="content">
					<h1>주문 내역 조회</h1>
						<!-- 배달 중  -->
					<div class="contente_table">
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="border-style: none;">&#91; 주문접수 &#93;</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>요청사항</th>
									<th>주문일자</th>
									<th>배달원</th>
									<th>주문상태</th>
									<th>채팅하기</th>
									<th>주문 변경</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderVo" items="${orderList }">
									<c:if test="${orderVo.code_no == '3-001' || orderVo.code_no == '3-002'}">
										<tr>
											<td>${orderVo.order_no }</td>
											<td>${orderVo.order_req }</td>
											<td>${orderVo.order_date }</td>
											<c:choose>
												<c:when test="${orderVo.dlvr_name != null}">
													<td>${orderVo.dlvr_name}</td>
												</c:when>
												<c:otherwise>
													<td>미지정</td>
												</c:otherwise>
											</c:choose>
											<td>${orderVo.code_detail }</td>
											<td>
												<c:choose>
													<c:when test="${orderVo.code_no == '3-002' }">
														<a href="/user/messageForm" target="_blank"class="btn btn-info btn-sm">채팅시작</a>
													</c:when>
													<c:otherwise>
														배정된 라이더가 없습니다.
													</c:otherwise>
												</c:choose>
											<td>
												<c:choose>
													<c:when test="${orderVo.code_no == '3-001' }">
														<button type="button" class="btnOrderCancel btn btn-danger btn-sm" data-orderno="${orderVo.order_no}">주문취소</button>
													</c:when>
													<c:otherwise>
														<span>변경 불가</span>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />
					
					
					
					
						<!-- 배달 완료 -->
					<div class="contente_table">
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="border-style: none;">&#91; 주문완료 &#93;</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>주문정보</th>
									<th>주문일자</th>
									<th>배달원</th>
									<th>주문 상태</th>
									<th>리뷰쓰기</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderVo" items="${orderList }">
									<c:if
										test="${orderVo.code_detail == '배달완료' or orderVo.code_detail == '배달취소' or orderVo.code_detail == '주문취소'}">
										<tr>
											<td>${orderVo.order_no }</td>
											<td>${orderVo.order_req }</td>
											<td>${orderVo.order_date }</td>
											<c:choose>
												<c:when test="${orderVo.dlvr_name != null}">
													<td>${orderVo.dlvr_name }</td>
												</c:when>
												<c:otherwise>
													<td>미지정</td>
												</c:otherwise>
											</c:choose>
											<td>${orderVo.code_detail }</td>
											<td><a href="/timeline/showTimeline" class="btn btn-warning btn-sm">리뷰쓰기</a></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
<script>
	var orderResult = "${orderResult}";
	if (orderResult == "insertOrder_success") {
		alert("주문이 접수 되었습니다.");
	}
	$(function(){
		$(".btnOrderCancel").each(function() {
			$(this).click(function() {
				var confirmResult = confirm("주문을 취소하시겠습니까?");
				console.log(confirmResult);
				if(confirmResult) {
					var url = "/order/cancelOrder";
					var order_no = $(this).attr("data-orderno");
					console.log(order_no);
					var sendData = {
							"order_no" : order_no
					};
					$.post(url, sendData, function(data){
						console.log(data);
						if(data = "cancel_success") {
							alert("취소되었습니다.");
							location.reload();
						}
					});
				}
			});
		});
	});
</script>
</html>