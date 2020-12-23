<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">												
<title>Login Form Page</title>

<%@ include file="../include/link.jsp" %>
<%@ include file="../css/loginForm.css"%>
</head>
<%@include file="../include/header.jsp" %>
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
    <form id="frmLogin" action="/user/loginRun" method="POST">
  	  <input type="radio" class="check_who" id="check_user" name="check_who" value="일반회원" checked>일반회원
  	  <input type="radio" class="check_who" id="check_dlvr" name="check_who" value="라이더 회원">라이더 회원
      <input type="text" id="login_id" class="fadeIn second" name="user_id" placeholder="아이디">
      <input type="password" id="login_pw" class="fadeIn third" name="user_pw" placeholder="비밀번호">
      <input type="submit" class="fadeIn fourth" value="로그인" id="btnLogin">
    </form>
	
    <!-- Remind Passowrd -->
    <div id="formFooter">
     <ul class="underline">
     	<li><a class="underlineHover" href="/user/registerForm">회원가입</a></li>
     	<li><a class="underlineHover" href="/user/findAccountForm">아이디 찾기</a></li>
     	<li><a class="underlineHover" href="#">비밀번호 찾기</a></li>
     </ul> 
    </div>
  </div>
</div>

<script>
$(function(){
	// 일반회원으로 로그인, 라이더 회원으로 로그인 구분
	$(".check_who").click(function(){
		var check_who = $(this).val();
		if(check_who == "라이더 회원"){
			$("#frmLogin").attr("action", "/deliver/loginRun");
			$("#login_id").attr("name", "dlvr_id");
			$("#login_pw").attr("name", "dlvr_pw");
		} else {
			$("#frmLogin").attr("action", "/user/loginRun");
			$("#login_id").attr("name", "user_id");
			$("#login_pw").attr("name", "user_pw");
		}
	});
});
</script>
<%@ include file="../include/footer.jsp" %>