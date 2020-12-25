package com.kh.delivery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.delivery.domain.OrderVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OrderTest {

	private static final String NAMESPACE = "com.kh.delivery.order.";
	
	@Inject
	SqlSession sqlSession;
	
	@Test
	public void testGetOrderList() throws Exception {
		double order_lat = 35.535001;
		double order_lng = 129.311193;
		int range = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("order_lat", order_lat);
		map.put("order_lng", order_lng);
		map.put("range", range);
		List<OrderVo> orderList = sqlSession.selectList(NAMESPACE + "getOrderList", map);
		System.out.println(orderList);
	}
}
