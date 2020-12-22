<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../css/registerForm.css"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">												
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">												
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>												
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>												
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	
<title>Register Form Page</title>

</head>
<body>
	<h1>회원가입</h1>
<!-- 회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<form role="form" action="/user/registerRun" method="post">
					<div class="form-group">
						<label for="user_id"> 아이디 </label>
						<input type="text" class="form-control" id="user_id" name="user_id" required />
						<span id="dupCheckResult"><!-- TODO 탈퇴한 아이디 인지, 이미 가입된 아이디 인지 확인하기. --></span>
					</div>
					
					<div class="form-group">
						<label for="user_pw"> 비밀번호 </label>	
						<input type="password" class="form-control" id="user_pw" name="user_pw" required/>
						<span class="pw_state"><!-- 사용불가 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요. --></span>
					</div>
					
					<div class="form-group">
						<label for="user_pw2"> 비밀번호 확인 </label>
						<input type="password" class="form-control" id="user_pw2" name="user_pw2" required />
						<span class="pw_check"><!-- 비밀번호 같은지 확인 --></span>
					</div>
					
					<div class="form-group">
						<label for="user_name"> 이름 </label>
						<input type="text" class="form-control" id="user_name" name="user_name" required>
						<span class="name_state"><!--  --></span>
					</div>

					<div>
					<label>주소</label><br/>
					<%@ include file="../util/address.jsp" %>
					</div>
					
					<div class="form-group">
					<br/>
						<label for="user_phone"> 전화번호 </label>
						<input type="text" class="form-control" id="user_phone" name="user_phone" required placeholder="숫자만 입력해 주세요"/>
					</div>
					
					<div class="form-group">
						<label for="user_email"> 이메일 </label>
						<input type="text" class="form-control" id="user_email" name="user_email" required />
					</div>
					
					<!-- <div class="form-group">
						<label for="user_acc_num"> 계좌번호 </label>
						<input type="text" class="form-control" id="user_acc_num" />
					</div> -->
					
					<button type="submit" class="btn btn-primary" id="btnRegister">가입완료</button>
				</form>
				<script>
				$(function(){
					$("#btnRegister").click(function(){
						//TODO 이름 확인 한글만 가능하게.
						//TODO 아이디 중복확인
						//TODO 전화번호 숫자만 가능하게.					
						// 비밀번호 확인
					
						/*
						var user_pw = $("#user_pw").val();
						var user_pw2 = $("#user_pw2").val();
						
						if(user_pw != user_pw2){
							$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
						
						} else {
							$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
							
						}
						*/
						
					});
					
				});
				</script>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>