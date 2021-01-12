<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/link.jsp"%>
<style>
table {
	table-layout: fixed;
	word-break: break-all;
}

.content {
	
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
					<div>
						<table class="table">
							<thead>
								<tr>
									<th style="border-style: none;">&#91; 주문 대기 &#93;</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>요청사항</th>
									<th>주문일자</th>
									<th>배달원</th>
									<th>주문 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderVo" items="${orderList }">
									<c:if test="${orderVo.code_detail == '주문대기'}">
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
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />
					<div>
						<!-- 배달 중  -->
						<table class="table">
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
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderVo" items="${orderList }">
									<c:if test="${orderVo.code_detail == '배달중'}">
										<tr>
											<td>${orderVo.order_no }</td>
											<td>${orderVo.order_req }</td>
											<td>${orderVo.order_date }</td>
											<c:choose>
												<c:when test="${orderVo.dlvr_name != null}">
													<td><a href="#" title="배달원과 채팅하기">
															${orderVo.dlvr_name} </a></td>
												</c:when>
												<c:otherwise>
													<td>미지정</td>
												</c:otherwise>
											</c:choose>
											<td>${orderVo.code_detail }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />
					<div>
						<!-- 배달 완료 -->
						<table class="table">
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
</script>
</html>