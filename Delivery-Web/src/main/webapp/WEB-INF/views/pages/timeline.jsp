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
	
/*카테고리 분류*/
$("#category").on("change", function(){
	if($(this).val() == "2-002"){
		$(".rating").show();
	}else{
		$(".rating").hide();
	}
});

/* 글쓰기 */
$("#btnInsert").click(function(e){
	console.log("클릭");
	var url = "/timeline/insertArticle"
	var formData = new FormData();
	var f_timeline_img = $("input[type=file]")[0].files[0];
	var time_content = $("#time_content").val();
	var writer_no = parseInt("${userVo.user_no}");
	var account_state = "${userVo.account_state}";
	var time_state = $("#category").val();
	var time_star = parseInt($("input[name=rating]:checked").val());
	if(isNaN(time_star)){
		time_star = parseInt($("#noValueRating").val());
	}
	
	formData.append("f_timeline_img", f_timeline_img);
	formData.append("time_content", time_content);
	formData.append("time_state", time_state);
	formData.append("writer_no", writer_no);
	formData.append("writer_state", account_state);
	formData.append("time_star", time_star);
	
	
	$.ajax({
		"processData"	:	false,
		"contentType"	:	false,
		"type"			:	"post",
		"url"			:	url,
		"data"			:	formData, 
		"success"		:	function(data) {
			var clone1 = $("#forclone").clone();
			console.log(data);
			if(data.result == "insertArticle_success"){
				
				console.log(data.time_img);
				
				if(data.time_img == null){
					console.log("data없음")
					clone1.find(".pic").hide();
				}else{
					console.log("data있음")
					clone1.find(".pic").attr("src","${image_url}"+data.time_img);
				}
				clone1.find(".output-stars").hide();
				clone1.find("#profile-pic-output").attr("src","${image_url}${userVo.user_img}");
				clone1.find("h3").text("${userVo.user_name}");
				clone1.find(".content").text(data.time_content);
				
				
				$("#house").prepend(clone1).hide().fadeIn(1000);
				$("#time_content").val("");
				$("#time_img").val("");
			} else if(data.fail == "fail"){
				alert("글쓰기 실패");
			}
		}
	});


});

/*모달 트리거*/
$(".btnUpdate").click(function(e){
	$("#squarespaceModal > input[name=time_no]").val($(this).attr("data-no"));
	$("#btnUpdateModal").trigger("click");
});

/*업데이트 저장*/
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

/*삭제*/
$(".btnDelete").click(function(){
	var time_no = $(this).attr("data-no");
	console.log(time_no);
	var url = "/timeline/deleteArticle/" + time_no;
	$.get(url,function(data){
		console.log(data);
		javascript:history.go(0);
	});
});

/*사진 미리보기*/
$("#time_img").on("change", function(){
	readURL(this);
	$("#imgPreview").show();
	
});

});

function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#imgPreview").attr("src", e.target.result);
		}
		
		reader.readAs
		reader.readAsDataURL(input.files[0]);
		console.log("input.files[0] : " + input.files[0]);
	}
}
/*별점*/
function add(ths, sno) {
	for (var i = 1; i <= 5; i++) {
		var cur = document.getElementById("star" + i)
		cur.className = "far fa-star"
	}
	for (var i = 1; i <= sno; i++) {
		var cur = document.getElementById("star" + i)
		if (cur.className == "far fa-star") {
			cur.className = "fas fa-star"
		}
	}
}
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
					<form enctype="multipart/form-data" method="post" id="frmData">
						<div class="form-group">
							<!-- 유저번호  -->
							
							<div class="px-4 py-5 mx-auto">
								<div class="d-flex justify-content-center">
									<div class="card_writeform">
										<div class="row px-3">
											<img class="profile-pic mr-3" src="${image_url}${userVo.user_img}">
											<div class="flex-column">
												<h3 class="mb-0 font-weight-normal">${userVo.user_name}</h3>
												<select id="category" name="privacy" class="privacy">
													<option value="2-003">일반</option>
													<option value="2-002">배달후기</option>
												</select>
											</div>
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
											<img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg" id="profile-pic-output">
										</div>
										<div class="d-flex flex-column">
											<h3 class="mt-2 mb-0">${timelineVo.writer_name}</h3>
											<div class="output-stars">
											<!-- 별 다섯개 나 머리나빠서 로직 아직 안됨 기다리셈 -->
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
									<c:choose>
										<c:when test="${timelineVo.time_img != null}">
											<img class="pic" src="${image_url}${timelineVo.time_img}">
										</c:when>
										<c:otherwise>
												<img alt="등록된 이미지가 없습니다."src="#">
										</c:otherwise>
									</c:choose>
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