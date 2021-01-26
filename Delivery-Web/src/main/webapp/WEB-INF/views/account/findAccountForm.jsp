<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/findAccountForm.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp"%>
<title>계정 찾기 페이지</title>
</head>
<%@include file="../include/header.jsp"%>
<script>
$(function() {
	$("#btnFindAccount").click(function() {
		var text = $(this).text();
		console.log(text);
		var sendData = {
				'acc_name'	:	$("#acc_name").val(), 
				'acc_email'	:	$("#acc_email").val(), 
				'acc_phone'	:	$("#acc_phone").val()
		};
		if(text == '아이디 조회') {
			var url = "/account/findAccountId";	
			$.post(url, sendData, function(data) {
				if(data != null || data != "") {
					var cutData = data.substring(0, data.length-3);
					$("#span_acc_id").text("아이디는 : " + cutData + "*** 입니다. (뒤의 3자리는 가림)");
					$("#div_acc_id").css("display", "block");
					$("#acc_id_form").css("display", "block").focus();
				} else {
					alert("일치하는 정보가 없습니다");
				}
			});
			$(this).text('비밀번호 발송');
		} else if(text == '비밀번호 발송') {
			var url = "/account/sendAccountPw";
			sendData["acc_id"] = $("#acc_id").val();
			$.post(url, sendData, function(data) {
				if(data == 'sendAccountPw_success') {
					alert("이메일로 비밀번호를 전송했습니다");
					location.href = "/account/loginForm";
				} else {
					alert("일치하는 정보가 없습니다");
				}
			});
		}
	});
});
</script>
<body id="body_wrap">
	<div class="container-fluid" id="body_Container" style="height: 700px">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4" id="find_form">
							<div class="form-group" id="acc_id_form" style="display: none">
								<label for="inputId">아이디</label>
								<input type="text" class="form-control" id="acc_id" name="acc_id" />
							</div>
							<div class="form-group">
								<label for="inputName">이름</label>
								<input type="text" class="form-control" id="acc_name" name="acc_name" />
							</div>
							<div class="form-group">
								<label for="inputEmain">이메일 주소</label> 
								<input type="text" class="form-control" id="acc_email" name="acc_email" />
							</div>
							<div class="form-group">
								<label for="inputPhone">휴대폰 번호</label> 
								<input type="text" class="form-control" id="acc_phone" name="acc_phone" />
							</div>
							<div class="form-group" id="div_acc_id" style="display: none">
								<span id="span_acc_id" style="font-size: 24px"></span>
							</div>
							<button type="button" class="btn btn-primary" id="btnFindAccount">아이디 조회</button>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../include/footer.jsp"%>

</html>