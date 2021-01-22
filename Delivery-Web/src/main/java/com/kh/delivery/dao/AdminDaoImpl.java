package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.AdminVo;
import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.ReportVo;
import com.kh.delivery.domain.TimelineVo;
import com.kh.delivery.domain.UserVo;


@Repository
public class AdminDaoImpl implements AdminDao {
	
	private final static String NAMESPACE = "com.kh.delivery.admin.";
	
	@Inject
	SqlSession sqlSession;
	
	/* Login */
	@Override
	public AdminVo login(String admin_id, String admin_pw) {
		Map<String, Object> map = new HashMap<>();
		map.put("admin_id", admin_id);
		map.put("admin_pw", admin_pw);
		
		AdminVo adminVo = sqlSession.selectOne(NAMESPACE + "login", map);
		
		return adminVo;
	}
	
	/*------ 회원관련 카운트  -----*/
	/* 신규회원 */
	@Override
	public int getNewMemberCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewMemberCount");
		System.out.println("count:"+ count);
		return count;
	}
	
	/* 신규 가입대기 배달원 */
	@Override
	public int getWaitingDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getWaitingDeliveryCount");
		return count;
	}
	
	/* 신규 배달원 */
	@Override
	public int getNewDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewDeliveryCount");
		return count;
	}

	/* 전체 일반회원 */
	@Override
	public int getTotalMemberCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalMemberCount");
		return count;
	}

	/* 전체 배달원 */
	@Override
	public int getTotalDeliveryCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalDeliveryCount");
		return count;
	}
	/*------ 회원관련 카운트 끝 ------*/
	
	/*----- 주문관련 카운트 -----*/
	/*주문 요청 리스트*/
	@Override
	public int getRequestedOrderCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getRequestedOrderCount");
		return count;
	}
	
	/*진행중 주문*/
	@Override
	public int getOrderInProgressCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getOrderInProgressCount");
		return count;
	}
	
	/*완료된 주문*/
	@Override
	public int getFinishedOrderCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getFinishedOrderCount");
		return count;
	}
	
	/*전체 완료된 주문*/
	@Override
	public int getTotalFinishedOrderCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalFinishedOrderCount");
		return count;
	}
	
	/*취소된 주문*/
	@Override
	public int getTotalCanceledOrderCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalCanceledOrderCount");
		return count;
	}
	
	/*배달 취소*/
	@Override
	public int getTotalCanceledDeliverCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalCanceledDeliverCount");
		return count;
	}
	/*----- 주문관련 카운트 끝 -----*/
	
	/*----- 게시글 관련 카운트 -----*/
	/*신규 일반글*/
	@Override
	public int getNewPostCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewPostCount");
		return count;
	}
	
	/*신규 리뷰*/
	@Override
	public int getNewReviewCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewReviewCount");
		return count;
	}
	
	/*신규 공지*/
	@Override
	public int getNewNoticeCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewNoticeCount");
		return count;
	}
	
	/*전체 일반글*/
	@Override
	public int getTotalPostCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalPostCount");
		return count;
	}
	
	/*전체 리뷰*/
	@Override
	public int getTotalReviewCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalReviewCount");
		return count;
	}
	/*----- 게시글 관련 카운트 끝 -----*/
	
	/*----- 신고 관련 카운트 끝 -----*/
	/*신규 신고대기*/
	@Override
	public int getNewRequestedReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewRequestedReportCount");
		return count;
	}
	
	/*신규 일반글 신고*/
	@Override
	public int getNewPostReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewPostReportCount");
		return count;
	}
	
	/*신규 댓글 신고*/
	@Override
	public int getNewCommentReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getNewCommentReportCount");
		return count;
	}
	
	/* 전체 게시물 신고  */
	@Override
	public int getTotalPostReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalPostReportCount");
		return count;
	}
	
	/* 전체 댓글 신고*/
	@Override
	public int getTotalCommentReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getTotalCommentReportCount");
		return count;
	}
	
	/* 완료된 신고 */
	@Override
	public int getFinishedReportCount() {
		int count = sqlSession.selectOne(NAMESPACE + "getFinishedReportCount");
		return count;
	}
	/*----- 신고 관련 카운트 끝 -----*/
	
	/* 일반회원 리스트 */
	@Override
	public List<UserVo> getMemberList() {
		List<UserVo> list = sqlSession.selectList(NAMESPACE + "getMemberList");
		return list;
	}
	
	/* 배달원 리스트 */
	@Override
	public List<DeliverVo> getDeliverList() {
		List<DeliverVo> list = sqlSession.selectList(NAMESPACE + "getDeliverList");
		return list;
	}
	
	/* 가입대기중 배달원 리스트 */
	@Override
	public List<DeliverVo> getWaitingDeliverList() {
		List<DeliverVo> list = sqlSession.selectList(NAMESPACE + "getWaitingDeliverList");
		return list;
	}
	
	/* 계정 상태 수정 */
	@Override
	public String userStateUpdate(int user_no, String user_state) {
		Map<String, Object > map = new HashMap<>();
		map.put("user_no", user_no);
		map.put("user_state", user_state);
		sqlSession.update(NAMESPACE + "userStateUpdate", map);
		
		return "update_success";
	}

	@Override
	public String deliverStateUpdate(int dlvr_no, String dlvr_state) {
		Map<String, Object > map = new HashMap<>();
		map.put("dlvr_no", dlvr_no);
		map.put("dlvr_state", dlvr_state);
		sqlSession.update(NAMESPACE + "deliverStateUpdate", map);
		return "update_success";
	}
	/* 계정 상태 수정  끝*/
	
	
	/*대기중인 주문 목록*/
	@Override
	public List<OrderVo> getWaitingOrderList() {
		List<OrderVo> list = sqlSession.selectList(NAMESPACE + "getWaitingOrderList");
		return list;
	}
	
	/*접수된 주문 목록*/
	@Override
	public List<OrderVo> getAcceptOrderList() {
		List<OrderVo> list = sqlSession.selectList(NAMESPACE + "getAcceptOrderList");
		return list;
	}
	
	/*완료된 주문목록*/
	@Override
	public List<OrderVo> getFinishOrderList() {
		List<OrderVo> list = sqlSession.selectList(NAMESPACE + "getFinishOrderList");
		return list;
	}

	/*주문자 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderList() {
		List<OrderVo> list = sqlSession.selectList(NAMESPACE + "getCancelOrderList");
		return list;
	}

	/*배달원 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderListByDeliver() {
		List<OrderVo> list = sqlSession.selectList(NAMESPACE + "getCancelOrderListByDeliver");
		return list;
	}
	
	/*
	 * 배달원 수정
	 * order_no : 주문번호
	 * order_state : 주문상태
	 * DB 
	 * */
	@Override
	public void updateOrderState(int order_no, String order_state) {
		Map<String, Object> map = new HashMap<>();
		map.put("order_no", order_no);
		map.put("order_state", order_state);
		sqlSession.update(NAMESPACE + "updateOrderState", map);
	}
	
	/*일반글 목록*/
	@Override
	public List<TimelineVo> getPostList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getPostList");
		return list;
	}
	
	/*리뷰 목록*/
	@Override
	public List<TimelineVo> getReviewList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getReviewList");
		return list;
	}
	
	/*공지 목록*/
	@Override
	public List<TimelineVo> getNoticeList() {
		List<TimelineVo> list = sqlSession.selectList(NAMESPACE + "getNoticeList");
		return list;
	}
	
	/*글 삭제*/
	@Override
	public void deleteArticle(int time_no) {
		sqlSession.delete(NAMESPACE + "deleteArticle", time_no);
	}
	
	/*신고대기 목록*/
	@Override
	public List<ReportVo> getReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getReportList");
		return list;
	}
	/* 신고접수 목록*/
	@Override
	public List<ReportVo> getAcceptReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getAcceptReportList");
		return list;
	}
	
	/* 신고취소 목록*/
	@Override
	public List<ReportVo> getCancelReportList() {
		List<ReportVo> list = sqlSession.selectList(NAMESPACE + "getCancelReportList");
		return list;
	}
	
	/* 신고상태 변경*/
	@Override
	public void updateReportState(int report_no, String report_state) {
		Map<String, Object> map = new HashMap<>();
		map.put("report_no", report_no);
		map.put("report_state", report_state);
		sqlSession.selectList(NAMESPACE + "updateReportState", map);
		
	}
	


}
