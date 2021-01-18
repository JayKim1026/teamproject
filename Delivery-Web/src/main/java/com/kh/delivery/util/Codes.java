package com.kh.delivery.util;

public interface Codes {

	// 이미지 파일 버킷 주소
	String BUCKET_URL = "https://delivery-img2.s3.ap-northeast-2.amazonaws.com/";
	
	// 버킷 내 폴더 이름
	String DLVR_IMG = "Dlvr_Img/";
	String DLVR_IDCARD = "Dlvr_IDCard/";
	String USER_IMG = "User_Img/";
	String TIMELINE_IMG = "Timeline_Img/";
    String MESSAGE_IMG = "Message_Img/";
    
    // 포인트 코드
    String DELIVERY_SUCCESS = "7-001"; // 배달완료
    String ORDER_SUCCESS = "7-002"; // 주문완료
    String WRITE_TIMELINE = "7-003"; // 글쓰기
    String WRITE_COMMENT = "7-004"; // 댓글쓰기
    String REPORT = "7-005"; // 신고하기
    String REPORTED = "7-006"; // 신고당함(?)
    // 포인트 스코어
    int DELIVER_SUCCESS_POINT = 20;
    int ORDER_SUCCESS_POINT = 20;
    int WRITE_TIMELINE_POINT = 10;
    int WRITE_COMMENT_POINT = 5;
    int REPORT_POINT = 5;
    int REPORTED_POINT = -20;
}
