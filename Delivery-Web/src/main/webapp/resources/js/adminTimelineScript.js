function getPostList() {
	var url = "/admin/getPostList"
	$.post(url, function(data) {
		console.log("일반글:"+data);
		$("#postTable > #postTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#posttrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			var isImg = "";
			if(this.time_img != null){
				isImg = "O";
			}else{
				isImg = "X";
			}
			tr.find("td").eq(4).text(isImg);
			tr.find("td").eq(5).text(this.time_location);
			tr.find("td").eq(6).find("button").attr("time_no", this.time_no);
				
			$("#postTable > #postTableTbody").prepend(tr);
		});
	});
}
function getReviewList(){
	var url = "/admin/getReviewList"
	$.post(url, function(data){
		console.log("리뷰:" + data);
		$("#reviewTable > #reviewTableTbody").empty();
		$.each(data, function() {
				
			var tr = $("#reviewtrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			var isImg = "";
			if(this.time_img != null){
				isImg = "O";
			}else{
				isImg = "X";
			}
			tr.find("td").eq(4).text(isImg);
			
			if(this.order_no == "0"){
				tr.find("td").eq(5).text("");
			}else{
				tr.find("td").eq(5).text(this.order_no);
			}
			tr.find("td").eq(6).find("button").attr("time_no", this.time_no);
				
			$("#reviewTable > #reviewTableTbody").prepend(tr);
		});
	});
}

function getNoticeList(){
	var url = "/admin/getNoticeList"
	$.post(url, function(data){
		console.log("공지:"+data);
		$("#noticeTable > #noticeTableTbody").empty();
		$.each(data, function() {
			var tr = $("#noticetrTable").find("tr").clone();
			tr.find("td").eq(0).text(this.time_no);
			tr.find("td").eq(1).text(this.time_content);
			tr.find("td").eq(2).text(this.time_date);
			tr.find("td").eq(3).text(this.writer_name);
			tr.find("td").eq(7).find("button").attr("time_no", this.time_no);
				
			$("#noticeTable > #noticeTableTbody").prepend(tr);
		});	
	});
}

$(function() {
	getPostList()
	getReviewList()
	getNoticeList()

	
	$("#postTableTbody, #reviewTableTbody, #noticeTableTbody").on("click", ".btnDelete", function(){
			
		var time_no = parseInt($(this).attr("time_no"));
		console.log(time_no);
		var sendData = {
			"time_no"	:	time_no,
		};
		var url = "/admin/deleteArticle";
			
		$.post(url, sendData, function(data){
			if(data =="success"){
				location.reload();
			}
		});
	});
	
});