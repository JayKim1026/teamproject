<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/link.jsp" %>
<%@include file="../css/timeline.css" %>
<meta charset="UTF-8">
<title>timeLine.jsp</title>
</head>
<script>
$(function(){

	
	$.ajax({
		
	});
});
</script>
<body>
<%@include file="../include/timelineHeader.jsp" %>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
							<div class="form-group">
								
								<label>글쓰기</label> <input type="hidden"
									value="${userVo.user_no}" name="user_no">
								<textarea class="form-control" id="textArea" name="review_content"></textarea>
								<button class="btn btn-primary" id="submitBtn">글쓰기</button>
							</div>
						
			
						<div class="timeline-centered timeline-centered-location">
							<!-- 글 출력 -->
							<article class="timeline-entry">
								
								<div class="timeline-entry-inner">
																				
									<div class="timeline-icon bg-success">
										<i class="entypo-feather"></i>
									</div>
									
									<div class="timeline-label">
										<h2>
											<a href="#">Art Ramadani</a> <span>posted a statusupdate</span>
										</h2>
										<p>Tolerably earnestly middleton extremely distrusts she
											boy now not. Add and offered prepare how cordial two promise.
											Greatly who affixed suppose but enquire compact prepare all
											put. Added forth chief trees but rooms think may.</p>
									</div>
								</div>
								
							</article>
							<!--// 글 출력 끝 -->
												
							<!-- 새로고침 버튼 -->
							<article class="timeline-entry begin">
							
								<div class="timeline-entry-inner">
								
									<div class="timeline-icon"
										style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);">
										<i class="entypo-flight"></i> +
									</div>
									
								</div>
								
							</article>
							<!--// 새로고침 버튼 끝-->
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
										
<%@include file="../include/footer.jsp" %>
</body>
</html>