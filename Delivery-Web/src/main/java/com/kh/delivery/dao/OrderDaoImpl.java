package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.delivery.domain.OrderVo;

@Repository
public class OrderDaoImpl implements OrderDao {
	
	private static final String NAMESPACE = "com.kh.delivery.order.";
	
	@Inject
	SqlSession sqlSession;
	
	// 배달원 배달 내역 조회
	@Override
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception {
		List<OrderVo> deliveryList = sqlSession.selectList(NAMESPACE + "getDeliveryList", dlvr_no);
		return deliveryList;
	}
	
	@Override
	public OrderVo getMyOrder(int user_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("user_no", user_no);
		OrderVo orderVo = sqlSession.selectOne(NAMESPACE + "getMyOrder", map);
		return orderVo;
	}
	
	@Override
	public String orderCancel(int order_no) throws Exception {
		int result = sqlSession.update(NAMESPACE + "orderCancel", order_no);
		return "cancel_success";
	}

	// 일반회원 주문내역 조회
	@Override
	public List<OrderVo> getUserOrderList(int user_no) throws Exception {
		List<OrderVo> orderList	= sqlSession.selectList(NAMESPACE + "getUserOrderList", user_no);
		return orderList;
	}
	
	
	// 안드로이드
	@Override
	public List<OrderVo> getOrderList(double order_lat, double order_lng) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("order_lat", order_lat);
		map.put("order_lng", order_lng);
		List<OrderVo> orderList = sqlSession.selectList(NAMESPACE + "getOrderList", map);
		return orderList;
	}

	@Override
	public String insertOrder(OrderVo orderVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertOrder", orderVo);
		return "insertOrder_success";
	}
	
	@Override
	public String pickOrder(int order_no, int dlvr_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("order_no", order_no);
		map.put("dlvr_no", dlvr_no);
		sqlSession.update(NAMESPACE + "pickOrder", map);
		return "pickOrder_success";
	}

	@Override
	public OrderVo getPickedOrder(int dlvr_no) throws Exception {
		OrderVo orderVo = sqlSession.selectOne(NAMESPACE + "getPickedOrder", dlvr_no);
		return orderVo;
	}

	@Override
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("order_no", order_no);
		map.put("dlvr_no", dlvr_no);
		sqlSession.update(NAMESPACE + "cancelDelivery", map);
		return "cancelDelivery_success";
	}

	@Override
	public String deliveryCompleted(OrderVo orderVo) throws Exception {
		sqlSession.update(NAMESPACE + "deliveryCompleted", orderVo);
		return "delivery_completed";
	}
	

	
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
	
}
