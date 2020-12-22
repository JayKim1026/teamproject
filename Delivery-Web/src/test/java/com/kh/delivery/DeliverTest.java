package com.kh.delivery;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.delivery.domain.DeliverVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DeliverTest {

	private static final String NAMESPACE = "com.kh.delivery.deliver.";
	
	@Inject
	SqlSession sqlSession;
	
	@Test
	public void testLogin() throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("dlvr_id", "dlvr01");
		map.put("dlvr_pw", "1234");
		DeliverVo deliverVo = sqlSession.selectOne(NAMESPACE + "login", map);
		System.out.println(deliverVo);
	}
}
