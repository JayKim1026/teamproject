<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 로그인 페이지</title>
<%@ include file="../include/link.jsp" %>
<link rel="stylesheet" href="/resources/css/loginForm.css">
</head>
<%@include file="../include/header.jsp" %>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/resources/images/delivery_illust_logo.jpg" id="icon" alt="User Icon" />
      <h1>관리자 로그인</h1>
    </div>

    <!-- Login Form -->
    <form id="frmLogin" action="/admin/loginRun" method="POST">
  	  
      <input type="text" id="login_id" class="fadeIn second" name="admin_id" placeholder="아이디">
      <input type="password" id="login_pw" class="fadeIn third" name="admin_pw" placeholder="비밀번호">
      <input type="submit" class="fadeIn fourth" id="btnLogin">
    </form>
	
    <!-- Remind Passowrd -->
    <div id="formFooter">
     <ul class="underline">
     		
<!--      	<li><a class="underlineHover" href="/account/registerForm">회원가입</a></li> -->
<!--      	<li><a class="underlineHover" href="/account/findAccountForm">아이디 찾기</a></li> -->
<!--      	<li><a class="underlineHover" href="#">비밀번호 찾기</a></li> -->
     </ul> 
    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>
$(function(){
	var login_result = "${login_result}";
	if(login_result == "login_fail") {
		alert("아이디 또는 비밀번호를 확인해주세요");
	}
	
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
</html>