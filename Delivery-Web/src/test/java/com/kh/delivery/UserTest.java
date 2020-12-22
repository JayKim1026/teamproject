package com.kh.delivery;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.delivery.domain.UserVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserTest {
	
	@Inject
	SqlSession sqlSession;
	@Inject
	SqlSessionFactory sqlSessionFactory;
	
	private static String NAMESPACE = "com.kh.delivery.user.";
	
	@Test
	public void testLogin() throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", "user01");
		map.put("user_pw", "1234");
		UserVo userVo = sqlSession.selectOne(NAMESPACE + "login", map);
		System.out.println(userVo);
	}
}
