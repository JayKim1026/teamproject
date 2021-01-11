<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@include file="../include/link.jsp"%> --%>
<%-- <%@include file="../css/timeline.css"%> --%>
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
	
	$("#showComment").click(function(){
		$(this).hide();
		$("#closeComment").show();
		$("#commentList").show();
		
		var time_no = ${timelineVo.time_no};
		console.log(time_no);
		
		var url = "/comment/getCommentList/" + time_no;
		
		$.get(url, function(data){
			console.log(data);
			$("#newCommentList").empty();
			$.each(data, function(){
				
				var div = ("#commentList").clone();
				
				div.find("img").eq(0).attr();
				div.find(".commenter-head").children("span").eq(0).text(this.user_id);
				div.find(".commenter-head").children("span").eq(1).text(this.c_date);
				div.find(".comment-body").children("span").eq(0).text(this.c_content);
				
				$("#newCommentList").append(div);
				
			});
		});
		
	});
	
	$("#closeComment").click(function(){
		$(this).hide();
		$("#showComment").show();
		$("#commentList").hide();
	});
	
	$("#insertCommentBtn").click(function(){
		var time_no = "${timelineVo.time_no}";
		var user_id = "${userVo.user_id}";
		var c_content = $("#c_content").val();
		
		console.log(time_no);
		console.log(user_id);
		console.log(c_content);
		
		var url = "/comment/insertComment";
		var sendData = {
				"time_no"	:	time_no,
				"user_id"	:	user_id,
				"c_content" :	c_content
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
					
					
				}
			}
		});
	});
	/*//InserComment 끝*/
	
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
											<p class="text-muted" style="padding-right: 30px;">${timelineVo.time_date}</p>
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

									댓글보기 버튼
									<div class="row mt-4" style="padding-bottom: 15px;">
										<a class="ml-auto showComment" id="showComment" data-no="${timelineVo.time_no}" data-id="${userVo.user_id}" href="/timeline/content">댓글보기</a> 
										<a class="ml-auto closeComment" id="closeComment" style="display: none;" data-no="${timelineVo.time_no}">댓글접기</a>
									</div>

									<!-- 경계선 -->
									<div class="row"
										style="border-width: 1px; border-color: gray; border-style: solid; opacity: 0.5;">
									</div>

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

									<!-- 댓글보기 -->
									<div class="row commentList"
										style="padding-top: 10px; display: none;" id="commentList">
										<img src="" class="commenter-image" alt="commenter_image">

										<div class="comment-content col-md-11">
										
											<div class="commenter-head">
												<span class="commenter-name"><a href="#">이름</a></span> 
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
									
									<div id="newCommentList">
									
									</div>
									
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
</html>