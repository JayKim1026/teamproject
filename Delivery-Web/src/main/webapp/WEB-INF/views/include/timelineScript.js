$(function() {
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
		clone1.find(".btnUpdate").attr("data-no", data.time_no);
		clone1.find(".btnDelete").attr("data-no", data.time_no);
		clone1.find(".btnReport").attr("data-no", data.time_no).attr("data-writerno", data.writer_no);
		
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
	
	/* 타임라인 신고*/
	$(document).on("click", ".btnReport", function() {
		$(".timelineModal_report").fadeIn();
		var writer_no = $(this).attr("data-writerno");
		$(".btnTimelineReportRun").attr("data-defno", writer_no);
	});
	
	// 타임라인 report type 
	$("input[name=timelineReportType]").change(function(){
		var timelineReportType = $(this).val();
		$(".btnTimelineReportRun").attr("data-reportType", timelineReportType);
	});
	
	/* 타임라인 신고 모달 확인 버튼*/
	$(".btnTimelineReportRun").click(function(e){
		e.preventDefault();
			var url = "/report/report";
			var def_no = $(this).attr("data-defno");
			var plf_no = "${sessionScope.userVo.user_no}"
			var resultType= $(this).attr("data-reportType");
			console.log(resultType);
			console.log("plf_no : " + plf_no);
			$.post(url, sendData, function(reportResult){
				console.log(reportResult);
			});
	});
	
	/* 타임라인 신고 모달 취소 버튼*/
	$(".btnTimelineReportCancel").click(function(){
		$(".timelineModal_report").fadeOut();
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
		var toggle = $(this).attr("data-toggle");
	 	var time_no = $(this).attr("data-no");
		var commentList = $(this).parent().next().next().next();
		if(toggle == "hide") {
			$(this).attr("data-toggle", "show");
			getCommentList(time_no, commentList);
		} else if(toggle == "show") {
			$(this).attr("data-toggle", "hide");
			commentList.hide();
		}
	});
	
	// 댓글 작성
	$(document).on("click", ".insertCommentBtn", function() {
		var btn = $(this);
		var input = $(this).parent().prev().find("input");
		var time_no = $(this).attr("data-no");
		var comment = input.val();
		var writer_no = account_no;
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