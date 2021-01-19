<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../css/findAccountForm.css"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="../include/link.jsp"%>
<title>findAccount.jsp</title>
</head>

<%@include file="../include/header.jsp"%>

<body id="body_wrap">
	<div class="container-fluid" id="body_Container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4"></div>
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
								<input type="text" class="form-control" id="" name="user_phone" />
							</div>
							<button type="submit" class="btn btn-primary">비밀번호 발송</button>
						</form>
					</div>
					<div class="col-md-4"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../include/footer.jsp"%>

</html>