function getMemberList() {
	var url = "/admin/getMemberList"
	$.post(url, function(data) {
		$("#memberTable > #memberTableTbody").empty();
		$.each(data, function() {
			var tr = $("#trTable").find("tr").clone();
			tr.find("td").eq(0).text(this.user_no);
			tr.find("td").eq(1).text(this.user_id);
			tr.find("td").eq(2).text(this.user_name);
			tr.find("td").eq(3).text(this.user_phone);
			tr.find("td").eq(4).text(this.user_email);
			if(this.user_state == "1-001") {
				tr.find("td").eq(5).find("option").eq(0).attr("selected" , "selected");
			} else if( this.user_state == "1-002") {
				tr.find("td").eq(5).find("option").eq(1).attr("selected" , "selected");
			} else if ( this.user_state == "1-003") {
				tr.find("td").eq(5).find("option").eq(2).attr("selected" , "selected");
			} else if ( this.user_state == "1-004") {
				tr.find("td").eq(5).find("option").eq(3).attr("selected" , "selected");
			}
			tr.find("td").eq(6).find("button").attr("user_no", this.user_no);
			tr.find("td").eq(6).find("button").attr("data-userState", this.user_state);
			$("#memberTable > #memberTableTbody").prepend(tr);
		});
	});
}
function getDeliverList(){
	var url = "/admin/getDeliverList"
	$.post(url, function(data){
		$("#deliverTable > #deliverTableTbody").empty();
		$.each(data, function() {
			var tr = $("#trTableDeliver").find("tr").clone();
			tr = setDlvrList(this, tr);
			$("#deliverTable > #deliverTableTbody").prepend(tr);
		});
	});
}
function getWaitingDeliverList(){
	var url = "/admin/getWaitingDeliverList"
	$.post(url, function(data){
		$("#watingDeliverTable > #waitingDeliverTableTbody").empty();
		$.each(data, function() {
			var tr = $("#trTableWaitingDeliver").find("tr").clone();
			tr = setDlvrList(this, tr);
			$("#waitingDeliverTable > #waitingDeliverTableTbody").prepend(tr);
		});	
	});
}

function setDlvrList(data, tr) {
	tr.find("td").eq(0).text(data.dlvr_no);
	tr.find("td").eq(1).text(data.dlvr_id);
	tr.find("td").eq(2).text(data.dlvr_name);
	tr.find("td").eq(3).text(data.dlvr_phone);
	tr.find("td").eq(4).text(data.dlvr_email);
	if(data.dlvr_state == "1-001") {
		tr.find("td").eq(5).find("option").eq(0).attr("selected" , "selected");
	} else if( data.dlvr_state == "1-002") {
		tr.find("td").eq(5).find("option").eq(1).attr("selected" , "selected");
	} else if ( data.dlvr_state == "1-003") {
		tr.find("td").eq(5).find("option").eq(2).attr("selected" , "selected");
	} else if ( data.dlvr_state == "1-004") {
		tr.find("td").eq(5).find("option").eq(3).attr("selected" , "selected");
	}
	tr.find("td").eq(6).find("button").attr("dlvr_no", data.dlvr_no);
	tr.find("td").eq(6).find("button").attr("data-dlvrState", data.dlvr_state);
	return tr;
}

$(function() {
	getMemberList()
	getDeliverList()
	getWaitingDeliverList()
	
	// 일반 회원 계정 상태 변경
	$("#memberTableTbody").on("click", ".btnMemberUpdate", function(){
		var check = confirm("계정상태를 변경하시겠습니까?");
		if(check == true) { 
			var user_no = parseInt($(this).attr("user_no"));
			var selectValue = $(this).parent().prev().find("select").val();
				console.log(user_no);
				console.log(selectValue);
			var url = "/admin/userStateUpdate"
			var sendData = {
				"user_no" : user_no ,
				"user_state" : selectValue
			};
			$.post(url, sendData, function(updateResult){
				if(updateResult == "update_success") {
					console.log(updateResult);
					alert("변경 완료");
				}
			});
		}
	});
	
	// 라이더 회원 계정 상태 변경
	$("#deliverTableTbody").on("click", ".btnDeliverUpdate", function(){
		var check = confirm("계정상태를 변경하시겠습니까?");
		if(check == true) { 
			var dlvr_no = parseInt($(this).attr("dlvr_no"));
			var selectValue = $(this).parent().prev().find("select").val();
				console.log(dlvr_no);
				console.log(selectValue);
			var url = "/admin/deliverStateUpdate"
			var sendData = {
				"dlvr_no" : dlvr_no ,
				"dlvr_state" : selectValue
			};
			$.post(url, sendData, function(updateResult){
				if(updateResult == "update_success") {
					console.log(updateResult);
					alert("변경 완료");
				}
			});
		}
	});
	
	// 가입 대기중 라이더 회원 계정 상태 변경
	$("#waitingDeliverTable").on("click", ".btnWaitingDeliverUpdate", function(){
		var check = confirm("계정상태를 변경하시겠습니까?");
		if(check == true) { 
			var dlvr_no = parseInt($(this).attr("dlvr_no"));
			var selectValue = $(this).parent().prev().find("select").val();
				console.log(dlvr_no);
				console.log(selectValue);
			var url = "/admin/deliverStateUpdate"
			var sendData = {
				"dlvr_no" : dlvr_no ,
				"dlvr_state" : selectValue
			};
			$.post(url, sendData, function(updateResult){
				if(updateResult == "update_success") {
					console.log(updateResult);
					alert("변경 완료");
				}
			});
		}
	});
	
});