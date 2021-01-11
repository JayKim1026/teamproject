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

import com.kh.delivery.domain.DeliverVo;
import com.kh.delivery.domain.TimelineVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TimelineTest {

	private static final String NAMESPACE = "com.kh.delivery.timeline.";
	
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
	
	@Test
	public void testInsertArticle() throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_no", 21);
		map.put("review_content", "1234");
		sqlSession.insert(NAMESPACE + "insertArticle", map);
		
	}
	
	@Test
	public void testgetTimelineList() throws Exception {
		Map<String, String> map = new HashMap<>();
		String searchType = "2-002";
		map.put("searchType", searchType);
		List<TimelineVo> timelineList = sqlSession.selectList(NAMESPACE + "timelineList", map);
		System.out.println(timelineList);
	}
	
	@Test
	public void testGetLastTimeline() throws Exception {
		TimelineVo timelineVo = sqlSession.selectOne(NAMESPACE + "getLastTimeline");
		System.out.println(timelineVo);
	}
}
