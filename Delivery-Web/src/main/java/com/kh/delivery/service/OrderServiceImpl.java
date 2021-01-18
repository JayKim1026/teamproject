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
	

	// 웹
	@Override
	public OrderVo getMyOrder(int user_no) throws Exception {
		OrderVo orderVo = orderDao.getMyOrder(user_no);
		return orderVo;
	}

	
	// 안드로이드
	@Override
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception {
		List<OrderVo> orderList = orderDao.getOrderList(order_lat, order_lng, range);
		return orderList;
	}

	@Override
	public String insertOrder(OrderVo orderVo) throws Exception {
		String result = orderDao.insertOrder(orderVo);
		return result;
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

	@Override
	public List<OrderVo> getCompletedOrder(int dlvr_no) throws Exception {
		List<OrderVo> orderList = orderDao.getCompletedOrder(dlvr_no);
		return orderList;
	}
}
