<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/link.jsp"%>
</head>
<body>
	<%@include file="../../include/myPageHeader.jsp"%>
	orderList: ${orderList}
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>주문 정보</th>
								<th>주문 일자</th>
								<th>배달원</th>
								<th>주문 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderVo" items="${orderList }">
								<tr>
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
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
</body>
</html>