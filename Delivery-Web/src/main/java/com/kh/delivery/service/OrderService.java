package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.OrderVo;

public interface OrderService {
	
	// 공용
	public List<OrderVo> getDeliveryList(int dlvr_no) throws Exception;
	
	// 웹
	public String insertOrder(OrderVo orderVo) throws Exception;
	public OrderVo getMyOrder(int user_no) throws Exception;
	public String orderCancel (int order_no) throws Exception;
	public List<OrderVo> getUserOrderList(int user_no) throws Exception; 
	
	// 안드로이드 
	public List<OrderVo> getOrderList(double order_lat, double order_lng) throws Exception;
	public String pickOrder(int order_no, int dlvr_no) throws Exception;
	public OrderVo getPickedOrder(int dlvr_no) throws Exception;
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception;
	public String deliveryCompleted(OrderVo orderVo) throws Exception;
	
	// 관리자
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
}
