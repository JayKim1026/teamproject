<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/link.jsp"%>
<style>
table{
	table-layout: fixed; word-break: break-all;
}
</style>
</head>
<body>
	<%@include file="../include/deliverPageHeader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>배달번호</th>
							<th>주문내용</th>
							<th>배달날짜</th>
							<th>배달상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="orderVo" items="${deliveryList }">
						<tr>
							<td>${orderVo.order_no }</td>
							<td>${orderVo.order_req }</td>
							<td>${orderVo.order_date }</td>
							<td>${orderVo.code_detail }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>