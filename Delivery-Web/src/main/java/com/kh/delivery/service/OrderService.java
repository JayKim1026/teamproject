package com.kh.delivery.service;

import java.util.List;

import com.kh.delivery.domain.OrderVo;

public interface OrderService {
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception;
	public String insertOrder(OrderVo orderVo) throws Exception;
	public String pickOrder(int order_no, int dlvr_no) throws Exception;
	public OrderVo getPickedOrder(int dlvr_no) throws Exception;
	public String cancelDelivery(int order_no, int dlvr_no) throws Exception;
	public String deliveryCompleted(int order_no, int dlvr_no) throws Exception;
	public List<OrderVo> getCompletedOrder(int dlvr_no) throws Exception;
}
