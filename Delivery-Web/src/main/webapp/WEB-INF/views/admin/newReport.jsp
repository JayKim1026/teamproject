<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/link.jsp"%>
<link rel="stylesheet" href="/resources/css/adminHeader.css">
<style>
.project-tab {
    padding: 10%;
    margin-top: -8%;
}
.project-tab #tabs{
    background: #007b5e;
    color: #eee;
}
.project-tab #tabs h6.section-title{
    color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #0062cc;
    background-color: transparent;
    border-color: transparent transparent #f3f3f3;
    border-bottom: 3px solid !important;
    font-size: 16px;
    font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
    border: none;
}
.project-tab thead{
    background: #f3f3f3;
    color: #333;
}
.project-tab a{
    text-decoration: none;
    color: #333;
    font-weight: 600;
}
</style>
</head>
<body>
<%@include file="../include/adminHeader.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<!-- 탭 -->
					<nav>
	                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
		                    <a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">신고대기</a>
		                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">신고접수</a>
		                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">신고취소</a>
	                	</div>
                	</nav>
					<!-- 탭 끝-->
					<div class="tab-content" id="nav-tabContent">
					<!-- ReportList Table -->
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						<table style="display: none;" id="reporttrTable">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<select>
										<option value="6-001">신고대기</option>
										<option value="6-002">신고접수</option>
										<option value="6-003">신고취소</option>
									</select>
								</td>
								<td></td>
								<td><button type="button"
										class="btn btn-xs btn-warning btnModify">변경</button></td>
							</tr>
						</table>
	
						<table class="table" id="reportTable">
							<thead>
								<tr>
									<th>신고번호</th>
									<th>신고자</th>
									<th>피고인</th>
									<th>신고내용</th>
									<th>분류</th>
									<th>상태</th>
									<th>신고날짜</th>
									<th>/</th>
								</tr>
							</thead>
							<tbody id="reportTableTbody">
	
							</tbody>
						</table>
					</div>
					<!-- 신고 대기 -->
					
					<!-- 신고 접수 -->
					<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						<table style="display: none;" id="acceptReporttrTable">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<select>
										<option value="6-001">신고대기</option>
										<option value="6-002">신고접수</option>
										<option value="6-003">신고취소</option>
									</select>
								</td>
								<td></td>
								<td><button type="button"
										class="btn btn-xs btn-warning btnModify">변경</button></td>
							</tr>
						</table>
	
						<table class="table" id="acceptReportTable">
							<thead>
								<tr>
									<th>신고번호</th>
									<th>신고자</th>
									<th>피고인</th>
									<th>신고내용</th>
									<th>분류</th>
									<th>상태</th>
									<th>신고날짜</th>
									<th>/</th>
								</tr>
							</thead>
							<tbody id="acceptReportTableTbody">
	
							</tbody>
						</table>
					</div>
					<!-- 신고접수 끝 -->
					
					<!-- 신고 취소 -->
					<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
						<table style="display: none;" id="cancelReporttrTable">
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<select>
										<option value="6-001">신고대기</option>
										<option value="6-002">신고접수</option>
										<option value="6-003">신고취소</option>
									</select>
								</td>
								<td></td>
								<td><button type="button"
										class="btn btn-xs btn-warning btnModify">변경</button></td>
							</tr>
						</table>
	
						<table class="table" id="cancelReportTable">
							<thead>
								<tr>
									<th>신고번호</th>
									<th>신고자</th>
									<th>피고인</th>
									<th>신고내용</th>
									<th>분류</th>
									<th>상태</th>
									<th>신고날짜</th>
									<th>/</th>
								</tr>
							</thead>
							<tbody id="cancelReportTableTbody">
	
							</tbody>
						</table>
					</div>
					<!-- 신고 취소 끝 -->
				</div>
				<div class="col-md-2">
				<!-- End of ReportList Table  -->
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
function reportList(){
	var url = "/admin/getReportList"
	$.post(url,function(data){
		console.log(data);
		$("#reportTable > #reportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#reporttrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.report_no);
			tr.find("td").eq(1).text(this.plt_name);
			tr.find("td").eq(2).text(this.def_name);
			var report_code = "";
			if(this.report_code == "6-101"){
				report_code = "불친절";
			}else if(this.report_code == "6-102"){
				report_code = "물건상태불량";
			}else if(this.report_code == "6-103"){
				report_code = "너무오래걸림";
			}else if(this.report_code == "6-111"){
				report_code = "허위사실유포";
			}else if(this.report_code == "6-112"){
				report_code = "선정성/폭력성";
			}else if(this.report_code == "6-113"){
				report_code = "특정인비하";
			}
			tr.find("td").eq(3).text(report_code);
			
			var report_type = "";
			
			if(this.report_type == "6-011"){
				report_type = "배달신고";
			}else if(this.report_type == "6-012"){
				report_type = "타임라인신고";
			}else if(this.report_type == "6-013"){
				report_type = "댓글신고";
			}
			tr.find("td").eq(4).text(report_type);
			
			tr.find("td").eq(5).find("option:eq(0)").attr("selected", "selected");
			tr.find("td").eq(6).text(this.report_date);
		
			tr.find("td").eq(7).find("button").attr("report_no", this.report_no);
				
			$("#reportTable > #reportTableTbody").prepend(tr);
		});
	});
}

function acceptReportList(){
	var url = "/admin/getAcceptReportList"
	$.post(url,function(data){
		console.log(data);
		$("#acceptReportTable > #acceptReportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#acceptReporttrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.report_no);
			tr.find("td").eq(1).text(this.plt_name);
			tr.find("td").eq(2).text(this.def_name);
			var report_code = "";
			if(this.report_code == "6-101"){
				report_code = "불친절";
			}else if(this.report_code == "6-102"){
				report_code = "물건상태불량";
			}else if(this.report_code == "6-103"){
				report_code = "너무오래걸림";
			}else if(this.report_code == "6-111"){
				report_code = "허위사실유포";
			}else if(this.report_code == "6-112"){
				report_code = "선정성/폭력성";
			}else if(this.report_code == "6-113"){
				report_code = "특정인비하";
			}
			tr.find("td").eq(3).text(report_code);
			
			var report_type = "";
			
			if(this.report_type == "6-011"){
				report_type = "배달신고";
			}else if(this.report_type == "6-012"){
				report_type = "타임라인신고";
			}else if(this.report_type == "6-013"){
				report_type = "댓글신고";
			}
			tr.find("td").eq(4).text(report_type);
			
			tr.find("td").eq(5).find("option:eq(1)").attr("selected", "selected");
			tr.find("td").eq(6).text(this.report_date);
		
			tr.find("td").eq(7).find("button").attr("report_no", this.report_no);
				
			$("#acceptReportTable > #acceptReportTableTbody").prepend(tr);
		});
	});
}

function cancelReportList(){
	var url = "/admin/getCancelReportList"
	$.post(url,function(data){
		console.log(data);
		$("#cancelReportTable > #cancelReportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#cancelReporttrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.report_no);
			tr.find("td").eq(1).text(this.plt_name);
			tr.find("td").eq(2).text(this.def_name);
			var report_code = "";
			if(this.report_code == "6-101"){
				report_code = "불친절";
			}else if(this.report_code == "6-102"){
				report_code = "물건상태불량";
			}else if(this.report_code == "6-103"){
				report_code = "너무오래걸림";
			}else if(this.report_code == "6-111"){
				report_code = "허위사실유포";
			}else if(this.report_code == "6-112"){
				report_code = "선정성/폭력성";
			}else if(this.report_code == "6-113"){
				report_code = "특정인비하";
			}
			tr.find("td").eq(3).text(report_code);
			
			var report_type = "";
			
			if(this.report_type == "6-011"){
				report_type = "배달신고";
			}else if(this.report_type == "6-012"){
				report_type = "타임라인신고";
			}else if(this.report_type == "6-013"){
				report_type = "댓글신고";
			}
			tr.find("td").eq(4).text(report_type);
			
			tr.find("td").eq(5).find("option:eq(2)").attr("selected", "selected");
			tr.find("td").eq(6).text(this.report_date);
		
			tr.find("td").eq(7).find("button").attr("report_no", this.report_no);
				
			$("#cancelReportTable > #cancelReportTableTbody").prepend(tr);
		});
	});
}
</script>
<script>
$(function(){
	reportList();
	acceptReportList();
	cancelReportList();
	$("#reportTableTbody, #acceptReportTableTbody, #cancelReportTableTbody").on("click", ".btnModify", function(){
		console.log("클릭클릭");
		var report_no = parseInt($(this).attr("report_no"));
		var report_state = $(this).parent().prev().prev().find(":selected").val();
		var sendData = {
			"report_no"	:	report_no,
			"report_state":	report_state
		};
		var url = "/admin/updateReportState"
		$.post(url, sendData, function(data){
			if(data =="success"){
				location.reload();

			}
		});
	});
});
</script>
</html>