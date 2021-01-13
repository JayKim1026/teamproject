<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp"%>
<%@include file="../css/timeline.css"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

$(function(){
	var time_no = "${timelineVo.time_no}";
	var account_no;
	if("${userVo.user_no}" != "") {
		account_no = "${userVo.user_no}";
	} else if("${deliverVo.dlvr_no}" != ""){
		account_no = "${deliverVo.dlvr_no}";
	}
	
	/* Show CommentList */
	$("#showComment").click(function(){
		$(this).hide();
		$("#closeComment").show();
		var time_no = ${timelineVo.time_no};
		var url = "/comment/getCommentList/" + time_no;
		$.get(url, function(data){
			$("#newCommentList").empty();
			$.each(data, function(index, comment){
				var div = $(".commentListNew").eq(0).clone();
				div.find("img").attr("src", "${image_url}"+this.writer_img);
				div.find(".commenter-name").text(this.writer_name);
				div.find(".comment-date").text(this.c_date);
				div.find(".comment").text(this.c_content);
				if(parseInt("${userVo.user_no}") == this.writer_no){
					div.find(".btnUpdate").attr("data-no", this.c_no);
					div.find(".btnUpdate").attr("data-content", this.c_content);
					div.find(".btnDelete").attr("data-no", this.c_no);
				}else{
					div.find(".btnUpdate").empty();
					div.find(".btnDelete").empty();
				}
				$("#newCommentList").append(div);
				$("#newCommentList").show();
			});
		});
		
	});
	/*// End of Show CommentList //*/
	
	/*댓글보기 댓글접기 버튼 변경*/
	$("#closeComment").click(function(){
		$(this).hide();
		$("#showComment").show();
		$("#newCommentList").hide();
	});
	/*// End of 댓글보기 댓글접기 버튼 변경 //*/
	
	/*Insert Comment*/
	$("#insertCommentBtn").click(function(){
		var time_no = "${timelineVo.time_no}";
		var user_id = "${userVo.user_id}";
		var c_content = $("#c_content").val();
		var writer_no = "${userVo.user_no}";
		console.log(time_no);
		console.log(user_id);
		console.log(c_content);
		console.log(writer_no);
		
		var url = "/comment/insertComment";
		var sendData = {
				"time_no"	:	time_no,
				"user_id"	:	user_id,
				"c_content" :	c_content,
				"writer_no"	:	writer_no
		};
		
		$.ajax({
			"url"		:	url,
			"headers" 	: {
				"Content-Type" : "application/json"
			},
			"method" 	:	"post",
			"dataType"  :	"text",
			"data" 		:	JSON.stringify(sendData),
			"success"	:	function(data){
				console.log(data);
				if(data == "success"){
					console.log("댓글 입력성공");
					$("#showComment").trigger("click");
					
					
				}
			}
		});
	});
	/*// End of Insert Comment //*/
	
	/*Modify Comment*/
	$(document).on("click", ".btnUpdate",function(){
		console.log("클릭되엇다!");
		var c_no = parseInt($(this).attr("data-no"));
		var c_content = $(this).attr("data-content");
		console.log(c_content);
		
		$("#Modal_c_no").val(c_no);
		$("#Modal_c_content").val(c_content);
		
		$("#commentModal").trigger("click");
	});
	/*// End of Modify Comment //*/
	
	/*Modify Comment Save*/
	
	$("#commentModalSave").click(function(){
		var url = "/comment/updateComment"
		var sendData = {
				"c_content"	:	$("#Modal_c_content").val(),
				"c_no"		:	parseInt($("#Modal_c_no").val())
		};
		$.ajax({
			"url"		:	url,
			"headers"	:	{
		"Content-Type"	:	"application/json"
							},
			"dataType"	:	"text",
			"data"		:	JSON.stringify(sendData),
			"method"	:	"post",
			"success"	:	function(data){
				console.log(data);
				if(data =="success"){
					$("#commentModalCancel").trigger("click");
					console.log("댓글 수정 성공");
					$("#showComment").trigger("click");
				}
			}
		});
	});
	/*// End of Modify Comment Save //*/
	
	/* Delete Comment */
	$(document).on("click",".btnDelete" ,function(){
		var c_no = parseInt($(this).attr("data-no"));
		console.log(c_no);
		console.log("클릭클릭삭제클릭");
		var url = "/comment/deleteComment/" + c_no;
		$.get(url, function(data){
			console.log(data);
			if(data == "success"){
				console.log("삭제성공");
				$("#showComment").trigger("click");
			}
		});
		
	});
	/*// End of Delete Comment //*/
	
	/* Insert Like, Delete Like */
	$("#like").click(function(){
		console.log("라이크클릭");
		var that = $(this);
		var has = $(this).hasClass("red-color");
		var url = "";
		
		if(has){
			url = "/like/deleteLike/";
		}else{
			url = "/like/insertLike/";
		}
		url += time_no + "/" + account_no;
		/*far 빈하트 fas 꽉 찬 하트*/
		console.log(url);
		$.get(url, function(data){
			console.log(data);
			if(data == "insertLike_success"){
				that.removeClass("far");
				that.addClass("fas");
				that.addClass("red-color");
			} else if(data == "deleteLike_success") {
				that.removeClass("fas");
				that.addClass("far");
				that.removeClass("red-color");
			}
		});
		
	});		
});
</script>
<body>
	userVO:${sessionScope.userVo}
	timelineVo:${timelineVo}
<%@include file="../include/timelineHeader.jsp"%>
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6" id="house">
						<div>
							<div class="d-flex justify-content-center">

								<div class="card_output">
									<div class="row d-flex">
										<div class="">
											<img class="profile-pic"
												src="${image_url}${timelineVo.writer_img}">
										</div>
										<div class="d-flex flex-column">
											<h3 class="mt-2 mb-0">${timelineVo.writer_name}</h3>
											<div class="output-stars" style="padding-top: 10px;">
												<c:if test='${timelineVo.time_state == "2-002"}'>
													<c:if test="${timelineVo.time_star == 5}">
														<p class="text-left" id="five-stars-p">
															<span class="text-muted">5</span> <span
																class="fa fa-star star-active ml-3"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span>
														</p>
													</c:if>
													<!-- 별 네개 -->
													<c:if test="${timelineVo.time_star == 4}">
														<p class="text-left" id="four-stars-p">
															<span class="text-muted">4</span> <span
																class="fa fa-star star-active ml-3"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-inactive"></span>
														</p>
													</c:if>

													<!-- 별 세개 -->
													<c:if test="${timelineVo.time_star == 3}">
														<p class="text-left" id="three-stars-p">
															<span class="text-muted">3</span> <span
																class="fa fa-star star-active ml-3"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-active"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span>
														</p>
													</c:if>

													<!-- 별 두개 -->
													<c:if test="${timelineVo.time_star == 2}">
														<p class="text-left" id="two-stars-p">
															<span class="text-muted">2</span> <span
																class="fa fa-star star-active ml-3"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span>
														</p>
													</c:if>

													<!-- 별 한개 -->
													<c:if test="${timelineVo.time_star == 1}">
														<p class="text-left" id="one-stars-p">
															<span class="text-muted">1</span> <span
																class="fa fa-star star-active ml-3"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span> <span
																class="fa fa-star star-inactive"></span>
														</p>
													</c:if>
												</c:if>
											</div>
										</div>
										<c:if test="${timelineVo.time_location != null}">
											<p style="padding-top: 19px; color: gray;">님이</p>
											<p
												style="font-size: 16px; padding-left: 3px; padding-top: 19px; font-weight: bold;">${timelineVo.time_location}</p>
											<p style="padding-top: 19px; color: gray;">에 있습니다.</p>
										</c:if>
										<div class="ml-auto">
											<ul class="nav navbar-nav" style="float: right;">
												<li class="dropdown">
													<a href="#"class="dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
													<ul class="dropdown-menu" role="menu">
														<li><a class="btnUpdate" id="btnUpdateComment" onclick="">수정</a></li>
														<li><a class="btnDelete" id="btnDeleteComment">삭제</a></li>
														<li><a id="btnReport">신고</a></li>
													</ul>
												</li>
											</ul>
										</div>

									</div>
									<div class="text-left">
										<p class="content">${timelineVo.time_content}</p>
									</div>
									<div class="row text-left">
										<c:if test="${timelineVo.time_img != null}">
											<img class="pic" src="${image_url}${timelineVo.time_img}"
												style="width: 100px; height: 100px;"
												onclick="window.open(this.src)">
										</c:if>
									</div>
									
									<!-- 좋아요.. -->
									<div class="row text-left mt-4">
										<i
										<c:choose>
											<c:when test="${isLike == true}">
												class="fas fa-heart red-color"
											</c:when>
											<c:otherwise>
												class="far fa-heart"
											</c:otherwise>
										</c:choose>
										  style="font-size:30px;" id="like"></i>
										(<span>${timelineVo.time_like}</span>)
									</div>
									<!-- 좋아요 끝 -->
									
									<!-- 댓글보기 버튼 -->
									<div class="row mt-4" style="padding-bottom: 15px;">
										<a class="ml-auto showComment" id="showComment" data-no="${timelineVo.time_no}" data-id="${userVo.user_id}">댓글보기</a> 
										<a class="ml-auto closeComment" id="closeComment" style="display: none;" data-no="${timelineVo.time_no}">댓글접기</a>
									</div>
									<!-- 댓글보기 버튼 끝 -->
									
									<!-- 경계선 -->
									<div class="row"
										style="border-width: 1px; border-color: gray; border-style: solid; opacity: 0.5;">
									</div>
									<!-- 경계선 끝 -->
									
									<!-- 댓글작성-->
									<div class="row">
										<div class="col-md-10">
											<input class="mt-4 mb-3 form-control"
												placeholder="댓글을 작성해주세요" id="c_content"></input>
										</div>
										<div class="col-md-2">
											<button type="button"
												class="form-control mt-4 mb-3"
												style="background: #BFFBBE;" id="insertCommentBtn">작성</button>
										</div>
									</div>
									<!-- 댓글작성 끝-->
									
									<!-- 댓글보기 클론 참고용 -->
									<div class="row commentList"
										style="padding-top: 10px; display: none;" id="commentList">
										<div class="row commentListNew"
										style="padding-top: 10px;" id="commentListNew">
											<img class="commenter-image" alt="commenter_image">

											<div class="comment-content col-md-11">
												<div class="ml-auto">
												<ul class="nav navbar-nav" style="float: right;">
													<li class="dropdown"><a
														class="dropdown-toggle" data-toggle="dropdown"><span
															class="caret"></span></a>
														<ul class="dropdown-menu" role="menu">
																<li><a class="btnUpdate">수정</a></li>
																<li><a class="btnDelete">삭제</a></li>
															<li><a id="btnReport">신고</a></li>
														</ul>
												</ul>
											</div>
												<div class="commenter-head">
													<span class="commenter-name">이름</span> 
													<span class="comment-date"><i class="far fa-clock"></i>
													2days ago
													</span>
												</div>
												<div class="comment-body">
													<span class="comment">내용</span>
												</div>
												
												<div class="comment-footer">
													<a href="#" class="comment-action">답글</a>
												</div>
											</div>
										</div>
									</div>
									<!-- 댓글보기 클론 참고용 끝 -->
									
									<!-- 댓글 보기 -->
									<div id="newCommentList">
									
									</div>
									<!-- 댓글 보기 끝 -->
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
<!-- 댓글 수정 모달 -->

<div class="center">
<button data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary center-block" style="display:none;" id="commentModal">Click Me</button>
</div>


<!-- line modal -->
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h3 class="modal-title" id="lineModalLabel" style="text-align:center;">댓글 수정</h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
              <div class="form-group">
                <label for="exampleInputEmail1">내용</label>
                <input type="hidden" id="Modal_c_no">
                <input type="text" class="form-control" id="Modal_c_content">
              </div>
		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button" id="commentModalCancel" >취소</button>
				</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default btn-hover-green" role="button" id="commentModalSave">저장</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
</html>