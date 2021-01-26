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
<script src="/resources/js/reportScript.js"></script>
</html>