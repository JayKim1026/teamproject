function reportList(){
	var url = "/admin/getReportList"
	$.post(url,function(data){
		console.log(data);
		$("#reportTable > #reportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#reporttrTable").find("tr").clone();
			tr = setList(this, tr, 0);
			$("#reportTable > #reportTableTbody").prepend(tr);
		});
	});
}

function acceptReportList(){
	var url = "/admin/getAcceptReportList"
	$.post(url,function(data){
		console.log(data);
		$("#acceptReportTable > #acceptReportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#acceptReporttrTable").find("tr").clone();
			tr = setList(this, tr, 1);
			$("#acceptReportTable > #acceptReportTableTbody").prepend(tr);
		});
	});
}

function cancelReportList(){
	var url = "/admin/getCancelReportList"
	$.post(url,function(data){
		console.log(data);
		$("#cancelReportTable > #cancelReportTableTbody").empty();
		$.each(data, function() {
			var tr = $("#cancelReporttrTable").find("tr").clone();
			tr = setList(this, tr, 2);
			$("#cancelReportTable > #cancelReportTableTbody").prepend(tr);
		});
	});
}

function setList(data, tr, num) {
	tr.find("td").eq(0).text(data.report_no);
	tr.find("td").eq(1).text(data.plt_name);
	tr.find("td").eq(2).text(data.def_name);
	tr.find("td").eq(3).text(data.report_detail);
	tr.find("td").eq(4).text(data.type_detail);
	tr.find("td").eq(5).find("option:eq(" + num + ")").attr("selected", "selected");
	tr.find("td").eq(6).text(data.report_date);
	tr.find("td").eq(7).find("button").attr("report_no", data.report_no);
	return tr;
}

$(function(){
	reportList();
	acceptReportList();
	cancelReportList();
	$("#reportTableTbody, #acceptReportTableTbody, #cancelReportTableTbody").on("click", ".btnModify", function(){
		console.log("클릭클릭");
		var report_no = parseInt($(this).attr("report_no"));
		var report_state = $(this).parent().prev().prev().find(":selected").val();
		var sendData = {
			"report_no"	:	report_no,
			"report_state":	report_state
		};
		var url = "/admin/updateReportState"
		$.post(url, sendData, function(data){
			if(data =="success"){
				location.reload();

			}
		});
	});
});