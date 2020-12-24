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
	
	
}
