<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인 정보 관리</title>
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
			                    <a class="nav-item nav-link" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">일반글</a>
			                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">리뷰</a>
			                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">공지</a>
		                    </div>
	                    </nav>
						<div class="tab-content" id="nav-tabContent">
<!------------------------------------------------- 일반글 ------------------------------------------------->						
                        	<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<table style="display: none; table-layout: fixed;" id="posttrTable">
									<tr>
										<td style="width: 5%"></td>
										<td style="width: 30%"></td>
										<td style="width: 10%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 6%">
											<button type="button" class="btn btn-xs btn-warning btnDelete">삭제</button>
										</td>
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
								<table style="display: none; table-layout: fixed;" id="reviewtrTable">
									<tr>
										<td style="width: 5%"></td>
										<td style="width: 30%"></td>
										<td style="width: 10%"></td>
										<td style="width: 10%"></td>
										<td style="width: 8%"></td>
										<td style="width: 8%"></td>
										<td style="width: 6%">
											<button type="button" class="btn btn-xs btn-warning btnDelete">삭제</button>
										</td>
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
<script src="/resources/js/adminTimelineScript.js"></script>
</html>