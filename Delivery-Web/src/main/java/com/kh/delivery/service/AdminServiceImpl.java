package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.AdminDao;
import com.kh.delivery.domain.AccountDto;
import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.UserVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDao adminDao;
	
	/* Login */
	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		AdminVo adminVo = adminDao.login(admin_id, admin_pw);
		return adminVo;
	}
	/*------ 회원관련 리스트 끝 -----*/
	/* 신규회원 */
	@Override
	public int getNewMemberCount() {
		int count = adminDao.getNewMemberCount();
		return count;
	}
	
	/* 신규 가입대기 배달원 */
	@Override
	public int getWaitingDeliveryCount() {
		int count = adminDao.getWaitingDeliveryCount();
		return count;
	}

	/* 신규 배달원 */
	@Override
	public int getNewDeliveryCount() {
		int count = adminDao.getNewDeliveryCount();
		return count;
	}
	
	/* 전체 일반회원 */
	@Override
	public int getTotalMemberCount() {
		int count = adminDao.getTotalMemberCount();
		return count;
	}

	/* 전체 배달원 */
	@Override
	public int getTotalDeliveryCount() {
		int count = adminDao.getTotalDeliveryCount();
		return count;
	}
	/*------ 회원관련 리스트 끝 ------*/
	
	/*----- 주문관련 리스트 -----*/
	/*주문 요청 리스트*/
	@Override
	public int getRequestedOrderCount() {
		int count = adminDao.getRequestedOrderCount();
		return count;
	}
	
	/*진행중 주문*/
	@Override
	public int getOrderInProgressCount() {
		int count = adminDao.getOrderInProgressCount();
		return count;
	}
	
	/*완료된 주문*/
	@Override
	public int getFinishedOrderCount() {
		int count = adminDao.getFinishedOrderCount();
		return count;
	}
	
	/*전체 완료된 주문*/
	@Override
	public int getTotalFinishedOrderCount() {
		int count = adminDao.getTotalFinishedOrderCount();
		return count;
	}
	
	/*취소된 주문*/
	@Override
	public int getTotalCanceledOrderCount() {
		int count = adminDao.getTotalCanceledOrderCount();
		return count;
	}
	
	/*배달 취소*/
	@Override
	public int getTotalCanceledDeliverCount() {
		int count = adminDao.getTotalCanceledDeliverCount();
		return count;
	}
	
	/*----- 주문관련 리스트 끝 -----*/
	
	/*----- 게시글 관련 카운트 -----*/
	/*신규 일반글*/
	@Override
	public int getNewPostCount() {
		int count = adminDao.getNewPostCount();
		return count;
	}
	
	/*신규 리뷰*/
	@Override
	public int getNewReviewCount() {
		int count = adminDao.getNewReviewCount();
		return count;
	}
	
	/*신규 공지*/
	@Override
	public int getNewNoticeCount() {
		int count = adminDao.getNewNoticeCount();
		return count;
	}
	
	/*전체 일반글*/
	@Override
	public int getTotalPostCount() {
		int count = adminDao.getTotalPostCount();
		return count;
	}
	
	/*전체 리뷰*/
	@Override
	public int getTotalReviewCount() {
		int count = adminDao.getTotalReviewCount();
		return count;
	}
	/*----- 게시글 관련 카운트 끝 -----*/
	
	/*----- 신고 관련 카운트  -----*/
	/*신규 신고대기*/
	@Override
	public int getNewRequestedReportCount() {
		int count = adminDao.getNewRequestedReportCount();
		return count;
	}
	
	/*신규 일반글 신고*/
	@Override
	public int getNewPostReportCount() {
		int count = adminDao.getNewPostReportCount();
		return count;
	}
	
	/*신규 댓글 신고*/
	@Override
	public int getNewCommentReportCount() {
		int count = adminDao.getNewCommentReportCount();
		return count;
	}
	
	/* 전체 게시물 신고  */
	@Override
	public int getTotalPostReportCount() {
		int count = adminDao.getTotalPostReportCount();
		return count;
	}
	
	/* 전체 댓글 신고*/
	@Override
	public int getTotalCommentReportCount() {
		int count = adminDao.getTotalCommentReportCount();
		return count;
	}
	
	/* 완료된 신고 */
	@Override
	public int getFinishedReportCount() {
		int count = adminDao.getFinishedReportCount();
		return count;
	}
	/*----- 신고 관련 카운트 끝 -----*/
	
	/*----- 일반회원 리스트 -----*/
	@Override
	public List<UserVo> getMemberList() {
		List<UserVo> list = adminDao.getMemberList();
		return list;
	}
	/*----- 일반회원 리스트 끝 -----*/
	
	/*----- 배달원원 리스트 -----*/
	@Override
	public List<DeliverVo> getDeliverList() {
		List<DeliverVo> list = adminDao.getDeliverList();
		return list;
	}
	/*----- 배달원원 리스트 끝 -----*/
	
	/*----- 가입 대기 배달원원 리스트 -----*/
	@Override
	public List<DeliverVo> getWaitingDeliverList() {
		List<DeliverVo> list = adminDao.getWaitingDeliverList();
		return list;
	}
	/*----- 가입 대기 배달원원 리스트 끝-----*/
	
	/*----- 회원정보 가져오기-----*/
	@Override
	public UserVo getMemberInfo(int user_no) {
		UserVo userVo = adminDao.getMemberInfo(user_no);
		return userVo;
	}
	/*----- 회원정보 가져오기 끝-----*/
	
	/*대기중인 주문 목록*/
	@Override
	public List<OrderVo> getWaitingOrderList() {
		List<OrderVo> list = adminDao.getWaitingOrderList();
		return list;
	}
	
	/*접수된 주문 목록*/
	@Override
	public List<OrderVo> getAcceptOrderList() {
		List<OrderVo> list = adminDao.getAcceptOrderList();
		return list;
	}
	
	/*완료된 주문목록*/
	@Override
	public List<OrderVo> getFinishOrderList() {
		List<OrderVo> list = adminDao.getFinishOrderList();
		return list;
	}
	
	/*주문자 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderList() {
		List<OrderVo> list = adminDao.getCancelOrderList();
		return list;
	}
	
	/*배달원 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderListByDeliver() {
		List<OrderVo> list = adminDao.getCancelOrderListByDeliver();
		return list;
	}
	
}
