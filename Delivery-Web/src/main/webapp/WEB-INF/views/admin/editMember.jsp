<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/link.jsp"%>
<%@include file="../css/adminHeader.css"%>
</head>
<body>
	<%@include file="../include/adminHeader.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>

					<div class="col-md-8">
						<table style="display: none;" id="trTable">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td><button type="button"
										class="btn btn-xs btn-warning btnCommentModify">수정</button></td>
								<td><button type="button"
										class="btn btn-xs btn-danger btnCommentDelete">삭제</button></td>
							</tr>
						</table>

						<table class="table" id="memberTable">
							<thead>
								<tr>
									<th>회원번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>휴대전화</th>
									<th>EMAIL</th>
									<th>계정상태</th>
									<th>#</th>
								</tr>
							</thead>
							<tbody id="memberTableTbody">

							</tbody>
						</table>
					</div>

					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function getMemberList() {
		var url = "/admin/getMemberList"
		$.post(url, function(data) {
			console.log(data);
			$("#memberTable > #memberTableTbody").empty();
			$.each(data, function() {
				
				var tr = $("#trTable").find("tr").clone();
				console.log(tr);
				tr.find("td").eq(0).text(this.user_no);
				tr.find("td").eq(1).text(this.user_id);
				tr.find("td").eq(2).text(this.user_name);
				tr.find("td").eq(3).text(this.user_phone);
				tr.find("td").eq(4).text(this.user_email);
				tr.find("td").eq(5).text(this.account_state);
				tr.find("td").eq(6).find("button").attr("user_no", this.user_no);
				tr.find("td").eq(7).find("button").attr("user_no", this.user_no);
				
				
				$("#memberTable > #memberTableTbody").prepend(tr);
			});
		});
	}
	$(function() {
		getMemberList()
	});
</script>
</html>