<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../css/loginForm.css"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form Page</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/resources/images/delivery_illust_logo.jpg" id="icon" alt="User Icon" />
      <h1>Welcome!</h1>
    </div>

    <!-- Login Form -->
    <form action="/user/loginRun", method="POST">
      <input type="text" id="user_id" class="fadeIn second" name="user_id" placeholder="아이디">
      <input type="text" id="user_pw" class="fadeIn third" name="user_pw" placeholder="비밀번호">
      <input type="submit" class="fadeIn fourth" value="로그인">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
     <ul class="underline">
     	<li><a class="underlineHover" href="#">회원가입</a></li>
     	<li><a class="underlineHover" href="#">아이디 찾기</a></li>
     	<li><a class="underlineHover" href="#">비밀번호 찾기</a></li>
     </ul> 
    </div>

  </div>
</div>
</body>
</html>