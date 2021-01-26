function getWaitingOrderList() {
	var url = "/admin/getWaitingOrderList"
	$.post(url, function(data) {
		console.log(data);
		$("#waitingOrderTable > #waitingOrderTableTbody").empty();
		$.each(data, function() {
			var tr = $("#waitingOrdertrTable").find("tr").clone();
			tr = setList(this, tr, false, 0);
			tr.find("td").eq(8).find("button").attr("order_no", this.order_no);
			$("#waitingOrderTable > #waitingOrderTableTbody").prepend(tr);
		});
	});
}
function getAcceptOrderList(){
	var url = "/admin/getAcceptOrderList"
	$.post(url, function(data){
		$("#acceptOrderTable > #acceptOrderTableTbody").empty();
		console.log("접수주문:" + data);
		$.each(data, function() {
			var tr = $("#acceptOrdertrTable").find("tr").clone();
			tr = setList(this, tr, true, 3);
			$("#acceptOrderTable > #acceptOrderTableTbody").prepend(tr);
		});
	});
}

function getFinishOrderList(){
	var url = "/admin/getFinishOrderList"
	$.post(url, function(data){
		console.log("주문완료:"+data);
		$("#finishOrderTable > #finishOrderTableTbody").empty();
		$.each(data, function() {
			var tr = $("#finishOrdertrTable").find("tr").clone();
			tr = setList(this, tr, true, 4);
			$("#finishOrderTable > #finishOrderTableTbody").prepend(tr);
		});	
	});
}

function getCancelOrderList(){
	var url = "/admin/getCancelOrderList"
	$.post(url, function(data){
		console.log("사용자 주문 취소:"+data);
		$("#cancelOrderTable > #cancelOrderTableTbody").empty();
		$.each(data, function() {
			var tr = $("#cancelOrdertrTable").find("tr").clone();
			tr = setList(this, tr, false, 1);
			$("#cancelOrderTable > #cancelOrderTableTbody").prepend(tr);
		});	
	});
}

function  getCancelOrderListByDeliver(){
	var url = "/admin/getCancelOrderListByDeliver"
	$.post(url, function(data){
		console.log(data);
		$("#cancelOrderTableByDeliver > #cancelOrderTableTbodyByDeliver").empty();
		$.each(data, function() {
			var tr = $("#cancelOrdertrTableByDeliver").find("tr").clone();
			tr = setList(this, tr, true, 2);
			$("#cancelOrderTableByDeliver > #cancelOrderTableTbodyByDeliver").prepend(tr);
		});	
	});
}

function setList(data, tr, isConnected, num) {
	tr.find("td").eq(0).text(data.order_no);
	tr.find("td").eq(1).text(data.order_req);
	tr.find("td").eq(2).text(data.order_date);
	if(isConnected) {
		tr.find("td").eq(3).text(data.dlvr_name);
	} else {
		tr.find("td").eq(3).text("배정안됨");
	}
	tr.find("td").eq(4).text(data.user_name);
	tr.find("td").eq(5).text(data.ca_detail);
	tr.find("td").eq(6).find("option:eq(" + num + ")").attr("selected", "selected");
	tr.find("td").eq(7).find("button").attr("order_no", data.order_no);
	return tr;
}

$(function() {
	getWaitingOrderList()
	getAcceptOrderList()
	getFinishOrderList()
	getCancelOrderList()
	getCancelOrderListByDeliver()
	
	$("#finishOrderTableTbody, #waitingOrderTableTbody, #acceptOrderTableTbody, #cancelOrderTableTbody, #cancelOrderTableTbodyByDeliver").on("click", ".btnModify", function(){
		
		var order_no = parseInt($(this).attr("order_no"));
		var order_state = $(this).parent().prev().find(":selected").val();
		console.log(order_no);
		console.log("order_state:" + order_state);
		var sendData = {
			"order_no"	:	order_no,
			"order_state":	order_state
		};
		var url = "/admin/updateOrderState"
		$.post(url, sendData, function(data){
			if(data =="success"){
				location.reload();
// 				if(order_state == "3-001"){
// 					$("#nav-home-tab").trigger("click");
// 				}else if(order_state == "3-002"){
// 					$("#nav-profile-tab").trigger("click");
// 				}else if(order_state == "3-003"){
// 					$("#nav-contact-tab").trigger("click");
// 				}else if(order_state == "3-004"){
// 					$("#nav-contact-tab2").trigger("click");
// 				}else if(order_state = "3-005"){
// 					$("#nav-contact-tab3").trigger("click");
// 				}
			}
		});
	});
});