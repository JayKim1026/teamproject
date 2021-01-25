package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.delivery.dao.AccountDao;
import com.kh.delivery.dao.OrderDao;
import com.kh.delivery.dao.PointDao;
import com.kh.delivery.domain.OrderVo;
import com.kh.delivery.domain.PointVo;
import com.kh.delivery.util.Codes;

@Service
public class OrderServiceImpl implements OrderService, Codes {

	@Inject
	OrderDao orderDao;
	@Inject
	PointDao pointDao;
	@Inject
	AccountDao accountDao;
	
	// 배달원 배달내역 조회
	@Override
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception {
		List<OrderVo> deliveryList = orderDao.getDeliveryList(dlvr_no);
		return deliveryList;
	}

	// 웹
	@Override
	public String insertOrder(OrderVo orderVo) throws Exception {
		String result = orderDao.insertOrder(orderVo);
		return result;
	}
	
	@Override
	public OrderVo getMyOrder(int user_no) throws Exception {
		OrderVo orderVo = orderDao.getMyOrder(user_no);
		return orderVo;
	}

	@Override
	public String orderCancel(int order_no) throws Exception {
		orderDao.orderCancel(order_no);
		return "cancel_success";
	}
	
	//일반회원 주문내역 조회 
	@Override
	public List<OrderVo> getUserOrderList(int user_no) throws Exception {
		List<OrderVo> orderList = orderDao.getUserOrderList(user_no);
		return orderList;
	}
	
	// 안드로이드
	@Override
	public List<OrderVo> getOrderList(double order_lat, double order_lng) throws Exception {
		List<OrderVo> orderList = orderDao.getOrderList(order_lat, order_lng);
		return orderList;
	}
	
	@Override
	public String pickOrder(int order_no, int dlvr_no) throws Exception {
		String result = orderDao.pickOrder(order_no, dlvr_no);
		return result;
	}

	@Override
	public OrderVo getPickedOrder(int dlvr_no) throws Exception {
		OrderVo orderVo = orderDao.getPickedOrder(dlvr_no);
		return orderVo;
	}

	@Override
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception {
		String result = orderDao.cancelDelivery(order_no, dlvr_no);
		return result;
	}

	@Override
	@Transactional
	public String deliveryCompleted(OrderVo orderVo) throws Exception {
		String result = orderDao.deliveryCompleted(orderVo);
		PointVo dlvrPointVo = new PointVo(DELIVERY_SUCCESS, orderVo.getDlvr_no(), DELIVER_SUCCESS_POINT);
		pointDao.insertPoint(dlvrPointVo);
		accountDao.updatePoint(dlvrPointVo);
		PointVo userPointVo = new PointVo(ORDER_SUCCESS, orderVo.getUser_no(), ORDER_SUCCESS_POINT);
		pointDao.insertPoint(userPointVo);
		accountDao.updatePoint(userPointVo);
		return result;
	}
	

	
	/*----- 주문관련 리스트 -----*/
	/*주문 요청 리스트*/
	@Override
	public int getRequestedOrderCount() {
		int count = orderDao.getRequestedOrderCount();
		return count;
	}
	
	/*진행중 주문*/
	@Override
	public int getOrderInProgressCount() {
		int count = orderDao.getOrderInProgressCount();
		return count;
	}
	
	/*완료된 주문*/
	@Override
	public int getFinishedOrderCount() {
		int count = orderDao.getFinishedOrderCount();
		return count;
	}
	
	/*전체 완료된 주문*/
	@Override
	public int getTotalFinishedOrderCount() {
		int count = orderDao.getTotalFinishedOrderCount();
		return count;
	}
	
	/*취소된 주문*/
	@Override
	public int getTotalCanceledOrderCount() {
		int count = orderDao.getTotalCanceledOrderCount();
		return count;
	}
	
	/*배달 취소*/
	@Override
	public int getTotalCanceledDeliverCount() {
		int count = orderDao.getTotalCanceledDeliverCount();
		return count;
	}
	
	/*----- 주문관련 리스트 끝 -----*/

	
	/*대기중인 주문 목록*/
	@Override
	public List<OrderVo> getWaitingOrderList() {
		List<OrderVo> list = orderDao.getWaitingOrderList();
		return list;
	}
	
	/*접수된 주문 목록*/
	@Override
	public List<OrderVo> getAcceptOrderList() {
		List<OrderVo> list = orderDao.getAcceptOrderList();
		return list;
	}
	
	/*완료된 주문목록*/
	@Override
	public List<OrderVo> getFinishOrderList() {
		List<OrderVo> list = orderDao.getFinishOrderList();
		return list;
	}
	
	/*주문자 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderList() {
		List<OrderVo> list = orderDao.getCancelOrderList();
		return list;
	}
	
	/*배달원 취소 목록*/
	@Override
	public List<OrderVo> getCancelOrderListByDeliver() {
		List<OrderVo> list = orderDao.getCancelOrderListByDeliver();
		return list;
	}
	
	/*배달현황 수정*/
	@Override
	public void updateOrderState(int order_no, String order_state) {
		orderDao.updateOrderState(order_no, order_state);
	}
	
}
