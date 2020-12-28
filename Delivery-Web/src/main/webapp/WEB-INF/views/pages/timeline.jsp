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
	
<div class="container-fluid">
	timelineVo: ${timelineVo}
	userVo: ${userVo}
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="form-group">
								
							<label>글쓰기</label> 
							<input type="hidden"value="${userVo.user_no}" id="user_no">
							<textarea class="form-control" id="review_content"></textarea>
							<button class="btn btn-primary" id="submitBtn">글쓰기</button>
						</div>
						
					</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<div class="timeline-centered timeline-centered-location">
							<!-- 글 출력 -->
							<c:forEach var="timelineVo" items="${timelineVo}">
							<article class="timeline-entry">
								<div class="timeline-entry-inner">
																		
									<div class="timeline-icon bg-success">
									
										<i class="entypo-feather"></i>
										
									</div>
									
									<div class="timeline-label">
										 <ul class="nav navbar-nav" style="float:right;">
        									<li class="dropdown">
			 									 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>				
			 								<ul class="dropdown-menu" role="menu">
			 									  <c:if test="${sessionScope.userVo.user_no == timelineVo.user_no}">
             									  <li><a class="btnUpdate" data-no="${timelineVo.review_no}">수정</a></li>
                								  <li><a class="btnDelete" data-no="${timelineVo.review_no}">삭제</a></li>
             									  </c:if>
             									  <li><a id="btnReport">신고</a></li>
             								</ul>                
          								  	</li>
       									</ul>
		
										<h2>
										<a href="#">${timelineVo.user_name}</a> <span>posted a statusupdate</span>
										</h2>
										<p>${timelineVo.review_content}</p>

									</div>
									</div>	
									
							</article>
							</c:forEach>
							<!--// 글 출력 끝 -->
												
							<!-- 새로고침 버튼 -->
							<article class="timeline-entry begin">
							
								<div class="timeline-entry-inner">
								
									<div class="timeline-icon"
										style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);">
										<i class="entypo-flight"></i> +
									</div>
									
								</div>
								
							</article>
							<!--// 새로고침 버튼 끝-->
						</div>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
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