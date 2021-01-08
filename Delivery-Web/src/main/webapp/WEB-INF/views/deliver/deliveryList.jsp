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
</style>
</head>
<body>
	<%@include file="../include/deliverPageHeader.jsp"%>


</body>
<table class="table">
	<thead>
		<tr>
			<th style="border-style: none;">&#91;완료목록&#93;</th>
		</tr>
	</thead>
	<thead>
		<tr>
			<th>배달번호</th>
			<th>주문내용</th>
			<th>배달날짜</th>
			<th>배달상태</th>
			<th>배달평점</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderVo" items="${deliveryList }">
		<c:if test="${orderVo.code_detail == '배달완료'}">
			<tr>
				<td>${orderVo.order_no }</td>
				<td>${orderVo.order_req }</td>
				<td>${orderVo.order_date }</td>
				<td>${orderVo.code_detail }</td>
				<td>
					<c:choose>
					<c:when test ="${orderVo.time_star == 0 }">
					평가가 되지 않았습니다.
					</c:when>
					<c:otherwise>${orderVo.time_star}</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>


<table class="table">
	<thead>
		<tr>
			<th style="border-style: none;">&#91;취소목록&#93;</th>
		</tr>
	</thead>
	<thead>
		<tr>
			<th>배달번호</th>
			<th>주문내용</th>
			<th>배달날짜</th>
			<th>배달상태</th>
			<th>배달평점</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="orderVo" items="${deliveryList }">
		<c:if test="${orderVo.code_detail == '배달취소' || orderVo.code_detail == '주문취소' }">
				<tr>
					<td>${orderVo.order_no }</td>
					<td>${orderVo.order_req }</td>
					<td>${orderVo.order_date }</td>
					<td>${orderVo.code_detail }</td>
					<td>
						<c:choose>
							<c:when test ="${orderVo.time_star == 0 }">
							평가가 되지 않았습니다.
							</c:when>
							<c:otherwise>
								<c:if test="${orderVo.time_star == 1}">
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
								
								</c:if>
								<c:if test ="${orderVo.time_star == 2 }">
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
								</c:if>
								<c:if test ="${orderVo.time_star == 3 }">
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">☆</label>
									<label for="rating" style="color: #FFD600">☆</label>
								</c:if>
								<c:if test ="${orderVo.time_star == 4 }">
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">☆</label>
								</c:if>
								<c:if test ="${orderVo.time_star == 5 }">
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
									<label for="rating" style="color: #FFD600">★</label>
								</c:if>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
		</c:if>
		</c:forEach>
	</tbody>
</table>
</html>