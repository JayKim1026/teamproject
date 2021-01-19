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
	
	// 웹
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
		System.out.println("orderDao : " + result);
		return "cancel_success";
	}
	
	
	// 안드로이드
	@Override
	public List<OrderVo> getOrderList(double order_lat, double order_lng, int range) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("order_lat", order_lat);
		map.put("order_lng", order_lng);
		map.put("range", range);
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

	@Override
	public List<OrderVo> getCompletedOrder(int dlvr_no) throws Exception {
		List<OrderVo> orderList = sqlSession.selectList(NAMESPACE + "getCompletedOrder", dlvr_no);
		return orderList;
	}


	
}
