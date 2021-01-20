<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp" %>
<%@include file="../css/timeline.css" %>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d&libraries=services,clusterer,drawing"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55ba16f01b6380a3b436ed92926b126d"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>timeLine.jsp</title>
</head>
<script>
function contentSubmit(){
	$("#frm").submit();
}

$(function(){
$("#map_marker").click(function(){
	// 카카오 주소 검색기
	var geocoder = new kakao.maps.services.Geocoder();
	// 위치 권한 있으면 좌표로 주소 반환
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			console.log(position);
			var lat = position.coords.latitude
			var lng = position.coords.longitude;
			var locPosition = new kakao.maps.LatLng(lat, lng);
			//좌표로 주소 반환
			searchDetailAddrFromCoords(locPosition, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = result[0].address.address_name;
					console.log(detailAddr);
					
					const str = detailAddr;
					const strArray = str.split(" ");
					console.log(strArray);
					console.log(strArray[2]);
					
					$("#time_location").text(strArray[2]);
					$("#write-map-marker").show();
				}
			});
		});
	} else {
		console.log("안됨");
	}
	// 좌표로 주소 얻기
	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	});
	
	/*카테고리 분류*/
	$("#category").on("change", function(){
		if($(this).val() == "2-002"){
			$(".rating").show();
		}else{
			$(".rating").hide();
		}
	});
	
	var lastTimeNo;
	var account_no;
	if("${userVo.user_no}" != "") {
		account_no = parseInt("${userVo.user_no}");
	} else if("${deliverVo.dlvr_no}" != "") {
		account_no = parseInt("${deliverVo.dlvr_no}");
	}
	console.log("account_no : " + account_no);
	
	getTimelineList();
	
	function getTimelineList() {
		var url = "/timeline/getTimelineList";
		var sendData = {
				"account_no"	:	account_no
		};
		$.post(url, sendData, function(data) {
			$.each(data, function(index) {
				if(index == 0) {
					lastTimeNo = this.time_no;
					console.log("getTimelineList, lastTimeNo = " + lastTimeNo);
				}
				setTimeline(this, false);
			});
		});
	}
	
	function getCurrentTimeline() {
		var url = "/timeline/getCurrentTimeline";
		var sendData = {
				"time_no"	:	lastTimeNo, 
				"account_no":	account_no
		}
		$.post(url, sendData, function(data) {
			$.each(data, function(index) {
				if(index == 0) {
					lastTimeNo = this.time_no;
				}
				setTimeline(this, true);
			});
		});
	}
	
	function setTimeline(data, insert) {
		// 클론
		var clone1 = $("#forclone").clone();
		
		/* 카테고리 */
		
		if(data.time_state == "2-002"){
			clone1.find(".output-stars-clone").show();
		}else if(data.time_state == "2-003"){
			clone1.find(".output-stars-clone").hide();
		}
		
		/*별 클론*/
		if(data.time_star == 5){
		}else if(data.time_star == 4){
			clone1.find(".pclass").children("span").eq(0).text("4");
			clone1.find(".pclass").children("span").eq(5).removeClass("star-active").addClass("star-inactive");
		}else if(data.time_star == 3){
			clone1.find(".pclass").children("span").eq(0).text("3");
			clone1.find(".pclass").children("span").eq(4).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(5).removeClass("star-active").addClass("star-inactive");
		}else if(data.time_star == 2){
			clone1.find(".pclass").children("span").eq(0).text("2");
			clone1.find(".pclass").children("span").eq(3).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(4).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(5).removeClass("star-active").addClass("star-inactive");
		}else if(data.time_star == 1){
			clone1.find(".pclass").children("span").eq(0).text("1");
			clone1.find(".pclass").children("span").eq(2).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(3).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(4).removeClass("star-active").addClass("star-inactive");
			clone1.find(".pclass").children("span").eq(5).removeClass("star-active").addClass("star-inactive");
		}
		/*//별 클론 */
		
		/* 이미지 클론*/
		if(data.time_img != null){
			clone1.find(".time_img").attr("src","${image_url}"+data.time_img).show();
		}else if(data.time_img == null){
			clone1.find(".time_img").attr("src","#").hide();
		}
		/*//이미지 클론 */
		
		clone1.find(".writer_img").attr("src","${image_url}"+data.writer_img);
		clone1.find(".writer_name").text(data.writer_name);
		clone1.find(".time_date").text(data.time_date);
		clone1.find(".time_content").text(data.time_content);
		if(data.time_location != null && data.time_location != "") {
			clone1.find(".time_location").prev().show();
			clone1.find(".time_location").text(data.time_location);
			clone1.find(".time_location").next().show();
		} else{
			clone1.find(".time_location").prev().hide();
			clone1.find(".time_location").text("");
			clone1.find(".time_location").next().hide();
		}
		
		if(data.liked_no != -1) {
			clone1.find(".isLike").removeClass("black-color").addClass("red-color").attr("data-timeno", data.time_no);
			clone1.find(".time_like").removeClass("black-color").text(data.time_like).addClass("red-color");
		} else {
			clone1.find(".isLike").removeClass("red-color").addClass("black-color").attr("data-timeno", data.time_no);
			clone1.find(".time_like").removeClass("red-color").text(data.time_like).addClass("black-color");
		}
		
		clone1.find(".showComment").attr("data-no", data.time_no);
		clone1.find(".insertCommentBtn").attr("data-no", data.time_no);
		
		clone1.show();
		if(!insert) {
			$("#house").append(clone1).hide().fadeIn(1000);
		} else {
			$("#house").prepend(clone1);
		}
	}
	
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
		var time_location = $("#time_location").text();
		if(isNaN(time_star)){
			time_star = parseInt($("#noValueRating").val());
		}
		
		formData.append("f_timeline_img", f_timeline_img);
		formData.append("time_content", time_content);
		formData.append("time_state", time_state);
		formData.append("writer_no", writer_no);
		formData.append("writer_state", account_state);
		formData.append("time_star", time_star);
		formData.append("time_location", time_location);
		
		$.ajax({
			"processData"	:	false,
			"contentType"	:	false,
			"type"			:	"post",
			"url"			:	url,
			"data"			:	formData, 
			"success"		:	function(data) {
				console.log(data);
				if(data.result == "insertArticle_success"){
// 					getCurrentTimeline();
					$("#time_content").val("");
					$("#time_img").val("");
					$("#imgPreview").hide();
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
		var inputFile = $("input[type=file]")[0].files[0];
		console.log("업데이트파일:" + inputFile);
		readURL(this);
		$("#imgPreview").show();
		$("#deleteImg").show();
		
	});
	
	/*사진 업로드 취소*/
	$("#deleteImg").click(function(){
		$("input[type=file]").val("");
		$("#imgPreview").hide();
		$("#deleteImg").hide();
		
	});
	
	// 댓글 가져오기
	function getCommentList(time_no, commentList) {
		var url = "/comment/getCommentList/" + time_no;
		$.post(url, function(data) {
			commentList.empty();
			$.each(data, function() {
				console.log(commentList);
				setComment(this, commentList);
			});
			commentList.show();
		});
	}
	
	// 댓글 세팅
	function setComment(comment, commentList) {
		var commentClone = $("#commentClone").clone();
		commentClone.find("img").attr("src", "${image_url}" + comment.writer_img);
		commentClone.find(".writer-name").text(comment.writer_name);
		commentClone.find(".comment-date").text(comment.c_date);
		commentClone.find(".comment-content").text(comment.c_content);
		commentClone.show();
		commentList.append(commentClone);
	}
	
	// 글 마다 있는 댓글보기버튼
	$(document).on("click", ".showComment", function() {
		var btnName = $(this).text();
	 	var time_no = $(this).attr("data-no");
		var commentList = $(this).parent().next().next().next();
		if(btnName == "댓글 보기") {
			$(this).text("댓글 닫기");
			getCommentList(time_no, commentList);
		} else if(btnName == "댓글 닫기") {
			$(this).text("댓글 보기");
			commentList.hide();
		}
	});
	
	// 댓글 작성
	$(document).on("click", ".insertCommentBtn", function() {
		var btn = $(this);
		var input = $(this).parent().prev().find("input");
		var time_no = $(this).attr("data-no");
		var comment = input.val();
		var writer_no;
		if("${userVo.user_no}" != "") {
			writer_no = parseInt("${userVo.user_no}");
		} else if("${deliverVo.dlvr_no}" != "") {
			wrtier_no = parseInt("${deliverVo.dlvr_no}");
		}
		var url = "/comment/insertComment";
		var sendData = {
				"c_content"	:	comment, 
				"writer_no"	:	writer_no, 
				"time_no"	:	time_no
		};
		$.post(url, sendData, function(data) {
			console.log(data);
			if(data == "insertComment_success") {
				var commentList = btn.parent().parent().next();
				getCommentList(time_no, commentList);
				input.val("");
			}
		});
	});
	
	// 좋아요
	$(document).on("click", ".isLike", function() {
		var isLike = $(this);
		var time_like = parseInt($(this).next().text());
		var time_no = $(this).attr("data-timeno");
		var url;
		if($(this).hasClass("red-color")) {
			url = "/like/deleteLike/" + time_no + "/" + account_no;
		} else if($(this).hasClass("black-color")) {
			url = "/like/insertLike/" + time_no + "/" + account_no;
		}
		$.post(url, function(data) {
			if(data == "insertLike_success") {
				isLike.removeClass("black-color").addClass("red-color");
				isLike.next().removeClass("black-color").addClass("red-color").text(++time_like);
			} else if(data == "deleteLike_success") {
				isLike.removeClass("red-color").addClass("black-color");
				isLike.next().removeClass("red-color").addClass("black-color").text(--time_like);
			}
		});
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
<%@ include file="../include/frm.jsp"%>
<%@include file="../include/timelineHeader.jsp" %>
${likeList}
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
	<!-------------------------- //글 입력  -------------------------->
	
	<!-------------------------- 글 출력  -------------------------->
	<div class="container-fluid" style="background-color: #f0f2f5;">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-1"></div>
					<div class="col-md-6" id="house">
						
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
<!-- ------------------------글 출력 클론----------------------------- -->

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
						<span class="isLike" style="font-size: 30px">♥</span>
						<span class="pl-2 time_like"></span>
					</div>
				</div>
				
				<!-- 댓글보기 버튼 -->
				<div class="row mt-4" style= "padding-bottom:15px;">
					<a class="ml-auto showComment" >댓글 보기</a>	
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
	
	<!-- -----------------------댓글 클론 -->
	<div id="commentClone" style="display: none">
		<div class="row commentInfo" style="padding-top:10px;">
			<img src="https://cdn.pixabay.com/photo/2017/04/06/19/34/girl-2209147_960_720.jpg"  class="commenter-image" alt="commenter_image">			
			<div class="comment-content col-md-11">
				<div class="commenter-head">
					<span class="commenter-name"><a class="writer-name" href="#">김범준</a></span> 
					<span class="comment-date"><i class="far fa-clock"></i>댓글날짜</span>
				</div>
				<div class="comment-body">
					<span class="comment comment-content">댓글내용</span>
				</div>
				<div class="comment-footer">		
					<a class="comment-action"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- -----------------------// 댓글 클론 -->
	
					
	<%@include file="../include/footer.jsp" %>
</body>
</html>