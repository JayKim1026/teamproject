package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;

public interface AdminDao {
	
	/* 신규 가입자 신규 기준은 하루*/
	
	/*Login*/
	public AdminVo login(String admin_id, String admin_pw);
	/* ----- 회원관련 카운트 -----*/
	/*신규 일반회원 카운트*/
	public int getNewMemberCount();
	/*신규 회원가입 대기중인 배달원 카운트*/
	public int getWaitingDeliveryCount();
	/*신규 배달원 카운트*/
	public int getNewDeliveryCount();
	/* 일반회원 카운트 */
	public int getTotalMemberCount();
	/* 배달원 카운트 */
	public int getTotalDeliveryCount();
	/* ----- 회원관련 카운트 끝 -----*/
	
	/*----- 주문관련 카운트 -----*/
	/*새로운 주문 요청*/
	public int getRequestedOrderCount();
	/*진행중 주문*/
	public int getOrderInProgressCount();
	/*완료된 주문*/
	public int getFinishedOrderCount();
	/*전체 완료된 주문*/
	public int getTotalFinishedOrderCount();
	/*전체 취소된 주문*/
	public int getTotalCanceledOrderCount();
	/*배달 취소*/
	public int getTotalCanceledDeliverCount();
	
	/*----- 주문관련 카운트 끝 -----*/
	
	/*----- 게시판 관련 카운트 -----*/
	/*신규 일반글*/
	public int getNewPostCount();
	/*신규 리뷰*/
	public int getNewReviewCount();
	/*신규 공지*/
	public int getNewNoticeCount();
	/*전체 일반글*/
	public int getTotalPostCount();
	/*전체 리뷰*/
	public int getTotalReviewCount();
	/*----- 게시판 관련 카운트 끝-----*/
	
	/*----- 신고 관련 카운트 -----*/
	/*신규 신고대기*/
	public int getNewRequestedReportCount();
	/*신규 일반글 신고*/
	public int getNewPostReportCount();
	/*신규 댓글 신고*/
	public int getNewCommentReportCount();
	/*전체 게시물 신고 */
	public int getTotalPostReportCount();
	/*전체 댓글 신고*/
	public int getTotalCommentReportCount();
	/*완료된 신고*/
	public int getFinishedReportCount();
	/*----- 신고 관련 카운트 끝-----*/
	
	/*----- 회원(배달원+일반원 리스트) -----*/
	/*일반회원 리스트  */
	public List<UserVo> getMemberList();
	/*배달원 리스트*/
	public List<DeliverVo> getDeliverList();
	/*가입 대기중 배달원 리스트*/
	public List<DeliverVo> getWaitingDeliverList();
	/*----- 회원(배달원+일반원 리스트)끝 -----*/
	
	/*----- 계정 상태 수정-----*/
	public String userStateUpdate(int user_no, String user_state);
	public String deliverStateUpdate(int dlvr_no, String dlvr_state);
	/*----- 계정 상태 수정 끝 -----*/
	
	/*----- 주문 목록 + 현황 수정 -----*/
	/*대기중인 주문 목록*/
	public List<OrderVo> getWaitingOrderList();
	/*접수된 주문 목록*/
	public List<OrderVo> getAcceptOrderList();
	/*완료된 주문목록*/
	public List<OrderVo> getFinishOrderList();
	/*주문자 취소 목록*/
	public List<OrderVo> getCancelOrderList();
	/*배달원 취소 목록*/
	public List<OrderVo> getCancelOrderListByDeliver();
	/*배달현황 수정*/
	public void updateOrderState(int order_no, String order_state);
	/*----- 주문 목록 + 현황 수정 끝 -----*/
	
	/*----- 게시판(일반글 + 리뷰 + 공지) 목록 + 글 삭제-----*/
	/*일반글 목록*/
	public List<TimelineVo> getPostList();
	/*리뷰 목록*/
	public List<TimelineVo> getReviewList();
	/*공지 목록*/
	public List<TimelineVo> getNoticeList();
	/*글 삭제*/
	public void deleteArticle(int time_no);
	/*----- 게시판(일반글 + 리뷰 + 공지) 목록 + 글 삭제 끝 -----*/
	
	/*----- 신고 목록 + 처리-----*/
	/*신고대기 목록*/
	public List<ReportVo> getReportList();
	/* 신고접수 목록*/
	public List<ReportVo> getAcceptReportList();
	/* 신고취소 목록*/
	public List<ReportVo> getCancelReportList();
	/* 신고상태 변경*/
	public void updateReportState(int report_no, String report_state);
	/*----- 신고 목록 + 처리 끝-----*/
}