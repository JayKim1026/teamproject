<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../css/registerForm.css"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/1190a8ce02.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<title>Register Form Page</title>

</head>
<body>
<!-- 일반회원가입 폼 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 register_wrapper" >
				<div class="register_title">사용자 가입</div>
				<form role="form" action="/user/registerRun" method="post">
					<div class="form-group">
					 	<label for="user_id"> 아이디 </label>
						<input type="text" class="form-control" id="user_id" name="user_id" required />
						<span class="id_state">TODO 탈퇴한 아이디 인지, 이미 가입된 아이디 인지 확인하기, 숫자</span>
					</div>
					
					<div class="form-group">
						<label for="user_pw"> 비밀번호 </label>	
						<input type="password" class="form-control" id="user_pw" name="user_pw" required/>
						<span class="pw_state">사용불가 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</div>
					
					<div class="form-group">
						<label for="user_pw2"> 비밀번호 확인 </label>
						<input type="password" class="form-control" id="user_pw2" name="user_pw2" required />
						<span class="pw_check">비밀번호 같은지 확인</span>
					</div>
					
					<div class="form-group">
						<label for="user_name"> 이름 </label>
						<input type="text" class="form-control" id="user_name" name="user_name" required>
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
						<input type="text" class="form-control" id="user_phone" name="user_phone"  required />
						<span><!--  --></span>
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
				</div>
			</div>
			<!--// 회원가입 폼  -->
			<div class="col-md-4"></div>
		</div>
</body>
<script>
$(function(){
		
	//TODO 이름칸에 한글만 입력 가능.
	$("#user_name").keyup(function(){
		var user_name = $("#user_name").val();
		var chk_user_name = "";
		for(var i = 0; i < user_name.length; i++){
			chk_user_name = user_name.charCodeAt(i);
			if(chk_user_name < 45032 || 55203 < chk_user_name ){
				$(".name_state").text("특수기호, 숫자 , 영어 입력 불가능합니다").css("color", "red");
			} else {
				$(".name_state").text("");
			} 
		}
	});
	
	//TODO 아이디 중복확인
	$("#user_id").keyup(function(){
		var user_id = $("#user_id").val();
		var chk_user_id = "";
		for(var i = 0; i < user_id.length; i++){
			chk_user_id = user_id.charCodeAt(i)
			if((47 < chk_user_id && chk_user_id < 58  ) || (64 < chk_user_id && chk_user_id < 91) || (96 < chk_user_id && chk_user_id < 123)){
				$(".id_state").text("사용가능").css("color", "green");
			} else {
				$(".id_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
			}
		}
	});
		
	//TODO 전화번호 숫자만 가능하게.					
		
	// user_pw 숫자, 영어 대소문자만 입력 가능. 
	// TODO 자릿수 8자에서 16자
	$("#user_pw").keyup(function(){
		var user_pw = $(this).val();
		var chk_user_pw = "";
		for(var i = 0; i < user_pw.length; i++){
			chk_user_pw = user_pw.charCodeAt(i);
			console.log(chk_user_pw);
			if((47 < chk_user_pw && chk_user_pw < 58  ) || (64 < chk_user_pw && chk_user_pw < 91) || (96 < chk_user_pw && chk_user_pw < 123)){
				$(".pw_state").text("사용가능").css("color", "green");
			} else {
				$(".pw_state").text("특수기호, 한글은 입력이 불가능합니다").css("color", "red");
			} 
		}
	});
	
	// user_pw2 user_pw랑 일치하는지 확인
	$("#user_pw2").keyup(function(){
		var user_pw = $("#user_pw").val();
		var user_pw2 = $("#user_pw2").val();
		
		if(user_pw != user_pw2){
			$(".pw_check").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		
		} else {
			$(".pw_check").text("비밀번호가 일치합니다.").css("color", "green");
			
		}
	});
		
	
		
	
	
}); // 핸들러
</script>
</html>