<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp" %>
<%@include file="../css/timeline.css" %>
<meta charset="UTF-8">
<title>timeLine.jsp</title>
</head>
<script>
$(function(){
	
$("#btnInsert").click(function(e){
	console.log("클릭");
	
	var formData = new FormData();
	var f_timeline_img = $("input[type=file]")[0].files[0];
	var time_content = $("#time_content").val();
	var writer_name = "${userVo.user_name}";
	var writer_state = "2-012";
	formData.append("f_timeline_img", f_timeline_img);
	formData.append("time_content", time_content);
	formData.append("writer_no", writer_name);
	formData.append("writer_state", writer_state);
	$.ajax({
		"processData"	:	false,
		"contentType"	:	false,
		"type"			:	"post",
		"url"			:	"/timeline/insertArticle",
		"data"			:	formData, 
		"success"		:	function(data) {
			console.log(data);
<<<<<<< HEAD
			if(data != null){
				
			var clone1 = $("#forclone").clone();
			clone1.find("h3").text("${userVo.user_name}");
			clone1.find(".content").text("${review_content}");
			$("#house").prepend(clone1).hide().fadeIn(1000);
			$("#review_content").val("");
			$("#review_img").val("");
			} else if(data == "fail"){
=======
			if(data == "insertArticle_success"){
				var clone1 = $("#forclone").clone();
				clone1.find("h3").text(writer_name);
				clone1.find(".content").text(time_content);
				$("#house").prepend(clone1).hide().fadeIn(1000);
				$("#timeline_content").val("");
				$("#timeline_img").val("");
			} else if(data == "fail") {
>>>>>>> branch 'master' of https://github.com/JayKim1026/teamproject.git
				alert("글쓰기 실패");
			}
		}	
	});
// 	javascript:history.go(0);
});

$(".btnUpdate").click(function(e){
	$("#squarespaceModal > input[name=time_no]").val($(this).attr("data-no"));
	$("#btnUpdateModal").trigger("click");
});

$("#btnUpdateSave").click(function(){
	var time_no = $("#squarespaceModal > input[name=time_no]").val();
	var time_content = $("#time_content_update").val();
	
	console.log(time_no);
	console.log(time_content);
	
	var url = "/timeline/updateArticle";
	var sendData = {
			"time_no" : time_no,
			"time_content" : time_content
	};
	
	$.ajax({
		"url"		:	url,
		"dataType"	:	"text",
		"data"		:	JSON.stringify(sendData),
		"method"	:	"post",
		"headers"	:	{
	"Content-Type"	:	"application/json"
						},
		"success"	:	function(data){
			console.log(data);
	
		}	
						
		});
	javascript:history.go(0);
	$("#btnUpdateClose").trigger("click");	
});

$(".btnDelete").click(function(){
	var time_no = $(this).attr("data-no");
	console.log(time_no);
	var url = "/timeline/deleteArticle/" + time_no;
	$.get(url,function(data){
		console.log(data);
		javascript:history.go(0);
	});
});

});
</script>
<body>
<%@include file="../include/timelineHeader.jsp" %>
	<!-------------------------- 글 입력  --------------------------> 
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<div class="form-group">
							<!-- 유저번호  -->
							
							<div class="px-4 py-5 mx-auto">
								<div class="d-flex justify-content-center">
									<div class="card_writeform">
										<div class="row px-3">
											<img class="profile-pic mr-3"
												src="https://i.imgur.com/6tPhTUn.jpg">
											<div class="flex-column">
												<h3 class="mb-0 font-weight-normal">${userVo.user_name}</h3>
												<select name="privacy" class="privacy">
													<option>Public post</option>
													<option>Private post</option>
												</select>
											</div>
										</div>
										<form enctype="multipart/form-data" method="post" id="frmData">
										<div class="row px-3 form-group">
										
											<input type="hidden" value="${userVo.user_no}" id="user_no" name="user_no">
											<textarea id="time_content" name="time_content"
												class="text-muted bg-light mt-4 mb-3"
												placeholder="안녕하세요 오늘은 무슨 생각을 하고있나요?"></textarea>
										
										</div>
										<div class="row px-3 form-group">
											<p class="fa fa-user options mb-0 mr-4"></p>
											<p class="fa fa-map-marker options mb-0 mr-4"></p>
											<label class="fa fa-image options mb-0 mr-4" for="time_img"></label>
											<input type="file" class="form-control-file" id="time_img" name="time_img" style="display:none" />
											
<!-- 											<div id="divUploaded" style="padding-left:40px;"> -->
<!-- 												<img height="25" src="/resources/images/default.png"/> -->
<!-- 											</div> -->
											<div class="btn btn-success ml-auto" id="btnInsert">글쓰기</div>
										</div>
										</form>	
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
	<!-------------------------- //글 입력  -------------------------->
	
	<!-------------------------- 글 출력  -------------------------->
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6" id="house">
						<c:forEach var="timelineVo" items="${timelineList}">
						<div id="forclone">
							<div class="d-flex justify-content-center">
								
								<div class="card_output">
									<div class="row d-flex">
										<div class="">
											<img class="profile-pic"
												src="https://i.imgur.com/V3ICjlm.jpg">
										</div>
										<div class="d-flex flex-column">
											<h3 class="mt-2 mb-0">${timelineVo.writer_name}</h3>
											<div>
												<p class="text-left">
													<span class="text-muted">4.0</span> <span
														class="fa fa-star star-active ml-3"></span> <span
														class="fa fa-star star-active"></span> <span
														class="fa fa-star star-active"></span> <span
														class="fa fa-star star-active"></span> <span
														class="fa fa-star star-inactive"></span>
												</p>
											</div>
										</div>
											<div class="ml-auto">
												<ul class="nav navbar-nav" style="float:right;">
													<li class="dropdown"><a href="#"
														class="dropdown-toggle" data-toggle="dropdown"><span
															class="caret"></span></a>
														<ul class="dropdown-menu" role="menu">
															<c:if
																test="${sessionScope.userVo.user_no == timelineVo.writer_no}">
																<li><a class="btnUpdate"
																	data-no="${timelineVo.time_no}">수정</a></li>
																<li><a class="btnDelete"
																	data-no="${timelineVo.time_no}">삭제</a></li>
															</c:if>
															<li><a id="btnReport">신고</a></li>
														</ul>
										
													</ul>
													<p class="text-muted pt-2 pt-sm-5">10 Sept</p>
												</div>
										</div>
									<div class="text-left">
										<p class="content">${timelineVo.time_content}</p>
									</div>
									<div class="row text-left">
										<c:if test="${timelineVo.time_img != null}">
											<img class="pic" src="${image_url}${timelineVo.time_img}">
										</c:if>
									</div>
									<div class="row text-left mt-4">
										<div class="like mr-3 vote">
											<img src="https://i.imgur.com/mHSQOaX.png"><span
												class="blue-text pl-2">20</span>
										</div>
										<div class="unlike vote">
											<img src="https://i.imgur.com/bFBO3J7.png"><span
												class="text-muted pl-2">4</span>
										</div>
									</div>
								</div>	
							</div>
						</div>
						</c:forEach>
						<!--------------------------// 글 출력  -------------------------->
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>


	<!-----------------------------------------모달----------------------------------------->
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

	<%@include file="../include/footer.jsp" %>
</body>
</html>