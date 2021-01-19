<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/link.jsp"%>
<%@include file="../css/adminHeader.css"%>
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
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">주문완료</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
<!------------------------------------------------- 대기중 주문 목록  ------------------------------------------------->						
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<table style="display: none;" id="waitingOrdertrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnMemberModify">수정</button></td>
										<td><button type="button"
												class="btn btn-xs btn-danger btnMemberDelete">삭제</button></td>
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
								<table style="display: none;" id="acceptOrdertrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnDeliverModify">수정</button></td>
										<td><button type="button"
												class="btn btn-xs btn-danger btnDeliverDelete">삭제</button></td>
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
								<table style="display: none;" id="finishOrdertrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
										<select>
										<option>주문취소</option>
										<option>주문대기</option>
										</select>
										</td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnModify">수정</button></td>
										<td><button type="button"
												class="btn btn-xs btn-danger btnDelete">삭제</button></td>
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
								<table style="display: none;" id="cancelOrdertrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnWaitingDeliverModify">수정</button></td>
										<td><button type="button"
												class="btn btn-xs btn-danger btnWaitingDeliverDelete">삭제</button></td>
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
								<table style="display: none;" id="cancelOrdertrTableByDeliver">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnWaitingDeliverModify">수정</button></td>
										<td><button type="button"
												class="btn btn-xs btn-danger btnWaitingDeliverDelete">삭제</button></td>
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
<!------------------------------------------------- 수정 모달 ------------------------------------------------->
<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					 <a id="modal-881374" href="#modal-container-881374" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
					
					<div class="modal fade" id="modal-container-881374" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="myModalLabel">
										Modal title
									</h5> 
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									...
								</div>
								<div class="modal-footer">
									 
									<button type="button" class="btn btn-primary">
										Save changes
									</button> 
									<button type="button" class="btn btn-secondary" data-dismiss="modal">
										Close
									</button>
								</div>
							</div>
							
						</div>
						
					</div>
					
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
<!------------------------------------------------- 수정 모달 끝------------------------------------------------->
</body>
<script>
function getWaitingOrderList() {
	var url = "/admin/getWaitingOrderList"
	$.post(url, function(data) {
		console.log("주문대기:"+data);
		$("#waitingOrderTable > #waitingOrderTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#waitingOrdertrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.order_no);
			tr.find("td").eq(1).text(this.order_req);
			tr.find("td").eq(2).text(this.order_date);
			tr.find("td").eq(3).text("배정안됨");
			tr.find("td").eq(4).text(this.user_name);
			var order_ca = "";
			if(this.order_ca == "3-011"){
				order_ca = "사무용품";
			}else if(this.order_ca == "3-012"){
				order_ca = "음식";
			}else if(this.order_ca == "3-013"){
				order_ca = "기타";
			}
			tr.find("td").eq(5).text(order_ca);
			
			if(this.order_state = "3-001"){
				tr.find("td").eq(6).text("대기");
			}
			
			tr.find("td").eq(7).find("button").attr("order_no", this.order_no);
			tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
				
			$("#waitingOrderTable > #waitingOrderTableTbody").prepend(tr);
		});
	});
}
function getAcceptOrderList(){
	var url = "/admin/getAcceptOrderList"
	$.post(url, function(data){
		$("#acceptOrderTable > #acceptOrderTableTbody").empty();
		console.log("접수주문:" + data);
		$.each(data, function() {
				
			var tr = $("#acceptOrdertrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.order_no);
			tr.find("td").eq(1).text(this.order_req);
			tr.find("td").eq(2).text(this.order_date);
			tr.find("td").eq(3).text(this.dlvr_name);
			tr.find("td").eq(4).text(this.user_name);
			var order_ca = "";
			if(this.order_ca == "3-011"){
				order_ca = "사무용품";
			}else if(this.order_ca == "3-012"){
				order_ca = "음식";
			}else if(this.order_ca == "3-013"){
				order_ca = "기타";
			}
			tr.find("td").eq(5).text(order_ca);
			
			if(this.order_state = "3-002"){
				tr.find("td").eq(6).text("배송중");
			}
			tr.find("td").eq(7).find("button").attr("order_no", this.order_no);
			tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
				
			$("#acceptOrderTable > #acceptOrderTableTbody").prepend(tr);
		});
	});
}

function getFinishOrderList(){
	var url = "/admin/getFinishOrderList"
	$.post(url, function(data){
		console.log("주문완료:"+data);
		$("#finishOrderTable > #finishOrderTableTbody").empty();
		$.each(data, function() {
			var tr = $("#finishOrdertrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.order_no);
			tr.find("td").eq(1).text(this.order_req);
			tr.find("td").eq(2).text(this.order_date);
			tr.find("td").eq(3).text(this.dlvr_name);
			tr.find("td").eq(4).text(this.user_name);
			var order_ca = "";
			if(this.order_ca == "3-011"){
				order_ca = "사무용품";
			}else if(this.order_ca == "3-012"){
				order_ca = "음식";
			}else if(this.order_ca == "3-013"){
				order_ca = "기타";
			}
			tr.find("td").eq(5).text(order_ca);
			
// 			if(this.order_state = "3-003"){
// 				tr.find("td").eq(6).text("완료");
// 			}
			tr.find("td").eq(7).find("button").attr("order_no", this.order_no);
			tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
				
			$("#finishOrderTable > #finishOrderTableTbody").prepend(tr);
		});	
	});
}

function getCancelOrderList(){
	var url = "/admin/getCancelOrderList"
		$.post(url, function(data){
			console.log("사용자 주문 취소:"+data);
			$("#cancelOrderTable > #cancelOrderTableTbody").empty();
			$.each(data, function() {
				var tr = $("#cancelOrdertrTable").find("tr").clone();
				tr.find("td").eq(0).text(this.order_no);
				tr.find("td").eq(1).text(this.order_req);
				tr.find("td").eq(2).text(this.order_date);
				tr.find("td").eq(3).text(this.dlvr_name);
				tr.find("td").eq(4).text(this.user_name);
				var order_ca = "";
				if(this.order_ca == "3-011"){
					order_ca = "사무용품";
				}else if(this.order_ca == "3-012"){
					order_ca = "음식";
				}else if(this.order_ca == "3-013"){
					order_ca = "기타";
				}
				tr.find("td").eq(5).text(order_ca);
				
				if(this.order_state = "3-004"){
					tr.find("td").eq(6).text("주문취소");
				}
				tr.find("td").eq(7).find("button").attr("order_no", this.order_no);
				tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
					
				$("#cancelOrderTable > #cancelOrderTableTbody").prepend(tr);
			});	
		});
}

function  getCancelOrderListByDeliver(){
	var url = "/admin/getCancelOrderListByDeliver"
		$.post(url, function(data){
			console.log("배달원 주문 취소:"+data);
			$("#cancelOrderTableByDeliver > #cancelOrderTableTbodyByDeliver").empty();
			$.each(data, function() {
				var tr = $("#cancelOrdertrTableByDeliver").find("tr").clone();
				tr.find("td").eq(0).text(this.order_no);
				tr.find("td").eq(1).text(this.order_req);
				tr.find("td").eq(2).text(this.order_date);
				tr.find("td").eq(3).text(this.dlvr_name);
				tr.find("td").eq(4).text(this.user_name);
				var order_ca = "";
				if(this.order_ca == "3-011"){
					order_ca = "사무용품";
				}else if(this.order_ca == "3-012"){
					order_ca = "음식";
				}else if(this.order_ca == "3-013"){
					order_ca = "기타";
				}
				tr.find("td").eq(5).text(order_ca);
				
				if(this.order_state = "3-005"){
					tr.find("td").eq(6).text("배달취소");
				}
				tr.find("td").eq(7).find("button").attr("order_no", this.order_no);
				tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
					
				$("#cancelOrderTableByDeliver > #cancelOrderTableTbodyByDeliver").prepend(tr);
			});	
		});
}

$(function() {
	getWaitingOrderList()
	getAcceptOrderList()
	getFinishOrderList()
	getCancelOrderList()
	getCancelOrderListByDeliver()
	
	$("#finishOrderTableTbody").on("click", ".btnModify", function(){
		console.log("클릭클릭");
		console.log($(this).attr("order_no"));
		
		
		
		$("#modal-881374").trigger("click");
		
		
	});
});

</script>
</html>