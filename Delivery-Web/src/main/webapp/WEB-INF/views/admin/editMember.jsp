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
			                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">일반회원</a>
			                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">배달원</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">가입대기중</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<table style="display: none;" id="trTable">
									<tr>
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
							
							<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<table style="display: none;" id="trTableDeliver">
									<tr>
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
		
								<table class="table" id="deliverTable">
									<thead>
										<tr>
											<th>배달원번호</th>
											<th>ID</th>
											<th>이름</th>
											<th>휴대전화</th>
											<th>EMAIL</th>
											<th>계정상태</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody id="deliverTableTbody">
		
									</tbody>
								</table>
							</div>
							
							<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
								<table style="display: none;" id="trTableWaitingDeliver">
									<tr>
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
		
								<table class="table" id="watingDeliverTable">
									<thead>
										<tr>
											<th>배달원번호</th>
											<th>ID</th>
											<th>이름</th>
											<th>휴대전화</th>
											<th>EMAIL</th>
											<th>계정상태</th>
											<th>#</th>
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
<script>
function getMemberList() {
	var url = "/admin/getMemberList"
	$.post(url, function(data) {
		$("#memberTable > #memberTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#trTable").find("tr").clone();
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
function getDeliverList(){
	var url = "/admin/getDeliverList"
	$.post(url, function(data){
		$("#deliverTable > #deliverTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#trTableDeliver").find("tr").clone();
			tr.find("td").eq(0).text(this.dlvr_no);
			tr.find("td").eq(1).text(this.dlvr_id);
			tr.find("td").eq(2).text(this.dlvr_name);
			tr.find("td").eq(3).text(this.dlvr_phone);
			tr.find("td").eq(4).text(this.dlvr_email);
			tr.find("td").eq(5).text(this.dlvr_state);
			tr.find("td").eq(6).find("button").attr("dlvr_no", this.dlvr_no);
			tr.find("td").eq(7).find("button").attr("dlvr_no", this.dlvr_no);
				
			$("#deliverTable > #deliverTableTbody").prepend(tr);
		});
	});
}

function getWaitingDeliverList(){
	var url = "/admin/getWaitingDeliverList"
	$.post(url, function(data){
		$("#watingDeliverTable > #waitingDeliverTableTbody").empty();
		$.each(data, function() {
			var tr = $("#trTableWaitingDeliver").find("tr").clone();
			tr.find("td").eq(0).text(this.dlvr_no);
			tr.find("td").eq(1).text(this.dlvr_id);
			tr.find("td").eq(2).text(this.dlvr_name);
			tr.find("td").eq(3).text(this.dlvr_phone);
			tr.find("td").eq(4).text(this.dlvr_email);
			tr.find("td").eq(5).text(this.dlvr_state);
			tr.find("td").eq(6).find("button").attr("dlvr_no", this.dlvr_no);
			tr.find("td").eq(7).find("button").attr("dlvr_no", this.dlvr_no);
				
			$("#watingDeliverTable > #waitingDeliverTableTbody").prepend(tr);
		});	
	});
}
$(function() {
	getMemberList()
	getDeliverList()
	getWaitingDeliverList()
	
	$("#memberTableTbody").on("click", ".btnMemberModify", function(){
		var user_no = parseInt($(this).attr("user_no"));
		console.log(user_no);
		location.href = "/admin/memberInfoForm?user_no=" + user_no
		
	});
});
</script>
</html>