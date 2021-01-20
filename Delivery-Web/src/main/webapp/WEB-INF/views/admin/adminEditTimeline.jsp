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
			                    <a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">일반글</a>
			                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">리뷰</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">공지</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
<!------------------------------------------------- 일반글 ------------------------------------------------->						
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<table style="display: none;" id="posttrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnDelete">삭제</button></td>
									</tr>
								</table>
		
								<table class="table" id="postTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>내용</th>
											<th>게시일</th>
											<th>작성자</th>
											<th>첨부사진</th>
											<th>위치</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="postTableTbody">
		
									</tbody>
								</table>
								
							</div>
<!------------------------------------------------- 일반글 끝 ------------------------------------------------->							
							
<!------------------------------------------------- 리뷰  ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<table style="display: none;" id="reviewtrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnDelete">삭제</button></td>
									</tr>
								</table>
		
								<table class="table" id="reviewTable">
									<thead>
										<tr>
											<th>번호</th>
											<th>내용</th>
											<th>게시일</th>
											<th>작성자</th>
											<th>첨부사진</th>
											<th>주문번호</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="reviewTableTbody">
		
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 리뷰 끝 ------------------------------------------------->							

<!------------------------------------------------- 공지 ------------------------------------------------->							
							<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
								<table style="display: none;" id="noticetrTable">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><button type="button"
												class="btn btn-xs btn-warning btnDelete">삭제</button></td>
									</tr>
								</table>
		
								<table class="table" id="noticeTable">
									<thead>
										<tr>
											<th>글번호</th>
											<th>내용</th>
											<th>게시일</th>
											<th>작성자</th>
											<th>/</th>
										</tr>
									</thead>
									<tbody id="noticeTableTbody">
									
									</tbody>
								</table>
							</div>
<!------------------------------------------------- 공지 끝 ------------------------------------------------->
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
function getPostList() {
	var url = "/admin/getPostList"
	$.post(url, function(data) {
		console.log("일반글:"+data);
		$("#postTable > #postTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#posttrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			var isImg = "";
			if(this.time_img != null){
				isImg = "O";
			}else{
				isImg = "X";
			}
			tr.find("td").eq(4).text(isImg);
			tr.find("td").eq(5).text(this.time_location);
			tr.find("td").eq(6).find("button").attr("time_no", this.time_no);
				
			$("#postTable > #postTableTbody").prepend(tr);
		});
	});
}
function getReviewList(){
	var url = "/admin/getReviewList"
	$.post(url, function(data){
		console.log("리뷰:" + data);
		$("#reviewTable > #reviewTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#reviewtrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			var isImg = "";
			if(this.time_img != null){
				isImg = "O";
			}else{
				isImg = "X";
			}
			tr.find("td").eq(4).text(isImg);
			
			if(this.order_no == "0"){
				tr.find("td").eq(5).text("");
			}else{
				tr.find("td").eq(5).text(this.order_no);
			}
			tr.find("td").eq(6).find("button").attr("time_no", this.time_no);
				
			$("#reviewTable > #reviewTableTbody").prepend(tr);
		});
	});
}

function getNoticeList(){
	var url = "/admin/getNoticeList"
	$.post(url, function(data){
		console.log("공지:"+data);
		$("#noticeTable > #noticeTableTbody").empty();
		$.each(data, function() {
			var tr = $("#noticetrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			tr.find("td").eq(7).find("button").attr("time_no", this.time_no);
				
			$("#noticeTable > #noticeTableTbody").prepend(tr);
		});	
	});
}

$(function() {
	getPostList()
	getReviewList()
	getNoticeList()

	
$("#postTableTbody, #reviewTableTbody, #noticeTableTbody").on("click", ".btnDelete", function(){
		
	var time_no = parseInt($(this).attr("time_no"));
	console.log(time_no);
	var sendData = {
		"time_no"	:	time_no,
	};
	var url = "/admin/deleteArticle";
		
	$.post(url, sendData, function(data){
		if(data =="success"){
			location.reload();
		}
	});
});
	
});

</script>
</html>