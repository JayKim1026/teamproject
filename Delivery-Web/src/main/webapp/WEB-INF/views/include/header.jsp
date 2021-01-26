<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/include.css">
<header>
<div class="container-fluid" id="head_Container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
					<a class="main-menu" id="main_login" href="/account/loginForm">로그인</a>
					<a class="main-menu" id="main_DlvrJoinus" href="/account/dlvr_RegisterForm">뚜벅이 지원</a>
					<a class="main-menu" id="main_Joinus" href="/account/registerForm">사용자 가입</a>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</header>
<script>
$(document).ready(function () {
	  var trigger = $('.hamburger'),
	      overlay = $('.overlay'),
	     isClosed = false;

	    trigger.click(function () {
	      hamburger_cross();      
	    });

	    function hamburger_cross() {

	      if (isClosed == true) {          
	        overlay.hide();
	        trigger.removeClass('is-open');
	        trigger.addClass('is-closed');
	        isClosed = false;
	      } else {   
	        overlay.show();
	        trigger.removeClass('is-closed');
	        trigger.addClass('is-open');
	        isClosed = true;
	      }
	  }
	  
	  $('[data-toggle="offcanvas"]').click(function () {
	        $('#wrapper').toggleClass('toggled');
	  });  
	});
</script>