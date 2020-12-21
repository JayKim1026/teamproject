package com.kh.delivery;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberClass {
	
	@Inject
	SqlSession sqlSession;
	@Inject
	SqlSessionFactory sqlSessionFactory;
	
	private static String NAMESPACE = "com.kh.delivery.member.";
	
}
