<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 관리</title>
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
			                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">주문대기</a>
			                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">주문접수</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab2" data-toggle="tab" href="#nav-contact2" role="tab" aria-controls="nav-contact2" aria-selected="false">주문취소</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab3" data-toggle="tab" href="#nav-contact3" role="tab" aria-controls="nav-contact3" aria-selected="false">배달취소</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">배달완료</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
<!------------------------------------------------- 대기중 주문 목록  ------------------------------------------------->						
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<table style="display: none; table-layout: fixed;" id="waitingOrdertrTable">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 16%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 5%"></td>
										<td style="width: 8%">
											<select>
												<option value="3-001">주문대기</option>
												<option value="3-004">주문취소</option>
												<option value="3-005">배달취소</option>
												<option value="3-002">배달중</option>
												<option value="3-003">배달완료</option>
											</select>
										</td>
										<td style="width: 5%"><button type="button"
												class="btn btn-xs btn-warning btnModify">변경</button></td>
									</tr>
								</table>
		
								<table class="table" id="waitingOrderTable">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>요청사항</th>
											<th>주문일자</th>
											<th>배달원</th>
											<th>주문자</th>
											<th>종류</th>
											<th>현황</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="waitingOrderTableTbody">
		
									</tbody>
								</table>
								
							</div>
<!------------------------------------------------- 대기중 주문 목록 끝 ------------------------------------------------->							
							
<!------------------------------------------------- 배달중 주문 목록  ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<table style="display: none; table-layout: fixed;" id="acceptOrdertrTable">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 16%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 5%"></td>
										<td style="width: 8%">
											<select>
												<option value="3-001">주문대기</option>
												<option value="3-004">주문취소</option>
												<option value="3-005">배달취소</option>
												<option value="3-002">배달중</option>
												<option value="3-003">배달완료</option>
											</select>
										</td>
										<td style="width: 5%"><button type="button"
												class="btn btn-xs btn-warning btnModify">변경</button></td>
									</tr>
								</table>
		
								<table class="table" id="acceptOrderTable">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>요청사항</th>
											<th>주문일자</th>
											<th>배달원</th>
											<th>주문자</th>
											<th>종류</th>
											<th>현황</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="acceptOrderTableTbody">
		
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 배달중 주문 목록 끝 ------------------------------------------------->							

<!------------------------------------------------- 완료된 주문 목록  ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
								<table style="display: none; table-layout: fixed;" id="finishOrdertrTable">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 16%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 5%"></td>
										<td style="width: 8%">
											<select>
												<option value="3-001">주문대기</option>
												<option value="3-004">주문취소</option>
												<option value="3-005">배달취소</option>
												<option value="3-002">배달중</option>
												<option value="3-003">배달완료</option>
											</select>
										</td>
										<td style="width: 5%"><button type="button"
												class="btn btn-xs btn-warning btnModify">변경</button></td>
									</tr>
								</table>
		
								<table class="table" id="finishOrderTable">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>요청사항</th>
											<th>주문일자</th>
											<th>배달원</th>
											<th>주문자</th>
											<th>종류</th>
											<th>현황</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="finishOrderTableTbody">
									
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 완료된 주문 목록 끝 ------------------------------------------------->
							
<!------------------------------------------------- 사용자 취소 주문 목록  ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-contact2" role="tabpanel" aria-labelledby="nav-contact-tab2">
								<table style="display: none; table-layout: fixed;" id="cancelOrdertrTable">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 16%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 5%"></td>
										<td style="width: 8%">
											<select>
												<option value="3-001">주문대기</option>
												<option value="3-004">주문취소</option>
												<option value="3-005">배달취소</option>
												<option value="3-002">배달중</option>
												<option value="3-003">배달완료</option>
											</select>
										</td>
										<td style="width: 5%"><button type="button"
												class="btn btn-xs btn-warning btnModify">변경</button></td>
									</tr>
								</table>
		
								<table class="table" id="cancelOrderTable">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>요청사항</th>
											<th>주문일자</th>
											<th>배달원</th>
											<th>주문자</th>
											<th>종류</th>
											<th>현황</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="cancelOrderTableTbody">
									
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 사용자 취소 주문 목록 끝 ------------------------------------------------->

<!------------------------------------------------- 배달원 취소 주문 목록 ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-contact3" role="tabpanel" aria-labelledby="nav-contact-tab3">
								<table style="display: none; table-layout: fixed" id="cancelOrdertrTableByDeliver">
									<tr>
										<td style="width: 8%"></td>
										<td style="width: 16%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 5%"></td>
										<td style="width: 8%">
											<select>
												<option value="3-001">주문대기</option>
												<option value="3-004">주문취소</option>
												<option value="3-005">배달취소</option>
												<option value="3-002">배달중</option>
												<option value="3-003">배달완료</option>
											</select>
										</td>
										<td style="width: 5%"><button type="button"
												class="btn btn-xs btn-warning btnModify">변경</button></td>
									</tr>
								</table>
		
								<table class="table" id="cancelOrderTableByDeliver">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>요청사항</th>
											<th>주문일자</th>
											<th>배달원</th>
											<th>주문자</th>
											<th>종류</th>
											<th>현황</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="cancelOrderTableTbodyByDeliver">
									
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 배달원 취소 주문 목록 끝 ------------------------------------------------->							
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="/resources/js/adminOrderScript.js"></script>
</html>