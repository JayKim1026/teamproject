package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.UserVo;

public interface AdminService {

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
	
	/* 일반멤버 리스트*/
	public List<UserVo> getMemberList();
	/*----- 일반회원 리스트 끝 -----*/
	
	/*----- 배달원 리스트 -----*/
	public List<DeliverVo> getDeliverList();
	/*----- 배달원 리스트 끝 -----*/
	
	/*----- 가입 대기중 배달원 리스트 -----*/
	public List<DeliverVo> getWaitingDeliverList();
	/*----- 가입 대기중 배달원 리스트 끝 -----*/
	
	/*----- 회원정보 수정정보 받아오기-----*/
	public UserVo getMemberInfo(int user_no);
	/*----- 회원정보 수정정보 받아오기 끝 -----*/
	
}
