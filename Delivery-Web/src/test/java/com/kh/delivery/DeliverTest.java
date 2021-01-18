package com.kh.delivery;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
		System.out.println(sqlSession);
//		Map<String, String> map = new HashMap<>();
//		map.put("dlvr_id", "dlvr01");
//		map.put("dlvr_pw", "1234");
//		DeliverVo deliverVo = sqlSession.selectOne(NAMESPACE + "login", map);
//		System.out.println(deliverVo);
		sqlSession.update("com.kh.delivery.account.updatePoint");
	}
	
	@Test
	public void testDlvrRegist() throws Exception {
		DeliverVo deliverVo = new DeliverVo();
		deliverVo.setDlvr_img("cat.jpg");
		deliverVo.setDlvr_idcard("dog.jpg");
		deliverVo.setDlvr_id("dlvr02");
		deliverVo.setDlvr_pw("1234");
		deliverVo.setDlvr_name("이진형");
		deliverVo.setDlvr_phone("010-3012-1891");
		deliverVo.setDlvr_addr("울산광역시 북구 매산로65 110동 603호");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dlvr_birth = new Date(df.parse("1994-06-27").getTime());
		deliverVo.setDlvr_birth(dlvr_birth);
		deliverVo.setDlvr_email("dlwlsgud@naver.com");
		sqlSession.insert(NAMESPACE + "registDeliver", deliverVo);
		
	}
}
