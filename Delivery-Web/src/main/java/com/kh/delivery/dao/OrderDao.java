package com.kh.delivery.dao;

import java.util.List;

import com.kh.delivery.domain.OrderVo;

public interface OrderDao {
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception;
	public String pickOrder(int order_no, int dlvr_no) throws Exception;
	public OrderVo getPickedOrder(int dlvr_no) throws Exception;
}
