package com.kh.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.delivery.dao.OrderDao;
import com.kh.delivery.domain.OrderVo;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	OrderDao orderDao;

	@Override
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception {
		List<OrderVo> orderList = orderDao.getOrderList(order_lat, order_lng, range);
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
	
}
