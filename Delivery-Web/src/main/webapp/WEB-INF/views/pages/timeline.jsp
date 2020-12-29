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
	
$("#submitBtn").click(function(){
	console.log("클릭");
	
	var user_no = parseInt($("#user_no").val());
	var review_content = $("#review_content").val();
	
	console.log(user_no);
	console.log(review_content);
	
	
	var url = "/timeline/insertArticle";
	var sendData = {
			"user_no"				:	user_no,
			"review_content"		:	review_content
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
			javascript:history.go(0);
		}
		});
	});

$(".btnUpdate").click(function(e){
	$("#squarespaceModal > input[name=review_no]").val($(this).attr("data-no"));
	$("#btnUpdateModal").trigger("click");
});

$("#btnUpdateSave").click(function(){
	var review_no = $("#squarespaceModal > input[name=review_no]").val();
	var review_content = $("#review_content_update").val();
	
	console.log(review_no);
	console.log(review_content);
	
	var url = "/timeline/updateArticle";
	var sendData = {
			"review_no" : review_no,
			"review_content" : review_content
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
	var review_no = $(this).attr("data-no");
	console.log(review_no);
	var url = "/timeline/deleteArticle/" + review_no;
	$.get(url,function(data){
		console.log(data);
		javascript:history.go(0);
	});
});

});
</script>
<body>
<%@include file="../include/timelineHeader.jsp" %>

	<div class="container-fluid divcolor"  style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<div class="form-group">

							<input type="hidden" value="${userVo.user_no}" id="user_no">
							<div class="container px-4 py-5 mx-auto">
								<div class="row d-flex justify-content-center">
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
										<div class="row px-3 form-group">
											<textarea id="review_content" class="text-muted bg-light mt-4 mb-3"
												placeholder="안녕하세요 오늘은 무슨 생각을 하고있나요?"></textarea>
										</div>
										<div class="row px-3">
											<p class="fa fa-user options mb-0 mr-4"></p>
											<p class="fa fa-map-marker options mb-0 mr-4"></p>
											<p class="fa fa-image options mb-0 mr-4"></p>
											<img class="options"
												src="https://img.icons8.com/material/24/000000/more--v2.png"
												width="30px" height="28px">
											<div class="btn btn-success ml-auto" id="submitBtn">글쓰기</div>
										</div>
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
	

<!-----------------------------------------모달----------------------------------------->
<button data-toggle="modal" data-target="#squarespaceModal"class="btn btn-primary center-block" id="btnUpdateModal" style="display:none;">Click Me</button>
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
	<input type="hidden" name="review_no">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="lineModalLabel">수정</h3>
			</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<textarea class="form-control" id="review_content_update" placeholder="당신의 생각을 공유해주세요!"></textarea>
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