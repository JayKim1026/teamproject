<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../css/registerForm.css"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<%@ include file="../include/link.jsp" %>
</head>
<body>
<%@include file="../include/header.jsp" %>
<!-- 일반회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 register_wrapper" >
				<div class="register_title">사용자 가입</div>
				<form role="form" action="/user/registerRun" method="post">
					<div class="form-group">
					 	<label for="user_id"> 아이디 </label>
						<input type="text" class="form-control" id="user_id" name="user_id" required maxlength="16"/>
						<span class="id_state" id="checkIdDupl"></span>
					</div>
					
					<div class="form-group">
						<label for="user_pw"> 비밀번호 </label>	
						<input type="password" class="form-control" id="user_pw" name="user_pw" required maxlength="16"/>
						<span class="pw_state">사용불가 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</div>
					
					<div class="form-group">
						<label for="user_pw2"> 비밀번호 확인 </label>
						<input type="password" class="form-control" id="user_pw2" name="user_pw2" required maxlength="16"/>
						<span class="pw_check">비밀번호 같은지 확인</span>
					</div>
					
					<div class="form-group">
						<label for="user_name"> 이름 </label>
						<input type="text" class="form-control" id="user_name" name="user_name" required maxlength="8">
						<span class="name_state"><!-- 한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가) --></span>
					</div>
					
					<div>
						<label for="user_birth"> 생년 월일 </label>
						<div class="form-group registerForm_birth">
						<span class="span_box">
							<input type="text" class="form-control" id="user_birth_year" name="user_birth" placeholder="년(4자)" aria-label="년(4자)" maxlength="4">
						</span>
						<span class="span_box">
							<select id="user_birth_month" class="sel" name="user_birth" aria-label="월">
								<option selected>월</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
							</span>
							<span class="span_box">
							<input type="text" class="form-control" id="user_birth_day" name="user_birth" aria-label="일" placeholder="일" maxlength="2">
							</span>
						</div>
					</div>
					
					<div>
					<label>주소</label><br/>
					<%@ include file="../util/address.jsp" %>
					</div>
					
					<div class="form-group">
					<br/>
						<label for="user_phone"> 전화번호 </label>
						<input type="text" class="form-control" id="user_phone" name="user_phone"  required maxlength="16"/>
						<span class="phone_state"></span>
					</div>
					
					<div class="form-group">
						<label for="user_email"> 이메일 </label>
						<input type="text" class="form-control" id="user_email" name="user_email" required/>
						<span class="email_state"></span>
					</div>
					
					<!-- <div class="form-group">
						<label for="user_acc_num"> 계좌번호 </label>
						<input type="text" class="form-control" id="user_acc_num" />
					</div> -->
					
					<button type="submit" class="btn btn-primary" id="btnRegister">가입완료</button>
				</form>
				</div>
			</div>
			<!--// 회원가입 폼  -->
			<div class="col-md-4"></div>
		</div>
		<footer class="container-fluid text-center bg-lightgray" id="footer">
	        <div class="copyrights" style="margin-top:25px;">
         	   <p>뚜벅뚜벅COMPANY © 2020, All Rights Reserved
               <br>
               <span>Web Design By: PL&K </span></p>
<!-- <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p> -->
        	</div>
		</footer>
</body>
<script>
$(function(){
	//<아이디칸>사용 가능한 아이디(영어 대소문자, 숫자) 
	$("#user_id").keyup(function() {
		var user_id = $("#user_id").val();
		var chk_user_id = "";
		var result = true;
		if(user_id == "" || user_id == null) {
			$(".id_state").text("");
		} else {
			for(var i = 0; i < user_id.length; i++) {
				chk_user_id = user_id.charCodeAt(i)
				if((47 < chk_user_id && chk_user_id < 58  ) || (64 < chk_user_id && chk_user_id < 91) || (96 < chk_user_id && chk_user_id < 123)){
					$(".id_state").text("사용가능").css("color", "green");
				} else {
					result = false;
					$(".id_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
					break;
				}
			}
		}
		//<아이디칸>아이디 중복확인
		if(result) {
			var url = "/user/checkIdDupl";
			var user_id = $("#user_id").val();
			sendData = {
					"user_id" :  user_id
			};
			$.get(url, sendData, function(data){
				if(data == true){
					$(".id_state").text("멋진 아이디네요!").css("color", "green");
				} else {
					$(".id_state").text("이미 사용 중이거나, 탈퇴한 아이디 입니다.").css("color", "red");
				}
			});// ajax
		}// 중복확인 if
	});// id keyup
	
	// <비밀번호칸> 숫자, 영어 대소문자만 입력 + TODO 자릿수 8자에서 16자
	$("#user_pw").keyup(function(){
		var user_pw = $(this).val();
		var chk_user_pw = "";
		if(user_pw == "" || user_pw == null){
			$(".pw_state").text("");
		} else {
			for(var i = 0; i < user_pw.length; i++){
				chk_user_pw = user_pw.charCodeAt(i);
				console.log(chk_user_pw);
				if((47 < chk_user_pw && chk_user_pw < 58  ) || (64 < chk_user_pw && chk_user_pw < 91) || (96 < chk_user_pw && chk_user_pw < 123)){
					$(".pw_state").text("사용가능").css("color", "green");
				} else {
					$(".pw_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
					break;
				} 
			}
		}
	});
	
	// <비밀번호 확인칸 > user_pw2 user_pw랑 일치하는지 확인
	$("#user_pw2").keyup(function() {
		var user_pw = $("#user_pw").val();
		var user_pw2 = $("#user_pw2").val();
		if(user_pw2 == null || user_pw2 == ""){
			$(".pw_check").text("");
		} else {
			if(user_pw != user_pw2){
				$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
			} else {
				$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
			}
		}
	});
	
	//<이름칸>이름칸에 한글만 입력 가능.
	$("#user_name").keyup(function() {
		var user_name = $("#user_name").val();
		var chk_user_name = "";
		if(user_name == "" || user_name == null) {
			$(".name_state").text("");
		} else {
			for(var i = 0; i < user_name.length; i++){
				chk_user_name = user_name.charCodeAt(i);
				if(chk_user_name < 45032 || 55203 < chk_user_name ){
					$(".name_state").text("특수기호, 숫자 , 영어 입력 불가능합니다").css("color", "red");
					break;
				} else {
					$(".name_state").text("");
				} 
			}
		}
	});
	
	//<전화번호칸>TODO 전화번호 숫자만 가능하게.	
	$("#user_phone").keyup(function() {
		var user_phone = $(this).val();
		var chk_user_phone = "";
		if(user_phone == null || user_phone == "") {
			$(".phone_state").text("");
		} else {
			for(var i = 0; i < user_phone.length; i++) {
				chk_user_phone = user_phone.charCodeAt(i);
				if(47 < chk_user_phone && chk_user_phone < 57) {
					$(".phone_state").text("");
				} else {
					$(".phone_state").text("숫자만 입력해 주세요").css("color", "red");
					break;
				}
			}
		}
	});
	
	//<이메일칸> 양식 설정 ----@---.-----
 	$("#user_email").blur(function() {
		var user_email = $(this).val();
		var chk_user_email = "";
 		if(user_email == null || user_email == "") {
 			$(".email_state").text("");
 		} else {
 			var at = user_email.lastIndexOf("@");
			var dot = user_email.lastIndexOf(".");
			
 			for(var i = 0; i < user_email.length; i++){
 				chk_user_email = user_email.charCodeAt(i);
 				
 				
 			}
 		}
	});
	
	
}); // 핸들러
</script>
</html>