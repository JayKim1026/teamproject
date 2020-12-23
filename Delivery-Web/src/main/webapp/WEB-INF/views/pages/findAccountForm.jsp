<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../css/findAccountForm.css"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=604ec3b26177328871e555f2b188cf12"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/1190a8ce02.js"
	crossorigin="anonymous"></script>
<title>findAccount.jsp</title>
</head>
<body>
<header>
<div class="container-fluid" id="head_Container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
					<a class="main-menu" id="main_login" href="/user/loginForm">로그인</a>
					<a class="main-menu" id="main_Joinus" href="/user/registerForm">회원가입</a>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</header>

<body id="body_wrap">
<div class="container-fluid" id="body_Container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4" id="find_form">
					<form role="form" action="/user/findAccountRun" method="post">
					
						<div class="form-group">
							<label for="exampleInputEmail1">이름</label>
							<input type="text" class="form-control" id="" name="user_name" />
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">이메일 주소</label>
							<input type="text" class="form-control" id="" name="user_email" />
						</div>
							
						<div class="form-group">
							<label for="exampleInputPassword1">휴대폰 번호</label>
							<input type="text" class="form-control" id="" name="user_phone"/>
						</div>
	
						<button type="submit" class="btn btn-primary">비밀번호 발송</button>
					</form>
				</div>
				
				<div class="col-md-4">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<footer class="container-fluid text-center bg-lightgray" id="footer">

        <div class="copyrights" style="margin-top:25px;">
            <p>뚜벅뚜벅COMPANY © 2020, All Rights Reserved
                <br>
                <span>Web Design By: PL&K </span></p>
<!--             <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p> -->
        </div>
</footer>
</body>
</html>