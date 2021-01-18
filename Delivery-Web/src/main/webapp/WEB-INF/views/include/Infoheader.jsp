<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ include file="../css/include.css"%>
<header>
<div class="container-fluid" id="head_Container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
					<div class="col-md-2">
						<div id="wrapper">
							<div class="overlay"></div>

							<!-- Sidebar -->
							<nav class="navbar navbar-inverse navbar-fixed-top"
								id="sidebar-wrapper" role="navigation">
								<ul class="nav sidebar-nav">
									<li class="sidebar-brand"><a href="#"> 메뉴 </a></li>
									<c:if test="${sessionScope.userVo != null }">
									<li><a href="/user/info">회원정보</a></li>
									<li><a href="/order/orderForm">주문하기</a></li>
									<li><a href="/user/orderList">주문 내역 조회</a></li>
									<li><a href="/CSCenter/FAQ">자주하는 질문</a></li>
									</c:if>
									
									<c:if test="${sessionScope.deliverVo != null }">
									<li><a href="/deliver/info">회원정보</a></li>
									<li><a href="/deliver/deliveryList">배달 내역 조회</a></li>
									<li><a href="#">1:1 문의</a></li>
									<li><a href="#">자주하는 질문</a></li>
									</c:if>
									
								</ul>
							</nav>
							<!-- /#sidebar-wrapper -->

							<!-- Page Content -->
							<div id="page-content-wrapper">
								<button type="button" class="hamburger is-closed"
									data-toggle="offcanvas">
									<span class="hamb-top"></span> <span class="hamb-middle"></span>
									<span class="hamb-bottom"></span>
								</button>
								<div class="container">
									<div class="row">
										<div class="col-lg-8 col-lg-offset-2">
											
											
										</div>
									</div>
								</div>
							</div>
							<!-- /#page-content-wrapper -->

						</div>
					</div>
					<div class="col-md-8">
					<a class="main-logo" href="/">뚜벅뚜벅COMPANY</a>
					<div class="loginMenu" style="float:right; width: 80px;">
						<c:choose>
							<c:when test ="${sessionScope.userVo == null && sessionScope.deliverVo == null}">
								<a class="main-menu" id="main_login" href="/account/loginForm">로그인</a>
								<a class="main-menu" id="main_Joinus" href="/account/registerForm">회원가입</a>
							</c:when>
							<c:otherwise>
								<a class="main-menu" id="main_logout" href="/account/logout">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</div>
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