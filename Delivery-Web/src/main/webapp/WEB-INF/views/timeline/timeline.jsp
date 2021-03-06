<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/link.jsp" %>
<link rel="stylesheet" href="/resources/css/timeline.css">
<title>타임라인 페이지</title>
</head>
<script type="text/javascript">
// 세션, 모델 변수 가져오기
var image_url = "${image_url}";
var account_no;
var account_state;
if("${userVo.user_no}" != "") {
	account_no = parseInt("${userVo.user_no}");
	account_state = "${userVo.account_state}";
} else if("${deliverVo.dlvr_no}" != "") {
	account_no = parseInt("${deliverVo.dlvr_no}");
	account_state = "${deliverVo.dlvr_no}";
}
console.log("account_no : " + account_no);
</script>
<script src="/resources/js/timelineScript.js" charset="UTF-8"></script>
<body>
<%@ include file="../include/timelineHeader.jsp" %>
<!------------------------------------- 글 입력 ------------------------------------->
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6">
					<form enctype="multipart/form-data" method="post" id="frmData">
						<div class="form-group">
							<!-- 유저번호  -->
							
							<div class="px-4 py-5 mx-auto">
								<div class="d-flex justify-content-center">
									<div class="card_writeform">
										<div class="row px-3">
											<c:choose>
												<c:when test="${userVo != null}">
													<img class="profile-pic mr-3" src="${image_url}${userVo.user_img}">
												</c:when>
												<c:when test="${deliverVo != null}">
													<img class="profile-pic mr-3" src="${image_url}${deliverVo.dlvr_img}">
												</c:when>
											</c:choose>
											<div class="flex-column">
												<h3 class="mb-0 font-weight-normal">${userVo.user_name}</h3>
												<select id="category" name="privacy" class="privacy">
													<option value="2-003">일반</option>
													<option value="2-002">배달후기</option>
												</select>
											</div>
											<i class="fas fa-map-marker-alt" id="write-map-marker"></i>
											<h5 id="time_location" style="padding-left:6px; padding-top:3px;"></h5>
										</div>
										<div class="rating" style="display:none;">
											<input type="radio" name="rating" value="5" id="5"> 
											<label for="5">☆</label> 
											<input type="radio" name="rating" value="4" id="4"> 
											<label for="4">☆</label> 
											<input type="radio" name="rating" value="3" id="3"> 
											<label for="3">☆</label> 
											<input type="radio" name="rating" value="2" id="2"> 
											<label for="2">☆</label> 
											<input type="radio" name="rating" value="1" id="1"> 
											<label for="1">☆</label>
											<input type="radio" name="rating" value="0" id="noValueRating">
										</div>
										
										<div class="row px-3 form-group">
										
											<input type="hidden" value="${userVo.user_no}" id="user_no" name="user_no">
											<textarea id="time_content" name="time_content"
												class="text-muted bg-light mt-4 mb-3"
												placeholder="안녕하세요 오늘은 무슨 생각을 하고있나요?"></textarea>
											<img src="#" id="imgPreview" style="width:60px; height:60px; display:none;">
											<i class="fas fa-times" id="deleteImg" style="display:none;"></i>
										</div>
										<div class="row px-3 form-group">
											<p class="fa fa-user options mb-0 mr-4"></p>
											<p class="fa fa-map-marker options mb-0 mr-4" id="map_marker"></p>
											<label class="fa fa-image options mb-0 mr-4" for="time_img"></label>
											<input type="file" class="form-control-file" id="time_img" name="time_img" style="display:none" />
											
<!-- 											<div id="divUploaded" style="padding-left:40px;"> -->
<!-- 												<img height="25" src="/resources/images/default.png"/> -->
<!-- 											</div> -->
											<div class="btn btn-success ml-auto" id="btnInsert">글쓰기</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</form>	
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
<!-------------------------------------// 글 입력  끝------------------------------------->
	
<!------------------------------------- 글 출력 ------------------------------------->
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6" id="house">
						
						
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
<!-------------------------------------// 글 출력  끝------------------------------------->

<!------------------------------------- 수정 모달 ------------------------------------->	
<button data-toggle="modal" data-target="#squarespaceModal"class="btn btn-primary center-block" id="btnUpdateModal" style="display:none;">Click Me</button>
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<input type="hidden" name="time_no">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="lineModalLabel">수정</h3>
			</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<textarea class="form-control" id="time_content_update" placeholder="당신의 생각을 공유해주세요!"></textarea>
						</div>
					</form>

				</div>
				
			<div class="modal-footer">
				<div class="btn-group btn-group-justified" role="group" aria-label="group button">
					<div class="btn-group" role="group">
						<button type="button" id="btnUpdateClose"class="btn btn-default" data-dismiss="modal" role="button">닫기</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" id="btnUpdateSave" class="btn btn-default btn-hover-green" role="button">완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!------------------------------------- 수정 모달 끝 ------------------------------------->	

<!------------------------------------- 글 출력 클론------------------------------------->	
	<div id="forclone" style="display:none;">
		<div class="d-flex justify-content-center">
			<div class="card_output">
				<div class="row d-flex">
					<div class="">
						<!-- 작성자 이미지 -->
						<img class="writer_img profile-pic" src="https://i.imgur.com/V3ICjlm.jpg" id="profile-pic-output-clone">
					</div>
					<div class="d-flex flex-column">
						<h3 class="mt-2 mb-0 writer_name"></h3>
						<div class="output-stars-clone">
							<p class="text-left pclass" id="five-stars-p-clone">
								<span class="text-muted">5</span> 
								<span class="fa fa-star star-active ml-3" id="star1"></span> 
								<span class="fa fa-star star-active" id="star2"></span> 
								<span class="fa fa-star star-active" id="star3"></span> 
								<span class="fa fa-star star-active" id="star4"></span> 
								<span class="fa fa-star star-active" id="star5"></span>
							</p>
						</div>
					</div>
						<p style="padding-top:19px; color:gray;">님이</p>
						<p class="time_location" style="font-size: 16px; padding-left:3px; padding-top:19px; font-weight:bold; ">위치</p>
						<p style="padding-top:19px; color:gray;">에 있습니다.</p>
					<div class="ml-auto">
						<ul class="nav navbar-nav" style="float: right;">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"><span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a class="btnUpdate">수정</a></li>
									<li><a class="btnDelete">삭제</a></li>
									<li><a class="btnReport">신고</a></li>
								</ul>
						</ul>
						<p class="text-muted time_date" style="padding-right:30px; ">날짜</p>
					</div>
				</div>
				<div class="text-left">
					<p class="time_content"></p>
				</div>
				<div class="row text-left">
					<img class="time_img" src="#" style="display:none; width:100px; height:100px;">
				</div>
				<div class="row text-left mt-4">
					<div class="like mr-3 vote">
						<i class="fas fa-heart isLike" style="font-size: 25px"></i>
						<span class="pl-2 time_like"></span>
					</div>
				</div>
				
				<!-- 댓글보기 버튼 -->
				<div class="row mt-4" style= "padding-bottom:15px;">
					<a class="ml-auto showComment">댓글 보기</a>
				</div>
				
				<!-- 경계선 -->
				<div class="row" style="border-width: 1px; border-color:gray; border-style:solid; opacity:0.5;">
				</div>
				
				<!-- 댓글작성-->
				<div class="row">
					<div class="col-md-10">
						<input class="mt-4 mb-3 form-control" placeholder="댓글을 작성해주세요"></input>
					</div>
					<div class="col-md-2">
						<button type="button" class="form-control mt-4 mb-3 insertCommentBtn" style="background:#BFFBBE;">작성</button>
					</div>
				</div>
				
				<!-- 댓글보기 -->
				<div class="commentList" style="padding-top:10px; " data-no="" id="commentList">
				</div>
			</div>
		</div>
	</div>

	<!--------------------------// 글 출력 클론  -------------------------->
	
<!------------------------------------- 댓글 클론 ------------------------------------->	
	<div id="commentClone" style="display: none">
		<div class="row commentInfo" style="padding-top:10px;">
			<img src="https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg"  class="commenter-image" alt="commenter_image">			
			<div class="comment col-md-8">
				<div class="commenter-head">
					<span class="commenter-name"><a class="writer-name">김범준</a></span> 
					<span class="comment-date"><i class="far fa-clock"></i>댓글날짜</span>
				</div>
				<div class="comment-body">
					<span class="comment comment-content">댓글내용</span>
					<input type="text" class="comment comment-update" style="display: none"/>
				</div>
				<div class="comment-footer">
					<a class="comment-action"></a>
				</div>
			</div>
			<div class="comment-button">
				<button class="btn btn-primary btnUpdateCommentOk" style="display: none">완료</button>
				<button class="btn btn-primary btnCancelUpdateComment" style="display: none">취소</button>
				<ul class="nav navbar-nav" style="float: right;">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a class="btnUpdateComment">수정</a></li>
							<li><a class="btnDeleteComment">삭제</a></li>
							<li><a class="btnReportComment">신고</a></li>
						</ul>
				</ul>
			</div>
		</div>
	</div>
<!------------------------------------- 댓글 클론 끝 ------------------------------------->	
	
<!------------------------------------- 신고 모달------------------------------------->	
	<div class="timelineModal_report">
		<div class="timelineModal_content">
			<form action="/report/report" method="post">
				<label><strong>신고하기</strong></label>
				<ul class="timelineModal_ul">
					<li><input type="radio" name="timelineReportCode" value="6-111" checked/><span class="Modal_span">원치 않는 상업성 콘텐츠 또는 허위사실유포</span></li>
					<li><input type="radio" name="timelineReportCode" value="6-112" /><span class="Modal_span">포르노 또는 음란물</span></li>
					<li><input type="radio" name="timelineReportCode" value="6-113" /><span class="Modal_span">노골적인 희롱 또는 폭력</span></li>
					<li>
						<div class="timelineModal_btns">
							<button type="submit" class="btn btn-danger btnTimelineReportRun" >확인</button>
							<button type="button" class="btn btn-info btnTimelineReportCancel">취소</button>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
<!------------------------------------- 신고 모달 끝------------------------------------->		
<%@include file="../include/footer.jsp" %>
</body>
</html>