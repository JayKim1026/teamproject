package com.kh.delivery.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TimelineDaoImpl implements TimelineDao {
	
	private static final String NAMESPACE = "com.kh.delivery.timeline."; 
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertArticle(int user_no, String review_content) {
		
		System.out.println("TimelineDao, insertArticle, user_no:" + user_no);
		System.out.println("TimelineDao, insertArticle, review_content:" + review_content);
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("hi!");
		map.put("user_no", user_no);
		map.put("review_content", review_content);
		
		System.out.println("TimelineDao, insertArticle, map:" + map);
		
		sqlSession.insert(NAMESPACE + "insertArticle", map);
		
	}
}
