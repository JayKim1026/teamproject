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
}
