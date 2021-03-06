<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
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
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<nav>
		                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
			                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">일반회원</a>
			                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">배달원</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">가입대기중</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        	<!-- 일반회원 clone table -->
								<table style="display: none; table-layout: fixed;" id="trTable">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 6%"></td>
										<td style="width: 10%"></td>
										<td style="width: 10%"></td>
										<td style="width: 12%"></td>
										<td style="width: 8%">
											<select>
												<option value="1-001">가입대기</option>
												<option value="1-002">가입완료</option>
												<option value="1-003">계정탈퇴</option>
												<option value="1-004">계정정지</option>
											</select>
										</td>
										<td style="width: 8%">
											<button type="button" class="btn btn-xs btn-danger btnMemberUpdate">변경</button>
										</td>
									</tr>
								</table>
		
							<!-- 일반회원  table -->
								<table class="table" id="memberTable">
									<thead>
										<tr>
											<th>회원번호</th>
											<th>ID</th>
											<th>이름</th>
											<th>휴대전화</th>
											<th>EMAIL</th>
											<th>계정상태</th>
											<th>상태변경</th>
										</tr>
									</thead>
									<tbody id="memberTableTbody">
		
									</tbody>
								</table>
								
							</div>
							
							<!-- 라이더회원 clone table -->
							<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<table style="display: none; table-layout: fixed;" id="trTableDeliver">
									<tr>
										<td style="width: 10%"></td>
										<td style="width: 6%"></td>
										<td style="width: 10%"></td>
										<td style="width: 10%"></td>
										<td style="width: 12%"></td>
										<td style="width: 8%">
											<select>
												<option value="1-001">가입대기</option>
												<option value="1-002">가입완료</option>
												<option value="1-003">계정탈퇴</option>
												<option value="1-004">계정정지</option>
											</select>
										</td>
										<td style="width: 8%"><button type="button" class="btn btn-xs btn-danger btnDeliverUpdate">변경</button></td>
									</tr>
								</table>
		
							<!-- 라이더 회원 table  -->
								<table class="table" id="deliverTable">
									<thead>
										<tr>
											<th>배달원번호</th>
											<th>ID</th>
											<th>이름</th>
											<th>휴대전화</th>
											<th>EMAIL</th>
											<th>계정상태</th>
											<th>상태변경</th>
										</tr>
									</thead>
									<tbody id="deliverTableTbody">
		
									</tbody>
								</table>
							</div>
							
							<!-- 가입 대기중 라이더 회원 clone table  -->
							<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
								<table style="display: none; table-layout: fixed;" id="trTableWaitingDeliver">
									<tr>
										<td style="width: 10%"></td>
										<td style="width: 6%"></td>
										<td style="width: 10%"></td>
										<td style="width: 10%"></td>
										<td style="width: 12%"></td>
										<td style="width: 8%">
											<select>
												<option value="1-001">가입대기</option>
												<option value="1-002">가입완료</option>
												<option value="1-003">계정탈퇴</option>
												<option value="1-004">계정정지</option>
											</select>
										</td>
										<td style="width: 8%"><button type="button" class="btn btn-xs btn-danger btnWaitingDeliverUpdate">변경</button></td>
									</tr>
								</table>
		
								<!-- 가입 대기중 라이더 회원 table -->
								<table class="table" id="waitingDeliverTable">
									<thead>
										<tr>
											<th>배달원번호</th>
											<th>ID</th>
											<th>이름</th>
											<th>휴대전화</th>
											<th>EMAIL</th>
											<th>계정상태</th>
											<th>상태변경</th>
										</tr>
									</thead>
									<tbody id="waitingDeliverTableTbody">
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/editMemberScript.js"></script>
</html>