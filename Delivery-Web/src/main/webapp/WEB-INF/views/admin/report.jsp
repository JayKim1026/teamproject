<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	$(function() {
		
		var selected = "";
		
		getReportList("");
		
		function getReportList(report_type) {
			var url = "/report/getReportList";
			var sendData = {
					"report_type"	:	report_type
			};
			$.post(url, sendData, function(data) {
				$("#tbody").empty();
				$.each(data, function() {
					console.log(this);
					var tr = $("#trClone").clone();
					tr.children().eq(0).text(this.report_no);
					tr.children().eq(1).text(this.type_detail);
					tr.children().eq(2).text(this.report_detail);
					tr.children().eq(3).text(this.plt_name);
					tr.children().eq(4).text(this.def_name);
					tr.children().eq(5).text(this.report_date);
					tr.children().eq(6).attr("data-no", this.report_no);
					$("#tbody").append(tr);
				});
			});
		}
		
		$("#search").change(function() {
			selected = $(this).val();
			if(selected != "line") {
				getReportList(selected);
			}
		});
		
		$(document).on("click", ".btnApproveReport", function(data) {
			var url = "/report/approveReport";
			var sendData = {
					"report_no"	:	parseInt($(this).parent().attr("data-no")), 
					"admin_no"	:	201
			}
			$.post(url, sendData, function(data) {
				console.log(data);
				console.log(selected);
				getReportList(selected);
			});
		});
		
	});
	
</script>


</head>
<body>
	<select id="search">
		<option value="">전체</option>
		<option value="line">-------</option>
		<option value="6-011">배달</option>
		<option value="6-012">타임라인</option>
		<option value="6-013">댓글</option>
	</select>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th>신고번호</th>
							<th>신고타입</th>
							<th>신고내용</th>
							<th>신고자</th>
							<th>피고인</th>
							<th>신고시간</th>
							<th>버튼</th>
						</tr>
					</thead>
					<tbody id="tbody"></tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<table style="display: none;">
		<tbody>
			<tr id="trClone">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<button class="btn btn-primary btnApproveReport">신고접수</button>
					<button class="btn btn-danger btnRevokeReport">신고취소</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>